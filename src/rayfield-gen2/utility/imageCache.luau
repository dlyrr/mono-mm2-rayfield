-- Rayfield/utility/imageCache  (bundle module #51)
-- deobfuscated from Rayfield Gen2 v1.2.0

local filesystem, path, variables, constants =
    require(script.Parent.filesystem),
    require(script.Parent.path),
    require(script.Parent.variables),
    require(script.Parent.constants)
export type RewriteMap = { [number]: string }
export type CacheSettledCallback = (failed: number) -> ()
export type PreloadCallback = CacheSettledCallback
export type AvatarCallback = (uri: string) -> ()
export type OnCachedCallback = (id: number) -> ()
export type ThumbnailEntry = { state: string?, imageUrl: string? }
export type ThumbnailResponse = { data: { ThumbnailEntry }? }
local ai, aj, ak, al, am, b, c, d: { [number]: string } =
    {},
    variables.fileSystemManager:getRootFolder(),
    variables.fileSystemManager:getAssetsFolder(),
    variables.assetResolver,
    [[https://raw.githubusercontent.com/SiriusSoftwareLtd/rayfield-gen2/main/assets/]],
    48,
    [[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],
    {}
for e, f in constants.icons do
    local g = f :: number
    d[g] = am .. tostring(g) .. ".png"
end
local e = 0
for f in d do
    e += 1
end
ai.rewrites = {} :: RewriteMap
ai.onCached = nil :: OnCachedCallback?
local f = "\137PNG\r\n\26\n"

local function g(h: string, i: string): string?
    if type(getfenv().getcustomasset) ~= "function" or typeof(filesystem.isfile) ~= "function" then
        return nil
    end
    if not filesystem.isfile(h) then
        pcall(filesystem.ensureFolder, aj)
        pcall(filesystem.ensureFolder, ak)
        local j = al:getAssetContentFromUrl(i, h, false)
        if not j or string.sub(j, 1, 8) ~= f then
            return nil
        end
        if not pcall(filesystem.writefile, h, j) then
            return nil
        end
    end
    local j, k = pcall(getfenv().getcustomasset, h)
    return if j and type(k) == "string" then k else nil
end

local function h(i: number): string
    return path.join(ak, "avatar_" .. tostring(i) .. ".png")
end

local function i(j: string): string?
    local k, l = pcall(function()
        return variables.httpService:JSONDecode(j)
    end)
    if not k or type(l) ~= "table" then
        return nil
    end
    local m = (l :: ThumbnailResponse).data
    if type(m) ~= "table" then
        return nil
    end
    local n = m[1]
    if type(n) ~= "table" then
        return nil
    end
    local o = n :: ThumbnailEntry
    if o.state == "Completed" and type(o.imageUrl) == "string" then
        return o.imageUrl
    end
    return nil
end

local function j(k: number): string?
    local l: string?
    for m = 1, 4 do
        local n = al:getAssetContentFromUrl(string.format(c, k, b, b), "avatar:" .. tostring(k), m > 1)
        if n then
            local o = i(n)
            if o then
                l = o
                break
            end
        end
        if m < 4 then
            task.wait(0.3)
        end
    end
    if not l then
        return nil
    end
    return g(h(k), l)
end
local k: {
    [number]: { AvatarCallback },
}, l: { [number]: boolean } = {}, {}

function ai.preload(m: PreloadCallback?): (boolean, number)
    local n = getfenv()
    if type(n.getcustomasset) ~= "function" or typeof(filesystem.isfile) ~= "function" then
        if m then
            task.defer(m, e)
        end
        return false, e
    end
    local o = ai.rewrites
    table.clear(o)
    local function p()
        if not m then
            return
        end
        local q = 0
        for r in d do
            if not o[r] then
                q += 1
            end
        end
        m(q)
    end
    local q, r, s = 0, 0, true
    for t, u in d do
        local v, w: string? = (path.join(ak, tostring(t) .. ".png"))
        if filesystem.isfile(v) then
            local x, y = pcall(n.getcustomasset, v)
            w = if x and type(y) == "string" then y else nil
        end
        if w then
            o[t] = w
        else
            r += 1
            q += 1
            task.spawn(function()
                local x = g(v, u)
                if x then
                    o[t] = x
                    if ai.onCached then
                        pcall(ai.onCached, t)
                    end
                end
                q -= 1
                if q == 0 and not s then
                    p()
                end
            end)
        end
    end
    s = false
    if q == 0 then
        p()
    end
    return r == 0, r
end

function ai.avatar(m: unknown, n: AvatarCallback?): string
    if type(m) ~= "number" then
        return ""
    end
    if typeof(filesystem.isfile) ~= "function" then
        return ""
    end
    local o = h(m)
    if filesystem.isfile(o) then
        local p, q = pcall(getfenv().getcustomasset, o)
        if p and type(q) == "string" then
            return q
        end
    end
    if l[m] then
        return ""
    end
    local p = k[m]
    if p then
        if n then
            table.insert(p, n)
        end
        return ""
    end
    if n then
        k[m] = { n }
        task.spawn(function()
            local q, r = j(m), k[m]
            k[m] = nil
            if not q then
                l[m] = true
                return
            end
            if r then
                for s, t in r do
                    pcall(t, q)
                end
            end
        end)
    end
    return ""
end
return ai
