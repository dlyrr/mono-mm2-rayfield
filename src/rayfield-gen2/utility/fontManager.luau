-- Rayfield/utility/fontManager  (bundle module #48)
-- deobfuscated from Rayfield Gen2 v1.2.0

local services = require(script.Parent.services)
local af, ag, filesystem, assetResolver, log, path =
    services.getService("HttpService"),
    services.getService("RunService"),
    require(script.Parent.filesystem),
    require(script.Parent.assetResolver),
    require(script.Parent.log),
    require(script.Parent.path)

local function al(am: unknown): string?
    local fontManager, c = pcall(function()
        return af:JSONEncode(am)
    end)
    if fontManager and type(c) == "string" then
        return c
    else
        log.warn("Failed to encode JSON:", c)
        return nil
    end
end

local function am(fontManager: string): unknown?
    local c, d = pcall(function()
        return af:JSONDecode(fontManager)
    end)
    if c then
        return d
    else
        log.warn("Failed to decode JSON:", d)
        return nil
    end
end
local fontManager = {}
fontManager.__type = "fontManager"
export type FontFace = { name: string, family: string, weight: number, style: string, assetId: string }
export type FontManifest = { name: string, faces: { FontFace } }
export type CachedFont = {
    customId: number | string,
    manifest: FontManifest,
    loadedFromDisk: boolean,
    variants: { [string]: Font },
}
export type FontCache = { [number]: CachedFont }
export type FontResolverOptions = { fallbackFont: Font?, saveToDisk: boolean?, skipCache: boolean? }
type FontManagerState = {
    _debug: boolean,
    _pendingLoads: { [string]: { thread } },
    rootFolder: string,
    assetResolver: ai.AssetResolver,
    defaultOptions: FontResolverOptions,
    fontCache: FontCache?,
}
export type FontManager = FontManagerState & {
    resolve: (self: FontManager, id: number | string) -> Font?,
    loadFont: (
        self: FontManager,
        id: (number | string)?,
        fontWeight: Enum.FontWeight?,
        fontStyle: Enum.FontStyle?,
        saveToDisk: boolean?,
        skipCache: boolean?
    ) -> Font?,
    getFontFromId: (self: FontManager, id: number | string) -> Font?,
}
export type fontManager = FontManager

local function c(d: unknown): FontManifest?
    local e = d :: any
    if type(e) ~= "table" or type(e.name) ~= "string" or type(e.faces) ~= "table" then
        return nil
    end
    e.name = path.sanitizeFile(e.name)
    if #e.name == 0 or #e.faces == 0 then
        return nil
    end
    for f, g in e.faces do
        if type(g) ~= "table" or type(g.name) ~= "string" or type(g.assetId) ~= "string" then
            return nil
        end
        g.name = path.sanitizeFile(g.name)
        if #g.name == 0 then
            return nil
        end
    end
    return e :: FontManifest
end
local d = { "\0\1\0\0", "OTTO", "true", "ttcf", "wOFF", "wOF2" }

local function e(f: string): boolean
    for g, h in d do
        if string.sub(f, 1, #h) == h then
            return true
        end
    end
    return false
end
local f = getfenv()

local function g(h: Enum.FontWeight, i: Enum.FontStyle): string
    return tostring(h) .. "|" .. tostring(i)
end

local function h(i: unknown): number?
    if type(i) == "number" then
        return i
    end
    if type(i) == "string" then
        return tonumber(i)
    end
    return nil
end

function fontManager.__index(i: FontManagerState, j: unknown): unknown
    local k = (fontManager :: any)[j]
    if k ~= nil then
        return k
    end
    local l = h(j)
    if not l then
        return nil
    end
    local m = i.fontCache
    if m then
        local n = m[l]
        if n then
            local o = g(Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            local p = n.variants and n.variants[o]
            if p then
                return p
            end
            for q, r in pairs(n.variants or {}) do
                return r
            end
        end
    end
    return nil
end

function fontManager.new(
    i: string,
    j: boolean?,
    k: boolean?,
    l: ai.AssetDownloadUrl?,
    m: FontResolverOptions?
): FontManager
    local n = m
        or {
            saveToDisk = true,
            skipCache = not k or false,
            fallbackFont = Font.fromEnum(Enum.Font.SourceSans),
        }
    local o = setmetatable(
        {
            rootFolder = i,
            fontCache = if k then {} :: FontCache else nil,
            assetResolver = assetResolver.new(k, l),
            defaultOptions = n,
            _debug = j or ag:IsStudio() or false,
            _pendingLoads = {},
        } :: FontManagerState,
        fontManager
    ) :: any
    pcall(filesystem.ensureFolder, i)
    return o
end

local function i(j: FontManager, k: number, l: Enum.FontWeight, m: Enum.FontStyle, n: string): Font?
    local o = j.rootFolder .. "/" .. k .. ".json"
    if typeof(filesystem.isfile) ~= "function" then
        return j.defaultOptions.fallbackFont
    end
    local p, q: string? = false
    if ag:IsStudio() and j._debug then
        log.warn(
            [[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]
        )
        q =
            [[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
    elseif filesystem.isfile(o) then
        local r, s = pcall(filesystem.readfile, o)
        q = r and s or nil
    else
        q = j.assetResolver:getAssetContentFromId(k, false)
        p = q ~= nil
    end
    local r: FontManifest?
    if q then
        local s, t = pcall(am, q)
        if s and t then
            r = c(t)
        else
            if j._debug then
                log.warn(
                    "Failed to parse font manifest for font id: " .. tostring(k) .. ". Error: " .. tostring(t)
                )
            end
        end
    else
        return j.defaultOptions.fallbackFont
    end
    if not r then
        if j._debug then
            log.warn("Font manifest is nil for font id: " .. tostring(k))
        end
        pcall(filesystem.delfile, o)
        return j.defaultOptions.fallbackFont
    end
    if p and q then
        pcall(filesystem.writefile, o, q)
    end
    local s, t = j.rootFolder .. "/" .. r.name, true
    if not pcall(filesystem.ensureFolder, s) then
        return j.defaultOptions.fallbackFont
    end
    for u, v in ipairs(r.faces) do
        local w = s .. "/" .. v.name:gsub(" ", "-") .. ".ttf"
        if filesystem.isfile(w) then
            local x, y = pcall(filesystem.readfile, w)
            if not x or type(y) ~= "string" or not e(y) then
                pcall(filesystem.delfile, w)
            end
        end
        if not filesystem.isfile(w) then
            local x = j.assetResolver:resolve(v.assetId)
            local y = if x ~= nil then j.assetResolver:getAssetContentFromId(x, false) else nil
            if not y or not e(y) then
                t = false
                if j._debug then
                    log.warn(
                        "Font face content is missing or not a font for font id: "
                            .. tostring(k)
                            .. ", face: "
                            .. v.name
                    )
                end
                continue
            end
            pcall(filesystem.writefile, w, y)
        end
        local x, y = pcall(f.getcustomasset, w)
        if x and type(y) == "string" then
            r.faces[u].assetId = y
            if j._debug then
                log.print("Loaded font face for id: " .. tostring(k) .. ", face: " .. v.name)
            end
        else
            t = false
            if j._debug then
                log.warn("Failed to load font face for id: " .. tostring(k) .. ", face: " .. v.name)
            end
        end
    end
    if not t then
        return j.defaultOptions.fallbackFont
    end
    local u = al(r)
    if not u or not pcall(filesystem.writefile, s .. "/manifest.json", u) then
        return j.defaultOptions.fallbackFont
    end
    local v, w = pcall(f.getcustomasset, s .. "/manifest.json")
    if not v or not w then
        if j._debug then
            log.warn("Failed to load font manifest for id: " .. tostring(k))
        end
        return j.defaultOptions.fallbackFont
    end
    local x, y = pcall(Font.new, w :: any, l, m)
    if not x or not y then
        if j._debug then
            log.warn("Failed to load font for id: " .. tostring(k))
        end
        return j.defaultOptions.fallbackFont
    end
    local z = j.fontCache
    if z then
        z[k] = { customId = w, manifest = r, loadedFromDisk = true, variants = { [n] = y } }
        if j._debug then
            log.print("Cached font for id: " .. tostring(k))
        end
    end
    return y
end

function fontManager.loadFont(
    j: FontManager,
    k: (number | string)?,
    l: Enum.FontWeight?,
    m: Enum.FontStyle?,
    n: boolean?,
    o: boolean?
): Font?
    if n == nil then
        n = j.defaultOptions.saveToDisk
    end
    if o == nil then
        o = j.defaultOptions.skipCache
    end
    local p, q = l or Enum.FontWeight.Regular, m or Enum.FontStyle.Normal
    local r, s = g(p, q), j.assetResolver:resolve(k)
    local t = h(s)
    if not t then
        log.warn("Invalid font id: " .. tostring(k))
        return j.defaultOptions.fallbackFont
    end
    local u = j.fontCache
    if u and not o then
        local v = u[t]
        if v then
            local w = v.variants and v.variants[r]
            if w then
                if j._debug then
                    log.print("Loaded font from cache for id: " .. tostring(t))
                end
                return w
            end
            local x, y = pcall(Font.new, v.customId :: any, p, q)
            if x and y then
                v.variants = v.variants or {}
                v.variants[r] = y
                if j._debug then
                    log.print("Loaded font variant from cache for id: " .. tostring(t))
                end
                return y
            else
                if j._debug then
                    log.warn("Failed to load font from cache for id: " .. tostring(t))
                end
                u[t] = nil
                return j.defaultOptions.fallbackFont
            end
        end
    end
    if not n then
        if j._debug then
            log.warn([[Font loading without saving to disk can be detected by Anti-cheats.]])
        end
        return j.defaultOptions.fallbackFont
    end
    local v, w = j._pendingLoads, tostring(t) .. "|" .. r
    local x = v[w]
    if x then
        table.insert(x, coroutine.running())
        return coroutine.yield()
    end
    v[w] = {}
    local y, z = pcall(i, j, t, p, q, r)
    local A = if y then z else j.defaultOptions.fallbackFont
    x = v[w]
    v[w] = nil
    if x then
        for B, C in x do
            coroutine.resume(C, A)
        end
    end
    return A
end

function fontManager.resolve(j: FontManager, k: number | string): Font?
    local l = h(k)
    if not l then
        return nil
    end
    local m = j.fontCache
    if m then
        local n = m[l]
        if n then
            if j._debug then
                log.print("Resolved font for id: " .. tostring(l))
            end
            for o, p in pairs(n.variants or {}) do
                return p
            end
        end
    end
    return nil
end

function fontManager.getFontFromId(j: FontManager, k: number | string): Font?
    return j:resolve(k)
end
return fontManager
