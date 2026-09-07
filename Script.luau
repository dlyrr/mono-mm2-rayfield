-- Mono MM2, running on Rayfield Gen2.
--
-- Script and UI originally by https://robloxscripts.com/user/Fleece (MonoMM2).
-- The bundled MonoUI library is replaced by the adapter below; the feature
-- code is unmodified apart from its one library entry point.
--
-- Rayfield Gen2 (c) 2026 Corridon Capital, MPL-2.0 - https://mozilla.org/MPL/2.0/

--!nocheck
-- Rayfield Gen2 v1.2.0 - deobfuscated single-file build
-- Reconstructed from the darklua bundle at https://sirius.menu/gen2
--
-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.
--
-- Layout: a table stands in for each ModuleScript/Folder of the original
-- Rojo tree, so `script.Parent.Parent.utility.locale` resolves exactly as it
-- did in the real hierarchy. Modules are lazily evaluated on first require.

local Rayfield = (function()
    local Modules, Cache = {}, {}

    local NodeMeta = {
        __tostring = function(self)
            return rawget(self, "Name")
        end,
    }

    local function FindFirstChild(self, name)
        return rawget(self, name)
    end

    local function Node(name, parent)
        local node = setmetatable({ Name = name, Parent = parent, FindFirstChild = FindFirstChild }, NodeMeta)
        if parent then
            parent[name] = node
        end
        return node
    end

    local function define(node, factory)
        Modules[node] = factory
    end

    local function require(node)
        local cached = Cache[node]
        if cached ~= nil then
            return cached
        end
        local factory = Modules[node]
        if not factory then
            error("attempt to require an unknown module: " .. tostring(node), 2)
        end
        local result = factory(node, require)
        Cache[node] = result
        return result
    end

    -- ---------------------------------------------------------------- tree

    local Rayfield = Node("Rayfield", nil)
    local Rayfield_components = Node("components", Rayfield)
    local Rayfield_themes = Node("themes", Rayfield)
    local Rayfield_utility = Node("utility", Rayfield)

    local Rayfield_utility_HapticEngine = Node("HapticEngine", Rayfield_utility)
    local Rayfield_utility_assetResolver = Node("assetResolver", Rayfield_utility)
    local Rayfield_utility_colors = Node("colors", Rayfield_utility)
    local Rayfield_utility_constants = Node("constants", Rayfield_utility)
    local Rayfield_utility_enums = Node("enums", Rayfield_utility)
    local Rayfield_utility_filesystem = Node("filesystem", Rayfield_utility)
    local Rayfield_utility_filesystemManager = Node("filesystemManager", Rayfield_utility)
    local Rayfield_utility_flagNames = Node("flagNames", Rayfield_utility)
    local Rayfield_utility_fontManager = Node("fontManager", Rayfield_utility)
    local Rayfield_utility_functions = Node("functions", Rayfield_utility)
    local Rayfield_utility_image = Node("image", Rayfield_utility)
    local Rayfield_utility_imageCache = Node("imageCache", Rayfield_utility)
    local Rayfield_utility_layouts = Node("layouts", Rayfield_utility)
    local Rayfield_utility_locale = Node("locale", Rayfield_utility)
    local Rayfield_utility_lockable = Node("lockable", Rayfield_utility)
    local Rayfield_utility_log = Node("log", Rayfield_utility)
    local Rayfield_utility_moveable = Node("moveable", Rayfield_utility)
    local Rayfield_utility_network = Node("network", Rayfield_utility)
    local Rayfield_utility_odometer = Node("odometer", Rayfield_utility)
    local Rayfield_utility_ordering = Node("ordering", Rayfield_utility)
    local Rayfield_utility_path = Node("path", Rayfield_utility)
    local Rayfield_utility_persistence = Node("persistence", Rayfield_utility)
    local Rayfield_utility_persistenceConfig = Node("persistenceConfig", Rayfield_utility)
    local Rayfield_utility_persistencePaths = Node("persistencePaths", Rayfield_utility)
    local Rayfield_utility_persistenceSettings = Node("persistenceSettings", Rayfield_utility)
    local Rayfield_utility_persistenceWrite = Node("persistenceWrite", Rayfield_utility)
    local Rayfield_utility_runtime = Node("runtime", Rayfield_utility)
    local Rayfield_utility_services = Node("services", Rayfield_utility)
    local Rayfield_utility_textMetrics = Node("textMetrics", Rayfield_utility)
    local Rayfield_utility_variables = Node("variables", Rayfield_utility)
    local Rayfield_utility_windowSizing = Node("windowSizing", Rayfield_utility)
    local Rayfield_themes_amethyst = Node("amethyst", Rayfield_themes)
    local Rayfield_themes_cobalt = Node("cobalt", Rayfield_themes)
    local Rayfield_themes_default = Node("default", Rayfield_themes)
    local Rayfield_themes_ember = Node("ember", Rayfield_themes)
    local Rayfield_themes_frost = Node("frost", Rayfield_themes)
    local Rayfield_themes_rose = Node("rose", Rayfield_themes)
    local Rayfield_components_action = Node("action", Rayfield_components)
    local Rayfield_components_button = Node("button", Rayfield_components)
    local Rayfield_components_chrome = Node("chrome", Rayfield_components)
    local Rayfield_components_colorpicker = Node("colorpicker", Rayfield_components)
    local Rayfield_components_console = Node("console", Rayfield_components)
    local Rayfield_components_descriptor = Node("descriptor", Rayfield_components)
    local Rayfield_components_divider = Node("divider", Rayfield_components)
    local Rayfield_components_drag = Node("drag", Rayfield_components)
    local Rayfield_components_dropdown = Node("dropdown", Rayfield_components)
    local Rayfield_components_group = Node("group", Rayfield_components)
    local Rayfield_components_input = Node("input", Rayfield_components)
    local Rayfield_components_keybind = Node("keybind", Rayfield_components)
    local Rayfield_components_notification = Node("notification", Rayfield_components)
    local Rayfield_components_popup = Node("popup", Rayfield_components)
    local Rayfield_components_progress = Node("progress", Rayfield_components)
    local Rayfield_components_search = Node("search", Rayfield_components)
    local Rayfield_components_section = Node("section", Rayfield_components)
    local Rayfield_components_sidebar = Node("sidebar", Rayfield_components)
    local Rayfield_components_slider = Node("slider", Rayfield_components)
    local Rayfield_components_stat = Node("stat", Rayfield_components)
    local Rayfield_components_tab = Node("tab", Rayfield_components)
    local Rayfield_components_tabSection = Node("tabSection", Rayfield_components)
    local Rayfield_components_tabSelector = Node("tabSelector", Rayfield_components)
    local Rayfield_components_tag = Node("tag", Rayfield_components)
    local Rayfield_components_text = Node("text", Rayfield_components)
    local Rayfield_components_toast = Node("toast", Rayfield_components)
    local Rayfield_components_toggle = Node("toggle", Rayfield_components)
    local Rayfield_components_window = Node("window", Rayfield_components)
    local Rayfield_types = Node("types", Rayfield)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/HapticEngine
    define(Rayfield_utility_HapticEngine, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables, af = require(script.Parent.variables), {}
        af.enabled = false
        type HapticTypes = { click: Enum.HapticEffectType?, notify: Enum.HapticEffectType? }
        local ag: HapticTypes, ah, ai =
            {}, pcall(function()
                Instance.new("HapticEffect"):Destroy()
                return { click = Enum.HapticEffectType.UIHover, notify = Enum.HapticEffectType.UIClick }
            end)
        if ah then
            ag = ai
        end
        local aj: { [Enum.HapticEffectType]: Instance }, ak: Instance? = {}

        function af.setContainer(al: Instance?)
            ak = al
        end

        function af.releaseContainer(al: Instance?)
            if al == nil or ak == al then
                ak = nil
            end
        end

        local function al(): Instance
            if ak and ak.Parent then
                return ak
            end
            return variables.guiContainer
        end

        local function am(b: Enum.HapticEffectType): Instance?
            local c = aj[b]
            if c and c.Parent then
                return c
            end
            local d, e = pcall(Instance.new, "HapticEffect")
            if not d then
                return nil
            end
            local f = e :: any
            f.Type = b
            local g = pcall(function()
                e.Parent = al()
            end)
            if not g then
                e:Destroy()
                return nil
            end
            aj[b] = e
            return e
        end

        local function b(c: Enum.HapticEffectType?)
            if not c or not af.enabled then
                return
            end
            local d = am(c)
            if d then
                local e = d :: any
                pcall(e.Play, d)
            end
        end

        function af.click()
            b(ag.click)
        end

        function af.notify()
            b(ag.notify)
        end

        function af.setEnabled(c: boolean?)
            af.enabled = c and true or false
            if not af.enabled then
                af.teardown()
            end
        end

        function af.teardown()
            for c, d in aj do
                pcall(d.Destroy, d)
                aj[c] = nil
            end
        end
        return af
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/assetResolver
    define(Rayfield_utility_assetResolver, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local network, log = require(script.Parent.network), require(script.Parent.log)
        export type AssetId = number | string
        export type AssetDownloadUrl = string
        export type CacheKey = AssetId
        export type ResolvedAsset = AssetId
        export type AssetRequestPayload = { Url: string, Method: string }
        local ag = {
            Enum = {
                AssetDownloadUrl = {
                    RobloxDownloadUrl = "https://assetdelivery.roblox.com/v1/asset/?id=%d" :: AssetDownloadUrl,
                    RoProxyDownloadUrl = "https://assetdelivery.roproxy.com/v1/asset?id=%d" :: AssetDownloadUrl,
                },
            },
        }
        ag.__index = ag
        ag.__type = "assetResolver"
        type AssetResolverState = {
            contentCache: { [CacheKey]: string }?,
            contentCacheOrder: { CacheKey }?,
            contentDownloadUrl: AssetDownloadUrl,
            pendingRequests: { [CacheKey]: { thread } },
        }
        export type AssetResolver = AssetResolverState & {
            resolve: (self: AssetResolver, value: unknown) -> ResolvedAsset?,
            getAssetContentFromUrl: (
                self: AssetResolver,
                url: string,
                cacheKey: CacheKey?,
                forced: boolean?
            ) -> string?,
            getAssetContentFromId: (self: AssetResolver, id: AssetId, forced: boolean?) -> string?,
        }
        local ah = 8

        function ag.new(ai: boolean?, aj: AssetDownloadUrl?): AssetResolver
            local ak: { [CacheKey]: string }? = if ai then {} else nil
            local al = setmetatable(
                {
                    contentCache = ak,
                    contentCacheOrder = if ai then {} :: { CacheKey } else nil,
                    contentDownloadUrl = aj or ag.Enum.AssetDownloadUrl.RobloxDownloadUrl,
                    pendingRequests = {},
                } :: AssetResolverState,
                ag
            ) :: any
            return al
        end

        function ag.resolve(ai: AssetResolver, aj: unknown): ResolvedAsset?
            if type(aj) == "number" then
                return aj
            end
            if type(aj) ~= "string" then
                return nil
            end
            if string.sub(aj, 1, 11) == "rbxasset://" or string.sub(aj, 1, 11) == "rbxthumb://" then
                return aj
            end
            local ak = tonumber(string.match(aj, "^rbxassetid://(%d+)$"))
            if ak then
                return ak
            end
            return nil
        end

        local function ai(aj: unknown): boolean
            if type(aj) ~= "table" then
                return false
            end
            local ak = aj :: { Body: unknown, StatusCode: unknown, Success: unknown }
            local al = ak.Body
            if type(al) ~= "string" or #al == 0 then
                return false
            end
            if type(ak.StatusCode) == "number" then
                local am = ak.StatusCode :: number
                return am >= 200 and am < 300
            end
            if type(ak.Success) == "boolean" then
                return ak.Success :: boolean
            end
            return false
        end

        function ag.getAssetContentFromUrl(aj: AssetResolver, ak: string, al: CacheKey?, am: boolean?): string?
            local b = aj.contentCache
            if al ~= nil and b and not am then
                local c = b[al]
                if c then
                    return c
                end
            end
            local c = aj.pendingRequests
            if al ~= nil then
                local d = c[al]
                if d then
                    table.insert(d, coroutine.running())
                    return coroutine.yield()
                end
                c[al] = {}
            end
            local d, e: string? = (network.getRequestFn())
            if not d then
                log.warn("No request function available to download asset content.")
            else
                local f, g = pcall(d, { Url = ak, Method = "GET" } :: AssetRequestPayload)
                if f and ai(g) then
                    local h = (g :: { Body: string }).Body
                    e = h
                    if al ~= nil and b then
                        local i = aj.contentCacheOrder
                        if i and b[al] == nil then
                            table.insert(i, al)
                            local j = if #i > ah then table.remove(i, 1) else nil
                            if j ~= nil then
                                b[j] = nil
                            end
                        end
                        b[al] = h
                    end
                elseif not am then
                    log.warn("Failed to download asset content for url: " .. tostring(ak))
                end
            end
            if al ~= nil then
                local f = c[al]
                c[al] = nil
                if f then
                    for g, h in f do
                        coroutine.resume(h, e)
                    end
                end
            end
            return e
        end

        function ag.getAssetContentFromId(aj: AssetResolver, ak: AssetId, al: boolean?): string?
            local am = aj:resolve(ak)
            if not am or type(am) ~= "number" then
                log.warn("Invalid asset id: " .. tostring(am))
                return nil
            end
            local b = string.format(aj.contentDownloadUrl, am)
            return aj:getAssetContentFromUrl(b, am, al)
        end
        return ag
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/colors
    define(Rayfield_utility_colors, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local colors = {}

        function colors.contrastColor(af: Color3): Color3
            local ag = 0.299 * af.R + 0.587 * af.G + 0.114 * af.B
            return if ag > 0.5 then Color3.fromRGB(0, 0, 0) else Color3.fromRGB(255, 255, 255)
        end

        function colors.toColorSequence(af: Color3 | ColorSequence): ColorSequence
            return if typeof(af) == "ColorSequence" then af else ColorSequence.new(af)
        end

        function colors.contrastText(af: Color3): Color3
            local ag = 0.299 * af.R + 0.587 * af.G + 0.114 * af.B
            return if ag > 0.6 then Color3.fromRGB(20, 20, 20) else Color3.fromRGB(255, 255, 255)
        end
        return colors
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/constants
    define(Rayfield_utility_constants, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local constants = {}
        constants.fontAsset = "rbxassetid://12187365364"
        constants.pillResizeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
        constants.icons = {
            close = 83277910885129,
            minimise = 108115485663409,
            maximise = 88738500661569,
            settings = 129180860773723,
            search = 100604009889706,
            chevron = 88479147175134,
            check = 125626312718314,
            dot = 91452555903853,
            colorpicker = 91452555903853,
            banner = 111263549366178,
            config = 125823673784681,
            rayfield = 80387863064905,
        }
        constants.accent = { on = Color3.fromRGB(23, 153, 110), onStroke = Color3.fromRGB(32, 201, 144) }
        constants.statAccents = {
            positive = {
                fill = ColorSequence.new(Color3.fromRGB(0, 170, 127), Color3.fromRGB(0, 134, 98)),
                stroke = ColorSequence.new(Color3.fromRGB(0, 213, 156), Color3.fromRGB(0, 189, 135)),
            },
            negative = {
                fill = ColorSequence.new(Color3.fromRGB(172, 47, 47), Color3.fromRGB(135, 37, 37)),
                stroke = ColorSequence.new(Color3.fromRGB(255, 75, 75), Color3.fromRGB(244, 67, 67)),
            },
            neutral = {
                fill = ColorSequence.new(Color3.fromRGB(0, 170, 127), Color3.fromRGB(0, 134, 98)),
                stroke = ColorSequence.new(Color3.fromRGB(0, 213, 156), Color3.fromRGB(0, 189, 135)),
            },
        }
        constants.zIndex = {
            elementLock = 60,
            elementLockContent = 65,
            bottomFade = 100,
            notification = 1500,
            drag = 1000,
            toast = 2000,
            toastContent = 2001,
            restoreContent = 100001,
            restoreInteract = 100002,
        }
        constants.displayOrder = { window = 99999, banner = 100000, popup = 100001 }
        return constants
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/enums
    define(Rayfield_utility_enums, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local enums = {}

        function enums.itemFromValue(self, ag)
            local ah, ai = pcall(function()
                return self:FromValue(ag)
            end)
            if ah and ai then
                return ai
            end
            local aj, ak = pcall(function()
                return self:GetEnumItems()
            end)
            if not aj then
                return nil
            end
            for al, am in ak do
                if am.Value == ag then
                    return am
                end
            end
            return nil
        end
        return enums
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/filesystem
    define(Rayfield_utility_filesystem, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local services, af = require(script.Parent.services), {}
        local ag = services.getService("RunService"):IsStudio()
        local ah = not ag
            and typeof(writefile) == "function"
            and typeof(readfile) == "function"
            and typeof(isfile) == "function"
            and typeof(isfolder) == "function"
            and typeof(makefolder) == "function"
            and typeof(listfiles) == "function"
            and typeof(delfile) == "function"
            and typeof(delfolder) == "function"
        if ah then
            function af.writefile(ai: string, aj: string)
                writefile(ai, aj)
            end
            function af.readfile(ai: string): string
                return readfile(ai)
            end
            if typeof(appendfile) == "function" then
                function af.appendfile(ai: string, aj: string)
                    appendfile(ai, aj)
                end
            end
            function af.isfile(ai: string): boolean
                return isfile(ai)
            end
            function af.delfile(ai: string)
                delfile(ai)
            end
            function af.listfiles(ai: string): { string }
                return listfiles(ai)
            end
            function af.makefolder(ai: string)
                makefolder(ai)
            end
            function af.isfolder(ai: string): boolean
                return isfolder(ai)
            end
            function af.delfolder(ai: string)
                delfolder(ai)
            end
        elseif ag then
            local ai = Instance.new("Folder")
            ai.Name = "Filesystem"
            ai.Parent = services.getService("ReplicatedStorage")
            local function aj(ak: string): { string }
                local al = {}
                for am in string.gmatch(ak, "[^/]+") do
                    table.insert(al, am)
                end
                return al
            end
            local function ak(al: { string }, am: boolean): Instance?
                local b: Instance = ai
                for c = 1, #al - 1 do
                    local d = b:FindFirstChild(al[c])
                    if not d then
                        if not am then
                            return nil
                        end
                        local e = Instance.new("Folder")
                        e.Name = al[c]
                        e.Parent = b
                        d = e
                    end
                    b = d :: Instance
                end
                return b
            end
            local function al(am: Instance?): StringValue?
                if am and am:IsA("StringValue") then
                    return am
                end
                return nil
            end
            function af.writefile(am: string, b: string)
                local c = aj(am)
                assert(#c > 0, "Invalid path")
                local d = ak(c, true)
                assert(d, "Invalid path")
                local e = c[#c]
                local f = d:FindFirstChild(e)
                local g = al(f)
                if g then
                    g.Value = b
                else
                    if f then
                        f:Destroy()
                    end
                    local h = Instance.new("StringValue")
                    h.Name = e
                    h.Value = b
                    h.Parent = d
                end
            end
            function af.readfile(am: string): string
                local b = aj(am)
                assert(#b > 0, "Invalid path")
                local c = ak(b, false)
                assert(c, "File not found: " .. am)
                local d = c:FindFirstChild(b[#b])
                local e = al(d)
                assert(e, "File not found: " .. am)
                return e.Value
            end
            function af.isfile(am: string): boolean
                local b = aj(am)
                if #b == 0 then
                    return false
                end
                local c = ak(b, false)
                if not c then
                    return false
                end
                return al(c:FindFirstChild(b[#b])) ~= nil
            end
            function af.listfiles(am: string): { string }
                local b, c: Instance = aj(am), ai
                for d, e in b do
                    local f = c:FindFirstChild(e)
                    if not f or not f:IsA("Folder") then
                        error("Folder not found: " .. am)
                    end
                    c = f
                end
                local d: { string } = {}
                for e, f in c:GetChildren() do
                    table.insert(d, am .. "/" .. f.Name)
                end
                return d
            end
            function af.delfile(am: string)
                local b = aj(am)
                assert(#b > 0, "Invalid path")
                local c = ak(b, false)
                assert(c, "File not found: " .. am)
                local d = c:FindFirstChild(b[#b])
                local e = al(d)
                assert(e, "File not found: " .. am)
                e:Destroy()
            end
            function af.makefolder(am: string)
                local b = aj(am)
                if #b == 0 then
                    return
                end
                local c: Instance = ai
                for d, e in b do
                    local f = c:FindFirstChild(e)
                    if not f then
                        local g = Instance.new("Folder")
                        g.Name = e
                        g.Parent = c
                        f = g
                    end
                    c = f :: Instance
                end
            end
            function af.isfolder(am: string): boolean
                local b = aj(am)
                if #b == 0 then
                    return false
                end
                local c: Instance = ai
                for d, e in b do
                    local f = c:FindFirstChild(e)
                    if not f or not f:IsA("Folder") then
                        return false
                    end
                    c = f
                end
                return true
            end
            function af.delfolder(am: string)
                local b = aj(am)
                assert(#b > 0, "Invalid path")
                local c = ak(b, false)
                assert(c, "Folder not found: " .. am)
                local d = c:FindFirstChild(b[#b])
                assert(d and d:IsA("Folder"), "Folder not found: " .. am)
                d:Destroy()
            end
        end
        if af.writefile and not af.appendfile then
            function af.appendfile(ai: string, aj: string)
                local ak = if af.isfile(ai) then af.readfile(ai) else nil
                af.writefile(ai, if ak then ak .. aj else aj)
            end
        end

        function af.ensureFolder(ai: string)
            if not af.isfolder(ai) then
                af.makefolder(ai)
            end
        end

        function af.ensureDir(ai: string)
            local aj = ""
            for ak in string.gmatch(ai, "[^/]+") do
                aj = if aj == "" then ak else aj .. "/" .. ak
                if not af.isfolder(aj) then
                    af.makefolder(aj)
                end
            end
        end
        return af
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/filesystemManager
    define(Rayfield_utility_filesystemManager, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local filesystem, path, ag, ah =
            require(script.Parent.filesystem), require(script.Parent.path), "Rayfield", {}
        ah.__index = ah
        export type FileSystemManager = {
            root: string,
            assets: string,
            getPath: (self: FileSystemManager, subpath: string?) -> string,
            getAssetsFolder: (self: FileSystemManager, subfolder: string?) -> string,
            getRootFolder: (self: FileSystemManager) -> string,
        }

        function ah.new(ai: string?): FileSystemManager
            local aj = ai or ag
            local ak = setmetatable({ root = aj, assets = aj .. "/Assets" }, ah) :: any
            pcall(filesystem.ensureFolder, ak.root)
            pcall(filesystem.ensureFolder, ak.assets)
            return ak
        end

        function ah.getPath(self, aj: string?): string
            return path.join(self.root, aj)
        end

        function ah.getAssetsFolder(self, aj: string?): string
            if aj then
                local ak = path.join(self.assets, aj)
                pcall(filesystem.ensureFolder, ak)
                return ak
            end
            return self.assets
        end

        function ah.getRootFolder(self): string
            return self.root
        end
        return ah
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/flagNames
    define(Rayfield_utility_flagNames, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local ae, af, ag = {}, 2166136261, 16777619

        local function ah(ai: string): number
            local aj = af
            for ak = 1, #ai do
                aj = bit32.bxor(aj, string.byte(ai, ak))
                local al = aj % 65536
                local am = (aj - al) / 65536
                aj = (((am * ag) % 65536) * 65536 + al * ag) % 4294967296
            end
            return aj
        end

        function ae.deriveFlagFromName(ai: string): string
            local aj = ai:gsub("(%S+)", function(aj: string): string
                return aj:sub(1, 1):upper() .. aj:sub(2, -1)
            end):gsub("[^%w]", "")
            if aj == "" and ai ~= "" then
                return string.format("Flag%08x", ah(ai))
            end
            return aj
        end
        return ae
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/fontManager
    define(Rayfield_utility_fontManager, function(script, require)
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
                            "Failed to parse font manifest for font id: "
                                .. tostring(k)
                                .. ". Error: "
                                .. tostring(t)
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
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/functions
    define(Rayfield_utility_functions, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local ae, textMetrics, colors, flagNames =
            {},
            require(script.Parent.textMetrics),
            require(script.Parent.colors),
            require(script.Parent.flagNames)
        ae.textWidth = textMetrics.textWidth
        ae.textHeight = textMetrics.textHeight
        ae.deriveFlagFromName = flagNames.deriveFlagFromName
        ae.contrastColor = colors.contrastColor
        ae.toColorSequence = colors.toColorSequence
        ae.contrastText = colors.contrastText
        return ae
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/image
    define(Rayfield_utility_image, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local imageCache, variables = require(script.Parent.imageCache), require(script.Parent.variables)
        type AvatarCallback = imageCache.AvatarCallback
        type PreloadCallback = imageCache.PreloadCallback
        local image = {}
        image.rewrites = imageCache.rewrites
        image.onBlock = nil :: ((unknown) -> ())?
        type PendingProperties = { [string]: boolean }
        image.pending = {} :: { [number]: { [Instance]: PendingProperties } }
        local ah, ai: { [string]: boolean } = false, { Image = true, HoverImage = true, PressedImage = true }

        local function aj(ak: unknown): number?
            if type(ak) == "number" then
                return ak
            elseif type(ak) == "string" then
                return tonumber(string.match(ak, "^rbxassetid://(%d+)$"))
            end
            return nil
        end

        local function ak(al: unknown): string
            if image.onBlock then
                image.onBlock(al)
            end
            return ""
        end

        function image.preload(al: PreloadCallback?): (boolean, number)
            ah = false
            return imageCache.preload(function(am)
                ah = true
                table.clear(image.pending)
                if al then
                    al(am)
                end
            end)
        end

        function image.avatar(al: number, am: AvatarCallback?): string
            if not variables.secureMode then
                return `rbxthumb://type=AvatarHeadShot&id={al}&w=48&h=48`
            end
            return imageCache.avatar(al, am)
        end

        function image.assign(al: Instance, am: string, b: unknown)
            local c = al :: any
            if not ai[am] then
                c[am] = b
                return
            end
            c[am] = image.resolve(b)
            if variables.secureMode and not ah then
                local d = aj(b)
                if d and not image.rewrites[d] then
                    local e = image.pending[d]
                    if not e then
                        e = setmetatable({}, { __mode = "k" }) :: any
                        image.pending[d] = e
                    end
                    local f = e[al]
                    if not f then
                        f = {}
                        e[al] = f
                    end
                    f[am] = true
                end
            end
        end
        imageCache.onCached = function(al: number)
            local am = image.pending[al]
            if not am then
                return
            end
            local b = image.rewrites[al]
            if b then
                for c, d in am do
                    if c.Parent then
                        local e = c :: any
                        for f in d do
                            e[f] = b
                        end
                    end
                end
            end
            image.pending[al] = nil
        end

        function image.resolve(al: unknown): string
            if al == nil or al == 0 or al == "" then
                return ""
            end
            if type(al) == "string" then
                if string.sub(al, 1, 11) == "rbxasset://" then
                    return al
                end
                if string.sub(al, 1, 11) == "rbxthumb://" then
                    return if variables.secureMode then ak(al) else al
                end
            end
            local am: number?
            if type(al) == "number" then
                am = al
            elseif type(al) == "string" then
                am = tonumber(string.match(al, "^rbxassetid://(%d+)$"))
            end
            local b = if am then image.rewrites[am] else nil
            if b then
                return b
            end
            if variables.secureMode then
                return ak(al)
            end
            if type(al) == "number" then
                return "rbxassetid://" .. al
            end
            if type(al) == "string" then
                return al
            end
            return ak(al)
        end
        return image
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/imageCache
    define(Rayfield_utility_imageCache, function(script, require)
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
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/layouts
    define(Rayfield_utility_layouts, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local ae, af = {}, 64
        local ag, ah, ai = af - 1, 38, 3
        export type Mode = "top" | "sidebar"
        export type Layout = {
            mode: Mode,
            topbarHeight: number,
            chromeHeight: number,
            pageDirection: Enum.FillDirection,
            fadeSize: UDim2,
            fadeTransparency: NumberSequence,
            fadeCorners: { string }?,
            tabStripTop: number?,
            tabStripHeight: number?,
            railWidth: number?,
            railCollapsedWidth: number?,
            railCollapseBelow: number?,
            rowHeight: number?,
            rowCornerRadius: number?,
            rowSpacing: number?,
            railPadding: number?,
            rowInset: number?,
            rowPadding: number?,
            rowContentSpacing: number?,
            rowIconSize: number?,
            footerHeight: number?,
            avatarSize: number?,
            cardTransparency: number?,
            cardStrokeRotation: number?,
            cardStrokeTransparency: NumberSequence?,
            cardCorners: { string }?,
        }
        ae.top = {
            mode = "top" :: Mode,
            topbarHeight = af,
            chromeHeight = ag + ah + ai,
            tabStripTop = ag,
            tabStripHeight = ah,
            pageDirection = Enum.FillDirection.Horizontal,
            fadeSize = UDim2.new(1, 0, -9.3E-2, 100),
            fadeTransparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.4414, 0),
                NumberSequenceKeypoint.new(0.7007, 0.631),
                NumberSequenceKeypoint.new(1, 1),
            }),
        } :: Layout
        ae.sidebar = {
            mode = "sidebar" :: Mode,
            topbarHeight = af,
            chromeHeight = af,
            railWidth = 219,
            railCollapsedWidth = 64,
            railCollapseBelow = 589,
            rowHeight = 38,
            rowCornerRadius = 14,
            rowSpacing = 4,
            railPadding = 17,
            rowInset = 15,
            rowPadding = 10,
            rowContentSpacing = 6,
            rowIconSize = 20,
            footerHeight = 60,
            avatarSize = 34,
            pageDirection = Enum.FillDirection.Vertical,
            cardTransparency = 0.98,
            cardStrokeRotation = 55,
            cardCorners = { "TopLeftRadius", "BottomRightRadius" },
            cardStrokeTransparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.9),
                NumberSequenceKeypoint.new(0.128, 0.95),
                NumberSequenceKeypoint.new(0.414, 0.985),
                NumberSequenceKeypoint.new(1, 1),
            }),
            fadeSize = UDim2.new(1, 0, 0, 55),
            fadeTransparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.377, 0),
                NumberSequenceKeypoint.new(1, 1),
            }),
            fadeCorners = { "BottomRightRadius" },
        } :: Layout

        function ae.get(aj: unknown): Layout?
            if aj == "sidebar" then
                return ae.sidebar
            elseif aj == "top" then
                return ae.top
            end
            return nil
        end

        function ae.railWidthFor(aj: Layout, ak: number): number
            if aj.mode ~= "sidebar" then
                return 0
            end
            local al = aj.railWidth :: number
            if ak < (aj.railCollapseBelow :: number) then
                return aj.railCollapsedWidth :: number
            end
            return al
        end
        return ae
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/locale
    define(Rayfield_utility_locale, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables, log, ag = require(script.Parent.variables), require(script.Parent.log), {}
        export type LocaleToken = { [any]: string }
        export type Translator = (source: string, localeId: string) -> string?
        export type TranslationTables = { [string]: { [string]: string } }
        ag.strings = {} :: TranslationTables
        ag.current = "en"
        ag.translator = nil :: Translator?
        local ah = {}

        local function ai(aj: string): string
            return string.match(aj, "^(%a+)") or aj
        end

        function ag.t(aj: unknown): unknown
            if type(aj) ~= "string" or aj == "" then
                return aj
            end
            return { [ah] = aj }
        end

        function ag.isToken(aj: unknown): boolean
            return type(aj) == "table" and type((aj :: { [any]: unknown })[ah]) == "string"
        end

        function ag.sourceOf(aj: LocaleToken): string
            return aj[ah]
        end

        function ag.resolve(aj: unknown): any
            if type(aj) ~= "string" then
                return aj
            end
            if ag.translator then
                local ak, al = pcall(ag.translator, aj, ag.current)
                if ak and type(al) == "string" and al ~= "" then
                    return al
                end
            end
            local ak = ag.strings[ag.current]
            if ak and ak[aj] then
                return ak[aj]
            end
            local al = ag.strings[ai(ag.current)]
            if al and al[aj] then
                return al[aj]
            end
            return aj
        end

        function ag.register(aj: TranslationTables?)
            if type(aj) ~= "table" then
                return
            end
            for ak, al in aj do
                if type(ak) == "string" and type(al) == "table" then
                    ak = string.lower(ak)
                    local am = ag.strings[ak]
                    if not am then
                        am = {}
                        ag.strings[ak] = am
                    end
                    for b, c in al do
                        if type(b) == "string" and type(c) == "string" then
                            am[b] = c
                        else
                            log.warn(`Rayfield: skipping a '{ak}' translation, entries must be string to string.`)
                        end
                    end
                end
            end
        end

        function ag.setActive(aj: string?): string
            ag.current = if type(aj) == "string" and aj ~= "" then string.lower(aj) else "en"
            return ag.current
        end

        function ag.detect(): string
            local aj = variables.localizationService.RobloxLocaleId
            if type(aj) == "string" and aj ~= "" then
                return string.lower(aj)
            end
            return "en"
        end
        return ag
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/lockable
    define(Rayfield_utility_lockable, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local function ae<T>(af: T): T
            local ag = af :: any
            function ag.Lock(self, ai: string?)
                self.window:_setElementLocked(self, true, ai)
            end
            function ag.Unlock(self)
                self.window:_setElementLocked(self, false)
            end
            function ag.IsLocked(self): boolean
                return self.locked == true
            end
            return af
        end
        return ae
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/log
    define(Rayfield_utility_log, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local runtime, af = require(script.Parent.runtime), {}
        type SuppressPredicate = () -> boolean

        local function ag(): boolean
            return runtime.secureMode
        end
        local ah: SuppressPredicate, ai: SuppressPredicate? = ag

        function af.setSecureModeSource(aj: SuppressPredicate?)
            ah = if type(aj) == "function" then aj else ag
        end

        function af.setSuppressPredicate(aj: SuppressPredicate?)
            ai = if type(aj) == "function" then aj else nil
        end

        local function aj(): boolean
            if ai and ai() then
                return true
            end
            return ah()
        end

        function af.warn(...)
            if aj() then
                return
            end
            warn(...)
        end

        function af.print(...)
            if aj() then
                return
            end
            print(...)
        end
        return af
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/moveable
    define(Rayfield_utility_moveable, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local function ae<T>(af: T): T
            local ag = af :: any
            function ag.MoveTo(self, ai: number)
                self.tab:_moveElement(self, ai)
            end
            function ag.MoveToTop(self)
                self.tab:_moveElement(self, 1)
            end
            function ag.MoveToBottom(self)
                self.tab:_moveElement(self, #self.tab.elements)
            end
            function ag.MoveUp(self)
                local ai = table.find(self.tab.elements, self)
                if ai then
                    self.tab:_moveElement(self, ai - 1)
                end
            end
            function ag.MoveDown(self)
                local ai = table.find(self.tab.elements, self)
                if ai then
                    self.tab:_moveElement(self, ai + 1)
                end
            end
            return af
        end
        return ae
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/network
    define(Rayfield_utility_network, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local network = {}
        network.__index = network
        export type RequestFn = (...any) -> any

        function network.getRequestFn(af: any?): RequestFn?
            af = af or getfenv()
            return af.request
                or af.http_request
                or (af.http and af.http.request)
                or (af.syn and af.syn.request)
                or (af.fluxus and af.fluxus.request)
        end
        return network
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/odometer
    define(Rayfield_utility_odometer, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables = require(script.Parent.variables)
        local af, ag = variables.textService, {}
        ag.__index = ag
        local ah = 20

        local function ai(aj, ak, al)
            local am = Instance.new("GetTextBoundsParams")
            am.Text = al
            am.Font = aj
            am.Size = ak
            am.Width = math.huge
            local b, c = pcall(af.GetTextBoundsAsync, af, am)
            return if b then c else Vector2.new(ak * 0.6, ak)
        end
        local aj = {}

        local function ak(al, am)
            local b = tostring(al.Family)
                .. "|"
                .. tostring(al.Weight)
                .. "|"
                .. tostring(al.Style)
                .. "|"
                .. tostring(am)
            local c = aj[b]
            if c then
                return c
            end
            local d, e = {}, 0
            for f = 0, 9 do
                local g = math.ceil(ai(al, am, tostring(f)).X)
                d[f] = g
                if g > e then
                    e = g
                end
            end
            c = { advance = d, maxWidth = e }
            aj[b] = c
            return c
        end

        function ag.new(al, am, b)
            b = b or {}
            local c = setmetatable({
                window = al,
                container = am,
                textSize = b.textSize or 16,
                transparency = b.transparency or 1,
                duration = b.duration or 0.55,
                slots = {},
                length = 0,
            }, ag)
            c.roll = TweenInfo.new(c.duration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            c.zIndex = math.max(am.ZIndex + 1, 6)
            c.height = math.ceil(c.textSize)
            local d = ak(al.theme.Font, c.textSize)
            c.advance = d.advance
            c.maxWidth = d.maxWidth
            al:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = b.alignment or Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 0),
                Parent = am,
            })
            return c
        end

        function ag._reel(self, am)
            local b = self.slots[am]
            if b.reel then
                return b.reel
            end
            local c = self.window:Create("Frame", {
                Name = "Reel",
                Size = UDim2.fromOffset(self.maxWidth, self.height),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                ZIndex = self.zIndex,
                Parent = self.container,
            })
            local d = self.window:Create("Frame", {
                Size = UDim2.fromOffset(self.maxWidth, self.height),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.new(0.5, 0, 0, 0),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = self.zIndex,
                Parent = c,
            })
            for e = 0, ah - 1 do
                self.window:Create("TextLabel", {
                    Text = tostring(e % 10),
                    Position = UDim2.fromOffset(0, e * self.height),
                    Size = UDim2.fromOffset(self.maxWidth, self.height),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextSize = self.textSize,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    TextTransparency = self.transparency,
                    ZIndex = self.zIndex,
                    Parent = d,
                }, { TextColor3 = "ContentColor", FontFace = "Font" })
            end
            local e = {
                cell = c,
                strip = d,
                digit = 0,
                target = 0,
                stripTween = nil,
                sizeTween = nil,
            }
            b.reel = e
            return e
        end

        function ag._static(self, am)
            local b = self.slots[am]
            if b.static then
                return b.static
            end
            local c = self.window:Create("TextLabel", {
                Name = "Static",
                Size = UDim2.fromOffset(0, self.height),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = self.textSize,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextYAlignment = Enum.TextYAlignment.Center,
                TextTransparency = self.transparency,
                ZIndex = self.zIndex,
                Parent = self.container,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            b.static = c
            return c
        end

        local function al(am)
            if am.stripTween then
                am.stripTween:Cancel()
                am.stripTween = nil
            end
            if am.sizeTween then
                am.sizeTween:Cancel()
                am.sizeTween = nil
            end
        end

        function ag._reelSnap(self, b, c)
            al(b)
            b.cell.Size = UDim2.fromOffset(self.advance[c], self.height)
            b.strip.Position = UDim2.new(0.5, 0, 0, -c * self.height)
            b.digit = c
            b.target = c
        end

        function ag._reelRoll(self, b, c, d)
            if b.stripTween or b.sizeTween then
                self:_reelSnap(b, b.target)
            end
            local e = b.digit
            if e == c then
                return
            end
            local f, g
            if d then
                f = e
                g = e + (c - e) % 10
            else
                f = e + 10
                g = f - (e - c) % 10
            end
            b.strip.Position = UDim2.new(0.5, 0, 0, -f * self.height)
            b.target = c
            local h, i =
                variables.tweenService:Create(
                    b.strip,
                    self.roll,
                    { Position = UDim2.new(0.5, 0, 0, -g * self.height) }
                ),
                variables.tweenService:Create(
                    b.cell,
                    self.roll,
                    { Size = UDim2.fromOffset(self.advance[c], self.height) }
                )
            b.stripTween = h
            b.sizeTween = i
            h.Completed:Connect(function(j)
                if j == Enum.PlaybackState.Completed and b.stripTween == h then
                    self:_reelSnap(b, c)
                end
            end)
            h:Play()
            i:Play()
            b.digit = c
        end

        function ag._putDigit(self, b, c, d, e)
            local f = self:_reel(b)
            local g = not f.cell.Visible
            f.cell.Visible = true
            f.cell.LayoutOrder = -b
            if self.slots[b].static then
                self.slots[b].static.Visible = false
            end
            if e and not g then
                self:_reelRoll(f, c, d)
            else
                self:_reelSnap(f, c)
            end
        end

        function ag._putStatic(self, b, c)
            local d = self:_static(b)
            if not d.Visible then
                d.TextTransparency = self.transparency
            end
            d.Text = c
            d.Visible = true
            d.LayoutOrder = -b
            if self.slots[b].reel then
                self.slots[b].reel.cell.Visible = false
            end
        end

        function ag._hide(self, b)
            local c = self.slots[b]
            if not c then
                return
            end
            if c.reel then
                c.reel.cell.Visible = false
            end
            if c.static then
                c.static.Visible = false
            end
        end

        function ag._render(self, b, c, d)
            b = tostring(b)
            if b == self._lastText then
                return
            end
            self._lastText = b
            local e = {}
            for f, g in utf8.codes(b) do
                table.insert(e, utf8.char(g))
            end
            local f = #e
            for g = 0, math.max(f, self.length) - 1 do
                self.slots[g] = self.slots[g] or {}
                if g < f then
                    local h = e[f - g]
                    if h:match("%d") then
                        self:_putDigit(g, tonumber(h), d, c)
                    else
                        self:_putStatic(g, h)
                    end
                else
                    self:_hide(g)
                end
            end
            self.length = f
        end

        function ag.to(self, b, c)
            self:_render(b, true, c)
        end

        function ag.snap(self, b)
            self:_render(b, false, true)
        end

        function ag.reveal(self, b, c, d)
            self.transparency = b
            for e, f in self.slots do
                if f.static and f.static.Visible then
                    self.window:_reveal(f.static, { TextTransparency = b }, c, d)
                end
                if f.reel then
                    for g, h in f.reel.strip:GetChildren() do
                        if h:IsA("TextLabel") then
                            self.window:_reveal(h, { TextTransparency = b }, c, d)
                        end
                    end
                end
            end
        end
        return ag
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/ordering
    define(Rayfield_utility_ordering, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        type OrderedElement = { main: GuiObject, descriptor: { main: GuiObject }? }

        local function ae(af: OrderedElement, ag: number)
            af.main.LayoutOrder = ag
            if af.descriptor then
                af.descriptor.main.LayoutOrder = ag + 1
            end
        end
        return ae
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/path
    define(Rayfield_utility_path, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local path = {}

        function path.join(af: string, ag: string?): string
            if not ag or ag == "" then
                return af
            end
            return af .. "/" .. ag
        end

        local function af(ag: string): string
            local ah
            repeat
                ah = ag
                ag = ag:gsub("%.%.", "")
            until ag == ah
            return ag
        end

        function path.sanitizeFolder(ag: unknown): string
            local ah = tostring(ag):gsub("\\", "/"):gsub('[:<>"|?*%c]', "")
            ah = af(ah):gsub("/+", "/")
            return (ah:gsub("^/+", ""))
        end

        function path.sanitizeFile(ag: unknown): string
            local ah = tostring(ag):gsub("[/\\]", ""):gsub('[:<>"|?*%c]', "")
            return af(ah)
        end

        function path.basename(ag: unknown): string
            return tostring(ag):match("[^/\\]+$") or tostring(ag)
        end

        function path.stripExtension(ag: unknown, ah: string?): string
            if ah and ah ~= "" then
                local ai = tostring(ag)
                if ai:sub(-#ah) == ah then
                    return ai:sub(1, -#ah - 1)
                end
                return ai
            end
            local ai = tostring(ag):match("^(.+)%.%w+$")
            return ai or tostring(ag)
        end
        return path
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/persistence
    define(Rayfield_utility_persistence, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local ae, persistenceConfig, persistenceSettings =
            {}, require(script.Parent.persistenceConfig), require(script.Parent.persistenceSettings)
        ae.getPath = persistenceConfig.getPath
        ae.save = persistenceConfig.save
        ae.load = persistenceConfig.load
        ae.applyTo = persistenceConfig.applyTo
        ae.list = persistenceConfig.list
        ae.delete = persistenceConfig.delete
        ae.getSettingsPath = persistenceSettings.getSettingsPath
        ae.saveSettings = persistenceSettings.saveSettings
        ae.loadSettings = persistenceSettings.loadSettings
        return ae
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/persistenceConfig
    define(Rayfield_utility_persistenceConfig, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables, filesystem, log, path, persistencePaths, persistenceWrite, ak =
            require(script.Parent.variables),
            require(script.Parent.filesystem),
            require(script.Parent.log),
            require(script.Parent.path),
            require(script.Parent.persistencePaths),
            require(script.Parent.persistenceWrite),
            {}
        type PersistedControl = {
            value: unknown,
            flag: string?,
            _canBeNil: boolean?,
            _serialize: ((PersistedControl) -> unknown)?,
            _deserialize: ((PersistedControl, unknown) -> ())?,
            Set: (PersistedControl, unknown) -> (),
        }
        type ConfigWindow = {
            controls: { [string]: PersistedControl },
            configuration: { fileName: string?, customFolder: string? },
            name: string,
            _loading: boolean?,
            _loadedConfig: { [string]: unknown }?,
            _loadedConfigPath: string?,
        }

        function ak.getPath(al: ConfigWindow, am: unknown?): (string?, string?)
            return persistencePaths.getConfigPath(al, am)
        end

        function ak.save(al: ConfigWindow, am: unknown?): boolean
            local b, c = ak.getPath(al, am)
            if not b or not c then
                log.warn("Rayfield: configuration name '" .. tostring(am) .. "' has no usable characters")
                return false
            end
            if typeof(filesystem.writefile) ~= "function" then
                return false
            end
            local d: { [string]: unknown } = {}
            for e, f in al.controls do
                local g, h = pcall(function()
                    local g = f._serialize
                    if g then
                        return g(f)
                    end
                    return f.value
                end)
                if g then
                    d[e] = h
                else
                    log.warn("Rayfield: Failed to serialize flag '" .. tostring(e) .. "' - " .. tostring(h))
                end
            end
            local e = al._loadedConfig
            if e and al._loadedConfigPath == c then
                for f, g in e do
                    if al.controls[f] == nil then
                        d[f] = g
                    end
                end
            end
            local f, g = pcall(variables.httpService.JSONEncode, variables.httpService, d)
            if not f then
                log.warn("Rayfield: Failed to encode configuration - " .. tostring(g))
                return false
            end
            local h, i = pcall(function()
                persistenceWrite.write(b, c, g)
            end)
            if not h then
                log.warn("Rayfield: Failed to save configuration - " .. tostring(i))
                return false
            end
            if al._loadedConfigPath == nil or al._loadedConfigPath == c then
                al._loadedConfig = d
                al._loadedConfigPath = c
            end
            return true
        end

        local function al(am: string): ({ [string]: unknown }?, string?)
            if not filesystem.isfile(am) then
                return nil, nil
            end
            local b, c = pcall(filesystem.readfile, am)
            if not b or type(c) ~= "string" then
                log.warn("Rayfield: Failed to read configuration file")
                return nil, nil
            end
            local d, e = pcall(variables.httpService.JSONDecode, variables.httpService, c)
            if not d or type(e) ~= "table" then
                return nil, c
            end
            return e :: { [string]: unknown }, c
        end

        local function am(b: string): string
            local c = path.stripExtension(b, ".rfld")
            local d, e = c .. " (Incorrect Format).rfld", 2
            while e <= 100 and filesystem.isfile(d) do
                d = c .. " (Incorrect Format " .. e .. ").rfld"
                e += 1
            end
            return d
        end

        function ak.load(b: ConfigWindow, c: unknown?): boolean
            local d, e = ak.getPath(b, c)
            if not d or not e then
                log.warn("Rayfield: configuration name '" .. tostring(c) .. "' has no usable characters")
                return false
            end
            if typeof(filesystem.isfile) ~= "function" then
                return false
            end
            local f, g = al(e)
            if not f and filesystem.isfile(e) then
                local h, i = al(persistenceWrite.tempPathFor(e))
                if h and i then
                    f = h
                    pcall(persistenceWrite.write, d, e, i)
                end
            end
            if not f then
                if g then
                    log.warn([[Rayfield: Configuration file has an invalid format, backing up and resetting]])
                    local h = am(e)
                    pcall(function()
                        filesystem.ensureDir(d)
                        filesystem.writefile(h, g)
                        filesystem.delfile(e)
                    end)
                end
                return false
            end
            local h, i = f :: { [string]: unknown }, b._loading
            b._loading = true
            local j, k = pcall(function()
                for j, k in b.controls do
                    ak.applyTo(k, h[j])
                end
            end)
            b._loading = i
            if not j then
                log.warn("Rayfield: Failed to apply configuration - " .. tostring(k))
            end
            b._loadedConfig = h
            b._loadedConfigPath = e
            return true
        end

        function ak.applyTo(b: PersistedControl, c: unknown)
            if c == nil and not b._canBeNil then
                return
            end
            local d, e = pcall(function()
                local d = b._deserialize
                if d then
                    d(b, c)
                else
                    b:Set(c)
                end
            end)
            if not d then
                log.warn("Rayfield: Failed to restore flag '" .. tostring(b.flag) .. "' - " .. tostring(e))
            end
        end

        function ak.list(b: ConfigWindow): { string }
            local c, d: { string } = ak.getPath(b), {}
            if not c then
                return d
            end
            local e, f = pcall(filesystem.listfiles, c)
            if not e or type(f) ~= "table" then
                return d
            end
            for g, h in f do
                local i = path.basename(h)
                if i:sub(-5) == ".rfld" then
                    local j = path.stripExtension(i, ".rfld")
                    if j and j ~= "" and not j:find(" %(Incorrect Format[^%)]*%)$") then
                        table.insert(d, j)
                    end
                end
            end
            table.sort(d)
            return d
        end

        function ak.delete(b: ConfigWindow, c: unknown): boolean
            if type(c) ~= "string" or c == "" then
                return false
            end
            local d, e = ak.getPath(b, c)
            if not e then
                return false
            end
            if typeof(filesystem.isfile) ~= "function" or not filesystem.isfile(e) then
                return false
            end
            pcall(filesystem.delfile, persistenceWrite.tempPathFor(e))
            return (pcall(filesystem.delfile, e))
        end
        return ak
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/persistencePaths
    define(Rayfield_utility_persistencePaths, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables, path, ag = require(script.Parent.variables), require(script.Parent.path), {}
        type ConfigWindow = {
            configuration: { fileName: string?, customFolder: string? },
            name: string,
        }

        function ag.getConfigPath(ah: ConfigWindow, ai: unknown?): (string?, string?)
            local aj = variables.fileSystemManager:getPath("Configurations")
            if ah.configuration.customFolder then
                aj = path.join(aj, path.sanitizeFolder(ah.configuration.customFolder))
            end
            if ai ~= nil then
                local ak = path.sanitizeFile(ai)
                if ak == "" then
                    return nil, nil
                end
                return aj, path.join(aj, ak .. ".rfld")
            end
            local ak = path.sanitizeFile(ah.configuration.fileName or ah.name)
            if ak == "" then
                ak = path.sanitizeFile(ah.name)
            end
            if ak == "" then
                ak = "Configuration"
            end
            return aj, path.join(aj, ak .. ".rfld")
        end

        function ag.getSettingsPath(): (string, string)
            local ah = variables.fileSystemManager:getPath("Settings")
            return ah, path.join(ah, "rayfield.rfld")
        end
        return ag
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/persistenceSettings
    define(Rayfield_utility_persistenceSettings, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables, filesystem, persistencePaths, persistenceWrite, enums, aj =
            require(script.Parent.variables),
            require(script.Parent.filesystem),
            require(script.Parent.persistencePaths),
            require(script.Parent.persistenceWrite),
            require(script.Parent.enums),
            {}
        type SettingsWindow = {
            settings: {
                toggleKeybind: EnumItem,
                mouseOverride: boolean,
                keepOnScreen: boolean,
                welcomeToast: boolean,
                haptics: boolean,
                showProfile: boolean,
            },
        }
        type DecodedSettings = {
            toggleKeybind: { [number]: unknown }?,
            mouseOverride: unknown?,
            keepOnScreen: unknown?,
            welcomeToast: unknown?,
            haptics: unknown?,
            showProfile: unknown?,
        }

        function aj.getSettingsPath(): (string, string)
            return persistencePaths.getSettingsPath()
        end

        function aj.saveSettings(ak: SettingsWindow): boolean
            local al, am = aj.getSettingsPath()
            local b: { [string]: unknown } = {
                toggleKeybind = { tostring(ak.settings.toggleKeybind.EnumType), ak.settings.toggleKeybind.Value } :: { unknown },
                mouseOverride = ak.settings.mouseOverride,
                keepOnScreen = ak.settings.keepOnScreen,
                welcomeToast = ak.settings.welcomeToast,
                haptics = ak.settings.haptics,
                showProfile = ak.settings.showProfile,
            }
            local c, d = pcall(variables.httpService.JSONEncode, variables.httpService, b)
            if not c then
                return false
            end
            local e = pcall(persistenceWrite.write, al, am, d)
            if not e then
                return false
            end
            return true
        end

        local function ak(al: string): (DecodedSettings?, string?)
            local am = false
            pcall(function()
                am = filesystem.isfile(al)
            end)
            if not am then
                return nil, nil
            end
            local b, c = pcall(filesystem.readfile, al)
            if not b or type(c) ~= "string" then
                return nil, nil
            end
            local d, e = pcall(variables.httpService.JSONDecode, variables.httpService, c)
            if not d or type(e) ~= "table" then
                return nil, c
            end
            return e :: DecodedSettings, c
        end

        function aj.loadSettings(al: SettingsWindow): boolean
            local am, b = aj.getSettingsPath()
            local c = ak(b)
            if not c then
                local d, e = ak(persistenceWrite.tempPathFor(b))
                if d and e then
                    c = d
                    pcall(persistenceWrite.write, am, b, e)
                end
            end
            if not c then
                return false
            end
            if c.toggleKeybind then
                pcall(function()
                    local d = tostring(c.toggleKeybind[1]):gsub("^Enum%.", "")
                    local e = (Enum :: any)[d]
                    if e then
                        local f = enums.itemFromValue(e, c.toggleKeybind[2])
                        if f then
                            al.settings.toggleKeybind = f
                        end
                    end
                end)
            end
            if type(c.mouseOverride) == "boolean" then
                al.settings.mouseOverride = c.mouseOverride
            end
            if type(c.keepOnScreen) == "boolean" then
                al.settings.keepOnScreen = c.keepOnScreen
            end
            if type(c.welcomeToast) == "boolean" then
                al.settings.welcomeToast = c.welcomeToast
            end
            if type(c.haptics) == "boolean" then
                al.settings.haptics = c.haptics
            end
            if type(c.showProfile) == "boolean" then
                al.settings.showProfile = c.showProfile
            end
            return true
        end
        return aj
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/persistenceWrite
    define(Rayfield_utility_persistenceWrite, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local filesystem, af, ag = require(script.Parent.filesystem), {}, ".saving"

        function af.tempPathFor(ah: string): string
            return ah .. ag
        end

        function af.write(ah: string, ai: string, aj: string)
            local ak = af.tempPathFor(ai)
            filesystem.ensureDir(ah)
            filesystem.writefile(ak, aj)
            if filesystem.readfile(ak) ~= aj then
                error("parked copy did not write cleanly")
            end
            filesystem.writefile(ai, aj)
            pcall(filesystem.delfile, ak)
        end
        return af
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/runtime
    define(Rayfield_utility_runtime, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local services = require(script.Parent.services)
        export type RuntimeState = {
            secureMode: boolean,
            coreGui: CoreGui,
            workspace: Workspace,
            runService: RunService,
            userInputService: UserInputService,
            guiService: GuiService,
            localPlayer: Player?,
            tweenService: TweenService,
            httpService: HttpService,
            textService: TextService,
            replicatedStorage: ReplicatedStorage,
            localizationService: LocalizationService,
            guiContainer: Instance,
        }
        local af = {} :: RuntimeState
        af.secureMode = (function()
            if typeof(getgenv) ~= "function" then
                return false
            end
            local ag, ah = pcall(function()
                return getgenv().RAYFIELD_SECURE
            end)
            return ag and ah == true
        end)()
        af.coreGui = services.getService("CoreGui") :: CoreGui
        af.workspace = services.getService("Workspace") :: Workspace
        af.runService = services.getService("RunService") :: RunService
        af.userInputService = services.getService("UserInputService") :: UserInputService
        af.guiService = services.getService("GuiService") :: GuiService
        af.localPlayer = (services.getService("Players") :: Players).LocalPlayer
        af.tweenService = services.getService("TweenService") :: TweenService
        af.httpService = services.getService("HttpService") :: HttpService
        af.textService = services.getService("TextService") :: TextService
        af.replicatedStorage = services.getService("ReplicatedStorage") :: ReplicatedStorage
        af.localizationService = services.getService("LocalizationService") :: LocalizationService
        af.guiContainer = (function(): Instance
            if af.runService:IsStudio() then
                local ag = af.localPlayer
                if ag then
                    return ag.PlayerGui
                end
                return af.coreGui
            end
            if typeof(gethui) == "function" then
                local ag, ah = pcall(gethui)
                if ag and ah then
                    return ah
                end
            end
            return af.coreGui
        end)()
        return af
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/services
    define(Rayfield_utility_services, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local services = {}

        function services.getService(af)
            local ag = game:GetService(af)
            return if cloneref then cloneref(ag) else ag
        end
        return services
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/textMetrics
    define(Rayfield_utility_textMetrics, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables = require(script.Parent.variables)
        local af, ag, ah: { [string]: number }, ai, aj = variables.textService, {}, {}, 0, 1024

        local function ak(al: GetTextBoundsParams): unknown
            local am, b = pcall(function()
                return af:GetTextBoundsAsync(al)
            end)
            return if am then b else nil
        end

        local function al(am: unknown, b: "X" | "Y"): number?
            if typeof(am) == "Vector2" then
                return if b == "X" then am.X else am.Y
            end
            if type(am) == "table" and type((am :: any)[b]) == "number" then
                return (am :: any)[b]
            end
            return nil
        end

        function ag.textWidth(am: Font, b: number, c: any): number
            c = tostring(c)
            local d = tostring(am.Family)
                .. "|"
                .. tostring(am.Weight)
                .. "|"
                .. tostring(am.Style)
                .. "|"
                .. tostring(b)
                .. "|"
                .. c
            local e = ah[d]
            if e then
                return e
            end
            local f = Instance.new("GetTextBoundsParams")
            f.Text = c
            f.Font = am
            f.Size = b
            f.Width = math.huge
            local g = al(ak(f), "X")
            if not g then
                local h = utf8.len(c) or #c
                return math.ceil(b * 0.55 * h)
            end
            local h = math.ceil(g)
            if ai >= aj then
                ah = {}
                ai = 0
            end
            ah[d] = h
            ai += 1
            return h
        end

        function ag.textHeight(am: Font, b: number, c: any, d: number): number
            local e = Instance.new("GetTextBoundsParams")
            e.Text = tostring(c)
            e.Font = am
            e.Size = b
            e.Width = d
            local f = al(ak(e), "Y")
            return if f then math.ceil(f) else b
        end
        return ag
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/variables
    define(Rayfield_utility_variables, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local runtime, constants, log, filesystemManager, assetResolver, fontManager =
            require(script.Parent.runtime),
            require(script.Parent.constants),
            require(script.Parent.log),
            require(script.Parent.filesystemManager),
            require(script.Parent.assetResolver),
            require(script.Parent.fontManager)
        type RuntimeState = runtime.RuntimeState
        type FileSystemManager = filesystemManager.FileSystemManager
        type AssetResolver = assetResolver.AssetResolver
        type FontManager = fontManager.FontManager
        export type VariablesState = RuntimeState & {
            fallbackFont: Font,
            fileSystemManager: FileSystemManager,
            assetResolver: AssetResolver,
            fontManager: FontManager,
            setFallbackFont: (font: Enum.Font | Font) -> (),
            brandFont: (weight: Enum.FontWeight?) -> Font,
        }
        local ak = table.clone(runtime) :: VariablesState
        log.setSecureModeSource(function()
            return ak.secureMode
        end)
        ak.fallbackFont = Font.fromEnum(Enum.Font.BuilderSans)
        ak.fileSystemManager = filesystemManager.new()
        ak.assetResolver =
            assetResolver.new(true, assetResolver.Enum.AssetDownloadUrl.RoProxyDownloadUrl) :: AssetResolver
        ak.fontManager = fontManager.new(
            ak.fileSystemManager:getAssetsFolder("fonts"),
            false,
            true,
            assetResolver.Enum.AssetDownloadUrl.RoProxyDownloadUrl,
            { saveToDisk = true, skipCache = false, fallbackFont = ak.fallbackFont }
        ) :: FontManager

        function ak.setFallbackFont(al: Enum.Font | Font)
            if typeof(al) == "EnumItem" then
                al = Font.fromEnum(al)
            end
            if typeof(al) == "Font" then
                ak.fallbackFont = al
                ak.fontManager.defaultOptions.fallbackFont = al
            end
        end

        function ak.brandFont(al: Enum.FontWeight?): Font
            if ak.secureMode then
                return Font.new(ak.fallbackFont.Family, al)
            end
            return Font.new(constants.fontAsset, al)
        end
        return ak
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/utility/windowSizing
    define(Rayfield_utility_windowSizing, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local layouts, af = require(script.Parent.layouts), {}
        export type Profile = {
            defaultSize: Vector2,
            minSize: Vector2,
            maxOccupancyX: number,
            maxOccupancyY: number?,
            marginFloorX: number,
            marginFloorY: number,
            topbarClearance: number?,
            maxAspectRatio: number,
            minAspectRatio: number?,
            widthCompensation: number?,
            chromeHeight: number,
        }
        local ag, ah =
            200, {
                top = {
                    defaultSize = Vector2.new(475, 500),
                    minSize = Vector2.new(300, 285),
                    maxOccupancyX = 0.86,
                    topbarClearance = 36,
                    marginFloorX = 24,
                    marginFloorY = 28,
                    maxAspectRatio = 2.3,
                    widthCompensation = 130,
                    chromeHeight = layouts.top.chromeHeight,
                } :: Profile,
                sidebar = {
                    defaultSize = Vector2.new(685, 450),
                    minSize = Vector2.new(560, 350),
                    maxOccupancyX = 0.92,
                    maxOccupancyY = 0.8,
                    marginFloorX = 24,
                    marginFloorY = 28,
                    maxAspectRatio = 2.6,
                    minAspectRatio = 1.2,
                    chromeHeight = layouts.sidebar.chromeHeight,
                } :: Profile,
            }

        function af.profile(ai: ae.Mode?): Profile
            if ai == "sidebar" then
                return ah.sidebar
            end
            return ah.top
        end

        function af.pageHeight(ai: number?, aj: ae.Mode?): number
            local ak = af.profile(aj)
            local al = if ai and ai > 0 then ai else ak.minSize.Y
            return math.max(al - ak.chromeHeight, 0)
        end

        local function ai(aj: Profile, ak: number): number
            local al = ak - aj.marginFloorY
            if aj.topbarClearance then
                al = math.min(al, ak - aj.topbarClearance * 2)
            end
            if aj.maxOccupancyY then
                al = math.min(al, ak * aj.maxOccupancyY)
            end
            return al
        end

        local function aj(ak: number, al: number, am: number): number
            return math.clamp((al - ak) / (al - am), 0, 1)
        end

        local function ak(al: Profile, am: number, b: number): UDim2
            local c = math.floor(math.min(math.clamp(b, al.minSize.Y, al.defaultSize.Y), b))
            local d = aj(c, al.defaultSize.Y, al.minSize.Y)
            local e = math.max(al.defaultSize.X + (al.widthCompensation :: number) * d, al.minSize.X)
            return UDim2.fromOffset(math.floor(math.min(e, am, c * al.maxAspectRatio)), c)
        end

        local function al(am: Profile, b: number, c: number): UDim2
            local d, e =
                math.min(math.clamp(b, am.minSize.X, am.defaultSize.X), b),
                math.min(math.clamp(c, am.minSize.Y, am.defaultSize.Y), c)
            e = math.floor(math.min(e, d / (am.minAspectRatio :: number)))
            d = math.floor(math.min(d, e * am.maxAspectRatio))
            return UDim2.fromOffset(d, e)
        end

        function af.fit(am: Vector2?, b: ae.Mode?): UDim2
            local c = af.profile(b)
            if not am or am.X < ag or am.Y < ag then
                return UDim2.fromOffset(c.defaultSize.X, c.defaultSize.Y)
            end
            local d, e = math.min(am.X * c.maxOccupancyX, am.X - c.marginFloorX), ai(c, am.Y)
            if c.minAspectRatio then
                return al(c, d, e)
            end
            return ak(c, d, e)
        end
        return af
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/themes/amethyst
    define(Rayfield_themes_amethyst, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        return {
            WindowColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 16, 32)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(30, 22, 46)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 28, 56)),
            }),
            ShadowColor = Color3.fromRGB(12, 6, 22),
            ElementStroke = Color3.fromRGB(54, 42, 74),
            ElementGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 24, 48)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(36, 28, 54)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(36, 28, 54)),
            }),
            ElementStrokeGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(72, 58, 104)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(88, 72, 124)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(72, 58, 104)),
            }),
            ElementStrokeHover = Color3.fromRGB(84, 68, 118),
            TabBackground = ColorSequence.new(Color3.fromRGB(54, 42, 80), Color3.fromRGB(34, 26, 52)),
            TabStroke = ColorSequence.new(Color3.fromRGB(88, 70, 128), Color3.fromRGB(54, 42, 80)),
            SliderBackground = Color3.fromRGB(46, 36, 68),
            SliderBackgroundHover = Color3.fromRGB(60, 48, 90),
            SliderProgress = ColorSequence.new(Color3.fromRGB(170, 112, 248), Color3.fromRGB(138, 80, 224)),
            AccentColor = Color3.fromRGB(168, 110, 246),
            AccentStroke = Color3.fromRGB(200, 154, 255),
            ToggleKnobOff = Color3.fromRGB(224, 214, 236),
            StatBackground = Color3.fromRGB(24, 18, 38),
            DropdownHighlight = Color3.fromRGB(168, 110, 246),
            NeutralButton = Color3.fromRGB(46, 36, 68),
            NeutralButtonHover = Color3.fromRGB(60, 48, 90),
            NeutralButtonStroke = Color3.fromRGB(140, 116, 190),
        }
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/themes/cobalt
    define(Rayfield_themes_cobalt, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        return {
            WindowColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 16, 34)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(20, 26, 50)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 36, 66)),
            }),
            ShadowColor = Color3.fromRGB(6, 8, 20),
            ElementStroke = Color3.fromRGB(44, 52, 82),
            ElementGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 32, 58)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(30, 38, 66)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 38, 66)),
            }),
            ElementStrokeGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 66, 104)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(70, 82, 124)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(56, 66, 104)),
            }),
            ElementStrokeHover = Color3.fromRGB(64, 76, 116),
            TabBackground = ColorSequence.new(Color3.fromRGB(48, 58, 92), Color3.fromRGB(30, 38, 64)),
            TabStroke = ColorSequence.new(Color3.fromRGB(78, 92, 140), Color3.fromRGB(48, 58, 92)),
            SliderBackground = Color3.fromRGB(40, 48, 78),
            SliderBackgroundHover = Color3.fromRGB(54, 64, 100),
            SliderProgress = ColorSequence.new(Color3.fromRGB(64, 132, 248), Color3.fromRGB(42, 104, 224)),
            AccentColor = Color3.fromRGB(48, 120, 240),
            AccentStroke = Color3.fromRGB(96, 164, 255),
            ToggleKnobOff = Color3.fromRGB(196, 206, 232),
            StatBackground = Color3.fromRGB(20, 26, 48),
            DropdownHighlight = Color3.fromRGB(48, 120, 240),
            NeutralButton = Color3.fromRGB(40, 48, 78),
            NeutralButtonHover = Color3.fromRGB(54, 64, 100),
            NeutralButtonStroke = Color3.fromRGB(120, 138, 195),
        }
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/themes/default
    define(Rayfield_themes_default, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables = require(script.Parent.Parent.utility.variables)
        return {
            CornerRoundness = UDim.new(0, 20),
            WindowColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(10, 10, 10)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(25, 25, 25)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 35)),
            }),
            ShadowColor = Color3.fromRGB(20, 20, 20),
            ElementStroke = Color3.fromRGB(35, 35, 35),
            ElementGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(35, 35, 35)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(35, 35, 35)),
            }),
            ElementStrokeGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(48, 48, 48)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(58, 58, 58)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(48, 48, 48)),
            }),
            TabColor = Color3.fromRGB(255, 255, 255),
            TabBackground = ColorSequence.new(Color3.fromRGB(50, 50, 50), Color3.fromRGB(35, 35, 35)),
            TabStroke = ColorSequence.new(Color3.fromRGB(95, 95, 95), Color3.fromRGB(50, 50, 50)),
            SliderBackground = Color3.fromRGB(47, 47, 47),
            SliderBackgroundHover = Color3.fromRGB(60, 60, 60),
            SliderProgress = ColorSequence.new(Color3.fromRGB(0, 170, 127), Color3.fromRGB(0, 134, 98)),
            SliderStroke = Color3.fromRGB(255, 255, 255),
            ActionColor = Color3.fromRGB(255, 255, 255),
            TitleFont = variables.brandFont(Enum.FontWeight.SemiBold),
            Font = variables.brandFont(Enum.FontWeight.Medium),
            ContentColor = Color3.fromRGB(255, 255, 255),
            LiveAnimation = false,
            DarkToggleOverlay = true,
            ElementTransparency = 0,
            ElementStrokeTransparency = 0,
            ElementStrokeHoverTransparency = 0,
            ElementStrokeHover = Color3.fromRGB(50, 50, 50),
            ElementCornerRadius = UDim.new(0, 12),
            ElementTextHoverColor = Color3.fromRGB(255, 255, 255),
            TitlingColor = Color3.fromRGB(255, 255, 255),
            DropdownHighlight = Color3.fromRGB(255, 255, 255),
            AccentColor = Color3.fromRGB(23, 153, 110),
            AccentStroke = Color3.fromRGB(32, 201, 144),
            AccentGlow = 0.4,
            StatBackground = Color3.fromRGB(25, 25, 25),
            SliderHandle = Color3.fromRGB(255, 255, 255),
            PillCornerRadius = UDim.new(1, 0),
            ToggleTrack = Color3.fromRGB(0, 0, 0),
            ToggleTrackTransparency = 0.9,
            ToggleKnobOff = Color3.fromRGB(255, 255, 255),
            ToggleKnobOffTransparency = 0.8,
            FieldBackground = Color3.fromRGB(255, 255, 255),
            FieldTransparency = 0.9,
            FieldGlow = Color3.fromRGB(255, 255, 255),
            PlaceholderColor = Color3.fromRGB(178, 178, 178),
            SurfaceStroke = Color3.fromRGB(255, 255, 255),
            NeutralButton = Color3.fromRGB(38, 38, 38),
            NeutralButtonHover = Color3.fromRGB(54, 54, 54),
            NeutralButtonStroke = Color3.fromRGB(255, 255, 255),
            ErrorColor = Color3.fromRGB(185, 50, 50),
            ErrorStrokeColor = Color3.fromRGB(240, 75, 75),
        }
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/themes/ember
    define(Rayfield_themes_ember, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        return {
            WindowColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 18, 16)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(32, 27, 23)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 33, 28)),
            }),
            ShadowColor = Color3.fromRGB(16, 12, 8),
            ElementStroke = Color3.fromRGB(54, 46, 40),
            ElementGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(32, 27, 23)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(38, 32, 27)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 32, 27)),
            }),
            ElementStrokeGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(72, 62, 52)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(88, 76, 64)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(72, 62, 52)),
            }),
            ElementStrokeHover = Color3.fromRGB(84, 72, 60),
            TabBackground = ColorSequence.new(Color3.fromRGB(56, 47, 40), Color3.fromRGB(36, 30, 26)),
            TabStroke = ColorSequence.new(Color3.fromRGB(92, 78, 66), Color3.fromRGB(56, 47, 40)),
            SliderBackground = Color3.fromRGB(48, 40, 34),
            SliderBackgroundHover = Color3.fromRGB(62, 52, 44),
            SliderProgress = ColorSequence.new(Color3.fromRGB(244, 152, 44), Color3.fromRGB(220, 110, 24)),
            AccentColor = Color3.fromRGB(240, 142, 40),
            AccentStroke = Color3.fromRGB(255, 182, 92),
            ToggleKnobOff = Color3.fromRGB(232, 224, 214),
            StatBackground = Color3.fromRGB(26, 21, 18),
            DropdownHighlight = Color3.fromRGB(240, 142, 40),
            NeutralButton = Color3.fromRGB(48, 40, 34),
            NeutralButtonHover = Color3.fromRGB(64, 54, 46),
            NeutralButtonStroke = Color3.fromRGB(150, 128, 104),
        }
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/themes/frost
    define(Rayfield_themes_frost, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables = require(script.Parent.Parent.utility.variables)
        return {
            WindowColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(246, 249, 251)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(236, 241, 245)),
            }),
            ShadowColor = Color3.fromRGB(116, 124, 132),
            LiveAnimation = false,
            ElementTransparency = 0,
            ElementStroke = Color3.fromRGB(218, 224, 228),
            ElementGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
            ElementStrokeGradient = ColorSequence.new(
                Color3.fromRGB(224, 230, 234),
                Color3.fromRGB(232, 238, 242)
            ),
            ElementStrokeTransparency = 0.1,
            ElementStrokeHoverTransparency = 0,
            ElementStrokeHover = Color3.fromRGB(0, 176, 208),
            DarkToggleOverlay = false,
            TabColor = Color3.fromRGB(38, 42, 46),
            TabBackground = ColorSequence.new(Color3.fromRGB(0, 176, 208), Color3.fromRGB(0, 150, 184)),
            TabStroke = ColorSequence.new(Color3.fromRGB(80, 206, 230), Color3.fromRGB(0, 160, 196)),
            SliderBackground = Color3.fromRGB(224, 230, 234),
            SliderBackgroundHover = Color3.fromRGB(212, 220, 224),
            SliderProgress = ColorSequence.new(Color3.fromRGB(0, 182, 214), Color3.fromRGB(0, 146, 182)),
            SliderStroke = Color3.fromRGB(200, 206, 210),
            AccentColor = Color3.fromRGB(0, 176, 208),
            AccentStroke = Color3.fromRGB(96, 210, 232),
            AccentGlow = 0.85,
            StatBackground = Color3.fromRGB(255, 255, 255),
            SliderHandle = Color3.fromRGB(60, 66, 72),
            ToggleTrack = Color3.fromRGB(198, 204, 210),
            ToggleTrackTransparency = 0,
            ToggleKnobOffTransparency = 0.05,
            FieldBackground = Color3.fromRGB(224, 230, 234),
            FieldTransparency = 0,
            FieldGlow = Color3.fromRGB(148, 154, 160),
            PlaceholderColor = Color3.fromRGB(138, 144, 150),
            SurfaceStroke = Color3.fromRGB(204, 210, 214),
            NeutralButton = Color3.fromRGB(224, 230, 234),
            NeutralButtonHover = Color3.fromRGB(212, 220, 224),
            NeutralButtonStroke = Color3.fromRGB(242, 246, 248),
            ActionColor = Color3.fromRGB(68, 74, 80),
            TitlingColor = Color3.fromRGB(26, 30, 34),
            TitleFont = variables.brandFont(Enum.FontWeight.SemiBold),
            Font = variables.brandFont(Enum.FontWeight.Medium),
            ContentColor = Color3.fromRGB(42, 46, 52),
            ElementTextHoverColor = Color3.fromRGB(18, 22, 26),
            DropdownHighlight = Color3.fromRGB(0, 176, 208),
            ErrorColor = Color3.fromRGB(200, 60, 55),
            ErrorStrokeColor = Color3.fromRGB(240, 80, 70),
        }
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/themes/rose
    define(Rayfield_themes_rose, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        return {
            WindowColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 18, 22)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(36, 26, 31)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(44, 32, 38)),
            }),
            ShadowColor = Color3.fromRGB(18, 10, 14),
            ElementStroke = Color3.fromRGB(58, 44, 50),
            ElementGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(34, 25, 29)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(40, 30, 34)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 30, 34)),
            }),
            ElementStrokeGradient = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(76, 58, 66)),
                ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(92, 70, 80)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(76, 58, 66)),
            }),
            ElementStrokeHover = Color3.fromRGB(88, 66, 74),
            TabBackground = ColorSequence.new(Color3.fromRGB(62, 46, 53), Color3.fromRGB(38, 29, 33)),
            TabStroke = ColorSequence.new(Color3.fromRGB(102, 78, 88), Color3.fromRGB(62, 46, 53)),
            SliderBackground = Color3.fromRGB(50, 38, 44),
            SliderBackgroundHover = Color3.fromRGB(64, 50, 56),
            SliderProgress = ColorSequence.new(Color3.fromRGB(244, 88, 140), Color3.fromRGB(220, 60, 116)),
            AccentColor = Color3.fromRGB(240, 82, 138),
            AccentStroke = Color3.fromRGB(255, 134, 178),
            ToggleKnobOff = Color3.fromRGB(236, 220, 226),
            StatBackground = Color3.fromRGB(28, 20, 24),
            DropdownHighlight = Color3.fromRGB(240, 82, 138),
            NeutralButton = Color3.fromRGB(50, 38, 44),
            NeutralButtonHover = Color3.fromRGB(64, 50, 56),
            NeutralButtonStroke = Color3.fromRGB(170, 122, 140),
        }
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/action
    define(Rayfield_components_action, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Action = {}
        Action.__index = Action
        Action.__type = "Action"
        local utility = script.Parent.Parent.utility
        local variables, log, HapticEngine =
            require(utility.variables), require(utility.log), require(utility.HapticEngine)

        function Action.new(k, l)
            l = if typeof(l) == "table" then l else {}
            local m = setmetatable({
                window = assert(k, "Missing argument #1 (Window expected)"),
                name = l.name or l.Name or "Action",
                icon = assert(l.icon or l.Icon, "Missing argument (Icon expected)"),
                callback = assert(l.callback or l.Callback, "Missing argument (Function expected)"),
                linkedTab = l.linkedTab or l.LinkedTab,
            }, Action)
            m.action = m.window:Create("Frame", {
                Name = m.name,
                BorderSizePixel = 0,
                LayoutOrder = -(l.order or 0),
                Size = UDim2.fromOffset(24, 24),
                BackgroundTransparency = 1,
                Parent = m.window.actionContainer,
            })
            m.iconLabel = m.window:Create("ImageLabel", {
                Image = m.icon,
                Size = UDim2.fromOffset(20, 20),
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                BackgroundTransparency = 1,
                ImageTransparency = 1,
                Parent = m.action,
            }, { ImageColor3 = "ActionColor" })
            m.interact = m.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextTransparency = 1,
                Parent = m.action,
            })
            local function n()
                if not m.window:_settled() then
                    return
                end
                if m.linkedTab and m.window.selectedTab == m.linkedTab then
                    return
                end
                if m.isLit and m:isLit() then
                    return
                end
                variables.tweenService
                    :Create(
                        m.iconLabel,
                        TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { ImageTransparency = 0.6 }
                    )
                    :Play()
            end
            m.window:Connect(m.interact.MouseButton1Click, function()
                HapticEngine.click()
                task.spawn(function()
                    local o, p = pcall(m.callback)
                    if not o then
                        log.warn(
                            `Rayfield encountered an error, with the callback for a {m.__type} component named '{m.name}':`
                        )
                        log.print(p)
                    end
                    n()
                end)
            end)
            m.window:Connect(m.interact.MouseEnter, function()
                if not m.window:_interactive() then
                    return
                end
                variables.tweenService
                    :Create(
                        m.iconLabel,
                        TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { ImageTransparency = 0.2 }
                    )
                    :Play()
            end)
            m.window:Connect(m.interact.MouseLeave, n)
            return m
        end
        return Action
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/button
    define(Rayfield_components_button, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Button = {}
        Button.__index = Button
        Button.__type = "Button"
        local utility = script.Parent.Parent.utility
        local variables, functions, moveable, lockable, locale, HapticEngine =
            require(utility.variables),
            require(utility.functions),
            require(utility.moveable),
            require(utility.lockable),
            require(utility.locale),
            require(utility.HapticEngine)

        function Button.new(n, o)
            o = if typeof(o) == "table" then o else {}
            local p = setmetatable({
                tab = assert(n, "Missing argument #1 (Tab expected)"),
                window = n.window,
                name = o.name or o.Name or "Button",
                icon = o.icon or o.Icon,
                description = o.description or o.Description,
                compact = n.compact or false,
                callback = o.callback or o.Callback or function() end,
            }, Button)
            if p.compact then
                p:_buildCompact()
            else
                p:_buildFull()
            end
            if p.description and not p.compact then
                p.descriptor = require(script.Parent.descriptor).new(p.tab, { description = p.description })
            end
            return p
        end

        function Button._runCallback(self)
            self.window:_runGuarded(self, self.callback)
        end

        function Button._buildFull(self)
            self.main = self.window:Create("Frame", {
                Size = UDim2.new(1, -20, 0, 43),
                BorderSizePixel = 0,
                Name = self.name,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = self.tab.tabPage,
            }, {
                BackgroundTransparency = "ElementTransparency",
            })
            self.stroke = self.window:StyleElementBody(self.main)
            self.hoverOverlay = self.window:CreateHoverOverlay(self.main)
            self.container = self.window:Create("Frame", {
                BorderSizePixel = 0,
                Parent = self.main,
                Size = UDim2.new(0, 170, 0, 16),
                Position = UDim2.new(0, 20, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
            })
            self.containerLayout = self.window:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Parent = self.container,
            })
            if self.icon then
                self.iconLabel = self.window:Create("ImageLabel", {
                    Image = self.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    Parent = self.container,
                }, { ImageColor3 = "ContentColor" })
            end
            self.title = self.window:Create("TextLabel", {
                Text = locale.t(self.name),
                Size = UDim2.fromOffset(250, 16),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                AutomaticSize = Enum.AutomaticSize.X,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                LayoutOrder = 1,
                TextTransparency = 1,
                Parent = self.container,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            self.interact = self.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                TextTransparency = 1,
                Parent = self.main,
            })
            self.window:_wireElementHover(self)
            self.window:ConnectFor(self, self.interact.MouseButton1Click, function()
                HapticEngine.click()
                variables.tweenService
                    :Create(
                        self.stroke,
                        TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { Transparency = 1 }
                    )
                    :Play()
                variables.tweenService
                    :Create(
                        self.main,
                        TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        { Size = UDim2.new(1, -26, 0, 43) }
                    )
                    :Play()
                self:_runCallback()
                task.wait(0.11)
                variables.tweenService
                    :Create(
                        self.main,
                        TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        { Size = UDim2.new(1, -20, 0, 43) }
                    )
                    :Play()
                variables.tweenService
                    :Create(
                        self.stroke,
                        TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { Transparency = self.window.theme.ElementStrokeTransparency }
                    )
                    :Play()
            end)
        end

        function Button._buildCompact(self)
            local o = self.window
            self.main, self.stroke, self.interact = o:_buildCompactRow(self.tab, self.name)
            self.hoverOverlay = self.interact
            o:Create(
                "UIPadding",
                { PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 16), Parent = self.interact }
            )
            o:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 6),
                Parent = self.interact,
            })
            if self.icon then
                self.iconLabel = o:Create("ImageLabel", {
                    Image = self.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    ImageTransparency = 1,
                    Parent = self.interact,
                }, { ImageColor3 = "ContentColor" })
            end
            self.title = o:Create("TextLabel", {
                Text = locale.t(self.name),
                Size = UDim2.fromOffset(0, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                LayoutOrder = 1,
                TextTransparency = 1,
                Parent = self.interact,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            o:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.title })
            self.window:_wireElementHover(self)
            self.window:ConnectFor(self, self.interact.MouseButton1Click, function()
                HapticEngine.click()
                variables.tweenService
                    :Create(
                        self.stroke,
                        TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { Transparency = 1 }
                    )
                    :Play()
                self:_runCallback()
                task.wait(0.11)
                variables.tweenService
                    :Create(
                        self.stroke,
                        TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { Transparency = self.window.theme.ElementStrokeTransparency }
                    )
                    :Play()
            end)
        end

        function Button._setShown(self, o, p)
            if o then
                self.window:_revealCommon(self, p)
            else
                self.window:_hideCommon(self, p)
            end
        end

        function Button._minWidth(self)
            local o = 32
            if self.icon then
                o += 22
            end
            o += functions.textWidth(self.window.theme.Font, 16, locale.resolve(self.name))
            return o
        end
        moveable(Button)
        lockable(Button)
        return Button
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/chrome
    define(Rayfield_components_chrome, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local utility = script.Parent.Parent.utility
        local variables, filesystem, constants, locale, HapticEngine, l, m =
            require(utility.variables),
            require(utility.filesystem),
            require(utility.constants),
            require(utility.locale),
            require(utility.HapticEngine),
            {},
            5

        function l.buildCollapsedFace(self)
            local o = self.showIconOnly
            self.collapsedIcon = self:Create("ImageLabel", {
                Name = "CollapsedIcon",
                AnchorPoint = if o then Vector2.new(0.5, 0.5) else Vector2.new(0, 0.5),
                Position = if o then UDim2.fromScale(0.5, 0.5) else UDim2.new(0, 16, 0.5, 0),
                Size = UDim2.fromOffset(24, 24),
                BackgroundTransparency = 1,
                Image = self.showIcon,
                ZIndex = constants.zIndex.restoreContent,
                ImageTransparency = 1,
                Parent = self.main,
            }, { ImageColor3 = "TitlingColor" })
            self:Create("UICorner", { Parent = self.collapsedIcon }, { CornerRadius = "PillCornerRadius" })
            local p = self:Create("Frame", {
                Name = "CollapsedText",
                Visible = not o,
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 50, 0.5, 0),
                Size = UDim2.new(1, -60, 0, 32),
                BackgroundTransparency = 1,
                ZIndex = constants.zIndex.restoreContent,
                Parent = self.main,
            })
            self:Create("UIListLayout", {
                Padding = UDim.new(0, 1),
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = p,
            })
            self.collapsedTitle = self:Create("TextLabel", {
                Name = "Title",
                Text = self.showName,
                Size = UDim2.new(1, 0, 0, 16),
                BackgroundTransparency = 1,
                FontFace = variables.brandFont(Enum.FontWeight.Medium),
                RichText = true,
                TextSize = 16,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 1,
                ZIndex = constants.zIndex.restoreContent,
                TextTransparency = 1,
                Parent = p,
            }, { TextColor3 = "TitlingColor" })
            self.collapsedSubtitle = self:Create("TextLabel", {
                Name = "Subtitle",
                Text = locale.t("Tap to show"),
                Size = UDim2.new(1, 0, 0, 14),
                BackgroundTransparency = 1,
                FontFace = variables.brandFont(Enum.FontWeight.Medium),
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 2,
                ZIndex = constants.zIndex.restoreContent,
                TextTransparency = 1,
                Parent = p,
            }, { TextColor3 = "TitlingColor" })
            self.collapsedInteract = self:Create("TextButton", {
                Name = "CollapsedInteract",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Text = "",
                TextTransparency = 1,
                Visible = false,
                ZIndex = constants.zIndex.restoreInteract,
                Parent = self.main,
            })
            l.bindCollapsedDrag(self)
        end

        function l.bindCollapsedDrag(self)
            local o, p, q, r, s = variables.userInputService, false, false, Vector2.zero, Vector2.zero
            local function t()
                if self.screenGui and self.screenGui.IgnoreGuiInset then
                    return variables.guiService:GetGuiInset()
                end
                return Vector2.zero
            end
            self:Connect(self.collapsedInteract.InputBegan, function(u, v)
                if v or not self.hidden or self.animating then
                    return
                end
                local w = u.UserInputType.Name
                if w ~= "MouseButton1" and w ~= "Touch" then
                    return
                end
                p, q = true, false
                s = o:GetMouseLocation()
                r = self.main.AbsolutePosition + self.main.AbsoluteSize * self.main.AnchorPoint - s
            end)
            self:Connect(o.InputEnded, function(u)
                local v = u.UserInputType.Name
                if v ~= "MouseButton1" and v ~= "Touch" then
                    return
                end
                if not p then
                    return
                end
                p = false
                if q then
                    self._collapsedPosition = self.main.Position
                    return
                end
                HapticEngine.click()
                self:ToggleHide()
            end)
            self:Connect(o.WindowFocusReleased, function()
                p = false
            end)
            self:Connect(variables.runService.RenderStepped, function()
                if not p then
                    return
                end
                if not self.hidden or self.animating then
                    p = false
                    return
                end
                local u = o:GetMouseLocation()
                if not q and (u - s).Magnitude < m then
                    return
                end
                q = true
                local v = u + r + t()
                self.main.Position = UDim2.fromOffset(v.X, v.Y)
            end)
        end

        function l.isNewUser()
            local n = variables.localPlayer
            if not n then
                return false
            end
            if typeof(filesystem.isfile) ~= "function" or typeof(filesystem.writefile) ~= "function" then
                return true
            end
            local o, p, q = variables.fileSystemManager:getPath("lastuser.txt"), tostring(n.UserId), true
            pcall(function()
                if filesystem.isfile(o) then
                    q = filesystem.readfile(o) ~= p
                end
            end)
            pcall(function()
                filesystem.writefile(o, p)
            end)
            return q
        end

        function l.setCollapsedShown(self, o, p)
            local q = { [self.collapsedIcon] = { ImageTransparency = if o then 0 else 1 } }
            if not self.showIconOnly then
                q[self.collapsedTitle] = {
                    TextTransparency = if o then 0 else 1,
                }
                q[self.collapsedSubtitle] = { TextTransparency = if o then 0.5 else 1 }
            end
            for r, s in q do
                if p then
                    variables.tweenService:Create(r, p, s):Play()
                else
                    for t, u in s do
                        r[t] = u
                    end
                end
            end
        end
        return l
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/colorpicker
    define(Rayfield_components_colorpicker, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local ColorPicker = {}
        ColorPicker.__index = ColorPicker
        ColorPicker.__type = "ColorPicker"
        local utility = script.Parent.Parent.utility
        local variables, functions, moveable, lockable, constants, locale, HapticEngine, o, p, q, r, s, t, u, v, w, x, y, z =
            require(utility.variables),
            require(utility.functions),
            require(utility.moveable),
            require(utility.lockable),
            require(utility.constants),
            require(utility.locale),
            require(utility.HapticEngine),
            ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
            }),
            41,
            52,
            Vector2.new(150, 120),
            184,
            10,
            214,
            10,
            240,
            62,
            8,
            400
        local A, B, C, D, E, F, G, H =
            {
                wide = {
                    height = 190,
                    previewPos = UDim2.new(1, -20, 0, q + 39),
                    previewSize = UDim2.new(1, -(w + 20), 0, 78),
                    hexPos = UDim2.new(0, w, 0, q + 90),
                    hexSize = UDim2.new(1, -(w + 20 + x + y), 0, 30),
                    alphaFieldPos = UDim2.new(1, -(20 + x), 0, q + 90),
                    alphaFieldSize = UDim2.new(0, x, 0, 30),
                },
                narrow = {
                    height = 296,
                    previewPos = UDim2.new(1, -20, 0, q + r.Y + 40),
                    previewSize = UDim2.new(1, -40, 0, 56),
                    hexPos = UDim2.new(0, 20, 0, q + r.Y + 78),
                    hexSize = UDim2.new(1, -(40 + x + y), 0, 30),
                    alphaFieldPos = UDim2.new(1, -(20 + x), 0, q + r.Y + 78),
                    alphaFieldSize = UDim2.new(0, x, 0, 30),
                },
            }, UDim2.new(1, -16, 0, p / 2), UDim2.fromOffset(40, 22), TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), TweenInfo.new(0.12, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

        local function I(J)
            return math.clamp(J, 0, 1)
        end

        local function J(K)
            return math.clamp(math.round(K), 0, 255)
        end
        local K = {
            black = Color3.fromRGB(0, 0, 0),
            white = Color3.fromRGB(255, 255, 255),
            red = Color3.fromRGB(255, 0, 0),
            green = Color3.fromRGB(0, 255, 0),
            blue = Color3.fromRGB(0, 0, 255),
            yellow = Color3.fromRGB(255, 255, 0),
            cyan = Color3.fromRGB(0, 255, 255),
            magenta = Color3.fromRGB(255, 0, 255),
            orange = Color3.fromRGB(255, 165, 0),
            purple = Color3.fromRGB(128, 0, 128),
            pink = Color3.fromRGB(255, 105, 180),
            brown = Color3.fromRGB(139, 69, 19),
            gray = Color3.fromRGB(128, 128, 128),
            grey = Color3.fromRGB(128, 128, 128),
        }

        local function L(M, N, O)
            if N <= 0 then
                return Color3.new(O, O, O)
            end
            local function P(Q, R, S)
                S = S % 1
                if S < 0.16666666666666666 then
                    return Q + (R - Q) * 6 * S
                elseif S < 0.5 then
                    return R
                elseif S < 0.6666666666666666 then
                    return Q + (R - Q) * (0.6666666666666666 - S) * 6
                end
                return Q
            end
            local Q = if O < 0.5 then O * (1 + N) else O + N - O * N
            local R = 2 * O - Q
            return Color3.new(P(R, Q, M + 0.3333333333333333), P(R, Q, M), P(R, Q, M - 0.3333333333333333))
        end

        local function M(N)
            local O = {}
            for P in N:gmatch("[%d%.]+") do
                table.insert(O, tonumber(P))
            end
            return O
        end

        local function N(O)
            if typeof(O) ~= "string" then
                return nil
            end
            local P = (O:lower():match("^%s*(.-)%s*$")) or ""
            if P == "" then
                return nil
            end
            if K[P] then
                return K[P]
            end
            local Q, R = P:match("^(%a+)"), M(P)
            if (Q == "hsv" or Q == "hsb") and #R >= 3 then
                local S, T, U =
                    (R[1] % 360) / 360,
                    if R[2] > 1 then R[2] / 100 else R[2],
                    if R[3] > 1 then R[3] / 100 else R[3]
                return Color3.fromHSV(S, I(T), I(U))
            end
            if Q == "hsl" and #R >= 3 then
                local S, T, U =
                    (R[1] % 360) / 360,
                    if R[2] > 1 then R[2] / 100 else R[2],
                    if R[3] > 1 then R[3] / 100 else R[3]
                return L(S, I(T), I(U))
            end
            if (Q == "rgb" or Q == "rgba") and #R >= 3 then
                return Color3.fromRGB(J(R[1]), J(R[2]), J(R[3]))
            end
            local S = P:match("^#?(%x%x%x%x%x%x)$") or P:match("^#?(%x%x%x)$") or P:match("^0x(%x%x%x%x%x%x)$")
            if S then
                local T, U = pcall(Color3.fromHex, S)
                if T then
                    return U
                end
            end
            if #R >= 3 and not Q then
                if R[1] <= 1 and R[2] <= 1 and R[3] <= 1 then
                    return Color3.new(I(R[1]), I(R[2]), I(R[3]))
                end
                return Color3.fromRGB(J(R[1]), J(R[2]), J(R[3]))
            end
            return nil
        end

        local function O(P, Q)
            if typeof(P) == "Color3" then
                return P
            end
            if typeof(P) == "string" then
                return N(P) or Q
            end
            return Q
        end

        function ColorPicker.new(P, Q)
            Q = if typeof(Q) == "table" then Q else {}
            local R = setmetatable({
                tab = assert(P, "Missing argument #1 (Tab expected)"),
                window = P.window,
                name = Q.name or Q.Name or "Color Picker",
                icon = Q.icon or Q.Icon,
                description = Q.description or Q.Description,
                forgetState = Q.forgetState or Q.ForgetState or P.forgetState,
                callback = Q.callback or Q.Callback or function() end,
                _isOpen = false,
            }, ColorPicker)
            R.value = O(Q.color or Q.Color or Q.value or Q.Value or Q.default, Color3.fromRGB(255, 255, 255))
            R.hue, R.sat, R.val = R.value:ToHSV()
            local S = Q.alpha or Q.Alpha
            R.alpha = if type(S) == "number" then I(S) else 1
            R.flag = Q.flag or Q.Flag or (not R.forgetState and functions.deriveFlagFromName(R.name) or nil)
            R.window:_registerControl(R)
            R.main = R.window:Create("Frame", {
                Size = UDim2.new(1, -20, 0, p),
                BorderSizePixel = 0,
                Name = R.name,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = R.tab.tabPage,
            }, { BackgroundTransparency = "ElementTransparency" })
            R.stroke = R.window:StyleElementBody(R.main)
            R.hoverOverlay = R.window:CreateHoverOverlay(R.main)
            R:_buildHeader()
            R:_buildPicker()
            R.window:ConnectFor(R, R.interact.MouseButton1Click, function()
                HapticEngine.click()
                if R._isOpen then
                    R:_close()
                else
                    R:_open()
                end
            end)
            R.window:ConnectFor(R, R.main.MouseEnter, function()
                if R._isOpen or not R.window:_interactive() then
                    return
                end
                local T = R.window.theme
                variables.tweenService
                    :Create(
                        R.stroke,
                        E,
                        { Transparency = T.ElementStrokeHoverTransparency, Color = T.ElementStrokeHover }
                    )
                    :Play()
                variables.tweenService:Create(R.title, E, { TextColor3 = T.ElementTextHoverColor }):Play()
                variables.tweenService:Create(R.hoverOverlay, E, { BackgroundTransparency = 0.97 }):Play()
            end)
            R.window:ConnectFor(R, R.main.MouseLeave, function()
                local T = R.window.theme
                variables.tweenService
                    :Create(R.stroke, E, { Transparency = T.ElementStrokeTransparency, Color = T.ElementStroke })
                    :Play()
                variables.tweenService:Create(R.title, E, { TextColor3 = T.ContentColor }):Play()
                variables.tweenService:Create(R.hoverOverlay, E, { BackgroundTransparency = 1 }):Play()
            end)
            if R.description then
                R.descriptor = require(script.Parent.descriptor).new(R.tab, { description = R.description })
            end
            R:_applyPickerVisibility(false, false)
            R:_setControlsVisible(false)
            R.window:ConnectFor(R, R.main:GetPropertyChangedSignal("AbsoluteSize"), function()
                if R.window.animating or (R.window.hidden and R.window.hasShownOnce) then
                    return
                end
                R:_applyLayout()
            end)
            R:_applyLayout()
            R:_render("instant")
            return R
        end

        function ColorPicker._buildHeader(self)
            self.container = self.window:Create("Frame", {
                Size = UDim2.new(0, 170, 0, 16),
                Position = UDim2.new(0, 20, 0, p / 2),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Parent = self.main,
            })
            self.window:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.container,
            })
            if self.icon then
                self.iconLabel = self.window:Create("ImageLabel", {
                    Image = self.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 5,
                    ImageTransparency = 1,
                    Parent = self.container,
                }, { ImageColor3 = "ContentColor" })
            end
            self.title = self.window:Create("TextLabel", {
                Text = locale.t(self.name),
                Size = UDim2.fromOffset(150, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 1,
                ZIndex = 5,
                TextTransparency = 1,
                Parent = self.container,
            }, {
                TextColor3 = "ContentColor",
                FontFace = "Font",
            })
            self.preview = self.window:Create("Frame", {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = B,
                Size = C,
                BackgroundColor3 = self.value,
                BorderSizePixel = 0,
                ZIndex = 3,
                BackgroundTransparency = 1,
                Parent = self.main,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.preview })
            self.previewShadow = self.window:CreateGlow(self.preview, self.value, 20, 1)
            self.invisibleGroup = self.window:Create("Frame", {
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Parent = self.preview,
            })
            self.window:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.invisibleGroup,
            })
            self.invisibleIcon = self.window:Create("ImageLabel", {
                Image = constants.icons.colorpicker,
                Size = UDim2.fromOffset(16, 16),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                ImageTransparency = 1,
                Parent = self.invisibleGroup,
            }, { ImageColor3 = "ContentColor" })
            self.invisibleText = self.window:Create("TextLabel", {
                Text = locale.t("Invisible"),
                Size = UDim2.fromOffset(0, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 15,
                LayoutOrder = 1,
                ZIndex = 5,
                TextTransparency = 1,
                Parent = self.invisibleGroup,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            self.interact = self.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, p),
                Position = UDim2.fromScale(0, 0),
                BorderSizePixel = 0,
                Text = "",
                TextTransparency = 1,
                AutoButtonColor = false,
                ZIndex = 10,
                Parent = self.main,
            })
        end

        function ColorPicker._buildMap(self)
            self.map = self.window:Create("Frame", {
                Position = UDim2.fromOffset(20, q),
                Size = UDim2.fromOffset(r.X, r.Y),
                BackgroundColor3 = Color3.fromHSV(self.hue, 1, 1),
                BorderSizePixel = 0,
                ZIndex = 2,
                BackgroundTransparency = 1,
                Parent = self.main,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.map })
            self.mapStroke = self.window:Create(
                "UIStroke",
                { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = self.map }
            )
            self.satOverlay = self.window:Create("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 3,
                BackgroundTransparency = 1,
                Parent = self.map,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.satOverlay })
            self.window:Create("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(1, 1),
                }),
                Parent = self.satOverlay,
            })
            self.valOverlay = self.window:Create("Frame", {
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                ZIndex = 4,
                BackgroundTransparency = 1,
                Parent = self.map,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.valOverlay })
            self.window:Create("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(1, 0),
                }),
                Parent = self.valOverlay,
            })
        end

        function ColorPicker._buildPicker(self)
            self:_buildMap()
            self.satCursor = self.window:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromOffset(12, 12),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 6,
                BackgroundTransparency = 1,
                Parent = self.map,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.satCursor })
            self.satCursorStroke = self.window:Create(
                "UIStroke",
                {
                    Color = Color3.fromRGB(255, 255, 255),
                    Thickness = 2,
                    Transparency = 1,
                    Parent = self.satCursor,
                }
            )
            self.mapInteract = self.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Text = "",
                TextTransparency = 1,
                AutoButtonColor = false,
                ZIndex = 7,
                Parent = self.map,
            })
            self.hueBar = self.window:Create("Frame", {
                Position = UDim2.fromOffset(s, q),
                Size = UDim2.fromOffset(t, r.Y),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 2,
                BackgroundTransparency = 1,
                Parent = self.main,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.hueBar })
            self.window:Create("UIGradient", {
                Color = o,
                Rotation = 90,
                Parent = self.hueBar,
            })
            self.hueHandle = self.window:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0, 0),
                Size = UDim2.fromOffset(t + 8, 8),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 4,
                BackgroundTransparency = 1,
                Parent = self.hueBar,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.hueHandle })
            self.hueHandleStroke = self.window:Create(
                "UIStroke",
                {
                    Color = Color3.fromRGB(255, 255, 255),
                    Thickness = 2,
                    Transparency = 1,
                    Parent = self.hueHandle,
                }
            )
            self.hueInteract = self.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 16, 1, 8),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = "",
                TextTransparency = 1,
                AutoButtonColor = false,
                ZIndex = 6,
                Parent = self.hueBar,
            })
            self.alphaBar = self.window:Create("Frame", {
                Position = UDim2.fromOffset(u, q),
                Size = UDim2.fromOffset(v, r.Y),
                BackgroundColor3 = self.value,
                BorderSizePixel = 0,
                ZIndex = 2,
                BackgroundTransparency = 1,
                Parent = self.main,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.alphaBar })
            self.alphaGradient = self.window:Create("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(1, 1),
                }),
                Parent = self.alphaBar,
            })
            self.alphaHandle = self.window:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0, 0),
                Size = UDim2.fromOffset(v + 8, 8),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 4,
                BackgroundTransparency = 1,
                Parent = self.alphaBar,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.alphaHandle })
            self.alphaHandleStroke = self.window:Create(
                "UIStroke",
                {
                    Color = Color3.fromRGB(255, 255, 255),
                    Thickness = 2,
                    Transparency = 1,
                    Parent = self.alphaHandle,
                }
            )
            self.alphaInteract = self.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 16, 1, 8),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = "",
                TextTransparency = 1,
                AutoButtonColor = false,
                ZIndex = 6,
                Parent = self.alphaBar,
            })
            self.hexBox = self.window:Create("Frame", {
                Position = UDim2.new(0, w, 0, q + 90),
                Size = UDim2.new(1, -(w + 20), 0, 30),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 2,
                BackgroundTransparency = 1,
                Parent = self.main,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.hexBox })
            self.hexBoxStroke = self.window:Create(
                "UIStroke",
                { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = self.hexBox }
            )
            self.hexInput = self.window:Create("TextBox", {
                Text = "#" .. self.value:ToHex():upper(),
                PlaceholderText = locale.t("Smart Input"),
                Size = UDim2.new(1, -14, 1, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 15,
                TextXAlignment = Enum.TextXAlignment.Center,
                ClearTextOnFocus = false,
                ZIndex = 3,
                TextTransparency = 1,
                Parent = self.hexBox,
            }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
            self.alphaBox = self.window:Create("Frame", {
                Position = UDim2.new(0, w, 0, q + 90),
                Size = UDim2.fromOffset(x, 30),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 2,
                BackgroundTransparency = 1,
                Parent = self.main,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.alphaBox })
            self.alphaBoxStroke = self.window:Create(
                "UIStroke",
                { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = self.alphaBox }
            )
            self.alphaInput = self.window:Create("TextBox", {
                Text = tostring(math.round(self.alpha * 100)) .. "%",
                PlaceholderText = "100%",
                Size = UDim2.new(1, -10, 1, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 15,
                TextXAlignment = Enum.TextXAlignment.Center,
                ClearTextOnFocus = false,
                ZIndex = 3,
                TextTransparency = 1,
                Parent = self.alphaBox,
            }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
            self.window:ConnectFor(self, self.mapInteract.InputBegan, function(Q)
                if
                    Q.UserInputType == Enum.UserInputType.MouseButton1
                    or Q.UserInputType == Enum.UserInputType.Touch
                then
                    self:_beginDrag("sat", Q.UserInputType == Enum.UserInputType.MouseButton1)
                end
            end)
            self.window:ConnectFor(self, self.hueInteract.InputBegan, function(Q)
                if
                    Q.UserInputType == Enum.UserInputType.MouseButton1
                    or Q.UserInputType == Enum.UserInputType.Touch
                then
                    self:_beginDrag("hue", Q.UserInputType == Enum.UserInputType.MouseButton1)
                end
            end)
            self.window:ConnectFor(self, self.alphaInteract.InputBegan, function(Q)
                if
                    Q.UserInputType == Enum.UserInputType.MouseButton1
                    or Q.UserInputType == Enum.UserInputType.Touch
                then
                    self:_beginDrag("alpha", Q.UserInputType == Enum.UserInputType.MouseButton1)
                end
            end)
            self.window:ConnectFor(self, variables.userInputService.InputEnded, function(Q)
                if
                    (
                        Q.UserInputType == Enum.UserInputType.MouseButton1
                        or Q.UserInputType == Enum.UserInputType.Touch
                    ) and self._drag
                then
                    self:_endDrag()
                end
            end)
            self.window:ConnectFor(self, self.hexInput.FocusLost, function()
                local Q = N(self.hexInput.Text)
                if Q then
                    self:Set(Q)
                else
                    self.hexInput.Text = "#" .. self.value:ToHex():upper()
                end
            end)
            self.window:ConnectFor(self, self.alphaInput.FocusLost, function()
                local Q = tonumber((self.alphaInput.Text:gsub("[^%d%.]", "")))
                if Q then
                    self:SetAlpha(I(Q / 100))
                else
                    self.alphaInput.Text = tostring(math.round(self.alpha * 100)) .. "%"
                end
            end)
        end

        function ColorPicker._beginDrag(self, Q, R)
            if not self._isOpen then
                return
            end
            self._drag = Q
            self._dragIsMouse = R
            self:_setHeld(Q)
            self:_pump()
            if self._dragConnection then
                self._dragConnection:Disconnect()
                self._dragConnection = nil
            end
            self._dragConnection = variables.runService.RenderStepped:Connect(function()
                local S = self._dragIsMouse
                    and not variables.userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
                if self.window.unloaded or not self._drag or S then
                    if S then
                        self:_endDrag()
                        return
                    end
                    if self._dragConnection then
                        self._dragConnection:Disconnect()
                        self._dragConnection = nil
                    end
                    return
                end
                self:_pump()
            end)
        end

        function ColorPicker._endDrag(self)
            self._drag = nil
            self:_setHeld(nil)
            if self._dragConnection then
                self._dragConnection:Disconnect()
                self._dragConnection = nil
            end
            self.window:_persist(self)
        end

        function ColorPicker._setHeld(self, Q)
            local R, S, T =
                if Q == "sat" then UDim2.fromOffset(16, 16) else UDim2.fromOffset(12, 12),
                if Q == "hue" then UDim2.fromOffset(t + 12, 10) else UDim2.fromOffset(t + 8, 8),
                if Q == "alpha" then UDim2.fromOffset(v + 12, 10) else UDim2.fromOffset(v + 8, 8)
            variables.tweenService:Create(self.satCursor, H, { Size = R }):Play()
            variables.tweenService:Create(self.hueHandle, H, { Size = S }):Play()
            variables.tweenService:Create(self.alphaHandle, H, { Size = T }):Play()
        end

        function ColorPicker._mouseLocation(self)
            local Q, R = variables.userInputService:GetMouseLocation(), self.window.screenGui
            if R and R.IgnoreGuiInset then
                return Q - variables.guiService:GetGuiInset()
            end
            return Q
        end

        function ColorPicker._pump(self)
            local Q, R, S, T = self.hue, self.sat, self.val, self.alpha
            if self._drag == "sat" then
                local U = self.map.AbsoluteSize
                if U.X <= 0 or U.Y <= 0 then
                    return
                end
                local V = self:_mouseLocation()
                self.sat = I((V.X - self.map.AbsolutePosition.X) / U.X)
                self.val = 1 - I((V.Y - self.map.AbsolutePosition.Y) / U.Y)
            elseif self._drag == "hue" then
                local U = self.hueBar.AbsoluteSize.Y
                if U <= 0 then
                    return
                end
                local V = self:_mouseLocation()
                self.hue = I((V.Y - self.hueBar.AbsolutePosition.Y) / U)
            elseif self._drag == "alpha" then
                local U = self.alphaBar.AbsoluteSize.Y
                if U <= 0 then
                    return
                end
                local V = self:_mouseLocation()
                self.alpha = 1 - I((V.Y - self.alphaBar.AbsolutePosition.Y) / U)
            else
                return
            end
            if self.hue == Q and self.sat == R and self.val == S and self.alpha == T then
                return
            end
            self.value = Color3.fromHSV(self.hue, self.sat, self.val)
            self:_render("drag")
            self:_fireCallback()
        end

        function ColorPicker._render(self, Q)
            local R, S, T, U, V, W =
                Color3.fromHSV(self.hue, 1, 1),
                UDim2.new(self.sat, 0, 1 - self.val, 0),
                UDim2.new(0.5, 0, self.hue, 0),
                UDim2.new(0.5, 0, 1 - self.alpha, 0),
                1 - self.alpha,
                1 - 0.4 * self.alpha
            if Q == "instant" then
                self.map.BackgroundColor3 = R
                self.satCursor.Position, self.satCursor.BackgroundColor3 = S, self.value
                self.hueHandle.Position, self.hueHandle.BackgroundColor3 = T, R
                self.alphaBar.BackgroundColor3 = self.value
                self.alphaHandle.Position, self.alphaHandle.BackgroundColor3 = U, self.value
                self.preview.BackgroundColor3 = self.value
                self.previewShadow.Color = self.value
                if not self.window.hidden then
                    self.preview.BackgroundTransparency = V
                    self.previewShadow.Transparency = W
                end
            else
                local X = if Q == "drag" then G else F
                variables.tweenService:Create(self.map, X, { BackgroundColor3 = R }):Play()
                variables.tweenService
                    :Create(self.satCursor, X, { Position = S, BackgroundColor3 = self.value })
                    :Play()
                variables.tweenService:Create(self.hueHandle, X, { Position = T, BackgroundColor3 = R }):Play()
                variables.tweenService
                    :Create(self.alphaHandle, X, { Position = U, BackgroundColor3 = self.value })
                    :Play()
                variables.tweenService
                    :Create(self.alphaBar, F, {
                        BackgroundColor3 = self.value,
                    })
                    :Play()
                local Y, Z = { BackgroundColor3 = self.value }, { Color = self.value }
                if not self.window.hidden then
                    Y.BackgroundTransparency = V
                    Z.Transparency = W
                end
                variables.tweenService:Create(self.preview, F, Y):Play()
                variables.tweenService:Create(self.previewShadow, F, Z):Play()
            end
            if not self.hexInput:IsFocused() then
                self.hexInput.Text = "#" .. self.value:ToHex():upper()
            end
            if not self.alphaInput:IsFocused() then
                self.alphaInput.Text = tostring(math.round(self.alpha * 100)) .. "%"
            end
            self:_renderInvisible(Q ~= "instant")
        end

        function ColorPicker._renderInvisible(self, Q)
            local R = 0
            if self._isOpen and not self.window.hidden then
                R = I((0.12 - self.alpha) / 0.12)
            end
            local S = 1 - R
            if Q then
                variables.tweenService:Create(self.invisibleIcon, E, { ImageTransparency = S }):Play()
                variables.tweenService:Create(self.invisibleText, E, { TextTransparency = S }):Play()
            else
                self.invisibleIcon.ImageTransparency = S
                self.invisibleText.TextTransparency = S
            end
        end

        function ColorPicker._fireCallback(self)
            self.window:_runGuarded(self, self.callback, self.value, self.alpha)
        end

        function ColorPicker._open(self)
            if self._isOpen then
                return
            end
            self._isOpen = true
            self:_setControlsVisible(true)
            if self._outsideClickConn then
                self.window:Disconnect(self._outsideClickConn)
            end
            self._outsideClickConn = self.window:Connect(variables.userInputService.InputBegan, function(Q)
                if
                    Q.UserInputType ~= Enum.UserInputType.MouseButton1
                    and Q.UserInputType ~= Enum.UserInputType.Touch
                then
                    return
                end
                local R, S, T = Q.Position, self.main.AbsolutePosition, self.main.AbsoluteSize
                if R.X < S.X or R.X > S.X + T.X or R.Y < S.Y or R.Y > S.Y + T.Y then
                    self:_close()
                end
            end)
            variables.tweenService:Create(self.main, D, { Size = UDim2.new(1, -20, 0, self._openHeight) }):Play()
            variables.tweenService
                :Create(self.preview, D, { Position = self._previewOpenPos, Size = self._previewOpenSize })
                :Play()
            self:_applyPickerVisibility(true, true)
            self:_renderInvisible(true)
        end

        function ColorPicker._close(self)
            if not self._isOpen then
                return
            end
            self._isOpen = false
            if self._outsideClickConn then
                self.window:Disconnect(self._outsideClickConn)
                self._outsideClickConn = nil
            end
            if self._drag then
                self:_endDrag()
            end
            if self.hexInput:IsFocused() then
                self.hexInput:ReleaseFocus()
            end
            if self.alphaInput:IsFocused() then
                self.alphaInput:ReleaseFocus()
            end
            self:_applyPickerVisibility(false, true)
            self:_renderInvisible(true)
            variables.tweenService:Create(self.preview, D, { Position = B, Size = C }):Play()
            variables.tweenService:Create(self.main, D, { Size = UDim2.new(1, -20, 0, p) }):Play()
            task.delay(E.Time, function()
                if not self._isOpen then
                    self:_setControlsVisible(false)
                end
            end)
        end

        function ColorPicker._applyPickerVisibility(self, Q, R)
            local S = {
                [self.map] = { BackgroundTransparency = if Q then 0 else 1 },
                [self.satOverlay] = {
                    BackgroundTransparency = if Q then 0 else 1,
                },
                [self.valOverlay] = { BackgroundTransparency = if Q then 0 else 1 },
                [self.mapStroke] = {
                    Transparency = if Q then 0.9 else 1,
                },
                [self.satCursor] = { BackgroundTransparency = if Q then 0 else 1 },
                [self.satCursorStroke] = {
                    Transparency = if Q then 0 else 1,
                },
                [self.hueBar] = { BackgroundTransparency = if Q then 0 else 1 },
                [self.hueHandle] = {
                    BackgroundTransparency = if Q then 0 else 1,
                },
                [self.hueHandleStroke] = { Transparency = if Q then 0 else 1 },
                [self.alphaBar] = {
                    BackgroundTransparency = if Q then 0 else 1,
                },
                [self.alphaHandle] = { BackgroundTransparency = if Q then 0 else 1 },
                [self.alphaHandleStroke] = { Transparency = if Q then 0 else 1 },
                [self.hexBox] = { BackgroundTransparency = if Q then 0.9 else 1 },
                [self.hexBoxStroke] = { Transparency = if Q then 0.85 else 1 },
                [self.hexInput] = { TextTransparency = if Q then 0.4 else 1 },
                [self.alphaBox] = {
                    BackgroundTransparency = if Q then 0.9 else 1,
                },
                [self.alphaBoxStroke] = { Transparency = if Q then 0.85 else 1 },
                [self.alphaInput] = {
                    TextTransparency = if Q then 0.4 else 1,
                },
            }
            for T, U in S do
                if R then
                    variables.tweenService:Create(T, E, U):Play()
                else
                    for V, W in U do
                        T[V] = W
                    end
                end
            end
        end

        function ColorPicker._setControlsVisible(self, Q)
            for R, S in { self.map, self.hueBar, self.alphaBar, self.hexBox, self.alphaBox } do
                S.Visible = Q
            end
        end

        function ColorPicker._applyLayout(self)
            local Q = self.main.AbsoluteSize.X
            local R = if Q > 0 and Q < z then "narrow" else "wide"
            if R == self._layoutMode then
                return
            end
            self._layoutMode = R
            local S = A[R]
            self._openHeight = S.height
            self._previewOpenPos = S.previewPos
            self._previewOpenSize = S.previewSize
            self.hexBox.Position = S.hexPos
            self.hexBox.Size = S.hexSize
            self.alphaBox.Position = S.alphaFieldPos
            self.alphaBox.Size = S.alphaFieldSize
            if self._isOpen then
                variables.tweenService
                    :Create(self.main, D, { Size = UDim2.new(1, -20, 0, self._openHeight) })
                    :Play()
                variables.tweenService
                    :Create(self.preview, D, { Position = self._previewOpenPos, Size = self._previewOpenSize })
                    :Play()
            end
        end

        function ColorPicker.Set(self, Q, R)
            self.value = O(Q, self.value)
            self.hue, self.sat, self.val = self.value:ToHSV()
            self:_render(if self._isOpen then "animate" else "instant")
            if not R then
                self:_fireCallback()
                self.window:_persist(self)
            end
        end

        function ColorPicker.SetAlpha(self, Q, R)
            self.alpha = I(if type(Q) == "number" then Q else self.alpha)
            self:_render(if self._isOpen then "animate" else "instant")
            if not R then
                self:_fireCallback()
                self.window:_persist(self)
            end
        end

        function ColorPicker._serialize(self)
            return self.value:ToHex()
                .. string.format("%02x", math.clamp(math.round((self.alpha or 1) * 255), 0, 255))
        end

        function ColorPicker._deserialize(self, Q)
            local R, S = (tostring(Q))
            if #R >= 8 then
                S = (tonumber(R:sub(7, 8), 16) or 255) / 255
                R = R:sub(1, 6)
            end
            local T, U = pcall(Color3.fromHex, R)
            if not T then
                return
            end
            if S then
                self:SetAlpha(S, true)
            end
            self:Set(U)
        end

        function ColorPicker._setShown(self, Q, R)
            local S = self.window
            if Q then
                S:_revealCommon(self, R)
                S:_reveal(self.preview, { BackgroundTransparency = 1 - self.alpha }, R)
                S:_reveal(self.previewShadow, { Transparency = 1 - 0.4 * self.alpha }, R)
            else
                S:_hideCommon(self, R)
                S:_reveal(self.preview, {
                    BackgroundTransparency = 1,
                }, R)
                S:_reveal(self.previewShadow, { Transparency = 1 }, R)
                if self._isOpen then
                    self:_close()
                end
            end
        end
        moveable(ColorPicker)
        lockable(ColorPicker)
        return ColorPicker
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/console
    define(Rayfield_components_console, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Console = {}
        Console.__index = Console
        Console.__type = "Console"
        local utility = script.Parent.Parent.utility
        local moveable, locale, j, k, l, m, n, o, p, q, r =
            require(utility.moveable),
            require(utility.locale),
            120,
            48,
            24,
            17,
            12,
            12,
            1.25,
            200,
            Font.fromEnum(Enum.Font.Code)

        function Console.new(s, t)
            t = if typeof(t) == "table" then t else {}
            local u = setmetatable({
                tab = assert(s, "Missing argument #1 (Tab expected)"),
                window = s.window,
                name = t.name or t.Name,
                description = t.description or t.Description,
                height = math.max(tonumber(t.height or t.Height) or j, k),
                follow = t.follow or t.Follow or false,
                maxLines = math.max(tonumber(t.maxLines or t.MaxLines) or q, 1),
                lines = {},
                lineLabels = {},
                head = 1,
                nextOrder = 1,
                textDirty = true,
            }, Console)
            u:_build()
            u:_setLines(t.text or t.Text or "")
            if u.description then
                u.descriptor = require(script.Parent.descriptor).new(u.tab, { description = u.description })
            end
            return u
        end

        function Console.Get(self): string
            if self.textDirty then
                self.text = table.concat(self.lines, "\n")
                self.textDirty = false
            end
            return self.text
        end

        function Console._setLines(self, t)
            t = if type(t) == "string" then t else tostring(t)
            table.clear(self.lines)
            if t ~= "" then
                for u in string.gmatch(t .. "\n", "([^\n]*)\n") do
                    table.insert(self.lines, u)
                end
            end
            self:_trim()
            self:_flush()
        end

        function Console._trim(self)
            local t = #self.lines - self.maxLines
            if t <= 0 then
                return
            end
            table.move(self.lines, t + 1, #self.lines, 1)
            for u = #self.lines, #self.lines - t + 1, -1 do
                self.lines[u] = nil
            end
        end

        function Console._makeLabel(self)
            return self.window:Create("TextLabel", {
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = r,
                TextSize = o,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextWrapped = true,
                LineHeight = p,
                RichText = false,
                TextTransparency = self._textTransparency or 1,
                Parent = self.scroll,
            }, { TextColor3 = "ContentColor" })
        end

        local function s(t: string): string
            return if t == "" then " " else t
        end

        function Console._flush(self)
            self.textDirty = true
            for u, v in self.lines do
                local w = self.lineLabels[u]
                if not w then
                    w = self:_makeLabel()
                    self.lineLabels[u] = w
                end
                w.LayoutOrder = u
                w.Text = s(v)
                w.Visible = true
            end
            for u = #self.lines + 1, #self.lineLabels do
                self.lineLabels[u].Visible = false
            end
            self.head = 1
            self.nextOrder = #self.lines + 1
            self:_follow()
        end

        function Console._pushLine(self, u: string)
            self.textDirty = true
            if #self.lines < self.maxLines then
                table.insert(self.lines, u)
                local v = #self.lines
                local w = self.lineLabels[v]
                if not w then
                    w = self:_makeLabel()
                    self.lineLabels[v] = w
                end
                w.LayoutOrder = self.nextOrder
                w.Text = s(u)
                w.Visible = true
                self.nextOrder += 1
                return
            end
            table.move(self.lines, 2, #self.lines, 1)
            self.lines[#self.lines] = u
            local v = self.lineLabels[self.head]
            v.LayoutOrder = self.nextOrder
            v.Text = s(u)
            v.Visible = true
            self.nextOrder += 1
            self.head = (self.head % #self.lineLabels) + 1
        end

        function Console._build(self)
            local u = if self.name then l else 0
            self.main = self.window:Create("Frame", {
                Size = UDim2.new(1, -20, 0, self.height + u + m * 2),
                BorderSizePixel = 0,
                Name = self.name or "Console",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = self.tab.tabPage,
            }, { BackgroundTransparency = "ElementTransparency" })
            self.stroke = self.window:StyleElementBody(self.main)
            if self.name then
                self.container = self.window:Create("Frame", {
                    Size = UDim2.new(1, -m * 2, 0, 16),
                    Position = UDim2.new(0, m, 0, m),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Parent = self.main,
                })
                self.title = self.window:Create("TextLabel", {
                    Text = locale.t(self.name),
                    Size = UDim2.fromScale(1, 1),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextSize = 16,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTransparency = 1,
                    Parent = self.container,
                }, { TextColor3 = "ContentColor", FontFace = "Font" })
            end
            self.panel = self.window:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.new(0.5, 0, 1, -m),
                Size = UDim2.new(1, -m * 2, 0, self.height),
                BorderSizePixel = 0,
                ClipsDescendants = true,
                BackgroundTransparency = 1,
                Parent = self.main,
            }, {
                BackgroundColor3 = "StatBackground",
            })
            self.window:Create("UICorner", { Parent = self.panel }, { CornerRadius = "ElementCornerRadius" })
            self.panelStroke = self.window:Create(
                "UIStroke",
                { ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Transparency = 1, Parent = self.panel },
                {
                    Color = "SurfaceStroke",
                }
            )
            self.scroll = self.window:Create("ScrollingFrame", {
                Size = UDim2.new(1, -n * 2, 1, -n * 2),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                ScrollBarThickness = 0,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                Parent = self.panel,
            })
            self.scrollLayout = self.window:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.scroll,
            })
            self:_watchCanvas()
        end

        function Console._pin(self)
            local u = self.scroll
            if not u or not u.Parent then
                return
            end
            u.CanvasPosition = Vector2.new(0, u.AbsoluteCanvasSize.Y)
        end

        function Console._follow(self)
            if not self.follow then
                return
            end
            self:_pin()
            task.defer(function()
                self:_pin()
            end)
        end

        function Console._watchCanvas(self)
            self.window:ConnectFor(
                self,
                self.scrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"),
                function()
                    if self.follow then
                        self:_pin()
                    end
                end
            )
        end

        function Console.Set(self, u)
            self:_setLines(u)
        end

        function Console.Append(self, u)
            u = if type(u) == "string" then u else tostring(u)
            for v in string.gmatch(u .. "\n", "([^\n]*)\n") do
                self:_pushLine(v)
            end
            self:_follow()
        end

        function Console.Clear(self)
            table.clear(self.lines)
            self:_flush()
        end

        function Console.Copy(self): boolean
            local u = (getgenv and getgenv().setclipboard) or setclipboard
            if typeof(u) ~= "function" then
                return false
            end
            return (pcall(u, self:Get()))
        end

        function Console.SetHeight(self, u)
            self.height = math.max(tonumber(u) or j, k)
            local v = if self.name then l else 0
            self.panel.Size = UDim2.new(1, -m * 2, 0, self.height)
            self.main.Size = UDim2.new(1, -20, 0, self.height + v + m * 2)
        end

        function Console._setShown(self, u, v)
            local w = self.window
            w:_reveal(
                self.main,
                { BackgroundTransparency = if u then w.theme.ElementTransparency or 0 else 1 },
                v
            )
            w:_reveal(self.stroke, { Transparency = if u then w.theme.ElementStrokeTransparency else 1 }, v)
            w:_reveal(self.panel, {
                BackgroundTransparency = if u then 0 else 1,
            }, v)
            w:_reveal(self.panelStroke, { Transparency = if u then 0.9 else 1 }, v)
            self._textTransparency = if u then 0.15 else 1
            for x, y in self.lineLabels do
                w:_reveal(y, { TextTransparency = self._textTransparency }, v)
            end
            if self.title then
                w:_reveal(self.title, { TextTransparency = if u then 0 else 1 }, v)
            end
            if self.descriptor then
                w:_reveal(self.descriptor.titleLabel, { TextTransparency = if u then 0.7 else 1 }, v)
            end
        end

        function Console.Remove(self)
            if self.descriptor then
                self.descriptor:Remove()
            end
            self.main:Destroy()
        end
        moveable(Console)
        return Console
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/descriptor
    define(Rayfield_components_descriptor, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Descriptor = {}
        Descriptor.__index = Descriptor
        Descriptor.__type = "Descriptor"
        local locale = require(script.Parent.Parent.utility.locale)

        function Descriptor.new(h, i)
            i = if typeof(i) == "table" then i else {}
            local j = setmetatable({
                tab = assert(h, "Missing argument #1 (Tab expected)"),
                window = h.window,
                description = i.description or i.Description or "",
            }, Descriptor)
            j.main = j.window:Create("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, -30, 0, 0),
                Parent = j.tab.tabPage,
            })
            j.window:Create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Parent = j.main })
            j.titleLabel = j.window:Create("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                RichText = true,
                Size = UDim2.new(1, -90, 0, 0),
                Text = locale.t(j.description),
                TextSize = 12,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTransparency = 1,
                Parent = j.main,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            j.window:Create("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromOffset(0, 15),
                Parent = j.main,
            })
            return j
        end
        return Descriptor
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/divider
    define(Rayfield_components_divider, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Divider = {}
        Divider.__index = Divider
        Divider.__type = "Divider"
        local moveable, locale, i, j, k, l, m, n, o =
            require(script.Parent.Parent.utility.moveable),
            require(script.Parent.Parent.utility.locale),
            1,
            12,
            10,
            14,
            12,
            0.88,
            0.55

        function Divider.new(p, q)
            q = if typeof(q) == "table" then q else {}
            local r, s = q.spacing or q.Spacing, q.text or q.Text
            local t = setmetatable({
                tab = assert(p, "Missing argument #1 (Tab expected)"),
                window = p.window,
                text = if s ~= nil then tostring(s) else "",
                spacing = if type(r) == "number" then math.max(r, 0) else j,
                line = q.line ~= false and q.Line ~= false,
            }, Divider)
            t.main = t.window:Create("Frame", {
                Size = UDim2.new(1, -40, 0, 0),
                BorderSizePixel = 0,
                Name = "Divider",
                BackgroundTransparency = 1,
                Parent = t.tab.tabPage,
            })
            t.window:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, k),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Parent = t.main,
            })
            if t.line then
                t.left = t:_buildHalf(1)
            end
            if t.text ~= "" then
                t:_buildLabel()
            end
            t:_applyHeight()
            return t
        end

        function Divider._buildHalf(self, q)
            local r = self.window:Create("Frame", {
                Size = UDim2.new(0, 0, 0, i),
                BorderSizePixel = 0,
                LayoutOrder = q,
                BackgroundTransparency = 1,
                Parent = self.main,
            }, { BackgroundColor3 = "ContentColor" })
            self.window:Create("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill,
                Parent = r,
            })
            return r
        end

        function Divider._buildLabel(self)
            self.title = self.window:Create("TextLabel", {
                Text = locale.t(self.text),
                Size = UDim2.fromOffset(0, l),
                AutomaticSize = Enum.AutomaticSize.X,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = m,
                TextXAlignment = Enum.TextXAlignment.Center,
                LayoutOrder = 2,
                TextTransparency = 1,
                Parent = self.main,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            if self.line then
                self.right = self:_buildHalf(3)
            end
        end

        function Divider._applyHeight(self)
            local q = if self.text ~= "" then l elseif self.line then i else 0
            self.main.Size = UDim2.new(1, -40, 0, self.spacing * 2 + q)
        end

        function Divider.Set(self, q)
            self.text = if q ~= nil then tostring(q) else ""
            if self.text ~= "" and not self.title then
                self:_buildLabel()
                if not self.window.hidden then
                    self:_setShown(true, true)
                end
            end
            if self.title then
                self.window:_bindLocale(self.title, "Text", self.text)
                local r = self.text ~= ""
                self.title.Visible = r
                if self.right then
                    self.right.Visible = r
                end
            end
            self:_applyHeight()
        end

        function Divider._setShown(self, q, r)
            local s, t = self.window, if q then n else 1
            s:_reveal(self.left, { BackgroundTransparency = t }, r)
            s:_reveal(self.right, { BackgroundTransparency = t }, r)
            s:_reveal(self.title, {
                TextTransparency = if q then o else 1,
            }, r)
        end
        moveable(Divider)
        return Divider
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/drag
    define(Rayfield_components_drag, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Drag = {}
        Drag.__index = Drag
        Drag.__type = "Drag"
        local utility = script.Parent.Parent.utility
        local variables, constants = require(utility.variables), require(utility.constants)

        function Drag.new(j, k)
            k = if typeof(k) == "table" then k else {}
            local l = setmetatable({ window = assert(j, "Missing argument #1 (Window expected)") }, Drag)
            l.drag = l.window:Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(150, 20),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, l.window.size.Y.Offset / 2 + 15),
                ZIndex = constants.zIndex.drag,
                Visible = false,
                Parent = l.window.screenGui,
            })
            l.dragCosmetic = l.window:Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.3),
                ZIndex = constants.zIndex.drag,
                BackgroundTransparency = 1,
                Size = UDim2.fromOffset(0, 4),
                Parent = l.drag,
            })
            l.window:Create("UICorner", { CornerRadius = UDim.new(0, 20), Parent = l.dragCosmetic })
            l.window:CreateGlow(l.dragCosmetic, Color3.fromRGB(255, 255, 255), 10, 0.5)
            l.dragInteract = l.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                TextTransparency = 1,
                ZIndex = constants.zIndex.drag,
                Parent = l.drag,
            })
            local m, n, o, p = false, Vector2.zero, l.window.screenGui
            if o and o.IgnoreGuiInset then
                n = variables.guiService:GetGuiInset()
            end
            local function q()
                local r, s, t =
                    variables.userInputService and variables.userInputService:GetMouseLocation() or Vector2.new(
                        0,
                        0
                    ),
                    p or Vector2.new(0, 0),
                    n or Vector2.new(0, 0)
                return r + s + t
            end
            local function r()
                local s = q()
                local t, u = s.X, s.Y
                if l.window.settings and l.window.settings.keepOnScreen then
                    local v, w, x = l.window.main.AbsoluteSize, l.window.screenGui.AbsoluteSize, 8
                    local y, z = v.X / 2, v.Y / 2
                    t = math.clamp(t, y + x, math.max(y + x, w.X - y - x))
                    u = math.clamp(u, z + x, math.max(z + x, w.Y - z - x))
                end
                local v, w =
                    UDim2.fromOffset(t, u), UDim2.fromOffset(t, u + (l.window.main.Size.Y.Offset / 2 + 15))
                return v, w
            end
            l.window:Connect(l.drag.MouseEnter, function()
                if not m and not l.window.hidden then
                    variables.tweenService
                        :Create(
                            l.dragCosmetic,
                            TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0.5, Size = UDim2.new(0, 120, 0, 4) }
                        )
                        :Play()
                end
            end)
            l.window:Connect(l.drag.MouseLeave, function()
                if not m and not l.window.hidden then
                    variables.tweenService
                        :Create(
                            l.dragCosmetic,
                            TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                            { BackgroundTransparency = 0.7, Size = UDim2.new(0, 100, 0, 4) }
                        )
                        :Play()
                end
            end)
            local function s()
                if not m then
                    return
                end
                m = false
                if not l.window:_interactive() then
                    return
                end
                variables.tweenService
                    :Create(
                        l.dragCosmetic,
                        TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                        { Size = UDim2.new(0, 100, 0, 4), BackgroundTransparency = 0.7 }
                    )
                    :Play()
                local t, u, v = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), r()
                variables.tweenService:Create(l.window.main, t, { Position = u }):Play()
                variables.tweenService:Create(l.drag, t, { Position = v }):Play()
            end
            l.window:Connect(l.dragInteract.InputBegan, function(t, u)
                if u then
                    return
                end
                local v = t.UserInputType.Name
                if v == "MouseButton1" or v == "Touch" then
                    if not l.window:_interactive() then
                        return
                    end
                    m = true
                    if o and o.IgnoreGuiInset then
                        n = variables.guiService:GetGuiInset()
                    end
                    p = l.window.main.AbsolutePosition
                        + l.window.main.AbsoluteSize * l.window.main.AnchorPoint
                        - variables.userInputService:GetMouseLocation()
                    if not l.window.hidden then
                        variables.tweenService
                            :Create(
                                l.dragCosmetic,
                                TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                                { Size = UDim2.new(0, 110, 0, 4), BackgroundTransparency = 0 }
                            )
                            :Play()
                    end
                end
            end)
            l.window:Connect(variables.userInputService.InputEnded, function(t)
                local u = t.UserInputType.Name
                if u == "MouseButton1" or u == "Touch" then
                    s()
                end
            end)
            l.window:Connect(variables.userInputService.WindowFocusReleased, s)
            local t, u = 1e-7, 1e-60
            l.window:Connect(variables.runService.RenderStepped, function(v)
                if not m then
                    return
                end
                if not l.window:_interactive() then
                    s()
                    return
                end
                local w, x = r()
                l.window.main.Position = l.window.main.Position:Lerp(w, 1 - t ^ v)
                l.drag.Position = l.drag.Position:Lerp(x, 1 - u ^ v)
            end)
            return l
        end
        return Drag
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/dropdown
    define(Rayfield_components_dropdown, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Dropdown = {}
        Dropdown.__index = Dropdown
        Dropdown.__type = "Dropdown"
        local utility = script.Parent.Parent.utility
        local variables, functions, image, constants, locale, HapticEngine, windowSizing, lockable =
            require(utility.variables),
            require(utility.functions),
            require(utility.image),
            require(utility.constants),
            require(utility.locale),
            require(utility.HapticEngine),
            require(utility.windowSizing),
            require(utility.lockable)
        local p, q, r, s, t, u, v, w, x, y, z, A, B, C, D =
            constants.icons.chevron,
            constants.icons.check,
            constants.icons.dot,
            constants.icons.search,
            UDim.new(0, 12),
            UDim.new(0, 7),
            30,
            38,
            38,
            5,
            2,
            41,
            6,
            7,
            6
        local E, F, G, H, I, J, K =
            C + D,
            4,
            22,
            TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            0.4,
            TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

        local function L(M)
            local N, O = {}, {}
            for P, Q in M do
                if typeof(Q) == "string" and not N[Q] then
                    N[Q] = true
                    table.insert(O, Q)
                end
            end
            return O
        end

        local function M(N, O)
            if N == nil then
                return {}
            end
            if typeof(N) == "string" then
                return { N }
            end
            if typeof(N) == "table" then
                local P = L(N)
                if not O and #P > 1 then
                    return { P[1] }
                end
                return P
            end
            return {}
        end

        local function N(O, P)
            local Q = {}
            for R, S in O do
                if table.find(P, S) then
                    table.insert(Q, S)
                end
            end
            return Q
        end

        local function O(P, Q)
            if #P ~= #Q then
                return false
            end
            for R, S in P do
                if not table.find(Q, S) then
                    return false
                end
            end
            return true
        end

        function Dropdown.new(P, Q)
            Q = if typeof(Q) == "table" then Q else {}
            local R, S =
                Q.options or Q.Options or {}, Q.multiSelect or Q.MultiSelect or Q.MultipleOptions or false
            local T = setmetatable({
                tab = assert(P, "Missing argument #1 (Tab expected)"),
                window = P.window,
                name = Q.name or Q.Name or "Dropdown",
                icon = Q.icon or Q.Icon,
                description = Q.description or Q.Description,
                forgetState = Q.forgetState or Q.ForgetState or P.forgetState,
                flag = Q.flag
                    or Q.Flag
                    or (
                        not (Q.forgetState or Q.ForgetState or P.forgetState)
                            and functions.deriveFlagFromName(Q.name or Q.Name or "Dropdown")
                        or nil
                    ),
                callback = Q.callback or Q.Callback or function() end,
                options = L(R),
                multiSelect = S,
                placeholderText = locale.resolve(Q.placeholder or Q.Placeholder or "None"),
                value = M(Q.value or Q.Value or Q.currentOption or Q.CurrentOption, S),
                _isOpen = false,
                _optionFrames = {},
            }, Dropdown)
            T._desiredValue = T.value
            T.value = N(T.value, T.options)
            T.window:_registerControl(T)
            T.main = T.window:Create("Frame", {
                Size = UDim2.new(1, -20, 0, 41),
                BorderSizePixel = 0,
                Name = T.name,
                BackgroundTransparency = 1,
                Parent = T.tab.tabPage,
            })
            T.top = T.window:Create("Frame", {
                Size = UDim2.new(1, 0, 0, 41),
                Position = UDim2.fromScale(0, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                ZIndex = 1,
                Parent = T.main,
            }, { BackgroundTransparency = "ElementTransparency" })
            T.stroke = T.window:StyleElementBody(T.top)
            T.hoverOverlay = T.window:CreateHoverOverlay(T.top)
            T.flashTarget = T.top
            T.container = T.window:Create("Frame", {
                BorderSizePixel = 0,
                Parent = T.top,
                Size = UDim2.new(0, 170, 0, 16),
                Position = UDim2.new(0, 20, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                ZIndex = 5,
            })
            T.containerLayout = T.window:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Parent = T.container,
            })
            if T.icon then
                T.iconLabel = T.window:Create("ImageLabel", {
                    Image = T.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    ZIndex = 5,
                    Parent = T.container,
                }, { ImageColor3 = "ContentColor" })
            end
            T.title = T.window:Create("TextLabel", {
                Text = locale.t(T.name),
                Size = UDim2.fromOffset(150, 16),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                AutomaticSize = Enum.AutomaticSize.X,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                LayoutOrder = 1,
                TextTransparency = 1,
                ZIndex = 5,
                Parent = T.container,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            T.selectedLabel = T.window:Create("TextLabel", {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -41, 0.5, 0),
                Size = UDim2.fromOffset(168, 15),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 15,
                TextXAlignment = Enum.TextXAlignment.Right,
                TextWrapped = true,
                TextTransparency = 1,
                ZIndex = 5,
                Parent = T.top,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            T.chevron = T.window:Create("ImageLabel", {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -18, 0.5, 0),
                Size = UDim2.fromOffset(16, 16),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Image = "rbxassetid://" .. tostring(p),
                Rotation = 180,
                ImageTransparency = 1,
                ZIndex = 5,
                Parent = T.top,
            }, { ImageColor3 = "ContentColor" })
            T.interact = T.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 41),
                Position = UDim2.fromScale(0, 0),
                BorderSizePixel = 0,
                Text = "",
                TextTransparency = 1,
                ZIndex = 10,
                AutoButtonColor = false,
                Parent = T.main,
            })
            T.panel = T.window:Create("Frame", {
                AnchorPoint = Vector2.new(1, 1),
                Position = UDim2.new(1, 0, 1, 0),
                Size = UDim2.new(1, 0, 1, -(A + B)),
                BorderSizePixel = 0,
                ClipsDescendants = true,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                ZIndex = 1,
                BackgroundTransparency = 1,
                Parent = T.main,
            })
            T.panelStroke = T.window:StyleElementPanel(T.panel)
            T.window:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = T.panel,
            })
            T.window:Create(
                "UIPadding",
                { PaddingTop = UDim.new(0, C), PaddingBottom = UDim.new(0, D), Parent = T.panel }
            )
            T:_buildSearch()
            T:_buildActions()
            T.list = T.window:Create("ScrollingFrame", {
                Active = true,
                Size = UDim2.new(1, 0, 0, 0),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.new(),
                ScrollBarImageColor3 = Color3.fromRGB(240, 240, 240),
                ScrollBarThickness = 3,
                ScrollBarImageTransparency = 1,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                LayoutOrder = 3,
                ZIndex = 1,
                Parent = T.panel,
            })
            T.window:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = T.list })
            T.window:ConnectFor(T, T.list:GetPropertyChangedSignal("CanvasPosition"), function()
                T:_syncScrollHint()
            end)
            T.window:ConnectFor(T, T.list:GetPropertyChangedSignal("AbsoluteCanvasSize"), function()
                T:_syncScrollHint()
            end)
            T.window:ConnectFor(T, T.list:GetPropertyChangedSignal("AbsoluteWindowSize"), function()
                T:_syncScrollHint()
            end)
            T.listLayout = T.window:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                Parent = T.list,
            })
            T.window:Create(
                "UIPadding",
                { PaddingTop = UDim.new(0, z), PaddingBottom = UDim.new(0, z), Parent = T.list }
            )
            T.emptyLabel = T.window:Create("TextLabel", {
                Name = "Empty",
                Size = UDim2.new(1, -12, 0, x),
                BackgroundTransparency = 1,
                Text = locale.t("No matches"),
                TextSize = 14,
                TextTransparency = 0.55,
                Visible = false,
                LayoutOrder = 1,
                Parent = T.list,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            local function U(V)
                return table.find(T.value, V) ~= nil
            end
            local function V(W, X)
                local Y = U(W.name)
                local Z, _, aa, ab =
                    if T._isOpen then (Y and 0.9 or 0.95) else 1,
                    if T._isOpen then (Y and 0 or 0.3) else 1,
                    if T._isOpen then (Y and 0 or 0.7) else 1,
                    if T._isOpen then (Y and 0.85 or 0.93) else 1
                image.assign(W.checkIcon, "Image", if Y then q else r)
                if X then
                    local ac = TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                    variables.tweenService:Create(W.frame, ac, { BackgroundTransparency = Z }):Play()
                    variables.tweenService:Create(W.title, ac, { TextTransparency = _ }):Play()
                    variables.tweenService:Create(W.checkIcon, ac, { ImageTransparency = aa }):Play()
                    variables.tweenService
                        :Create(W.stroke, ac, {
                            Transparency = ab,
                        })
                        :Play()
                else
                    W.frame.BackgroundTransparency = Z
                    W.title.TextTransparency = _
                    W.checkIcon.ImageTransparency = aa
                    W.stroke.Transparency = ab
                end
            end
            local function aa()
                if T.multiSelect then
                    local ab = #T.value
                    if ab == 0 then
                        T.selectedLabel.Text = T.placeholderText
                    elseif ab == 1 then
                        T.selectedLabel.Text = T.value[1]
                    else
                        T.selectedLabel.Text = locale.resolve("Various")
                    end
                else
                    T.selectedLabel.Text = T.value[1] or T.placeholderText
                end
            end
            T._renderOptionState = V
            T._updateSelectedLabel = aa
            local function ab(ac)
                local W = T.window:Create("Frame", {
                    Size = UDim2.new(1, -12, 0, x),
                    BorderSizePixel = 0,
                    LayoutOrder = #T._optionFrames + 1,
                    BackgroundTransparency = 1,
                    Parent = T.list,
                }, { BackgroundColor3 = "DropdownHighlight" })
                local X, Y, Z, _ =
                    T.window:Create("UICorner", { CornerRadius = u, Parent = W }),
                    T.window:Create(
                        "UIStroke",
                        { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = W }
                    ),
                    T.window:Create("TextButton", {
                        BackgroundTransparency = 1,
                        Size = UDim2.fromScale(1, 1),
                        Text = "",
                        TextTransparency = 1,
                        ZIndex = 50,
                        Parent = W,
                    }),
                    T.window:Create("Frame", {
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(0, 14, 0.5, 0),
                        Size = UDim2.fromOffset(170, 16),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        ZIndex = 5,
                        Parent = W,
                    })
                T.window:Create("UIListLayout", {
                    Padding = UDim.new(0, 5),
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Parent = _,
                })
                local ad, ae =
                    T.window:Create("ImageLabel", {
                        Image = "rbxassetid://" .. tostring(q),
                        Size = UDim2.fromOffset(16, 16),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        ImageTransparency = 1,
                        ZIndex = 5,
                        Parent = _,
                    }, { ImageColor3 = "ContentColor" }), T.window:Create("TextLabel", {
                        Text = ac,
                        Size = UDim2.fromOffset(170, 16),
                        BorderSizePixel = 0,
                        BackgroundTransparency = 1,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        LayoutOrder = 1,
                        TextTransparency = 1,
                        ZIndex = 5,
                        Parent = _,
                    }, { TextColor3 = "ContentColor", FontFace = "Font" })
                local af = {
                    name = ac,
                    frame = W,
                    interact = Z,
                    title = ae,
                    checkIcon = ad,
                    container = _,
                    stroke = Y,
                    corner = X,
                    connections = {},
                }
                table.insert(
                    af.connections,
                    T.window:ConnectFor(T, W.MouseEnter, function()
                        if not T._isOpen or not T.window:_interactive() then
                            return
                        end
                        if U(af.name) then
                            return
                        end
                        variables.tweenService
                            :Create(W, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 0.9,
                            })
                            :Play()
                        variables.tweenService
                            :Create(
                                ae,
                                TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                                { TextTransparency = 0.15 }
                            )
                            :Play()
                    end)
                )
                table.insert(
                    af.connections,
                    T.window:ConnectFor(T, W.MouseLeave, function()
                        if not T._isOpen then
                            return
                        end
                        if U(af.name) then
                            return
                        end
                        variables.tweenService
                            :Create(
                                W,
                                TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                                { BackgroundTransparency = 0.95 }
                            )
                            :Play()
                        variables.tweenService
                            :Create(
                                ae,
                                TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                                { TextTransparency = 0.3 }
                            )
                            :Play()
                    end)
                )
                table.insert(
                    af.connections,
                    T.window:ConnectFor(T, Z.MouseButton1Click, function()
                        if not T._isOpen then
                            return
                        end
                        HapticEngine.click()
                        local ag = U(af.name)
                        if not T.multiSelect then
                            if ag then
                                T:_close()
                                return
                            end
                            table.clear(T.value)
                            table.insert(T.value, af.name)
                        else
                            if ag then
                                local ah = table.find(T.value, af.name)
                                if ah then
                                    table.remove(T.value, ah)
                                end
                            else
                                table.insert(T.value, af.name)
                            end
                        end
                        T._desiredValue = table.clone(T.value)
                        for ah, ai in T._optionFrames do
                            V(ai, true)
                        end
                        aa()
                        T.window:_runGuarded(T, T.callback, T:_callbackValue())
                        T.window:_persist(T)
                        if not T.multiSelect then
                            task.wait(0.1)
                            T:_close()
                        end
                    end)
                )
                return af
            end
            T._buildOption = ab
            for ac, ad in T.options do
                local ae = ab(ad)
                table.insert(T._optionFrames, ae)
            end
            aa()
            T:_updateCorners()
            T.window:ConnectFor(T, T.interact.MouseButton1Click, function()
                HapticEngine.click()
                if T._isOpen then
                    T:_close()
                else
                    T:_open()
                end
            end)
            T.window:ConnectFor(T, T.main.MouseEnter, function()
                if T._isOpen or not T.window:_interactive() then
                    return
                end
                variables.tweenService
                    :Create(T.title, I, { TextColor3 = T.window.theme.ElementTextHoverColor })
                    :Play()
                variables.tweenService:Create(T.hoverOverlay, I, { BackgroundTransparency = 0.97 }):Play()
                variables.tweenService
                    :Create(T.stroke, I, {
                        Transparency = T.window.theme.ElementStrokeHoverTransparency,
                        Color = T.window.theme.ElementStrokeHover,
                    })
                    :Play()
            end)
            T.window:ConnectFor(T, T.main.MouseLeave, function()
                variables.tweenService:Create(T.title, I, { TextColor3 = T.window.theme.ContentColor }):Play()
                variables.tweenService:Create(T.hoverOverlay, I, { BackgroundTransparency = 1 }):Play()
                variables.tweenService
                    :Create(T.stroke, I, {
                        Transparency = T.window.theme.ElementStrokeTransparency,
                        Color = T.window.theme.ElementStroke,
                    })
                    :Play()
            end)
            if T.description then
                T.descriptor = require(script.Parent.descriptor).new(T.tab, { description = T.description })
            end
            return T
        end

        function Dropdown._callbackValue(self)
            if self.multiSelect then
                return table.clone(self.value)
            end
            return self.value[1]
        end

        function Dropdown._buildSearch(self)
            self._searchOpen = false
            self.searchbar = self.window:Create("Frame", {
                Name = "Search",
                Size = UDim2.new(1, -12, 0, v),
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                ClipsDescendants = false,
                ZIndex = 1,
                Parent = self.panel,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = self.searchbar })
            self.searchStroke = self.window:Create(
                "UIStroke",
                { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = self.searchbar }
            )
            self.searchShadow = self.window:CreateGlow(self.searchbar, Color3.fromRGB(255, 255, 255), 20, 1)
            self.searchToggle = self.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Text = "",
                TextTransparency = 1,
                ZIndex = 51,
                Parent = self.searchbar,
            })
            self.searchInput = self.window:Create("TextBox", {
                Text = "",
                PlaceholderText = locale.t("Search..."),
                Size = UDim2.new(1, -58, 0, 16),
                Position = UDim2.new(0, 44, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                ClearTextOnFocus = false,
                TextEditable = false,
                Interactable = false,
                ZIndex = 52,
                TextTransparency = 1,
                Parent = self.searchbar,
            }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
            self.searchIcon = self.window:Create("ImageButton", {
                Image = "rbxassetid://" .. tostring(s),
                Size = UDim2.fromOffset(20, 20),
                Position = UDim2.new(0, 24, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                ScaleType = Enum.ScaleType.Fit,
                AutoButtonColor = false,
                ZIndex = 53,
                ImageTransparency = 1,
                Parent = self.searchbar,
            }, { ImageColor3 = "ContentColor" })
            self.window:ConnectFor(self, self.searchToggle.MouseButton1Click, function()
                if not self._searchOpen then
                    self:_expandSearch()
                end
            end)
            self.window:ConnectFor(self, self.searchIcon.MouseButton1Click, function()
                if self._searchOpen then
                    self:_collapseSearch()
                else
                    self:_expandSearch()
                end
            end)
            self.window:ConnectFor(self, self.searchInput:GetPropertyChangedSignal("Text"), function()
                self:_applyFilter(self.searchInput.Text)
            end)
            self.window:ConnectFor(self, self.searchInput.FocusLost, function()
                if self.searchInput.Text == "" then
                    self:_collapseSearch()
                end
            end)
        end

        function Dropdown._expandSearch(self)
            if self._searchOpen then
                return
            end
            self._searchOpen = true
            self.searchInput.TextEditable = true
            self.searchInput.Interactable = true
            variables.tweenService
                :Create(self.searchbar, K, { Size = UDim2.new(1, -12, 0, w), BackgroundTransparency = 0.92 })
                :Play()
            variables.tweenService:Create(self.searchStroke, K, { Transparency = 0.86 }):Play()
            variables.tweenService:Create(self.searchShadow, K, { Transparency = 0.92 }):Play()
            variables.tweenService
                :Create(self.searchInput, K, {
                    TextTransparency = 0.3,
                })
                :Play()
            self:_resizeToOptions()
            self.searchInput:CaptureFocus()
        end

        function Dropdown._collapseSearch(self)
            if not self._searchOpen then
                return
            end
            self._searchOpen = false
            self.searchInput.TextEditable = false
            self.searchInput.Interactable = false
            self.searchInput:ReleaseFocus()
            self.searchInput.Text = ""
            variables.tweenService
                :Create(self.searchbar, K, { Size = UDim2.new(1, -12, 0, v), BackgroundTransparency = 1 })
                :Play()
            variables.tweenService:Create(self.searchStroke, K, { Transparency = 1 }):Play()
            variables.tweenService:Create(self.searchShadow, K, { Transparency = 1 }):Play()
            variables.tweenService:Create(self.searchInput, K, { TextTransparency = 1 }):Play()
            self:_resizeToOptions()
        end

        function Dropdown._applyFilter(self, ab)
            ab = string.lower(ab or "")
            local ac = 0
            for ad, ae in self._optionFrames do
                local af = ab == "" or string.find(string.lower(ae.name), ab, 1, true) ~= nil
                ae.frame.Visible = af
                if af then
                    ac += 1
                end
            end
            self.emptyLabel.Visible = ac == 0 and ab ~= ""
            self:_updateCorners()
            self:_resizeToOptions()
            self:_syncScrollHint()
        end

        function Dropdown._syncScrollHint(self)
            local ab, ac, ad =
                self.list.AbsoluteCanvasSize, self.list.AbsoluteWindowSize, self.list.CanvasPosition
            if not ab or not ac or not ad then
                return
            end
            local ae = self._isOpen and ac.Y > 0 and ab.Y - (ad.Y + ac.Y) > 1
            variables.tweenService
                :Create(self.list, H, { ScrollBarImageTransparency = if ae then J else 1 })
                :Play()
        end

        function Dropdown._visibleOptions(self): { string }
            local ab = {}
            for ac, ad in self._optionFrames do
                if ad.frame.Visible then
                    table.insert(ab, ad.name)
                end
            end
            return ab
        end

        function Dropdown._buildActions(self)
            if not self.multiSelect then
                return
            end
            self.actions = self.window:Create("Frame", {
                Name = "Actions",
                Size = UDim2.new(1, -12, 0, G),
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Parent = self.panel,
            })
            self.window:Create("UIListLayout", {
                Padding = UDim.new(0, 12),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.actions,
            })
            local function ab(ac: string, ad: number, ae: () -> ())
                local af = self.window:Create("TextButton", {
                    AutomaticSize = Enum.AutomaticSize.X,
                    Size = UDim2.fromOffset(0, G),
                    BackgroundTransparency = 1,
                    Text = locale.t(ac),
                    TextSize = 13,
                    TextTransparency = 0.45,
                    LayoutOrder = ad,
                    Parent = self.actions,
                }, { TextColor3 = "ContentColor", FontFace = "Font" })
                self.window:ConnectFor(self, af.MouseEnter, function()
                    variables.tweenService:Create(af, H, { TextTransparency = 0.15 }):Play()
                end)
                self.window:ConnectFor(self, af.MouseLeave, function()
                    variables.tweenService:Create(af, H, { TextTransparency = 0.45 }):Play()
                end)
                self.window:ConnectFor(self, af.MouseButton1Click, function()
                    ae()
                    self:_afterBulkChange()
                end)
                return af
            end
            ab("Select all", 1, function()
                local ac = self:_visibleOptions()
                for ad, ae in ac do
                    if not table.find(self.value, ae) then
                        table.insert(self.value, ae)
                    end
                end
            end)
            ab("Clear", 2, function()
                local ac = self:_visibleOptions()
                for ad = #self.value, 1, -1 do
                    if table.find(ac, self.value[ad]) then
                        table.remove(self.value, ad)
                    end
                end
            end)
        end

        function Dropdown._afterBulkChange(self)
            self._desiredValue = table.clone(self.value)
            for ab, ac in self._optionFrames do
                self._renderOptionState(ac, true)
            end
            self:_updateSelectedLabel()
            self:_updateCorners()
            self.window:_runGuarded(self, self.callback, self:_callbackValue())
            self.window:_persist(self)
            HapticEngine.click()
        end

        function Dropdown._resizeToOptions(self)
            if not self._isOpen then
                return
            end
            variables.tweenService
                :Create(self.main, K, { Size = UDim2.new(1, -20, 0, self:_openHeight()) })
                :Play()
        end

        function Dropdown._updateCorners(self)
            local ab = {}
            for ac, ad in self._optionFrames do
                if ad.frame.Visible then
                    table.insert(ab, ad)
                end
            end
            for ac, ad in ab do
                local ae, af = if ac == 1 then t else u, if ac == #ab then t else u
                ad.corner.TopLeftRadius = ae
                ad.corner.TopRightRadius = ae
                ad.corner.BottomLeftRadius = af
                ad.corner.BottomRightRadius = af
            end
        end

        local function aa(ab: number): number
            return ab * x + math.max(0, ab - 1) * y + z * 2
        end

        local function ab(ac: number): number
            return math.max(math.floor((ac - z * 2 + y) / (x + y)), 1)
        end

        function Dropdown._pageHeight(self): number
            local ad = self.window.size
            return windowSizing.pageHeight(ad and ad.Y.Offset, self.window.layout.mode)
        end

        function Dropdown._openHeight(self)
            local ad = 0
            for ae, af in self._optionFrames do
                if af.frame.Visible then
                    ad += 1
                end
            end
            local ae = if self._searchOpen then w else v
            local af, ag = A + B + E + ae + y + (if self.actions then G + y else 0), self:_pageHeight()
            local ah = math.min(math.max(ad, 1), F, ab(ag - af))
            return math.min(af + aa(ah), ag)
        end

        function Dropdown._open(self)
            if self._isOpen then
                return
            end
            self._isOpen = true
            if self._outsideClickConn then
                self.window:Disconnect(self._outsideClickConn)
            end
            self._outsideClickConn = self.window:Connect(variables.userInputService.InputBegan, function(ad)
                if
                    ad.UserInputType ~= Enum.UserInputType.MouseButton1
                    and ad.UserInputType ~= Enum.UserInputType.Touch
                then
                    return
                end
                local ae, af, ag = ad.Position, self.main.AbsolutePosition, self.main.AbsoluteSize
                if ae.X < af.X or ae.X > af.X + ag.X or ae.Y < af.Y or ae.Y > af.Y + ag.Y then
                    self:_close()
                end
            end)
            variables.tweenService
                :Create(
                    self.main,
                    TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    { Size = UDim2.new(1, -20, 0, self:_openHeight()) }
                )
                :Play()
            variables.tweenService
                :Create(
                    self.chevron,
                    TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    { Rotation = 0 }
                )
                :Play()
            variables.tweenService
                :Create(
                    self.panel,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { BackgroundTransparency = self.window.theme.ElementTransparency or 0 }
                )
                :Play()
            variables.tweenService
                :Create(
                    self.panelStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { Transparency = self.window.theme.ElementStrokeTransparency }
                )
                :Play()
            variables.tweenService
                :Create(
                    self.searchIcon,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { ImageTransparency = 0.5 }
                )
                :Play()
            for ad, ae in self._optionFrames do
                self._renderOptionState(ae, true)
            end
            self:_syncScrollHint()
            self:_bringIntoView()
        end

        function Dropdown._bringIntoView(self)
            local ad = self.tab and self.tab.tabPage
            if not ad then
                return
            end
            local ae, af, ag, ah =
                ad.AbsoluteWindowSize, ad.CanvasPosition, ad.AbsolutePosition, self.main.AbsolutePosition
            if not ae or not af or not ag or not ah or ae.Y <= 0 then
                return
            end
            local ai = ah.Y - ag.Y + af.Y
            local P = ai + self:_openHeight()
            local Q = P - (af.Y + ae.Y)
            if Q <= 0 then
                return
            end
            local R = math.min(af.Y + Q + 8, ai)
            variables.tweenService
                :Create(
                    ad,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { CanvasPosition = Vector2.new(af.X, R) }
                )
                :Play()
        end

        function Dropdown._close(self)
            if not self._isOpen then
                return
            end
            self._isOpen = false
            if self._outsideClickConn then
                self.window:Disconnect(self._outsideClickConn)
                self._outsideClickConn = nil
            end
            self:_collapseSearch()
            self:_syncScrollHint()
            variables.tweenService
                :Create(
                    self.chevron,
                    TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    { Rotation = 180 }
                )
                :Play()
            variables.tweenService
                :Create(
                    self.panel,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 1 }
                )
                :Play()
            variables.tweenService
                :Create(
                    self.panelStroke,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { Transparency = 1 }
                )
                :Play()
            variables.tweenService
                :Create(
                    self.searchIcon,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { ImageTransparency = 1 }
                )
                :Play()
            for ad, ae in self._optionFrames do
                self._renderOptionState(ae, true)
            end
            variables.tweenService
                :Create(
                    self.main,
                    TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    { Size = UDim2.new(1, -20, 0, 41) }
                )
                :Play()
        end

        function Dropdown._destroyOption(self, ad)
            if ad.connections then
                for ae, af in ad.connections do
                    local ag = table.find(self.connections, af)
                    if ag then
                        table.remove(self.connections, ag)
                    end
                    self.window:Disconnect(af)
                end
                ad.connections = nil
            end
            self.window:DestroySubtree(ad.frame)
        end

        function Dropdown._deriveSelection(self)
            local ad = self.value
            self.value = N(self._desiredValue or self.value, self.options)
            return not O(self.value, ad)
        end

        function Dropdown._reindexOptions(self)
            for ad, ae in self._optionFrames do
                ae.frame.LayoutOrder = ad
            end
        end

        function Dropdown._rebindOption(ac, ad, ae, af)
            ad.name = ae
            ad.title.Text = ae
            ad.frame.LayoutOrder = af
        end

        function Dropdown._destroyOptionsFrom(self, ad)
            local ae, af = {}, {}
            for ag = #self._optionFrames, ad, -1 do
                local ah = self._optionFrames[ag]
                table.insert(ae, ah.frame)
                if ah.connections then
                    table.move(ah.connections, 1, #ah.connections, #af + 1, af)
                    ah.connections = nil
                end
                self._optionFrames[ag] = nil
            end
            self.window:DisconnectMany(self, af)
            self.window:DestroySubtrees(ae)
        end

        function Dropdown.Refresh(self, ad)
            self.options = L(ad or {})
            local ae, af, ag = self:_deriveSelection(), #self._optionFrames, #self.options
            for ah = 1, math.min(af, ag) do
                self:_rebindOption(self._optionFrames[ah], self.options[ah], ah)
            end
            for ah = af + 1, ag do
                local ai = self._buildOption(self.options[ah])
                ai.frame.LayoutOrder = ah
                table.insert(self._optionFrames, ai)
            end
            if ag < af then
                self:_destroyOptionsFrom(ag + 1)
            end
            for ah, ai in self._optionFrames do
                self._renderOptionState(ai, false)
            end
            self._updateSelectedLabel()
            self:_applyFilter(if self._searchOpen then self.searchInput.Text else "")
            if ae then
                self.window:_runGuarded(self, self.callback, self:_callbackValue())
                self.window:_persist(self)
            end
        end

        function Dropdown.Add(self, ad)
            if typeof(ad) ~= "string" or ad == "" then
                return
            end
            if table.find(self.options, ad) then
                return
            end
            table.insert(self.options, ad)
            local ae = self._buildOption(ad)
            table.insert(self._optionFrames, ae)
            local af = self:_deriveSelection()
            if self._isOpen then
                self._renderOptionState(ae, true)
            end
            self:_applyFilter(if self._searchOpen then self.searchInput.Text else "")
            if af then
                self._updateSelectedLabel()
                self.window:_runGuarded(self, self.callback, self:_callbackValue())
                self.window:_persist(self)
            end
        end

        function Dropdown.Remove(self, ad)
            local ae = table.find(self.options, ad)
            if not ae then
                return
            end
            table.remove(self.options, ae)
            for af, ag in self._optionFrames do
                if ag.name == ad then
                    self:_destroyOption(ag)
                    table.remove(self._optionFrames, af)
                    self:_reindexOptions()
                    break
                end
            end
            if self._desiredValue then
                local af = table.find(self._desiredValue, ad)
                if af then
                    table.remove(self._desiredValue, af)
                end
            end
            local af = table.find(self.value, ad)
            if af then
                table.remove(self.value, af)
                self._updateSelectedLabel()
                self.window:_runGuarded(self, self.callback, self:_callbackValue())
                self.window:_persist(self)
            end
            self:_applyFilter(if self._searchOpen then self.searchInput.Text else "")
        end

        function Dropdown.Set(self, ad, ae)
            local af = M(ad, self.multiSelect)
            self._desiredValue = af
            self.value = N(af, self.options)
            for ag, ah in self._optionFrames do
                self._renderOptionState(ah, true)
            end
            self._updateSelectedLabel()
            if not ae then
                self.window:_runGuarded(self, self.callback, self:_callbackValue())
                self.window:_persist(self)
            end
        end

        function Dropdown._setShown(self, ad, ae)
            local af = self.window
            af:_reveal(self.stroke, { Transparency = if ad then af.theme.ElementStrokeTransparency else 1 }, ae)
            af:_reveal(self.title, { TextTransparency = if ad then 0 else 1 }, ae)
            af:_reveal(
                self.top,
                { BackgroundTransparency = if ad then (af.theme.ElementTransparency or 0) else 1 },
                ae
            )
            if self.iconLabel then
                af:_reveal(self.iconLabel, { ImageTransparency = if ad then 0 else 1 }, ae)
            end
            if self.descriptor then
                af:_reveal(self.descriptor.titleLabel, { TextTransparency = if ad then 0.7 else 1 }, ae)
            end
            af:_reveal(self.selectedLabel, {
                TextTransparency = if ad then 0.5 else 1,
            }, ae)
            af:_reveal(self.chevron, { ImageTransparency = if ad then 0.5 else 1 }, ae)
            if not ad and self._isOpen then
                self:_close()
            end
        end

        function Dropdown.MoveTo(self, ad)
            self.tab:_moveElement(self, ad)
        end

        function Dropdown.MoveToTop(self)
            self.tab:_moveElement(self, 1)
        end

        function Dropdown.MoveToBottom(self)
            self.tab:_moveElement(self, #self.tab.elements)
        end

        function Dropdown.MoveUp(self)
            local ad = table.find(self.tab.elements, self)
            if ad then
                self.tab:_moveElement(self, ad - 1)
            end
        end

        function Dropdown.MoveDown(self)
            local ad = table.find(self.tab.elements, self)
            if ad then
                self.tab:_moveElement(self, ad + 1)
            end
        end
        lockable(Dropdown)
        return Dropdown
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/group
    define(Rayfield_components_group, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Group = {}
        Group.__index = Group
        Group.__type = "Group"
        local moveable, log, ordering, ai, b =
            require(script.Parent.Parent.utility.moveable),
            require(script.Parent.Parent.utility.log),
            require(script.Parent.Parent.utility.ordering),
            8,
            { button = true, toggle = true, stat = true, slider = true }

        function Group.new(c, d)
            d = if typeof(d) == "table" then d else {}
            local e = string.lower(d.direction or d.Direction or "row")
            local f = e == "column" or e == "vertical"
            local g = not f
            local h = if g then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
            local i, j =
                setmetatable({
                    tab = assert(c, "Missing argument #1 (Tab expected)"),
                    window = c.window,
                    direction = h,
                    compact = g,
                    forgetState = c.forgetState,
                    elements = {},
                }, Group), c.direction == Enum.FillDirection.Horizontal
            i.main = i.window:Create("Frame", {
                Name = "Group",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                Size = if g then UDim2.new(1, -20, 0, 0) else UDim2.new(1, 0, 0, 0),
                Parent = i.tab.tabPage,
            })
            if j then
                i.main.Size = UDim2.new(0, 0, 0, 0)
                i.window:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = i.main })
            end
            i.tabPage = i.main
            i.layout = i.window:Create("UIListLayout", {
                FillDirection = h,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, ai),
                VerticalAlignment = if g then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top,
                HorizontalAlignment = if g
                    then Enum.HorizontalAlignment.Left
                    else Enum.HorizontalAlignment.Center,
                Parent = i.main,
            })
            return i
        end

        function Group._add(self, d, e)
            if self.compact and not b[d] then
                log.warn(
                    `Rayfield: a row only holds compact elements (button/toggle/stat/slider), ignoring '{d}'. Use a column for it.`
                )
                return nil
            end
            local f = require(script.Parent[d]).new(self, e)
            table.insert(self.elements, f)
            ordering(f, #self.elements * 10)
            self.window:_restoreLate(f)
            if self.compact then
                self:_wrapChild(f)
            end
            self:_reflowRow()
            if not self.window.hidden then
                f:_setShown(true, true)
            end
            return f
        end

        function Group._reflowRow(self)
            if self.direction ~= Enum.FillDirection.Horizontal then
                return
            end
            local d = #self.elements > 0
            for e, f in self.elements do
                if f.__type ~= "Group" then
                    d = false
                    break
                end
            end
            self.layout.Padding = if d then UDim.new(0, -10) else UDim.new(0, ai)
        end

        function Group._wrapChild(self, d)
            self.layout.Wraps = true
            self.layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
            d._widthManaged = true
            local e = if d._minWidth then d:_minWidth() else 0
            if e > 0 then
                d.main.AutomaticSize = Enum.AutomaticSize.None
                d.main.Size = UDim2.new(0, e, d.main.Size.Y.Scale, d.main.Size.Y.Offset)
            end
        end

        function Group.CreateButton(self, d)
            return self:_add("button", d)
        end

        function Group.CreateToggle(self, d)
            return self:_add("toggle", d)
        end

        function Group.CreateSwitch(self, d)
            return self:_add("toggle", d)
        end

        function Group.CreateStat(self, d)
            return self:_add("stat", d)
        end

        function Group.CreateSlider(self, d)
            return self:_add("slider", d)
        end

        function Group.CreateDropdown(self, d)
            return self:_add("dropdown", d)
        end

        function Group.CreateSection(self, d)
            return self:_add("section", d)
        end

        function Group.CreateText(self, d)
            return self:_add("text", d)
        end

        function Group.CreateDivider(self, d)
            return self:_add("divider", d)
        end

        function Group._addGroup(self, d)
            d = if typeof(d) == "table" then table.clone(d) else {}
            if self.direction == Enum.FillDirection.Horizontal then
                self.layout.VerticalAlignment = Enum.VerticalAlignment.Top
                if self.tab.direction ~= Enum.FillDirection.Horizontal then
                    self.main.Size = UDim2.new(1, 0, 0, 0)
                end
            end
            local e = Group.new(self, d)
            table.insert(self.elements, e)
            e.main.LayoutOrder = #self.elements * 10
            self:_reflowRow()
            return e
        end

        function Group.CreateGroup(self, d)
            return self:_addGroup(d)
        end

        function Group._moveElement(self, d, e)
            local f = table.find(self.elements, d)
            if not f then
                return
            end
            table.remove(self.elements, f)
            e = math.clamp(e, 1, #self.elements + 1)
            table.insert(self.elements, e, d)
            for g, h in self.elements do
                ordering(h, g * 10)
            end
        end

        function Group._setShown(self, d, e)
            for f, g in self.elements do
                g:_setShown(d, e)
            end
        end

        function Group._refreshTheme(self)
            for d, e in self.elements do
                if e._refreshTheme then
                    e:_refreshTheme()
                end
            end
        end
        moveable(Group)
        return Group
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/input
    define(Rayfield_components_input, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Input = {}
        Input.__index = Input
        Input.__type = "Input"
        local utility = script.Parent.Parent.utility
        local variables, functions, moveable, lockable, locale, constants, HapticEngine =
            require(utility.variables),
            require(utility.functions),
            require(utility.moveable),
            require(utility.lockable),
            require(utility.locale),
            require(utility.constants),
            require(utility.HapticEngine)
        local f, g =
            constants.pillResizeInfo, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

        local function h(i)
            local j, k = i:match("^([%d%.%-]+)%^([%d%.%-]+)$")
            if j and k then
                local l, m = tonumber(j), tonumber(k)
                if l and m then
                    return l ^ m
                end
            end
            return tonumber(i)
        end

        function Input.new(i, j)
            j = if typeof(j) == "table" then j else {}
            local k = setmetatable({
                tab = assert(i, "Missing argument #1 (Tab expected)"),
                window = i.window,
                name = j.name or j.Name or "Input",
                icon = j.icon or j.Icon,
                description = j.description or j.Description,
                forgetState = j.forgetState or j.ForgetState or i.forgetState,
                placeholder = j.placeholder or j.Placeholder or "",
                numeric = j.numeric or j.Numeric or false,
                clearOnFocus = j.clearOnFocus or j.ClearOnFocus or false,
                callback = j.callback or j.Callback or function() end,
            }, Input)
            k.value = tostring(j.value or j.Value or j.currentValue or j.CurrentValue or "")
            k.flag = j.flag or j.Flag or (not k.forgetState and functions.deriveFlagFromName(k.name) or nil)
            k.window:_registerControl(k)
            k.main = k.window:Create("Frame", {
                Size = UDim2.new(1, -20, 0, 41),
                BorderSizePixel = 0,
                Name = k.name,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = k.tab.tabPage,
            }, { BackgroundTransparency = "ElementTransparency" })
            k.stroke = k.window:StyleElementBody(k.main)
            k.hoverOverlay = k.window:CreateHoverOverlay(k.main)
            k.container = k.window:Create("Frame", {
                Size = UDim2.new(0, 170, 0, 16),
                Position = UDim2.new(0, 20, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Parent = k.main,
            })
            k.window:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Parent = k.container,
            })
            if k.icon then
                k.iconLabel = k.window:Create("ImageLabel", {
                    Image = k.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 5,
                    ImageTransparency = 1,
                    Parent = k.container,
                }, { ImageColor3 = "ContentColor" })
            end
            k.title = k.window:Create("TextLabel", {
                Text = locale.t(k.name),
                Size = UDim2.fromOffset(150, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 1,
                ZIndex = 5,
                TextTransparency = 1,
                Parent = k.container,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            k.box = k.window:Create("Frame", {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -7, 0, 20),
                Size = UDim2.fromOffset(85, 30),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Parent = k.main,
            }, { BackgroundColor3 = "FieldBackground" })
            k.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = k.box })
            k.boxStroke = k.window:Create(
                "UIStroke",
                { Transparency = 1, Parent = k.box },
                { Color = "SurfaceStroke" }
            )
            k.glow = k.window:CreateGlow(k.box, "FieldGlow", 20, 1)
            k._glowIdle = 1
            k.input = k.window:Create("TextBox", {
                Text = k.value,
                PlaceholderText = locale.t(k.placeholder),
                Size = UDim2.new(1, -15, 0, 15),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 15,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextTruncate = Enum.TextTruncate.AtEnd,
                ClearTextOnFocus = k.clearOnFocus,
                TextTransparency = 1,
                Parent = k.box,
            }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
            k.window:ConnectFor(k, k.input:GetPropertyChangedSignal("Text"), function()
                if k.numeric then
                    local l = (k.input.Text:gsub("[^%d%.%-eE%^]", ""))
                    if l ~= k.input.Text then
                        k.input.Text = l
                        return
                    end
                end
                k:_sizeBox(true)
            end)
            k.window:ConnectFor(k, k.input.Focused, function()
                variables.tweenService:Create(k.input, g, { TextTransparency = 0 }):Play()
            end)
            k.window:ConnectFor(k, k.input.FocusLost, function()
                variables.tweenService:Create(k.input, g, { TextTransparency = 0.6 }):Play()
                if k.clearOnFocus and k.input.Text == "" and k.value ~= "" then
                    k.input.Text = k.value
                    return
                end
                if k.input.Text == k.value then
                    return
                end
                k:_commit(k.input.Text)
            end)
            k.window:_wireElementHover(k)
            if k.description then
                k.descriptor = require(script.Parent.descriptor).new(k.tab, { description = k.description })
            end
            k:_sizeBox(false)
            return k
        end

        function Input._sizeBox(self, j)
            local k = self.input.Text ~= "" and self.input.Text or self.placeholder
            local l = math.clamp(functions.textWidth(self.window.theme.Font, 15, k) + 30, 70, 220)
            if j then
                variables.tweenService:Create(self.box, f, { Size = UDim2.fromOffset(l, 30) }):Play()
            else
                self.box.Size = UDim2.fromOffset(l, 30)
            end
        end

        function Input._commit(self, j, k)
            j = tostring(j)
            if self.numeric then
                local l = h(j)
                if not l or l ~= l or l == math.huge or l == -math.huge then
                    if self.input.Text ~= self.value then
                        self.input.Text = self.value
                    end
                    return
                end
                j = tostring(l)
            end
            local l = j ~= self.value
            self.value = j
            if self.input.Text ~= j then
                self.input.Text = j
            end
            if not k then
                self.window:_runGuarded(self, self.callback, j)
                self.window:_persist(self)
                if l and not self.window._loading then
                    HapticEngine.click()
                    self.window:_flashResult(self, true)
                end
            end
        end

        function Input.Set(self, j, k)
            self:_commit(j, k)
        end

        function Input._setShown(self, j, k)
            local l = self.window
            if j then
                l:_revealCommon(self, k)
                l:_reveal(self.box, { BackgroundTransparency = l.theme.FieldTransparency }, k)
                l:_reveal(self.boxStroke, {
                    Transparency = 0.85,
                }, k)
                l:_reveal(self.input, { TextTransparency = 0.6 }, k)
            else
                l:_hideCommon(self, k)
                l:_reveal(self.box, {
                    BackgroundTransparency = 1,
                }, k)
                l:_reveal(self.boxStroke, { Transparency = 1 }, k)
                l:_reveal(self.input, { TextTransparency = 1 }, k)
            end
        end

        function Input._refreshTheme(self)
            variables.tweenService
                :Create(
                    self.box,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { BackgroundTransparency = self.window.theme.FieldTransparency }
                )
                :Play()
        end
        moveable(Input)
        lockable(Input)
        return Input
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/keybind
    define(Rayfield_components_keybind, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Keybind = {}
        Keybind.__index = Keybind
        Keybind.__type = "Keybind"
        local utility = script.Parent.Parent.utility
        local variables, functions, moveable, lockable, locale, constants, HapticEngine, enums, log =
            require(utility.variables),
            require(utility.functions),
            require(utility.moveable),
            require(utility.lockable),
            require(utility.locale),
            require(utility.constants),
            require(utility.HapticEngine),
            require(utility.enums),
            require(utility.log)
        local h, i, j =
            constants.pillResizeInfo, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                [Enum.UserInputType.MouseButton1] = "MB1",
                [Enum.UserInputType.MouseButton2] = "MB2",
                [Enum.UserInputType.MouseButton3] = "MB3",
            }

        local function k(l)
            if typeof(l) ~= "EnumItem" or l == Enum.KeyCode.Unknown then
                return "None"
            end
            return j[l] or l.Name
        end

        local function l(m)
            if typeof(m) == "EnumItem" then
                return m
            end
            if type(m) == "string" then
                local n, o = pcall(function()
                    return Enum.KeyCode[m]
                end)
                if n and o then
                    return o
                end
                local p, q = pcall(function()
                    return Enum.UserInputType[m]
                end)
                if p and q and j[q] then
                    return q
                end
            end
            return Enum.KeyCode.Unknown
        end

        function Keybind.new(m, n)
            n = if typeof(n) == "table" then n else {}
            local o = setmetatable({
                tab = assert(m, "Missing argument #1 (Tab expected)"),
                window = m.window,
                name = n.name or n.Name or "Keybind",
                icon = n.icon or n.Icon,
                description = n.description or n.Description,
                forgetState = n.forgetState or n.ForgetState or m.forgetState,
                isMenuToggle = n.isMenuToggle or n.IsMenuToggle or false,
                callback = n.callback or n.Callback or function() end,
                onChanged = n.onChanged or n.OnChanged or function() end,
                hold = n.hold or n.Hold or false,
                holdThreshold = n.holdThreshold or n.HoldThreshold or 0.2,
                recording = false,
            }, Keybind)
            o.value = l(n.value or n.Value or n.default or n.Default)
            o.flag = n.flag or n.Flag or (not o.forgetState and functions.deriveFlagFromName(o.name) or nil)
            o.window:_registerControl(o)
            o.main = o.window:Create("Frame", {
                Size = UDim2.new(1, -20, 0, 41),
                BorderSizePixel = 0,
                Name = o.name,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = o.tab.tabPage,
            }, { BackgroundTransparency = "ElementTransparency" })
            o.stroke = o.window:StyleElementBody(o.main)
            o.hoverOverlay = o.window:CreateHoverOverlay(o.main)
            o.container = o.window:Create("Frame", {
                Size = UDim2.new(0, 170, 0, 16),
                Position = UDim2.new(0, 20, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Parent = o.main,
            })
            o.window:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Parent = o.container,
            })
            if o.icon then
                o.iconLabel = o.window:Create("ImageLabel", {
                    Image = o.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 5,
                    ImageTransparency = 1,
                    Parent = o.container,
                }, { ImageColor3 = "ContentColor" })
            end
            o.title = o.window:Create("TextLabel", {
                Text = locale.t(o.name),
                Size = UDim2.fromOffset(150, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 1,
                ZIndex = 5,
                TextTransparency = 1,
                Parent = o.container,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            o.box = o.window:Create("TextButton", {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -7, 0, 20),
                Size = UDim2.fromOffset(40, 30),
                AutoButtonColor = false,
                Text = "",
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Parent = o.main,
            }, { BackgroundColor3 = "FieldBackground" })
            o.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = o.box })
            o.boxStroke = o.window:Create(
                "UIStroke",
                { Transparency = 1, Parent = o.box },
                { Color = "SurfaceStroke" }
            )
            o.glow = o.window:CreateGlow(o.box, "FieldGlow", 20, 1)
            o._glowIdle = 0.9
            o.keyLabel = o.window:Create("TextLabel", {
                Text = k(o.value),
                Size = UDim2.fromScale(1, 1),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 15,
                TextXAlignment = Enum.TextXAlignment.Center,
                ZIndex = 2,
                TextTransparency = 1,
                Parent = o.box,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            o.window:ConnectFor(o, o.box.MouseButton1Click, function()
                HapticEngine.click()
                if o.recording then
                    o:_stopRecording()
                else
                    o:_startRecording()
                end
            end)
            o.window:ConnectFor(o, variables.userInputService.InputBegan, function(p, q)
                if q then
                    return
                end
                if o.recording then
                    o:_capture(p)
                    return
                end
                if o.window._recordingKeybind then
                    return
                end
                if o:_matches(p) then
                    if o.hold then
                        o:_beginHold(p)
                    else
                        o.window:_runGuarded(o, o.callback, o.value)
                    end
                end
            end)
            o.window:_wireElementHover(o)
            if o.description then
                o.descriptor = require(script.Parent.descriptor).new(o.tab, { description = o.description })
            end
            o:_sizeBox(false)
            return o
        end

        function Keybind._sizeBox(self, n)
            local o =
                math.clamp(functions.textWidth(self.window.theme.Font, 15, self.keyLabel.Text) + 28, 40, 200)
            if n then
                variables.tweenService:Create(self.box, h, { Size = UDim2.fromOffset(o, 30) }):Play()
            else
                self.box.Size = UDim2.fromOffset(o, 30)
            end
        end

        function Keybind._startRecording(self)
            local n = self.window._recordingKeybind
            if n and n ~= self then
                n:_stopRecording()
            end
            self.recording = true
            self.window._recordingKeybind = self
            self.keyLabel.Text = locale.resolve("Recording")
            self:_sizeBox(true)
            variables.tweenService
                :Create(self.glow, i, {
                    Transparency = 0.7,
                })
                :Play()
            variables.tweenService:Create(self.keyLabel, i, { TextTransparency = 0 }):Play()
        end

        function Keybind._stopRecording(self)
            self.recording = false
            if self.window._recordingKeybind == self then
                local n = self.window
                task.defer(function()
                    if n._recordingKeybind == self then
                        n._recordingKeybind = nil
                    end
                end)
            end
            self.keyLabel.Text = k(self.value)
            self:_sizeBox(true)
            variables.tweenService
                :Create(self.glow, i, {
                    Transparency = 0.9,
                })
                :Play()
            variables.tweenService:Create(self.keyLabel, i, { TextTransparency = 0.6 }):Play()
        end

        function Keybind._capture(self, n)
            local o
            if n.UserInputType == Enum.UserInputType.Keyboard then
                if n.KeyCode == Enum.KeyCode.Escape then
                    self:_stopRecording()
                    return
                end
                if n.KeyCode == Enum.KeyCode.Backspace then
                    self:_bind(Enum.KeyCode.Unknown)
                    return
                end
                o = n.KeyCode
            elseif
                n.UserInputType == Enum.UserInputType.MouseButton2
                or n.UserInputType == Enum.UserInputType.MouseButton3
            then
                o = n.UserInputType
            end
            if not o then
                return
            end
            if self.isMenuToggle then
                local p = self.window:_keybindUsing(o, self)
                if p then
                    self.window:Notify({
                        title = locale.resolve("Keybind unavailable"),
                        content = string.format(
                            locale.resolve("%s is bound to %s. Kept %s."),
                            k(o),
                            p.name,
                            k(self.value)
                        ),
                    })
                    self:_stopRecording()
                    self.window:_flashResult(self, false)
                    return
                end
            elseif o == self.window.settings.toggleKeybind then
                self.window:Notify({
                    title = locale.resolve("Keybind unavailable"),
                    content = string.format(
                        locale.resolve("%s is the menu toggle key. Kept %s."),
                        k(o),
                        k(self.value)
                    ),
                })
                self:_stopRecording()
                self.window:_flashResult(self, false)
                return
            end
            self:_bind(o)
        end

        function Keybind._bind(self, n)
            self.value = n
            self:_stopRecording()
            self.window:_runGuarded(self, self.onChanged, n)
            self.window:_persist(self)
            self.window:_flashResult(self, true)
        end

        function Keybind._matches(self, n)
            local o = self.value
            if typeof(o) ~= "EnumItem" or o == Enum.KeyCode.Unknown then
                return false
            end
            if o.EnumType == Enum.KeyCode then
                return n.KeyCode == o
            elseif o.EnumType == Enum.UserInputType then
                return n.UserInputType == o
            end
            return false
        end

        function Keybind._beginHold(self, n)
            if self._holding or self._holdPress then
                return
            end
            local o = {}
            self._holdPress = o
            local p, q = n.KeyCode, n.UserInputType
            task.delay(self.holdThreshold, function()
                if self._holdPress ~= o then
                    return
                end
                self._holding = true
                self.window:_runGuarded(self, self.callback, true)
            end)
            local r
            r = self.window:ConnectFor(self, variables.userInputService.InputEnded, function(s)
                local t = if p ~= Enum.KeyCode.Unknown then s.KeyCode == p else s.UserInputType == q
                if not t then
                    return
                end
                if self.connections then
                    local u = table.find(self.connections, r)
                    if u then
                        table.remove(self.connections, u)
                    end
                end
                self.window:Disconnect(r)
                if self._holdPress == o then
                    self._holdPress = nil
                end
                if self._holding then
                    self._holding = false
                    self.window:_runGuarded(self, self.callback, false)
                end
            end)
        end

        function Keybind.Set(self, n, o)
            local p = l(n)
            if p ~= Enum.KeyCode.Unknown then
                if self.isMenuToggle then
                    local q = self.window:_keybindUsing(p, self)
                    if q then
                        log.warn(
                            "Rayfield: "
                                .. k(p)
                                .. " is bound to '"
                                .. tostring(q.name)
                                .. "'; kept "
                                .. k(self.value)
                        )
                        return
                    end
                elseif p == self.window.settings.toggleKeybind then
                    log.warn("Rayfield: " .. k(p) .. " is the menu toggle key; kept " .. k(self.value))
                    return
                end
            end
            self.value = p
            if self.recording then
                self:_stopRecording()
            else
                self.keyLabel.Text = k(self.value)
                self:_sizeBox(true)
            end
            if not o then
                self.window:_runGuarded(self, self.onChanged, self.value)
                self.window:_persist(self)
            end
        end

        function Keybind._serialize(self)
            return { tostring(self.value.EnumType), self.value.Value }
        end

        function Keybind._deserialize(self, n)
            local o = tostring(n[1]):gsub("^Enum%.", "")
            local p, q = pcall(function()
                return Enum[o]
            end)
            if not p or not q then
                return
            end
            local r = enums.itemFromValue(q, n[2])
            if r then
                self:Set(r)
            end
        end

        function Keybind._setShown(self, n, o)
            local p = self.window
            if n then
                p:_revealCommon(self, o)
                p:_reveal(self.box, { BackgroundTransparency = p.theme.FieldTransparency }, o)
                p:_reveal(self.boxStroke, { Transparency = 0.85 }, o)
                p:_reveal(self.keyLabel, { TextTransparency = 0.6 }, o)
                p:_reveal(self.glow, { Transparency = 0.9 }, o)
            else
                p:_hideCommon(self, o)
                p:_reveal(self.box, { BackgroundTransparency = 1 }, o)
                p:_reveal(self.boxStroke, { Transparency = 1 }, o)
                p:_reveal(self.keyLabel, { TextTransparency = 1 }, o)
                p:_reveal(self.glow, { Transparency = 1 }, o)
            end
        end

        function Keybind._refreshTheme(self)
            variables.tweenService
                :Create(
                    self.box,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { BackgroundTransparency = self.window.theme.FieldTransparency }
                )
                :Play()
        end
        moveable(Keybind)
        lockable(Keybind)
        return Keybind
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/notification
    define(Rayfield_components_notification, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Notification = {}
        Notification.__index = Notification
        Notification.__type = "Notification"
        local utility = script.Parent.Parent.utility
        local variables, functions, constants, HapticEngine, c, d, e, f, g, h, i, j, k =
            require(utility.variables),
            require(utility.functions),
            require(utility.constants),
            require(utility.HapticEngine),
            TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.9, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            UDim2.new(0.5, 360, 0.5, 0),
            UDim2.new(0.5, 0, 0.5, 0),
            6,
            8

        local function l(m)
            return math.clamp(#m * 0.06 + 3, 3, 9)
        end

        function Notification.new(m, n)
            n = if typeof(n) == "table" then n else {}
            local o = setmetatable({
                window = assert(m, "Missing argument #1 (Window expected)"),
                title = n.title or n.Title or "Notification",
                content = n.content or n.Content or "",
                icon = n.icon or n.Icon,
                _hovered = false,
                _dismissed = false,
            }, Notification)
            o.duration = n.duration or n.Duration or l(o.content)
            local p = o.icon ~= nil and o.icon ~= 0 and o.icon ~= ""
            o.main = o.window:Create("Frame", {
                Name = "Notification",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, 0),
                BorderSizePixel = 0,
                ZIndex = constants.zIndex.notification,
                Parent = o.window.notifications,
            })
            o.window:Create("UIPadding", { PaddingTop = UDim.new(0, k), Parent = o.main })
            o.body = o.window:Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.new(1, 0, 1, 0),
                Position = h,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Active = true,
                BorderSizePixel = 0,
                ZIndex = constants.zIndex.notification,
                BackgroundTransparency = 1,
                Parent = o.main,
            })
            o.window:Create(
                "UIGradient",
                { Rotation = 270, Offset = Vector2.new(0, -0.1), Parent = o.body },
                { Color = { "WindowColor", functions.toColorSequence } }
            )
            o.window:Create("UICorner", { Parent = o.body }, {
                CornerRadius = "CornerRoundness",
            })
            o.stroke = o.window:Create(
                "UIStroke",
                { Transparency = 1, Parent = o.body },
                { Color = "SurfaceStroke" }
            )
            o.shadow = o.window:CreateGlow(o.body, "ShadowColor", 20, 1)
            o.window:Create(
                "UIPadding",
                { PaddingLeft = UDim.new(0, 20), PaddingRight = UDim.new(0, 20), Parent = o.body }
            )
            o.window:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 14),
                Parent = o.body,
            })
            if p then
                o.iconLabel = o.window:Create("ImageLabel", {
                    Image = o.icon,
                    Size = UDim2.fromOffset(24, 24),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    ZIndex = constants.zIndex.notification,
                    ImageTransparency = 1,
                    Parent = o.body,
                }, { ImageColor3 = "ContentColor" })
            end
            o.container = o.window:Create("Frame", {
                Size = UDim2.fromOffset(p and 222 or 260, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                ZIndex = constants.zIndex.notification,
                Parent = o.body,
            })
            o.window:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 4),
                Parent = o.container,
            })
            o.titleLabel = o.window:Create("TextLabel", {
                Text = o.title,
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 1,
                ZIndex = constants.zIndex.notification,
                TextTransparency = 1,
                Parent = o.container,
            }, { TextColor3 = "ContentColor", FontFace = "TitleFont" })
            if o.content ~= "" then
                o.descriptionLabel = o.window:Create("TextLabel", {
                    Text = o.content,
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    TextSize = 15,
                    TextWrapped = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    LayoutOrder = 2,
                    ZIndex = constants.zIndex.notification,
                    TextTransparency = 1,
                    Parent = o.container,
                }, { TextColor3 = "ContentColor", FontFace = "Font" })
            end
            o.window._notificationCount = (o.window._notificationCount or 0) + 1
            o.main.LayoutOrder = o.window._notificationCount
            local q = o.window._liveNotifications
            if not q then
                q = {}
                o.window._liveNotifications = q
            end
            table.insert(q, o)
            while #q > j do
                local r = table.remove(q, 1)
                if r and r ~= o then
                    task.spawn(r._dismiss, r)
                end
            end
            o._connections = {
                o.window:Connect(o.body.MouseEnter, function()
                    o._hovered = true
                end),
                o.window:Connect(o.body.MouseLeave, function()
                    o._hovered = false
                end),
                o.window:Connect(o.body.InputBegan, function(r)
                    if
                        r.UserInputType == Enum.UserInputType.MouseButton1
                        or r.UserInputType == Enum.UserInputType.Touch
                    then
                        o:_dismiss()
                    end
                end),
            }
            task.spawn(function()
                o:_show()
            end)
            return o
        end

        function Notification._measure(self)
            local n = self.iconLabel and 222 or 260
            local o = functions.textHeight(self.window.theme.TitleFont, 16, self.title, n)
            if self.descriptionLabel then
                o = o + 4 + functions.textHeight(self.window.theme.Font, 15, self.content, n)
            end
            return math.max(o, self.iconLabel and 24 or 0) + 28
        end

        function Notification._show(self)
            local n = self:_measure() + k
            if self._dismissed or not self.main.Parent then
                return
            end
            HapticEngine.notify()
            variables.tweenService:Create(self.main, c, { Size = UDim2.new(1, 0, 0, n) }):Play()
            variables.tweenService:Create(self.body, f, { Position = i }):Play()
            variables.tweenService:Create(self.body, d, { BackgroundTransparency = 0 }):Play()
            variables.tweenService:Create(self.titleLabel, e, { TextTransparency = 0 }):Play()
            variables.tweenService:Create(self.stroke, d, { Transparency = 0.95 }):Play()
            variables.tweenService:Create(self.shadow, e, { Transparency = 0.6 }):Play()
            task.wait(0.05)
            if self._dismissed or not self.main.Parent then
                return
            end
            if self.iconLabel then
                variables.tweenService:Create(self.iconLabel, e, { ImageTransparency = 0 }):Play()
            end
            task.wait(0.05)
            if self._dismissed or not self.main.Parent then
                return
            end
            if self.descriptionLabel then
                variables.tweenService
                    :Create(self.descriptionLabel, e, {
                        TextTransparency = 0.35,
                    })
                    :Play()
            end
            local o = 0
            while o < self.duration and not self._dismissed and self.main.Parent do
                local p = task.wait()
                if not self._hovered then
                    o += p
                end
            end
            self:_dismiss()
        end

        function Notification._dismiss(self)
            if self._dismissed then
                return
            end
            self._dismissed = true
            local n = self.window._liveNotifications
            local o = n and table.find(n, self)
            if n and o then
                table.remove(n, o)
            end
            if not self.main.Parent then
                return
            end
            variables.tweenService:Create(self.body, d, { BackgroundTransparency = 1 }):Play()
            variables.tweenService:Create(self.stroke, d, { Transparency = 1 }):Play()
            variables.tweenService:Create(self.shadow, e, { Transparency = 1 }):Play()
            variables.tweenService:Create(self.titleLabel, e, { TextTransparency = 1 }):Play()
            if self.descriptionLabel then
                variables.tweenService:Create(self.descriptionLabel, e, { TextTransparency = 1 }):Play()
            end
            if self.iconLabel then
                variables.tweenService:Create(self.iconLabel, e, { ImageTransparency = 1 }):Play()
            end
            variables.tweenService:Create(self.body, g, { Size = UDim2.new(1, -90, 1, 0) }):Play()
            local p = variables.tweenService:Create(self.main, g, { Size = UDim2.new(1, 0, 0, 0) })
            p:Play()
            p.Completed:Wait()
            if not self.main.Parent then
                return
            end
            for q, r in self._connections do
                self.window:Disconnect(r)
            end
            self.window:DestroySubtree(self.main)
        end
        return Notification
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/popup
    define(Rayfield_components_popup, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Popup = {}
        Popup.__index = Popup
        Popup.__type = "Popup"
        local utility = script.Parent.Parent.utility
        local variables, functions, constants, locale, log, HapticEngine, e, f, g, h, i, j, k, l, m =
            require(utility.variables),
            require(utility.functions),
            require(utility.constants),
            require(utility.locale),
            require(utility.log),
            require(utility.HapticEngine),
            TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            400,
            22,
            24,
            22,
            16
        local n, o, p, q, r, s, t, u = i - j * 2, 18, 14, 15, 16, 12, 300, 4
        local v, w, x, y, z, A, B, C, D, E, F, G, H, I, J, K =
            n - u * 2, 16, 13, 20, 10, 15, 14, 8, 10, 40, 8, UDim.new(1, 0), 16, 0.5, {}

        local function L()
            for M = #J, 1, -1 do
                local N = J[M]
                if N._closed or not N.screenGui.Parent then
                    table.remove(J, M)
                end
            end
        end

        local function M(N)
            L()
            return J[#J] == N
        end

        function Popup.new(N, O)
            O = if typeof(O) == "table" then O else {}
            local P = setmetatable({
                window = assert(N, "Missing argument #1 (Window expected)"),
                title = O.title or O.Title or "Popup",
                subtitle = O.subtitle or O.Subtitle,
                content = O.content or O.Content,
                icon = O.icon or O.Icon,
                boxes = O.boxes or O.Boxes,
                options = O.options or O.Options,
                dismissable = if O.dismissable ~= nil
                    then O.dismissable
                    elseif O.Dismissable ~= nil then O.Dismissable
                    else true,
                _reveal = {},
                _connections = {},
                _closed = false,
            }, Popup)
            if not P.options or #P.options == 0 then
                P.options = { { text = "Okay" } }
            end
            P:_build()
            L()
            table.insert(J, P)
            task.spawn(function()
                P:_show()
            end)
            return P
        end

        function Popup._fade(self, O, P, Q)
            table.insert(self._reveal, { instance = O, prop = P, to = Q })
            return O
        end

        function Popup._build(self)
            local O, P = self.window, self.icon ~= nil and self.icon ~= 0 and self.icon ~= ""
            self.screenGui = O:Create("ScreenGui", {
                Name = variables.httpService:GenerateGUID(false),
                IgnoreGuiInset = true,
                ResetOnSpawn = false,
                Enabled = true,
                DisplayOrder = constants.displayOrder.popup,
                ZIndexBehavior = Enum.ZIndexBehavior.Global,
                Parent = variables.guiContainer,
            })
            self.backdrop = O:Create("Frame", {
                Name = "Backdrop",
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                Active = true,
                BackgroundTransparency = 1,
                Parent = self.screenGui,
            })
            self:_fade(self.backdrop, "BackgroundTransparency", I)
            self.card = O:Create("Frame", {
                Name = "Card",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 14),
                Size = UDim2.fromOffset(i, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                Active = true,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Parent = self.screenGui,
            })
            self:_fade(self.card, "BackgroundTransparency", 0)
            O:Create(
                "UIGradient",
                { Rotation = 270, Offset = Vector2.new(0, -0.1), Parent = self.card },
                { Color = { "WindowColor", functions.toColorSequence } }
            )
            O:Create("UICorner", { Parent = self.card }, { CornerRadius = "CornerRoundness" })
            self.cardStroke = O:Create(
                "UIStroke",
                { Transparency = 1, Parent = self.card },
                { Color = "SurfaceStroke" }
            )
            self:_fade(self.cardStroke, "Transparency", 0.95)
            self.cardShadow = O:CreateGlow(self.card, "ShadowColor", 26, 1)
            self:_fade(self.cardShadow, "Transparency", 0.55)
            O:Create("UIPadding", {
                PaddingLeft = UDim.new(0, j),
                PaddingRight = UDim.new(0, j),
                PaddingTop = UDim.new(0, k),
                PaddingBottom = UDim.new(0, l),
                Parent = self.card,
            })
            O:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, m),
                Parent = self.card,
            })
            local Q = self:_measureHeader(P)
            self:_buildHeader(P, Q)
            local R = self:_buildContent()
            self:_buildFooter()
            local S = 2 + (R > 0 and 1 or 0)
            local T = k + Q + R + E + l + m * (S - 1)
            self.card.Size = UDim2.fromOffset(i, T)
            self.card.AutomaticSize = Enum.AutomaticSize.None
            if self.dismissable then
                table.insert(
                    self._connections,
                    O:Connect(self.backdrop.InputBegan, function(U)
                        if
                            U.UserInputType == Enum.UserInputType.MouseButton1
                            or U.UserInputType == Enum.UserInputType.Touch
                        then
                            self:Close()
                        end
                    end)
                )
                table.insert(
                    self._connections,
                    O:Connect(variables.userInputService.InputBegan, function(U, V)
                        if not V and U.KeyCode == Enum.KeyCode.Escape and M(self) then
                            if U == K then
                                return
                            end
                            K = U
                            self:Close()
                        end
                    end)
                )
            end
        end

        function Popup._buildHeader(self, O, P)
            local Q = self.window
            local R = Q:Create("Frame", {
                Name = "Header",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, P),
                LayoutOrder = 1,
                Parent = self.card,
            })
            Q:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, s),
                Parent = R,
            })
            if O then
                self:_fade(
                    Q:Create("ImageLabel", {
                        Image = self.icon,
                        Size = UDim2.fromOffset(r, r),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = 1,
                        ImageTransparency = 1,
                        Parent = R,
                    }, { ImageColor3 = "TitlingColor" }),
                    "ImageTransparency",
                    0
                )
            end
            local S = Q:Create("Frame", {
                Name = "Text",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, O and -(r + s) or 0, 0, self._columnH),
                LayoutOrder = 2,
                Parent = R,
            })
            Q:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 3),
                Parent = S,
            })
            self:_fade(
                Q:Create("TextLabel", {
                    Text = locale.t(self.title),
                    Size = UDim2.new(1, 0, 0, self._titleH),
                    BackgroundTransparency = 1,
                    TextSize = o,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    LayoutOrder = 1,
                    TextTransparency = 1,
                    Parent = S,
                }, {
                    TextColor3 = "TitlingColor",
                    FontFace = "Font",
                }),
                "TextTransparency",
                0
            )
            if self.subtitle and self.subtitle ~= "" then
                self:_fade(
                    Q:Create("TextLabel", {
                        Text = locale.t(self.subtitle),
                        Size = UDim2.new(1, 0, 0, self._subH),
                        BackgroundTransparency = 1,
                        TextSize = p,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextWrapped = true,
                        LayoutOrder = 2,
                        TextTransparency = 1,
                        Parent = S,
                    }, { TextColor3 = "TitlingColor", FontFace = "Font" }),
                    "TextTransparency",
                    0.55
                )
            end
        end

        function Popup._buildContent(self)
            if (not self.content or self.content == "") and (not self.boxes or #self.boxes == 0) then
                return 0
            end
            local O, P =
                self.window, if self.boxes and #self.boxes > 0 then self:_measureBoxes() else self:_measureText()
            local Q = math.min(P, t) + u * 2
            local R = O:Create("ScrollingFrame", {
                Name = "Content",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, Q),
                CanvasSize = UDim2.new(0, 0, 0, 0),
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                ScrollBarThickness = 4,
                ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
                ScrollingDirection = Enum.ScrollingDirection.Y,
                LayoutOrder = 2,
                ScrollBarImageTransparency = 1,
                Parent = self.card,
            })
            self:_fade(R, "ScrollBarImageTransparency", 0.8)
            O:Create("UIPadding", {
                PaddingLeft = UDim.new(0, u),
                PaddingRight = UDim.new(0, u),
                PaddingTop = UDim.new(0, u),
                PaddingBottom = UDim.new(0, u),
                Parent = R,
            })
            if self.boxes and #self.boxes > 0 then
                O:Create("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, C),
                    Parent = R,
                })
                for S, T in self.boxes do
                    self:_buildBox(R, T, S)
                end
            else
                self:_fade(
                    O:Create("TextLabel", {
                        Text = locale.t(self.content),
                        Size = UDim2.new(1, 0, 0, P),
                        BackgroundTransparency = 1,
                        TextSize = q,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        TextWrapped = true,
                        TextTransparency = 1,
                        Parent = R,
                    }, { TextColor3 = "ContentColor", FontFace = "Font" }),
                    "TextTransparency",
                    0.5
                )
            end
            return Q
        end

        function Popup._buildBox(self, O, P, Q)
            local R = self.window
            P = if typeof(P) == "table" then P else { title = tostring(P) }
            local S, T, U, V, W = P.icon ~= nil and P.icon ~= 0 and P.icon ~= "", self:_measureBox(P)
            local X = R:Create("Frame", {
                Name = "Box",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                Size = UDim2.new(1, -D, 0, T),
                LayoutOrder = Q,
                BackgroundTransparency = 1,
                Parent = O,
            })
            self:_fade(X, "BackgroundTransparency", 0)
            local Y = R:StyleElementPanel(X)
            self:_fade(Y, "Transparency", R.theme.ElementStrokeTransparency)
            R:Create("UIPadding", {
                PaddingLeft = UDim.new(0, w),
                PaddingRight = UDim.new(0, w),
                PaddingTop = UDim.new(0, x),
                PaddingBottom = UDim.new(0, x),
                Parent = X,
            })
            R:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, z),
                Parent = X,
            })
            if S then
                self:_fade(
                    R:Create("ImageLabel", {
                        Image = P.icon,
                        Size = UDim2.fromOffset(y, y),
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = 1,
                        ImageTransparency = 1,
                        Parent = X,
                    }, { ImageColor3 = "ContentColor" }),
                    "ImageTransparency",
                    0
                )
            end
            local Z = R:Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, S and -(y + z) or 0, 0, W),
                LayoutOrder = 2,
                Parent = X,
            })
            R:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 3),
                Parent = Z,
            })
            self:_fade(
                R:Create("TextLabel", {
                    Text = locale.t(P.title or P.Title or ""),
                    Size = UDim2.new(1, 0, 0, U),
                    BackgroundTransparency = 1,
                    TextSize = A,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    LayoutOrder = 1,
                    TextTransparency = 1,
                    Parent = Z,
                }, { TextColor3 = "ContentColor", FontFace = "TitleFont" }),
                "TextTransparency",
                0
            )
            local _ = P.description or P.Description
            if _ and _ ~= "" then
                self:_fade(
                    R:Create("TextLabel", {
                        Text = locale.t(_),
                        Size = UDim2.new(1, 0, 0, V),
                        BackgroundTransparency = 1,
                        TextSize = B,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        TextWrapped = true,
                        LayoutOrder = 2,
                        TextTransparency = 1,
                        Parent = Z,
                    }, { TextColor3 = "ContentColor", FontFace = "Font" }),
                    "TextTransparency",
                    0.65
                )
            end
        end

        function Popup._buildFooter(self)
            local O = self.window
            local P = O:Create("Frame", {
                Name = "Footer",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, E),
                LayoutOrder = 3,
                Parent = self.card,
            })
            O:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, F),
                Parent = P,
            })
            for Q, R in self.options do
                self:_buildButton(P, R, Q)
            end
        end

        function Popup._buildButton(self, O, P, Q)
            local R = self.window
            P = if typeof(P) == "table" then P else { text = tostring(P) }
            local S, T, U, V, W, X, Y =
                P.style or P.Style or "neutral",
                P.text or P.Text or P.name or P.Name or "Okay",
                P.callback or P.Callback
            if S == "primary" then
                V, W, X, Y = R.theme.AccentColor, R.theme.AccentStroke, R.theme.AccentStroke, 0.1
            elseif S == "danger" then
                V, W, X, Y = R.theme.ErrorColor, R.theme.ErrorStrokeColor, R.theme.ErrorStrokeColor, 0
            else
                V, W, X, Y = R.theme.NeutralButton, R.theme.NeutralButtonHover, R.theme.NeutralButtonStroke, 0.85
            end
            local Z = R:Create("Frame", {
                Name = "Button",
                BackgroundColor3 = V,
                BorderSizePixel = 0,
                Size = UDim2.new(0, 0, 0, E),
                LayoutOrder = Q,
                BackgroundTransparency = 1,
                Parent = O,
            })
            self:_fade(Z, "BackgroundTransparency", 0)
            R:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = Z })
            R:Create("UICorner", { CornerRadius = G, Parent = Z })
            local _ = R:Create("UIStroke", { Color = X, Transparency = 1, Parent = Z })
            self:_fade(_, "Transparency", Y)
            self:_fade(
                R:Create("TextLabel", {
                    Text = locale.t(T),
                    Size = UDim2.fromScale(1, 1),
                    BackgroundTransparency = 1,
                    TextSize = H,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    TextColor3 = functions.contrastText(V),
                    TextTransparency = 1,
                    Parent = Z,
                }, { FontFace = "Font" }),
                "TextTransparency",
                0
            )
            local aj, ak =
                R:Create("TextButton", {
                    Text = "",
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Parent = Z,
                }), TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            table.insert(
                self._connections,
                R:Connect(aj.MouseEnter, function()
                    if self._closed then
                        return
                    end
                    variables.tweenService:Create(Z, ak, { BackgroundColor3 = W }):Play()
                end)
            )
            table.insert(
                self._connections,
                R:Connect(aj.MouseLeave, function()
                    variables.tweenService:Create(Z, ak, { BackgroundColor3 = V }):Play()
                end)
            )
            table.insert(
                self._connections,
                R:Connect(aj.MouseButton1Click, function()
                    if self._closed then
                        return
                    end
                    HapticEngine.click()
                    variables.tweenService:Create(_, ak, { Transparency = 1 }):Play()
                    if U then
                        task.spawn(function()
                            local al, am = pcall(U)
                            if not al then
                                log.warn("Rayfield: popup button '" .. T .. "' callback errored:")
                                log.print(am)
                            end
                        end)
                    end
                    self:Close()
                end)
            )
        end

        function Popup._measureHeader(self, ak)
            local al = n - (if ak then r + s else 0)
            self._titleH = functions.textHeight(self.window.theme.Font, o, locale.resolve(self.title), al)
            self._subH = if self.subtitle and self.subtitle ~= ""
                then functions.textHeight(self.window.theme.Font, p, locale.resolve(self.subtitle), al)
                else 0
            self._columnH = self._titleH + (if self._subH > 0 then 3 + self._subH else 0)
            return math.max(self._columnH, if ak then r else 0)
        end

        function Popup._measureText(self)
            return functions.textHeight(self.window.theme.Font, q, locale.resolve(self.content), v)
        end

        function Popup._measureBox(self, ak)
            ak = if typeof(ak) == "table" then ak else { title = tostring(ak) }
            local al = ak.icon ~= nil and ak.icon ~= 0 and ak.icon ~= ""
            local am = v - D - w * 2 - (if al then y + z else 0)
            local N, O, P =
                functions.textHeight(
                    self.window.theme.TitleFont,
                    A,
                    locale.resolve(ak.title or ak.Title or ""),
                    am
                ),
                0,
                ak.description or ak.Description
            if P and P ~= "" then
                O = functions.textHeight(self.window.theme.Font, B, locale.resolve(P), am)
            end
            local Q = N + (if O > 0 then 3 + O else 0)
            local R = math.max(Q, if al then y else 0) + x * 2
            return R, N, O, Q
        end

        function Popup._measureBoxes(self)
            local ak = 0
            for al, am in self.boxes do
                ak += (self:_measureBox(am))
                if al < #self.boxes then
                    ak += C
                end
            end
            return ak
        end

        function Popup._show(self)
            if not self.screenGui.Parent then
                return
            end
            HapticEngine.notify()
            variables.tweenService:Create(self.card, e, { Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
            for ak, al in self._reveal do
                local am = if al.instance == self.backdrop then h else f
                variables.tweenService:Create(al.instance, am, { [al.prop] = al.to }):Play()
            end
        end

        function Popup.Close(self)
            if self._closed then
                return
            end
            self._closed = true
            local ak = table.find(J, self)
            if ak then
                table.remove(J, ak)
            end
            for al, am in self._connections do
                self.window:Disconnect(am)
            end
            self._connections = {}
            if not self.screenGui.Parent then
                return
            end
            variables.tweenService:Create(self.card, g, { Position = UDim2.new(0.5, 0, 0.5, 10) }):Play()
            for al, am in self._reveal do
                variables.tweenService:Create(am.instance, g, { [am.prop] = 1 }):Play()
            end
            task.delay(g.Time, function()
                self.window:DestroySubtree(self.screenGui)
            end)
        end
        return Popup
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/progress
    define(Rayfield_components_progress, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Progress = {}
        Progress.__index = Progress
        Progress.__type = "Progress"
        local utility = script.Parent.Parent.utility
        local variables, functions, moveable, locale, ak, al, am, b, c, d, e, f, g, h, i =
            require(utility.variables),
            require(utility.functions),
            require(utility.moveable),
            require(utility.locale),
            60,
            8,
            20,
            6,
            6,
            16,
            14,
            0.4,
            TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.85), NumberSequenceKeypoint.new(1, 0) }),
            0.9
        local j = TweenInfo.new(i, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, -1, true)

        local function k(l: unknown): number?
            local m = tonumber(l)
            if m == nil or m ~= m or math.abs(m) == math.huge then
                return nil
            end
            return m
        end

        function Progress.new(l, m)
            m = if typeof(m) == "table" then m else {}
            local n = k(m.steps or m.Steps)
            n = if n and n >= 2 then math.floor(n) else nil
            local o = m.range or m.Range
            local p, q = k(o and o[1]) or 0, k(o and o[2]) or n or 1
            if p > q then
                p, q = q, p
            end
            local r = setmetatable({
                tab = assert(l, "Missing argument #1 (Tab expected)"),
                window = l.window,
                name = m.name or m.Name or "Progress",
                icon = m.icon or m.Icon,
                description = m.description or m.Description,
                min = p,
                max = q,
                steps = n,
                value = 0,
                text = m.text or m.Text,
                format = m.format or m.Format,
                showValue = if m.showValue == nil then true else m.showValue == true,
                indeterminate = m.indeterminate or m.Indeterminate or false,
            }, Progress)
            r.value = r:_clamp(k(m.value or m.Value) or p)
            r:_build()
            if r.description then
                r.descriptor = require(script.Parent.descriptor).new(r.tab, { description = r.description })
            end
            return r
        end

        function Progress._clamp(self, m: number): number
            return math.clamp(k(m) or self.min, self.min, self.max)
        end

        function Progress._ratio(self): number
            local m = self.max - self.min
            if m <= 0 then
                return 1
            end
            return (self.value - self.min) / m
        end

        function Progress._filledSteps(self): number
            local m = self.steps :: number
            return math.clamp(math.round(self:_ratio() * m), 0, m)
        end

        function Progress._readout(self): string
            if self.text then
                return locale.resolve(self.text)
            end
            if self.format then
                local m, n = pcall(self.format, self.value, self.min, self.max)
                if m and type(n) == "string" then
                    return n
                end
            end
            if self.steps then
                return string.format("%d/%d", self:_filledSteps(), self.steps)
            end
            return string.format("%d%%", math.round(self:_ratio() * 100))
        end

        function Progress._build(self)
            self.main = self.window:Create("Frame", {
                Size = UDim2.new(1, -20, 0, ak),
                BorderSizePixel = 0,
                Name = self.name,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = self.tab.tabPage,
            }, { BackgroundTransparency = "ElementTransparency" })
            self.stroke = self.window:StyleElementBody(self.main)
            self.container = self.window:Create("Frame", {
                Size = UDim2.new(0, 170, 0, d),
                Position = UDim2.new(0, am, 0, 20),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Parent = self.main,
            })
            self.window:Create("UIListLayout", {
                Padding = UDim.new(0, 6),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.container,
            })
            if self.icon then
                self.iconLabel = self.window:Create("ImageLabel", {
                    Image = self.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    Parent = self.container,
                }, { ImageColor3 = "ContentColor" })
            end
            self.title = self.window:Create("TextLabel", {
                Text = locale.t(self.name),
                Size = UDim2.fromOffset(250, d),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = d,
                AutomaticSize = Enum.AutomaticSize.X,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                LayoutOrder = 1,
                TextTransparency = 1,
                Parent = self.container,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            self.readout = self.window:Create("TextLabel", {
                Text = self:_readout(),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -am, 0, 20),
                Size = UDim2.fromOffset(50, e),
                AutomaticSize = Enum.AutomaticSize.X,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = e,
                TextXAlignment = Enum.TextXAlignment.Right,
                Visible = self.showValue,
                TextTransparency = 1,
                Parent = self.main,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            if self.steps then
                self:_buildSteps()
                return
            end
            self.track = self.window:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.new(0.5, 0, 1, -16),
                Size = UDim2.new(1, -am * 2, 0, al),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Parent = self.main,
            }, { BackgroundColor3 = "SliderBackground" })
            self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.track })
            self.fill = self.window:Create("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.fromScale(if self.indeterminate then 0 else self:_ratio(), 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 2,
                BackgroundTransparency = 1,
                Parent = self.track,
            })
            self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.fill })
            self.window:Create(
                "UIGradient",
                { Offset = Vector2.new(0, 0.5), Rotation = 2, Transparency = h, Parent = self.fill },
                {
                    Color = {
                        "SliderProgress",
                        functions.toColorSequence,
                    },
                }
            )
            self.fillGlow = self.window:CreateGlow(self.fill, "AccentColor", 20, 1)
            if self.indeterminate then
                self:_startSweep()
            end
        end

        function Progress._buildSteps(self)
            local m = self.steps :: number
            self.track = self.window:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.new(0.5, 0, 1, -17),
                Size = UDim2.new(1, -am * 2, 0, b),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Parent = self.main,
            })
            self.window:Create("UIListLayout", {
                Padding = UDim.new(0, c),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.track,
            })
            self.stepFrames = {}
            for n = 1, m do
                local o = self.window:Create("Frame", {
                    Size = UDim2.new(1 / m, -(c * (m - 1)) / m, 1, 0),
                    BorderSizePixel = 0,
                    LayoutOrder = n,
                    BackgroundTransparency = 1,
                    Parent = self.track,
                }, { BackgroundColor3 = "SliderBackground" })
                self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = o })
                local p = self.window:Create("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    BackgroundTransparency = 1,
                    Parent = o,
                })
                self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = p })
                self.window:Create(
                    "UIGradient",
                    { Rotation = 90, Parent = p },
                    { Color = { "SliderProgress", functions.toColorSequence } }
                )
                table.insert(self.stepFrames, { segment = o, fill = p })
            end
        end

        function Progress._startSweep(self)
            if self._sweep or self.steps then
                return
            end
            self.fill.AnchorPoint = Vector2.new(0, 0.5)
            self.fill.Position = UDim2.fromScale(0, 0.5)
            self.fill.Size = UDim2.fromScale(0, 1)
            self._sweep = variables.tweenService:Create(self.fill, j, { Size = UDim2.fromScale(1, 1) })
            self._sweep:Play()
        end

        function Progress._stopSweep(self)
            if not self._sweep then
                return
            end
            self._sweep:Cancel()
            self._sweep = nil
            self.fill.AnchorPoint = Vector2.new(0, 0.5)
            self.fill.Position = UDim2.fromScale(0, 0.5)
        end

        function Progress._render(self, m: boolean?)
            self.readout.Text = self:_readout()
            if self.steps then
                if not self._shown then
                    return
                end
                local n = self:_filledSteps()
                for o, p in self.stepFrames do
                    local q = if o <= n then 0 else 1
                    if m == false then
                        p.fill.BackgroundTransparency = q
                    else
                        variables.tweenService
                            :Create(p.fill, g, {
                                BackgroundTransparency = q,
                            })
                            :Play()
                    end
                end
                return
            end
            local n = UDim2.fromScale(self:_ratio(), 1)
            if m == false then
                self.fill.Size = n
            else
                variables.tweenService:Create(self.fill, g, { Size = n }):Play()
            end
        end

        function Progress.Set(self, m)
            self.value = self:_clamp(m)
            if self.indeterminate then
                self.indeterminate = false
                self:_stopSweep()
            end
            self:_render()
        end

        function Progress.Get(self): number
            return self.value
        end

        function Progress.GetPercentage(self): number
            return self:_ratio()
        end

        function Progress.SetRange(self, m, n)
            m = k(m) or self.min
            n = k(n) or self.max
            if m > n then
                m, n = n, m
            end
            self.min, self.max = m, n
            self.value = self:_clamp(self.value)
            self:_render()
        end

        function Progress.SetText(self, m)
            self.text = m
            self.readout.Text = self:_readout()
        end

        function Progress.SetIndeterminate(self, m)
            m = m == true
            if m == self.indeterminate then
                return
            end
            self.indeterminate = m
            if m then
                self:_startSweep()
            else
                self:_stopSweep()
                self:_render(false)
            end
        end

        function Progress._setShown(self, m, n)
            local o = self.window
            self._shown = m
            o:_reveal(self.readout, { TextTransparency = if m then f else 1 }, n)
            if m then
                o:_revealCommon(self, n)
            else
                o:_hideCommon(self, n)
            end
            if self.steps then
                local p = self:_filledSteps()
                for q, r in self.stepFrames do
                    o:_reveal(r.segment, { BackgroundTransparency = if m then 0 else 1 }, n)
                    o:_reveal(r.fill, { BackgroundTransparency = if m and q <= p then 0 else 1 }, n)
                end
                return
            end
            o:_reveal(self.track, {
                BackgroundTransparency = if m then 0 else 1,
            }, n)
            o:_reveal(self.fill, { BackgroundTransparency = if m then 0 else 1 }, n)
            o:_reveal(self.fillGlow, { Transparency = if m then o.theme.AccentGlow else 1 }, n)
        end

        function Progress.Remove(self)
            self:_stopSweep()
            if self.descriptor then
                self.descriptor:Remove()
            end
            self.main:Destroy()
        end
        moveable(Progress)
        return Progress
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/search
    define(Rayfield_components_search, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local utility = script.Parent.Parent.utility
        local variables, constants, locale, action, aj, ak, al, am =
            require(utility.variables),
            require(utility.constants),
            require(utility.locale),
            require(script.Parent.action),
            {},
            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            0.6,
            0.2

        local function b(c)
            if c.__type == "Group" then
                local d = {}
                local function e(f)
                    for g, h in f.elements do
                        if h.__type == "Group" then
                            e(h)
                        elseif h.name then
                            table.insert(d, h.name)
                        end
                    end
                end
                e(c)
                return table.concat(d, "\n")
            end
            return c.name or ""
        end

        local function c(d)
            local e = {}
            for f, g in d.tabs do
                if g.neglectSelector then
                    continue
                end
                for h, i in g.elements do
                    if i.__type ~= "Section" then
                        table.insert(e, i)
                    end
                end
            end
            return e
        end

        local function d(e, f, g)
            variables.tweenService
                :Create(e.searchPill, g, { BackgroundTransparency = if f then 0.9 else 1 })
                :Play()
            variables.tweenService:Create(e.searchStroke, g, { Transparency = if f then 0.85 else 1 }):Play()
            variables.tweenService:Create(e.searchShadow, g, { Transparency = if f then 0.92 else 1 }):Play()
            variables.tweenService:Create(e.searchIcon, g, { ImageTransparency = if f then 0.65 else 1 }):Play()
            variables.tweenService:Create(e.searchInput, g, { TextTransparency = if f then 0.2 else 1 }):Play()
        end

        local function e(f, g, h)
            if f.layout.mode == "sidebar" then
                return
            end
            for i, j in f.tabs do
                if not j.neglectSelector and j.topbarItem then
                    j:_applyVisual(
                        if g then (if f.selectedTab == j then "selected" else "unselected") else "hidden",
                        h
                    )
                end
            end
        end

        local function f(g, h)
            h = string.lower(h or "")
            local i = false
            for j, k in g._searchUnits do
                local l = h == "" or string.find(k.text, h, 1, true) ~= nil
                k.unit.main.Visible = l
                if k.unit.descriptor then
                    k.unit.descriptor.main.Visible = l
                end
                i = i or l
            end
            g.searchEmpty.Visible = not i and h ~= ""
        end

        local function g(h)
            h._searchUnits = {}
            local i = 0
            for j, k in c(h) do
                i += 1
                local l = k.main
                table.insert(h._searchUnits, {
                    unit = k,
                    text = string.lower(b(k)),
                    homeParent = l.Parent,
                    homeOrder = l.LayoutOrder,
                    descOrder = k.descriptor and k.descriptor.main.LayoutOrder,
                })
                l.LayoutOrder = i * 10
                l.Parent = h.searchPage
                l.Visible = true
                if k.descriptor then
                    k.descriptor.main.LayoutOrder = i * 10 + 1
                    k.descriptor.main.Parent = h.searchPage
                    k.descriptor.main.Visible = true
                end
            end
        end

        local function h(i)
            for j, k in i._searchUnits do
                local l = k.unit
                if l.main and l.main.Parent then
                    l.main.LayoutOrder = k.homeOrder
                    l.main.Parent = k.homeParent
                    l.main.Visible = true
                end
                if l.descriptor and l.descriptor.main and l.descriptor.main.Parent then
                    l.descriptor.main.LayoutOrder = k.descOrder
                    l.descriptor.main.Parent = k.homeParent
                    l.descriptor.main.Visible = true
                end
            end
            i._searchUnits = {}
        end

        function aj.open(self)
            if self._searching or self.minimised or not self:_interactive() then
                return
            end
            self._searching = true
            g(self)
            f(self, "")
            self:_jumpTo(self.searchPage)
            e(self, false, ak)
            task.delay(ak.Time, function()
                if self._searching and self.layout.mode ~= "sidebar" then
                    self.tabList.Visible = false
                end
            end)
            self.searchPill.Visible = true
            d(self, true, ak)
            self.searchInput:CaptureFocus()
            variables.tweenService
                :Create(self.searchAction.iconLabel, ak, {
                    ImageTransparency = am,
                })
                :Play()
        end

        function aj.close(self, j)
            if not self._searching then
                return
            end
            j = j or {}
            self._searching = false
            self.searchInput.Text = ""
            self.searchInput:ReleaseFocus()
            self.searchEmpty.Visible = false
            h(self)
            local k = if j.jumpTo == nil then self.selectedTab and self.selectedTab.tabPage else j.jumpTo
            if k then
                self:_jumpTo(k)
            end
            d(self, false, ak)
            task.delay(ak.Time, function()
                if not self._searching then
                    self.searchPill.Visible = false
                end
            end)
            if j.showTabs then
                self.tabList.Visible = true
                e(self, true, ak)
            end
            variables.tweenService:Create(self.searchAction.iconLabel, ak, { ImageTransparency = al }):Play()
        end

        function aj.toggle(self)
            if self._searching then
                aj.close(self, { showTabs = true })
            else
                aj.open(self)
            end
        end

        function aj.railWidth(self, j)
            if self.searchPill then
                self.searchPill.Size = UDim2.new(1, -(j + 30), 0, 35)
            end
        end

        function aj.build(self)
            self._searching = false
            self.searchPage = self:Create("ScrollingFrame", {
                Name = "Search",
                Size = UDim2.new(1, -20, 1, 0),
                Position = UDim2.new(0.5, 0, 0, 68),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                ScrollBarThickness = 0,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                LayoutOrder = 2000,
                Parent = self.elements,
            })
            self:Create("UIListLayout", {
                Padding = UDim.new(0, 7),
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.searchPage,
            })
            self:Create("UIPadding", {
                PaddingTop = UDim.new(0, if self.layout.mode == "sidebar" then 53 else 10),
                PaddingBottom = UDim.new(0, 33),
                Parent = self.searchPage,
            })
            self.searchEmpty = self:Create("TextLabel", {
                Name = "NoResults",
                Text = locale.t("No results"),
                FontFace = variables.brandFont(Enum.FontWeight.Medium),
                TextSize = 15,
                TextTransparency = 0.6,
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.55, 0),
                Size = UDim2.fromOffset(200, 20),
                Visible = false,
                ZIndex = 3,
                Parent = self.main,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            local j = self.layout.mode == "sidebar"
            local k = if j then self.layout.chromeHeight + 8 else self.layout.tabStripTop + 1
            self.searchPill = self:Create("Frame", {
                Name = "SearchBar",
                AnchorPoint = Vector2.new(if j then 1 else 0.5, 0),
                Position = UDim2.new(if j then 1 else 0.5, if j then -15 else 0, 0, k),
                Size = UDim2.new(1, if j then -(self.layout.railWidth + 30) else -35, 0, 35),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 10,
                BackgroundTransparency = 1,
                Visible = false,
                Parent = self.main,
            })
            self:Create("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = self.searchPill,
            })
            self.searchStroke = self:Create(
                "UIStroke",
                {
                    Color = Color3.fromRGB(255, 255, 255),
                    Thickness = 1,
                    Transparency = 1,
                    Parent = self.searchPill,
                }
            )
            self.searchShadow = self:Create("UIShadow", {
                BlurRadius = UDim.new(0, 20),
                Color = Color3.fromRGB(255, 255, 255),
                ZIndex = -1,
                Transparency = 1,
                Parent = self.searchPill,
            })
            self.searchIcon = self:Create("ImageLabel", {
                Image = "rbxassetid://" .. tostring(constants.icons.search),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 15, 0.5, 1),
                Size = UDim2.fromOffset(16, 16),
                BackgroundTransparency = 1,
                ZIndex = 10,
                ImageTransparency = 1,
                Parent = self.searchPill,
            }, { ImageColor3 = "ContentColor" })
            self.searchInput = self:Create("TextBox", {
                Text = "",
                PlaceholderText = locale.t("Search all pages"),
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 40, 0.5, 0),
                Size = UDim2.new(1, -110, 0, 18),
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                ClearTextOnFocus = false,
                ClipsDescendants = true,
                ZIndex = 10,
                TextTransparency = 1,
                Parent = self.searchPill,
            }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
            self:Connect(self.searchInput:GetPropertyChangedSignal("Text"), function()
                if self._searching then
                    f(self, self.searchInput.Text)
                end
            end)
            self.searchAction = action.new(self, {
                name = "Search",
                icon = constants.icons.search,
                order = 4,
                callback = function()
                    aj.toggle(self)
                end,
            })
            self.searchAction.isLit = function()
                return self._searching
            end
        end
        return aj
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/section
    define(Rayfield_components_section, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Section = {}
        Section.__index = Section
        Section.__type = "Section"
        local moveable, locale =
            require(script.Parent.Parent.utility.moveable), require(script.Parent.Parent.utility.locale)

        function Section.new(ah, ai)
            ai = if typeof(ai) == "table" then ai else {}
            local aj = setmetatable({
                tab = assert(ah, "Missing argument #1 (Tab expected)"),
                window = ah.window,
                name = ai.name or ai.Name or "Section",
                icon = ai.icon or ai.Icon,
            }, Section)
            local ak = if #aj.tab.elements == 0 then 0 else 13
            aj.main = aj.window:Create("Frame", {
                Size = UDim2.new(1, -40, 0, 20 + ak),
                BorderSizePixel = 0,
                Name = aj.name,
                BackgroundTransparency = 1,
                Parent = aj.tab.tabPage,
            })
            if ak > 0 then
                aj.window:Create("UIPadding", { PaddingTop = UDim.new(0, ak), Parent = aj.main })
            end
            aj.window:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Parent = aj.main,
            })
            if aj.icon then
                aj.iconLabel = aj.window:Create("ImageLabel", {
                    Image = aj.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    Parent = aj.main,
                }, { ImageColor3 = "ContentColor" })
            end
            aj.title = aj.window:Create("TextLabel", {
                Text = locale.t(aj.name),
                Size = UDim2.fromOffset(0, 16),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 15,
                AutomaticSize = Enum.AutomaticSize.X,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                LayoutOrder = 1,
                TextTransparency = 1,
                Parent = aj.main,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            return aj
        end

        function Section._setShown(self, ai, aj)
            local ak = self.window
            ak:_reveal(self.title, { TextTransparency = if ai then 0.6 else 1 }, aj)
            if self.iconLabel then
                ak:_reveal(self.iconLabel, { ImageTransparency = if ai then 0.65 else 1 }, aj)
            end
        end
        moveable(Section)
        return Section
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/sidebar
    define(Rayfield_components_sidebar, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local utility = script.Parent.Parent.utility
        local variables, image, locale, tabSelector, search, ak, al, am, b, c =
            require(utility.variables),
            require(utility.image),
            require(utility.locale),
            require(script.Parent.tabSelector),
            require(script.Parent.search),
            {},
            0,
            0.7,
            0.95,
            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

        local function d(e)
            return e.layout.mode == "sidebar"
                and e.profile ~= nil
                and e.settings.showProfile
                and variables.localPlayer ~= nil
        end

        local function e(f, g)
            local h = variables.localPlayer
            if not h then
                return
            end
            f.profile = f:Create("Frame", {
                Name = "Profile",
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.new(1, 0, 0, g.footerHeight),
                BackgroundTransparency = 1,
                Parent = f.sidebar,
            })
            f.profileContainer = f:Create("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, g.rowInset, 0.5, 0),
                Size = UDim2.new(1, -g.rowInset, 1, 0),
                BackgroundTransparency = 1,
                Parent = f.profile,
            })
            f.profileLayout = f:Create("UIListLayout", {
                Padding = UDim.new(0, 10),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = f.profileContainer,
            })
            f.profileAvatar = f:Create("ImageLabel", {
                Name = "Avatar",
                Image = image.avatar(h.UserId, function(i)
                    if f.profileAvatar and not f.unloaded then
                        image.assign(f.profileAvatar, "Image", i)
                    end
                end),
                Size = UDim2.fromOffset(g.avatarSize, g.avatarSize),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                ImageTransparency = 1,
                Parent = f.profileContainer,
            })
            f:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = f.profileAvatar })
            f.profileLabels = f:Create("Frame", {
                Size = UDim2.fromOffset(50, g.avatarSize),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Parent = f.profileContainer,
            })
            f:Create("UIListLayout", {
                Padding = UDim.new(0, 2),
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = f.profileLabels,
            })
            f.profileName = f:Create("TextLabel", {
                Text = h.DisplayName,
                Size = UDim2.fromOffset(50, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTransparency = 1,
                Parent = f.profileLabels,
            }, { TextColor3 = "TitlingColor", FontFace = "Font" })
            f.profileSubtitle = f:Create("TextLabel", {
                Text = "",
                Size = UDim2.fromOffset(50, 14),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                TextSize = 14,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 1,
                Visible = false,
                TextTransparency = 1,
                Parent = f.profileLabels,
            }, { TextColor3 = "TitlingColor", FontFace = "Font" })
        end

        function ak.build(self, g)
            self.sidebar = self:Create("Frame", {
                Name = "Sidebar",
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.fromScale(0, 1),
                Size = UDim2.new(0, g.railWidth, 1, -g.chromeHeight),
                BackgroundTransparency = 1,
                Visible = false,
                Parent = self.main,
            })
            self.tabList = self:Create("ScrollingFrame", {
                Name = "Tabs",
                Active = true,
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                ScrollBarThickness = 0,
                ScrollBarImageTransparency = 1,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                ClipsDescendants = true,
                Parent = self.sidebar,
            })
            self:Create("UIPadding", {
                PaddingTop = UDim.new(0, g.railPadding),
                PaddingBottom = UDim.new(0, g.railPadding),
                Parent = self.tabList,
            })
            self.tabListLayout = self:Create("UIListLayout", {
                Padding = UDim.new(0, g.rowSpacing),
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.tabList,
            })
            e(self, g)
            ak.reflowProfile(self)
        end

        function ak.reflowProfile(self)
            local g, h = self.layout, d(self)
            if self.profile then
                self.profile.Visible = h
            end
            self.tabList.Size = UDim2.new(1, 0, 1, if h then -g.footerHeight else 0)
        end

        function ak.applyWidth(self, g)
            local h = self.layout
            self.sidebar.Size = UDim2.new(0, g, 1, -h.chromeHeight)
            self.elements.Size = UDim2.new(1, -g, 1, -h.chromeHeight)
            self.bottomFade.Size = UDim2.new(1, -g, h.fadeSize.Y.Scale, h.fadeSize.Y.Offset)
            search.railWidth(self, g)
            local i = g < (h.railWidth :: number)
            for j, k in self.tabs do
                if not k.neglectSelector then
                    tabSelector.setRowCollapsed(k, i, h)
                end
            end
            if self.profileContainer then
                self.profileContainer.Position = UDim2.new(0, if i then 0 else h.rowInset, 0.5, 0)
                self.profileContainer.Size = UDim2.new(1, if i then 0 else -h.rowInset, 1, 0)
                self.profileLayout.HorizontalAlignment = if i
                    then Enum.HorizontalAlignment.Center
                    else Enum.HorizontalAlignment.Left
                self.profileLabels.Visible = not i
            end
        end

        function ak.setProfileShown(self, g, h)
            if not self.profile or not self.profile.Visible then
                return
            end
            local i = {
                [self.profileAvatar] = {
                    ImageTransparency = if g then 0 else 1,
                    BackgroundTransparency = if g then b else 1,
                },
                [self.profileName] = { TextTransparency = if g then al else 1 },
                [self.profileSubtitle] = { TextTransparency = if g then am else 1 },
            }
            for j, k in i do
                if h then
                    variables.tweenService:Create(j, h, k):Play()
                else
                    for l, m in k do
                        j[l] = m
                    end
                end
            end
        end

        function ak.setProfileEnabled(self, g)
            if not self.profile then
                self.settings.showProfile = g
                return
            end
            if g then
                self.settings.showProfile = true
                ak.reflowProfile(self)
                ak.setProfileShown(self, true, c)
                return
            end
            ak.setProfileShown(self, false, c)
            task.delay(c.Time, function()
                if self.unloaded or self.settings.showProfile then
                    return
                end
                ak.reflowProfile(self)
            end)
            self.settings.showProfile = false
        end

        function ak.setSubtitle(self, g)
            if not self.profileSubtitle then
                return
            end
            local h = if type(g) == "string" and g ~= "" then locale.resolve(g) else nil
            self.profileSubtitle.Text = h or ""
            self.profileSubtitle.Visible = h ~= nil
        end
        return ak
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/slider
    define(Rayfield_components_slider, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Slider = {}
        Slider.__index = Slider
        Slider.__type = "Slider"
        local utility = script.Parent.Parent.utility
        local variables, functions, odometer, moveable, lockable, locale, HapticEngine =
            require(utility.variables),
            require(utility.functions),
            require(utility.odometer),
            require(utility.moveable),
            require(utility.lockable),
            require(utility.locale),
            require(utility.HapticEngine)

        local function b(c)
            local d = 0
            while d < 6 do
                local e = c * 10 ^ d
                if math.abs(e - math.round(e)) < 1e-9 then
                    break
                end
                d += 1
            end
            return d
        end

        local function c(d, e, f)
            local g = d[1] + math.round((f - d[1]) / e) * e
            return math.clamp(g, d[1], d[2])
        end
        local d, e, f, g, h, i =
            TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            300,
            Vector2.new(35, 20),
            Vector2.new(41, 22)

        local function j(k: number): UDim2
            return UDim2.new(k, 0, 1, 0)
        end

        local function k(): UDim2
            return UDim2.new(1, 0, 0.5, 0)
        end

        local function l(m: number, n: number, o: number): number
            return math.clamp((m - n) / o, 0, 1)
        end

        function Slider.new(m, n)
            n = if typeof(n) == "table" then n else {}
            local o = setmetatable({
                tab = assert(m, "Missing argument #1 (Tab expected)"),
                window = m.window,
                name = n.name or n.Name or "Slider",
                icon = n.icon or n.Icon,
                description = n.description or n.Description,
                forgetState = n.forgetState or n.ForgetState or m.forgetState,
                range = n.range or n.Range or {
                    0,
                    100,
                },
                increment = n.increment or n.Increment or 1,
                suffix = n.suffix or n.Suffix or "",
                callback = n.callback or n.Callback or function() end,
                dragging = false,
                minimal = n.minimal or n.Minimal or false,
                _handleWidth = h.X,
            }, Slider)
            assert(
                typeof(o.range) == "table" and typeof(o.range[1]) == "number" and typeof(o.range[2]) == "number",
                "A slider range needs two numbers, like { 0, 100 }."
            )
            if o.range[1] > o.range[2] then
                o.range = { o.range[2], o.range[1] }
            end
            if o.increment <= 0 then
                o.increment = 1
            end
            o.value = if (n.value or n.Value) ~= nil
                then (n.value or n.Value)
                elseif (n.currentValue or n.CurrentValue) ~= nil then (n.currentValue or n.CurrentValue)
                else o.range[1]
            o.value = c(o.range, o.increment, o.value)
            o._decimals = b(o.increment)
            o.flag = n.flag or n.Flag or (not o.forgetState and functions.deriveFlagFromName(o.name) or nil)
            o.window:_registerControl(o)
            o.main = o.window:Create("Frame", {
                Size = UDim2.new(1, -20, 0, 65),
                BorderSizePixel = 0,
                Name = o.name,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = o.tab.tabPage,
            }, { BackgroundTransparency = "ElementTransparency" })
            o.stroke = o.window:StyleElementBody(o.main)
            o._lastValue = o.value
            if not o.minimal then
                o:_buildLabel()
            end
            o.track = o.window:Create("Frame", {
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.new(1, -15, 0.5, 0),
                Size = UDim2.fromOffset(222, 14),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Parent = o.main,
            }, { BackgroundColor3 = "SliderBackground" })
            o.window:Create("UICorner", { CornerRadius = UDim.new(0, 13), Parent = o.track })
            o.progress = o.window:Create("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.fromScale(0, 0.5),
                Size = UDim2.fromScale(0, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 2,
                BackgroundTransparency = 1,
                Parent = o.track,
            })
            o.window:Create("UICorner", { CornerRadius = UDim.new(0, 13), Parent = o.progress })
            o.window:Create("UIGradient", {
                Offset = Vector2.new(0, 0.5),
                Rotation = 2,
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0.85),
                    NumberSequenceKeypoint.new(1, 0),
                }),
                Parent = o.progress,
            }, {
                Color = {
                    "SliderProgress",
                    functions.toColorSequence,
                },
            })
            o.progressGlow = o.window:CreateGlow(o.progress, "AccentColor", 20, 1)
            o.handle = o.window:Create("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = k(),
                Size = UDim2.fromOffset(h.X, h.Y),
                BorderSizePixel = 0,
                ZIndex = 50,
                BackgroundTransparency = 1,
                Parent = o.progress,
            }, { BackgroundColor3 = "SliderHandle" })
            o.window:Create("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = o.handle,
            })
            o.handleGlow = o.window:CreateGlow(o.handle, Color3.fromRGB(255, 255, 255), 10, 1)
            o.handleStroke = o.window:Create(
                "UIStroke",
                { Transparency = 1, Parent = o.handle },
                { Color = "SliderStroke" }
            )
            o.interact = o.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Text = "",
                TextTransparency = 1,
                ZIndex = 10,
                Parent = o.track,
            })
            o.window:ConnectFor(o, o.main.MouseEnter, function()
                if not o.window:_interactive() then
                    return
                end
                variables.tweenService
                    :Create(o.track, d, { BackgroundColor3 = o.window.theme.SliderBackgroundHover })
                    :Play()
            end)
            o.window:ConnectFor(o, o.main.MouseLeave, function()
                variables.tweenService
                    :Create(o.track, d, { BackgroundColor3 = o.window.theme.SliderBackground })
                    :Play()
            end)
            o.window:ConnectFor(o, o.interact.InputBegan, function(p)
                if
                    p.UserInputType == Enum.UserInputType.MouseButton1
                    or p.UserInputType == Enum.UserInputType.Touch
                then
                    HapticEngine.click()
                    o.dragging = true
                    o:_setHeld(true)
                    o:_updateFromMouse()
                    if o._dragConnection then
                        o._dragConnection:Disconnect()
                        o._dragConnection = nil
                    end
                    o._dragConnection = variables.runService.RenderStepped:Connect(function()
                        if o.window.unloaded or not o.dragging then
                            if o._dragConnection then
                                o._dragConnection:Disconnect()
                                o._dragConnection = nil
                            end
                            return
                        end
                        o:_updateFromMouse()
                    end)
                end
            end)
            o.window:ConnectFor(o, variables.userInputService.InputEnded, function(p)
                if
                    p.UserInputType == Enum.UserInputType.MouseButton1
                    or p.UserInputType == Enum.UserInputType.Touch
                then
                    o:_endDrag()
                end
            end)
            o.window:ConnectFor(o, variables.userInputService.WindowFocusReleased, function()
                o:_endDrag()
            end)
            if o.description and not o.minimal then
                o.descriptor = require(script.Parent.descriptor).new(o.tab, { description = o.description })
            end
            o.window:ConnectFor(o, o.main:GetPropertyChangedSignal("AbsoluteSize"), function()
                if o.window.animating or (o.window.hidden and o.window.hasShownOnce) then
                    return
                end
                o:_applyLayout()
            end)
            o:_applyLayout()
            if o.minimal then
                o.main.Size = UDim2.new(1, -20, 0, 41)
                o.track.AnchorPoint = Vector2.new(0.5, 0.5)
                o.track.Position = UDim2.new(0.5, 0, 0.5, 0)
                o.track.Size = UDim2.new(1, -30, 0, 14)
            end
            o:_renderProgress()
            return o
        end

        function Slider._buildLabel(self)
            self.container = self.window:Create("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 20, 0.5, 0),
                Size = UDim2.fromOffset(170, 33),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Parent = self.main,
            })
            self.containerLayout = self.window:Create("UIListLayout", {
                Padding = UDim.new(0, 2),
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.container,
            })
            self.titleContainer = self.window:Create("Frame", {
                Size = UDim2.new(1, 0, 0, 16),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 5,
                Parent = self.container,
            })
            self.window:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.titleContainer,
            })
            self.titleFlex = self.window:Create(
                "UIFlexItem",
                { FlexMode = Enum.UIFlexMode.None, Parent = self.titleContainer }
            )
            if self.icon then
                self.iconLabel = self.window:Create("ImageLabel", {
                    Image = self.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 5,
                    ImageTransparency = 1,
                    Parent = self.titleContainer,
                }, { ImageColor3 = "ContentColor" })
            end
            self.title = self.window:Create("TextLabel", {
                Text = locale.t(self.name),
                Size = UDim2.new(1, 0, 0, 16),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                RichText = true,
                LayoutOrder = 1,
                ZIndex = 5,
                TextTransparency = 1,
                Parent = self.titleContainer,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            self.window:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.title })
            self.valueHost = self.window:Create("Frame", {
                Size = UDim2.new(1, 0, 0, 16),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 6,
                LayoutOrder = 1,
                Parent = self.container,
            })
            self.valueOdo = odometer.new(
                self.window,
                self.valueHost,
                { textSize = 15, alignment = Enum.HorizontalAlignment.Left, transparency = 1, duration = 0.28 }
            )
            self.valueOdo:snap(self:_format(self.value))
        end

        function Slider._setMainHeight(self, n)
            if self._widthManaged then
                self.main.Size = UDim2.new(self.main.Size.X.Scale, self.main.Size.X.Offset, 0, n)
            else
                self.main.Size = UDim2.new(1, -20, 0, n)
            end
        end

        function Slider._applyLayout(self)
            if self.minimal then
                return
            end
            local n = self.main.AbsoluteSize.X
            local o = if n > 0 and n < g then "narrow" else "wide"
            if self._layoutMode == o then
                return
            end
            self._layoutMode = o
            if o == "narrow" then
                self:_setMainHeight(70)
                self.container.AnchorPoint = Vector2.new(0, 0)
                self.container.Position = UDim2.new(0, 20, 0, 14)
                self.container.Size = UDim2.new(1, -40, 0, 16)
                self.containerLayout.FillDirection = Enum.FillDirection.Horizontal
                self.titleFlex.FlexMode = Enum.UIFlexMode.Fill
                self.valueHost.AutomaticSize = Enum.AutomaticSize.X
                self.valueHost.Size = UDim2.new(0, 0, 0, 16)
                self.track.AnchorPoint = Vector2.new(0.5, 1)
                self.track.Position = UDim2.new(0.5, 0, 1, -14)
                self.track.Size = UDim2.new(1, -30, 0, 14)
            else
                self:_setMainHeight(65)
                self.container.AnchorPoint = Vector2.new(0, 0.5)
                self.container.Position = UDim2.new(0, 20, 0.5, 0)
                self.container.Size = UDim2.new(0, 170, 0, 33)
                self.containerLayout.FillDirection = Enum.FillDirection.Vertical
                self.titleFlex.FlexMode = Enum.UIFlexMode.None
                self.valueHost.AutomaticSize = Enum.AutomaticSize.None
                self.valueHost.Size = UDim2.new(1, 0, 0, 16)
                self.track.AnchorPoint = Vector2.new(1, 0.5)
                self.track.Position = UDim2.new(1, -15, 0.5, 0)
                self.track.Size = UDim2.new(0, 222, 0, 14)
            end
        end

        function Slider._format(self, n)
            local o = string.format("%." .. self._decimals .. "f", n)
            if self.suffix ~= "" then
                return o .. " " .. self.suffix
            end
            return o
        end

        function Slider._pillTravel(self)
            return math.max(self.track.AbsoluteSize.X, 0)
        end

        function Slider._renderProgress(self, n)
            local o = self.range[2] - self.range[1]
            local p = if o ~= 0 then math.clamp((self.value - self.range[1]) / o, 0, 1) else 0
            local q = j(p)
            if n then
                variables.tweenService:Create(self.progress, n, { Size = q }):Play()
            else
                self.progress.Size = q
            end
        end

        function Slider._updateFromMouse(self)
            local n = self:_pillTravel()
            if n <= 0 then
                return
            end
            local o = l(variables.userInputService:GetMouseLocation().X, self.track.AbsolutePosition.X, n)
            local p = c(self.range, self.increment, self.range[1] + o * (self.range[2] - self.range[1]))
            if p ~= self.value then
                self.value = p
                if self.valueOdo then
                    self.valueOdo:snap(self:_format(p))
                end
                self._lastValue = p
                self:_renderProgress(f)
                self:_fireCallback(p)
            end
        end

        function Slider._endDrag(self)
            if not self.dragging then
                return
            end
            self.dragging = false
            self:_setHeld(false)
            if self._dragConnection then
                self._dragConnection:Disconnect()
                self._dragConnection = nil
            end
            self.window:_persist(self)
        end

        function Slider._setHeld(self, n)
            if not n then
                self:_fireCallback(self.value)
            end
            local o = if n then i else h
            self._handleWidth = o.X
            variables.tweenService
                :Create(
                    self.handle,
                    e,
                    { Size = UDim2.fromOffset(o.X, o.Y), BackgroundTransparency = if n then 0.7 else 0 }
                )
                :Play()
            variables.tweenService:Create(self.handleStroke, e, { Transparency = if n then 0.6 else 1 }):Play()
            self:_renderProgress(e)
        end

        function Slider._fireCallback(self, n)
            self.window:_runGuarded(self, self.callback, n, self.dragging == true)
        end

        function Slider.Set(self, n, o)
            n = c(self.range, self.increment, n)
            self.value = n
            if self.valueOdo then
                self.valueOdo:to(self:_format(n), n >= (self._lastValue or n))
            end
            self._lastValue = n
            self:_renderProgress(d)
            if not o then
                self:_fireCallback(n)
                self.window:_persist(self)
            end
        end
        local m = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0.35)

        function Slider._setShown(self, o, p)
            local q = self.window
            if o then
                q:_revealCommon(self, p)
                q:_reveal(self.track, { BackgroundTransparency = 0 }, p)
                q:_reveal(self.progress, {
                    BackgroundTransparency = 0,
                }, p)
                q:_reveal(self.handle, { BackgroundTransparency = 0 }, p)
                if self.valueOdo then
                    self.valueOdo:reveal(0.3, p)
                end
                q:_reveal(self.progressGlow, { Transparency = math.max(0.55, q.theme.AccentGlow) }, p, m)
                q:_reveal(self.handleGlow, { Transparency = 0.8 }, p, m)
            else
                q:_hideCommon(self, p)
                q:_reveal(self.track, { BackgroundTransparency = 1 }, p)
                q:_reveal(self.progress, {
                    BackgroundTransparency = 1,
                }, p)
                q:_reveal(self.handle, { BackgroundTransparency = 1 }, p)
                if self.valueOdo then
                    self.valueOdo:reveal(1, p)
                end
                q:_reveal(self.progressGlow, { Transparency = 1 }, p, m)
                q:_reveal(self.handleGlow, { Transparency = 1 }, p, m)
            end
        end

        function Slider._refreshTheme(self)
            variables.tweenService
                :Create(
                    self.progressGlow,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { Transparency = math.max(0.55, self.window.theme.AccentGlow) }
                )
                :Play()
        end

        function Slider._minWidth(self)
            if self.minimal then
                return 100
            end
            local o = 40
            if self.icon then
                o += 22
            end
            o += functions.textWidth(self.window.theme.Font, 16, locale.resolve(self.name))
            o += 12
            o += functions.textWidth(self.window.theme.Font, 15, self:_format(self.value))
            return math.max(o, 160)
        end
        moveable(Slider)
        lockable(Slider)
        return Slider
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/stat
    define(Rayfield_components_stat, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Statistic = {}
        Statistic.__index = Statistic
        Statistic.__type = "Statistic"
        local utility = script.Parent.Parent.utility
        local variables, functions, odometer, moveable, constants, locale, log =
            require(utility.variables),
            require(utility.functions),
            require(utility.odometer),
            require(utility.moveable),
            require(utility.constants),
            require(utility.locale),
            require(utility.log)
        local b, c, d, e =
            constants.statAccents,
            NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.85), NumberSequenceKeypoint.new(1, 0) }),
            41,
            TweenInfo.new(0.6, Enum.EasingStyle.Exponential)

        local function f(g)
            return g.fill.Keypoints[1].Value
        end

        local function g(h)
            if h > 0 then
                return string.format("+%.1f%%", h)
            elseif h < 0 then
                return string.format("%.1f%%", h)
            else
                return "0%"
            end
        end

        local function h(i)
            if typeof(i) ~= "number" then
                return tostring(i)
            end
            local j = math.round(math.abs(i))
            local k = string.format("%.0f", j)
            local l = k:reverse():gsub("%d%d%d", "%0,"):reverse()
            if l:sub(1, 1) == "," then
                l = l:sub(2)
            end
            return if i < 0 and j ~= 0 then "-" .. l else l
        end

        local function i(j)
            local k = math.round(j)
            if k > 0 then
                return "+" .. h(k)
            elseif k < 0 then
                return h(k)
            else
                return "0"
            end
        end

        function Statistic.new(j, k)
            k = if typeof(k) == "table" then k else {}
            local l = setmetatable({
                tab = assert(j, "Missing argument #1 (Tab expected)"),
                window = j.window,
                name = k.name or k.Name or "Statistic",
                icon = k.icon or k.Icon,
                description = k.description or k.Description,
                value = if (k.value or k.Value) ~= nil then (k.value or k.Value) else 0,
                _hasValue = (k.value or k.Value) ~= nil,
                numberEasing = if (k.numberEasing ~= nil)
                    then k.numberEasing
                    elseif k.NumberEasing ~= nil then k.NumberEasing
                    else true,
                changeMode = k.changeMode or k.ChangeMode or "percentage",
                changeBaseline = k.changeBaseline or k.ChangeBaseline or "previous",
                prefix = k.prefix or k.Prefix or "",
                suffix = k.suffix or k.Suffix or "",
                compact = k.compact or k.Compact or j.compact or false,
                display = (k.display or k.Display or "value"),
                _initialValue = if (k.value or k.Value) ~= nil then (k.value or k.Value) else nil,
                _lastChange = 0,
            }, Statistic)
            if l.compact then
                l:_buildCompact()
            else
                l:_buildFull()
            end
            if l.description then
                if l.compact then
                    log.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{l.name}'.`)
                else
                    l.descriptor = require(script.Parent.descriptor).new(l.tab, { description = l.description })
                end
            end
            return l
        end

        function Statistic._buildFull(self)
            local k = self.window
            self.main = k:Create("Frame", {
                Size = UDim2.new(1, -20, 0, 90),
                BorderSizePixel = 0,
                Name = self.name,
                ZIndex = 5,
                BackgroundTransparency = 1,
                Parent = self.tab.tabPage,
            }, { BackgroundColor3 = "StatBackground", BackgroundTransparency = "ElementTransparency" })
            k:Create("UICorner", { Parent = self.main }, { CornerRadius = "ElementCornerRadius" })
            self.stroke = k:Create(
                "UIStroke",
                { Transparency = 1, Color = Color3.fromRGB(255, 255, 255), Parent = self.main },
                { Transparency = "ElementStrokeTransparency" }
            )
            self.strokeGradient = k:Create("UIGradient", {
                Rotation = 2,
                Offset = Vector2.new(0, 0.5),
                Color = b.neutral.stroke,
                Transparency = c,
                Parent = self.stroke,
            })
            self.titleContainer = k:Create("Frame", {
                Size = UDim2.new(1, -40, 0, 32),
                Position = UDim2.fromOffset(20, 15),
                BorderSizePixel = 0,
                LayoutOrder = -1,
                BackgroundTransparency = 1,
                ZIndex = 5,
                Parent = self.main,
            })
            self.gradientContainer = k:Create("Frame", {
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromOffset(0, 0),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                ZIndex = 5,
                Parent = self.main,
            })
            self.glow = k:CreateGlow(self.main, f(b.neutral), 13, 1)
            self.title = k:Create("TextLabel", {
                Text = locale.t(self.name),
                Size = UDim2.fromOffset(300, 19),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 19,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                LayoutOrder = 1,
                ZIndex = 10,
                TextTransparency = 1,
                Parent = self.titleContainer,
            }, { TextColor3 = "ContentColor", FontFace = "TitleFont" })
            self.mainGradient = k:Create("UIGradient", {
                Rotation = 2,
                Offset = Vector2.new(0, 0.5),
                Color = b.neutral.fill,
                Transparency = c,
                Parent = self.gradientContainer,
            })
            k:Create("UICorner", { Parent = self.gradientContainer }, { CornerRadius = "ElementCornerRadius" })
            if self.icon then
                self.iconLabel = k:Create("ImageLabel", {
                    Image = self.icon,
                    Size = UDim2.fromOffset(32, 32),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ZIndex = 10,
                    ImageTransparency = 1,
                    Parent = self.titleContainer,
                }, { ImageColor3 = "ContentColor" })
            end
            self.containerLayout = k:Create("UIListLayout", {
                Padding = UDim.new(0, 8),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.titleContainer,
            })
            self.valueHost = k:Create("Frame", {
                AnchorPoint = Vector2.new(0, 1),
                Position = UDim2.new(0, 20, 1, -15),
                Size = UDim2.fromOffset(200, 20),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 10,
                Parent = self.main,
            })
            self.changeHost = k:Create("Frame", {
                AnchorPoint = Vector2.new(1, 1),
                Position = UDim2.new(1, -20, 1, -15),
                Size = UDim2.fromOffset(200, 15),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ZIndex = 10,
                Parent = self.main,
            })
            self.valueOdo = odometer.new(
                k,
                self.valueHost,
                { textSize = 20, alignment = Enum.HorizontalAlignment.Left, transparency = 1 }
            )
            self.valueOdo:snap(self:_formatValue(self.value))
            self.changeOdo = odometer.new(
                k,
                self.changeHost,
                { textSize = 15, alignment = Enum.HorizontalAlignment.Right, transparency = 1 }
            )
            self.changeOdo:snap(self:_formatChange(0))
            self._accentGradients = { self.strokeGradient, self.mainGradient }
        end

        function Statistic._buildCompact(self)
            local k, l = self.window, self.tab.compact or false
            self.main = k:Create("Frame", {
                Name = self.name,
                Size = if l then UDim2.fromOffset(0, d) else UDim2.new(1, -20, 0, d),
                AutomaticSize = if l then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
                ClipsDescendants = true,
                BorderSizePixel = 0,
                ZIndex = 5,
                BackgroundTransparency = 1,
                Parent = self.tab.tabPage,
            }, { BackgroundColor3 = "StatBackground", BackgroundTransparency = "ElementTransparency" })
            k:Create("UICorner", { Parent = self.main }, { CornerRadius = "ElementCornerRadius" })
            self.stroke = k:Create(
                "UIStroke",
                { Transparency = 1, Color = Color3.fromRGB(255, 255, 255), Parent = self.main },
                {
                    Transparency = "ElementStrokeTransparency",
                }
            )
            self.strokeGradient = k:Create("UIGradient", {
                Rotation = 2,
                Offset = Vector2.new(0, 0.5),
                Color = b.neutral.stroke,
                Transparency = c,
                Parent = self.stroke,
            })
            if l then
                k:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = self.main })
            end
            k:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Parent = self.main,
            })
            self.card = k:Create("Frame", {
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, d),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                ZIndex = 5,
                BackgroundTransparency = 1,
                Parent = self.main,
            })
            k:Create("UICorner", { Parent = self.card }, { CornerRadius = "ElementCornerRadius" })
            self.mainGradient = k:Create("UIGradient", {
                Rotation = 2,
                Offset = Vector2.new(0, 0.5),
                Color = b.neutral.fill,
                Transparency = c,
                Parent = self.card,
            })
            k:Create(
                "UIPadding",
                { PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15), Parent = self.card }
            )
            k:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
                Padding = UDim.new(0, 10),
                Parent = self.card,
            })
            self.titleContainer = k:Create("Frame", {
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, 16),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                ZIndex = 6,
                Parent = self.card,
            })
            k:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.titleContainer })
            k:Create("UIListLayout", {
                Padding = UDim.new(0, 6),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = self.titleContainer,
            })
            if self.icon then
                self.iconLabel = k:Create("ImageLabel", {
                    Image = self.icon,
                    Size = UDim2.fromOffset(20, 20),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    ZIndex = 6,
                    ImageTransparency = 1,
                    Parent = self.titleContainer,
                }, {
                    ImageColor3 = "ContentColor",
                })
            end
            self.title = k:Create("TextLabel", {
                Text = locale.t(self.name),
                Size = UDim2.fromOffset(0, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                LayoutOrder = 1,
                ZIndex = 6,
                TextTransparency = 1,
                Parent = self.titleContainer,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            k:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.title })
            self.readoutHost = k:Create("Frame", {
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, 18),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                ZIndex = 6,
                Parent = self.card,
            })
            self.readoutOdo = odometer.new(k, self.readoutHost, {
                textSize = 17,
                alignment = Enum.HorizontalAlignment.Right,
                transparency = 1,
            })
            self.readoutOdo:snap(
                self.display == "change" and self:_formatChange(0) or self:_formatValue(self.value)
            )
            self._accentGradients = { self.strokeGradient, self.mainGradient }
        end

        function Statistic._setAccent(self, k, l)
            local m = b[k]
            self.strokeGradient.Color = m.stroke
            self.mainGradient.Color = m.fill
            if self.glow then
                self.glow.Color = f(m)
            end
            local n, o =
                if l == 1 then 14 elseif l == -1 then -10 else 2,
                if l == 1
                    then Vector2.new(0.04, 0.5)
                    elseif l == -1 then Vector2.new(-4E-2, 0.5)
                    else Vector2.new(0, 0.5)
            for p, q in self._accentGradients do
                variables.tweenService:Create(q, e, { Rotation = n, Offset = o }):Play()
            end
        end

        function Statistic._formatValue(self, k)
            return self.prefix .. h(k) .. self.suffix
        end

        function Statistic._formatChange(self, k)
            if self.changeMode == "absolute" then
                return i(k)
            else
                return g(k)
            end
        end

        function Statistic._showValue(self, k, l, m, n)
            if self.numberEasing and not n then
                k:to(self:_formatValue(l), l >= m)
            else
                k:snap(self:_formatValue(l))
            end
        end

        function Statistic._updateFullReadouts(self, k, l, m, n, o, p)
            self:_showValue(self.valueOdo, k, l, p)
            if o then
                self.changeOdo:snap(o)
                self._lastChange = 0
            elseif self.numberEasing and not n then
                self.changeOdo:to(self:_formatChange(m), m >= self._lastChange)
                self._lastChange = m
            else
                self.changeOdo:snap(self:_formatChange(m or 0))
                self._lastChange = m or 0
            end
        end

        function Statistic._updateCompactReadout(self, k, l, m, n, o, p)
            if self.display == "change" then
                if o then
                    self.readoutOdo:snap(o)
                    self._lastChange = 0
                elseif self.numberEasing and not n then
                    self.readoutOdo:to(self:_formatChange(m), m >= self._lastChange)
                    self._lastChange = m
                else
                    self.readoutOdo:snap(self:_formatChange(m or 0))
                    self._lastChange = m or 0
                end
            else
                self:_showValue(self.readoutOdo, k, l, p)
            end
        end

        function Statistic.Set(self, k)
            assert(typeof(k) == "number", "Statistic:Set() - value must be a number, got " .. typeof(k))
            local l, m = self.value, not self._hasValue
            self.value = k
            self._hasValue = true
            if m then
                self._initialValue = k
            end
            local n = if self.changeBaseline == "initial" then self._initialValue else l
            local o, p, q, r, s = m or n == k
            if o then
                p = 0
                r = "neutral"
                s = 0
            elseif n == 0 then
                local t, u =
                    if k > 0 then "+" else "-",
                    if self.changeMode == "percentage" then "\u{221e}%" else "\u{221e}"
                q = t .. u
                r = if k > 0 then "positive" else "negative"
                s = if k > 0 then 1 else -1
            elseif self.changeMode == "percentage" then
                p = ((k - n) / math.abs(n)) * 100
                s = if p > 0 then 1 elseif p < 0 then -1 else 0
                r = if s == 1 then "positive" elseif s == -1 then "negative" else "neutral"
            else
                p = k - n
                s = if p > 0 then 1 elseif p < 0 then -1 else 0
                r = if s == 1 then "positive" elseif s == -1 then "negative" else "neutral"
            end
            self:_setAccent(r, s)
            if self.compact then
                self:_updateCompactReadout(k, l, p, o, q, m)
            else
                self:_updateFullReadouts(k, l, p, o, q, m)
            end
        end

        function Statistic.ResetBaseline(self, k)
            local l, m, n = self.value, not self._hasValue, if typeof(k) == "number" then k else self.value
            self._initialValue = n
            self.value = n
            self._hasValue = true
            self._lastChange = 0
            if self.compact then
                if self.display == "change" then
                    self.readoutOdo:snap(self:_formatChange(0))
                else
                    self:_showValue(self.readoutOdo, n, l, m)
                end
            else
                self.changeOdo:snap(self:_formatChange(0))
                self:_showValue(self.valueOdo, n, l, m)
            end
            self:_setAccent("neutral", 0)
        end

        function Statistic._setShown(self, k, l)
            local m = self.window
            if self.compact then
                m:_reveal(self.main, {
                    BackgroundTransparency = if k then (self.window.theme.ElementTransparency or 0) else 1,
                }, l)
                m:_reveal(
                    self.stroke,
                    { Transparency = if k then self.window.theme.ElementStrokeTransparency else 1 },
                    l
                )
                m:_reveal(self.card, { BackgroundTransparency = if k then 0 else 1 }, l)
                m:_reveal(self.title, { TextTransparency = if k then 0 else 1 }, l)
                if self.iconLabel then
                    m:_reveal(self.iconLabel, { ImageTransparency = if k then 0 else 1 }, l)
                end
                self.readoutOdo:reveal(if k then 0 else 1, l)
                return
            end
            if k then
                m:_revealCommon(self, l)
                m:_reveal(self.gradientContainer, { BackgroundTransparency = 0 }, l)
                m:_reveal(self.glow, { Transparency = 0.82 }, l)
                self.valueOdo:reveal(0, l)
                self.changeOdo:reveal(0, l)
            else
                m:_hideCommon(self, l)
                m:_reveal(self.gradientContainer, { BackgroundTransparency = 1 }, l)
                m:_reveal(self.glow, {
                    Transparency = 1,
                }, l)
                self.valueOdo:reveal(1, l)
                self.changeOdo:reveal(1, l)
            end
        end

        function Statistic._minWidth(self)
            local k = 40
            if self.icon then
                k += 26
            end
            k += functions.textWidth(self.window.theme.Font, 16, locale.resolve(self.name))
            local l = if self.display == "change" then self:_formatChange(0) else self:_formatValue(self.value)
            k += functions.textWidth(self.window.theme.Font, 17, l)
            return k
        end
        moveable(Statistic)
        return Statistic
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/tab
    define(Rayfield_components_tab, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Tab = {}
        Tab.__index = Tab
        Tab.__type = "Tab"
        local utility = script.Parent.Parent.utility
        local variables, ordering, HapticEngine, search, tabSelector =
            require(utility.variables),
            require(utility.ordering),
            require(utility.HapticEngine),
            require(script.Parent.search),
            require(script.Parent.tabSelector)

        local function al(am, b)
            for c, d in b do
                if d.__type == "Group" then
                    al(am, d.elements)
                else
                    am:_unregisterControl(d)
                end
                if d.connections then
                    for e, f in d.connections do
                        am:Disconnect(f)
                    end
                    d.connections = nil
                end
                if d._dragConnection then
                    d._dragConnection:Disconnect()
                    d._dragConnection = nil
                end
                if am._recordingKeybind == d then
                    am._recordingKeybind = nil
                end
                if d._outsideClickConn then
                    am:Disconnect(d._outsideClickConn)
                    d._outsideClickConn = nil
                end
            end
        end
        local am, b =
            TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

        function Tab.new(c, d)
            d = if typeof(d) == "table" then d else {}
            local e = setmetatable({
                window = assert(c, "Missing argument #1 (Window expected)"),
                name = d.name or d.Name,
                icon = d.icon or d.Icon,
                neglectSelector = d.neglectSelector or d.NeglectSelector or false,
                customOrder = d.customOrder or d.CustomOrder or 0,
                forgetState = d.forgetState or d.ForgetState or false,
                elements = {},
                connections = {},
            }, Tab)
            assert(e.name or e.icon, "A tab needs a name or an icon.")
            if not e.neglectSelector then
                tabSelector.build(e, e.window.layout)
            end
            e.tabPage = e.window:Create("ScrollingFrame", {
                Name = e.name,
                Size = UDim2.new(1, -20, 1, 0),
                Position = UDim2.new(0.5, 0, 0, 68),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                AutomaticCanvasSize = Enum.AutomaticSize.Y,
                CanvasSize = UDim2.new(0, 0, 0, 0),
                ScrollBarThickness = 0,
                ScrollingDirection = Enum.ScrollingDirection.Y,
                LayoutOrder = e.customOrder or 0,
                Parent = e.window.elements,
            })
            e.tabPageLayout = e.window:Create("UIListLayout", {
                Padding = UDim.new(0, 7),
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = e.tabPage,
            })
            e.window:Create(
                "UIPadding",
                { PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 33), Parent = e.tabPage }
            )
            if not e.neglectSelector then
                table.insert(
                    e.connections,
                    e.window:Connect(e.topbarItemInteract.MouseButton1Click, function()
                        HapticEngine.click()
                        e:Select()
                    end)
                )
                table.insert(
                    e.connections,
                    e.window:Connect(e.topbarItemInteract.MouseEnter, function()
                        if not e.window:_interactive() then
                            return
                        end
                        if e.window.selectedTab ~= e then
                            e:_applyVisual("hover", b)
                            e:_spinGradients()
                        end
                    end)
                )
                table.insert(
                    e.connections,
                    e.window:Connect(e.topbarItemInteract.MouseLeave, function()
                        if e.window.selectedTab ~= e then
                            e:_applyVisual("unselected", b)
                        end
                    end)
                )
            end
            return e
        end

        function Tab._applyVisual(self, d, e)
            if self.neglectSelector or not self.topbarItem then
                return
            end
            local f = tabSelector.states[self.window.layout.mode][d]
            if not f then
                return
            end
            tabSelector.applyVisual(self, f, e)
        end

        function Tab._spinGradients(self)
            if self.neglectSelector then
                return
            end
            local d = TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            for e, f in { self.topbarItemGradient, self.topbarItemStrokeGradient } do
                f.Rotation = -270
                variables.tweenService:Create(f, d, { Rotation = 90 }):Play()
            end
        end

        function Tab.Select(self, d)
            if self.window._searching then
                search.close(self.window, { showTabs = true, jumpTo = false })
            end
            self.window.selectedTab = self
            self.window:_jumpTo(self.tabPage)
            local e = d or not self.window:_interactive()
            if not self.neglectSelector and not e then
                self:_applyVisual("selected", am)
            end
            for f, g in self.window.tabs do
                if g ~= self.window.selectedTab then
                    g:Deselect(e)
                end
            end
            if self ~= self.window.rfSettings and self.window.settingsAction and not e then
                variables.tweenService
                    :Create(
                        self.window.settingsAction.iconLabel,
                        TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { ImageTransparency = 0.6 }
                    )
                    :Play()
            end
        end

        function Tab.Deselect(self, d)
            if not self.neglectSelector and not d then
                self:_applyVisual("unselected", am)
            end
        end

        function Tab._register(self, d)
            table.insert(self.elements, d)
            ordering(d, #self.elements * 10)
            self.window:_restoreLate(d)
            if not self.window.hidden then
                d:_setShown(true, true)
            end
            return d
        end

        function Tab.CreateButton(self, d)
            return self:_register(require(script.Parent.button).new(self, d))
        end

        function Tab.CreateToggle(self, d)
            return self:_register(require(script.Parent.toggle).new(self, d))
        end

        function Tab.CreateSwitch(self, d)
            return self:CreateToggle(d)
        end

        function Tab.CreateSection(self, d)
            return self:_register(require(script.Parent.section).new(self, d))
        end

        function Tab.CreateText(self, d)
            return self:_register(require(script.Parent.text).new(self, d))
        end

        function Tab.CreateDivider(self, d)
            return self:_register(require(script.Parent.divider).new(self, d))
        end

        function Tab.CreateProgress(self, d)
            return self:_register(require(script.Parent.progress).new(self, d))
        end

        function Tab.CreateConsole(self, d)
            return self:_register(require(script.Parent.console).new(self, d))
        end

        function Tab.CreateStat(self, d)
            return self:_register(require(script.Parent.stat).new(self, d))
        end

        function Tab.CreateSlider(self, d)
            return self:_register(require(script.Parent.slider).new(self, d))
        end

        function Tab.CreateDropdown(self, d)
            return self:_register(require(script.Parent.dropdown).new(self, d))
        end

        function Tab.CreateInput(self, d)
            return self:_register(require(script.Parent.input).new(self, d))
        end

        function Tab.CreateKeybind(self, d)
            return self:_register(require(script.Parent.keybind).new(self, d))
        end

        function Tab.CreateColorPicker(self, d)
            return self:_register(require(script.Parent.colorpicker).new(self, d))
        end

        function Tab.CreateGroup(self, d)
            return self:_register(require(script.Parent.group).new(self, d))
        end

        function Tab._moveElement(self, d, e)
            local f = table.find(self.elements, d)
            if not f then
                return
            end
            table.remove(self.elements, f)
            e = math.clamp(e, 1, #self.elements + 1)
            table.insert(self.elements, e, d)
            for g, h in self.elements do
                ordering(h, g * 10)
            end
        end

        function Tab.Remove(self)
            local d = self.window
            if d._searching then
                search.close(d, { showTabs = true, jumpTo = d.selectedTab and d.selectedTab.tabPage })
            end
            local e = table.find(d.tabs, self)
            if e then
                table.remove(d.tabs, e)
            end
            if d.selectedTab == self then
                d.selectedTab = nil
                for f, g in ipairs(d.tabs) do
                    if not g.neglectSelector then
                        g:Select()
                        break
                    end
                end
            end
            al(d, self.elements)
            for f, g in self.connections do
                d:Disconnect(g)
            end
            self.connections = {}
            if self.topbarItem then
                d:DestroySubtree(self.topbarItem)
            end
            if self.tabPage then
                d:DestroySubtree(self.tabPage)
            end
            self.topbarItem = nil
            self.tabPage = nil
            self.elements = {}
        end
        return Tab
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/tabSection
    define(Rayfield_components_tabSection, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local TabSection = {}
        TabSection.__index = TabSection
        TabSection.__type = "TabSection"
        local locale, log, ah, ai, aj =
            require(script.Parent.Parent.utility.locale), require(script.Parent.Parent.utility.log), 20, 6, 3

        local function ak(al)
            for am, b in al.tabs do
                if not b.neglectSelector then
                    return true
                end
            end
            return #al.tabSections > 0
        end

        function TabSection.new(al, am)
            am = if typeof(am) == "table" then am else {}
            local b = setmetatable({
                window = assert(al, "Missing argument #1 (Window expected)"),
                name = am.name or am.Name or "Section",
                icon = am.icon or am.Icon,
            }, TabSection)
            if al.layout.mode ~= "sidebar" then
                if not al._warnedTabSection then
                    al._warnedTabSection = true
                    log.warn(
                        [[Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.]]
                    )
                end
                b.inert = true
                return b
            end
            b.main = al:Create("Frame", {
                Name = b.name,
                Size = UDim2.new(1, -ah * 2, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Visible = false,
                Parent = al.tabList,
            })
            b.padding = al:Create("UIPadding", {
                PaddingTop = UDim.new(0, if ak(al) then ai else 0),
                PaddingBottom = UDim.new(0, aj),
                Parent = b.main,
            })
            al:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Parent = b.main,
            })
            if b.icon then
                b.iconLabel = al:Create("ImageLabel", {
                    Image = b.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = 0,
                    ImageTransparency = 1,
                    Parent = b.main,
                }, { ImageColor3 = "ContentColor" })
            end
            b.title = al:Create("TextLabel", {
                Text = locale.t(b.name),
                Size = UDim2.fromOffset(0, 15),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 15,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Bottom,
                TextWrapped = true,
                LayoutOrder = 1,
                TextTransparency = 1,
                Parent = b.main,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            return b
        end

        function TabSection._setShown(self, am, b)
            if not self.main then
                return
            end
            local c = self.window
            c:_reveal(self.title, { TextTransparency = if am then 0.6 else 1 }, b)
            if self.iconLabel then
                c:_reveal(self.iconLabel, { ImageTransparency = if am then 0.65 else 1 }, b)
            end
        end

        function TabSection._setVisible(self, am)
            if self.main then
                self.main.Visible = am
            end
        end

        function TabSection.Remove(self)
            local am = table.find(self.window.tabSections, self)
            if am then
                table.remove(self.window.tabSections, am)
            end
            self.window:DestroySubtree(self.main)
            self.main = nil
        end
        return TabSection
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/tabSelector
    define(Rayfield_components_tabSelector, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local utility = script.Parent.Parent.utility
        local variables, functions, locale, ai =
            require(utility.variables), require(utility.functions), require(utility.locale), {}

        local function aj(ak: string?): string
            if type(ak) ~= "string" or ak == "" then
                return "?"
            end
            local al = utf8.offset(ak, 2)
            local am = if al then string.sub(ak, 1, al - 1) else ak
            return string.upper(am)
        end
        ai.states = {
            top = {
                selected = { background = 0, stroke = 0, content = 0 },
                hover = { background = 0.4, stroke = 0.3, content = 0.3 },
                unselected = {
                    background = 0.8,
                    stroke = 0.65,
                    content = 0.5,
                },
                hidden = { background = 1, stroke = 1, content = 1 },
            },
            sidebar = {
                selected = { background = 0.4, stroke = 0.5, content = 0, shadow = 0.8 },
                hover = { background = 0.7, stroke = 0.8, content = 0.3, shadow = 1 },
                unselected = { background = 1, stroke = 1, content = 0.5, shadow = 1 },
                hidden = { background = 1, stroke = 1, content = 1, shadow = 1 },
            },
        }

        local function ak(al, am, b)
            al.topbarItemGradient = al.window:Create(
                "UIGradient",
                { Rotation = 90, Parent = am },
                { Color = { "TabBackground", functions.toColorSequence } }
            )
            al.topbarItemStrokeGradient = al.window:Create(
                "UIGradient",
                { Rotation = 90, Parent = b },
                { Color = { "TabStroke", functions.toColorSequence } }
            )
        end

        local function al(am, b, c)
            if c and not am.icon then
                am.topbarItemInitial = am.window:Create("TextLabel", {
                    Text = aj(am.name),
                    Size = UDim2.fromOffset(b, b),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextSize = b - 4,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    Visible = false,
                    TextTransparency = 1,
                    Parent = am.topbarItemContainer,
                }, { TextColor3 = "TabColor", FontFace = "Font" })
            end
            if am.icon then
                am.topbarItemIcon = am.window:Create("ImageLabel", {
                    Image = am.icon,
                    Size = UDim2.fromOffset(b, b),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    Parent = am.topbarItemContainer,
                }, { ImageColor3 = "TabColor" })
            end
            if am.name then
                am.topbarItemTitle = am.window:Create("TextLabel", {
                    Text = locale.t(am.name),
                    Size = UDim2.fromOffset(0, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    TextSize = 16,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    LayoutOrder = 1,
                    TextTransparency = 1,
                    Parent = am.topbarItemContainer,
                }, { TextColor3 = "TabColor", FontFace = "Font" })
            end
        end

        local function am(b)
            b.topbarItem = b.window:Create("Frame", {
                Name = b.name,
                Size = UDim2.fromOffset(0, 34),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Visible = false,
                LayoutOrder = b.customOrder or 0,
                Parent = b.window.tabList,
            })
            b.topbarItemInteract = b.window:Create("TextButton", {
                Active = false,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                Text = "",
                TextTransparency = 1,
                Parent = b.topbarItem,
            })
            b.window:Create("UICorner", { Parent = b.topbarItem }, { CornerRadius = "PillCornerRadius" })
            b.topbarItemStroke = b.window:Create("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(255, 255, 255),
                Transparency = 1,
                Parent = b.topbarItem,
            })
            ak(b, b.topbarItem, b.topbarItemStroke)
            b.topbarItemContainer = b.window:Create("Frame", {
                Size = UDim2.fromOffset(0, 34),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Parent = b.topbarItem,
            })
            b.window:Create(
                "UIPadding",
                { PaddingLeft = UDim.new(0, 13), PaddingRight = UDim.new(0, 14), Parent = b.topbarItemContainer }
            )
            b.topbarItemLayout = b.window:Create("UIListLayout", {
                Padding = UDim.new(0, 6),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = b.topbarItemContainer,
            })
            al(b, 16, false)
        end

        local function b(c, d)
            c.topbarItem = c.window:Create("Frame", {
                Name = c.name,
                Size = UDim2.new(1, -d.rowInset * 2, 0, d.rowHeight),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Visible = false,
                LayoutOrder = c.customOrder or 0,
                Parent = c.window.tabList,
            })
            c.topbarItemInteract = c.window:Create("TextButton", {
                Active = false,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                Text = "",
                TextTransparency = 1,
                Parent = c.topbarItem,
            })
            c.window:Create("UICorner", { CornerRadius = UDim.new(0, d.rowCornerRadius), Parent = c.topbarItem })
            c.topbarItemStroke = c.window:Create("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(255, 255, 255),
                Transparency = 1,
                Parent = c.topbarItem,
            })
            ak(c, c.topbarItem, c.topbarItemStroke)
            c.topbarItemShadow = c.window:Create("UIShadow", {
                BlurRadius = UDim.new(0, 20),
                Color = Color3.fromRGB(255, 255, 255),
                Offset = UDim2.new(0, 0, 0, -15),
                Spread = UDim2.new(0, 10, 0, -30),
                ZIndex = -1,
                Transparency = 1,
                Parent = c.topbarItem,
            })
            c.topbarItemContainer = c.window:Create("Frame", {
                Size = UDim2.new(1, -d.rowPadding, 0, 24),
                Position = UDim2.new(0, d.rowPadding, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Parent = c.topbarItem,
            })
            c.topbarItemLayout = c.window:Create("UIListLayout", {
                Padding = UDim.new(0, d.rowContentSpacing),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = c.topbarItemContainer,
            })
            al(c, d.rowIconSize, true)
        end

        function ai.build(c, d)
            if d.mode == "sidebar" then
                b(c, d)
            else
                am(c)
            end
        end

        function ai.setRowCollapsed(self, d, e)
            if e.mode ~= "sidebar" or not self.topbarItem then
                return
            end
            if self.topbarItemTitle then
                self.topbarItemTitle.Visible = not d
            end
            if self.topbarItemInitial then
                self.topbarItemInitial.Visible = d
            end
            local f = if d then 0 else e.rowPadding
            self.topbarItemContainer.Size = UDim2.new(1, -f, 0, 24)
            self.topbarItemContainer.Position = UDim2.new(0, f, 0.5, 0)
            self.topbarItemLayout.HorizontalAlignment = if d
                then Enum.HorizontalAlignment.Center
                else Enum.HorizontalAlignment.Left
        end

        function ai.applyVisual(self, d, e)
            local f = {
                [self.topbarItem] = { BackgroundTransparency = d.background },
                [self.topbarItemStroke] = {
                    Transparency = d.stroke,
                },
            }
            if self.topbarItemIcon then
                f[self.topbarItemIcon] = { ImageTransparency = d.content }
            end
            if self.topbarItemTitle then
                f[self.topbarItemTitle] = { TextTransparency = d.content }
            end
            if self.topbarItemInitial then
                f[self.topbarItemInitial] = { TextTransparency = d.content }
            end
            if self.topbarItemShadow and d.shadow then
                f[self.topbarItemShadow] = {
                    Transparency = d.shadow,
                }
            end
            for g, h in f do
                if e then
                    variables.tweenService:Create(g, e, h):Play()
                else
                    for i, j in h do
                        g[i] = j
                    end
                end
            end
        end
        return ai
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/tag
    define(Rayfield_components_tag, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Tag = {}
        Tag.__index = Tag
        Tag.__type = "Tag"
        local utility = script.Parent.Parent.utility
        local variables, functions, image, aj, ak =
            require(utility.variables),
            require(utility.functions),
            require(utility.image),
            Color3.fromRGB(255, 175, 15),
            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

        function Tag.new(al, am)
            am = if typeof(am) == "table" then am else {}
            local b = setmetatable({
                window = assert(al, "Missing argument #1 (Window expected)"),
                text = am.text or am.Text or am.title or am.Title,
                icon = am.icon or am.Icon,
                color = am.color or am.Color or aj,
            }, Tag)
            assert(b.icon or (b.text and b.text ~= ""), "A Tag requires an icon, text, or both.")
            b.main = b.window:Create("Frame", {
                Name = "Tag",
                Size = UDim2.fromOffset(10, 24),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = b.color,
                BorderSizePixel = 0,
                LayoutOrder = am.order or am.Order or 0,
                BackgroundTransparency = 1,
                Parent = b.window.tagContainer,
            })
            b.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = b.main })
            b.window:Create(
                "UIPadding",
                { PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), Parent = b.main }
            )
            b.window:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = b.main,
            })
            local c = functions.contrastColor(b.color)
            b.iconLabel = b.window:Create("ImageLabel", {
                Name = "Icon",
                Image = b.icon or "",
                ImageColor3 = c,
                Size = UDim2.fromOffset(16, 16),
                BackgroundTransparency = 1,
                Visible = b.icon ~= nil,
                ZIndex = 5,
                ImageTransparency = 1,
                Parent = b.main,
            })
            b.title = b.window:Create("TextLabel", {
                Name = "Title",
                AnchorPoint = Vector2.new(0, 0.5),
                Size = UDim2.fromOffset(10, 15),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundTransparency = 1,
                Text = b.text or "",
                TextColor3 = c,
                TextSize = 15,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                RichText = true,
                Visible = b.text ~= nil and b.text ~= "",
                LayoutOrder = 1,
                ZIndex = 5,
                TextTransparency = 1,
                Parent = b.main,
            }, { FontFace = "Font" })
            b.window.tagContainer.Visible = true
            if not b.window.hidden then
                b:_setShown(true, ak)
            end
            return b
        end

        function Tag._setShown(self, am, b)
            local c, d = if am then 0 else 1, if typeof(b) == "TweenInfo" then b elseif b then ak else nil
            if d then
                variables.tweenService:Create(self.main, d, { BackgroundTransparency = c }):Play()
                variables.tweenService:Create(self.iconLabel, d, { ImageTransparency = c }):Play()
                variables.tweenService:Create(self.title, d, { TextTransparency = c }):Play()
            else
                self.main.BackgroundTransparency = c
                self.iconLabel.ImageTransparency = c
                self.title.TextTransparency = c
            end
        end

        function Tag.SetColor(self, am)
            self.color = am
            local b = functions.contrastColor(am)
            variables.tweenService:Create(self.main, ak, { BackgroundColor3 = am }):Play()
            variables.tweenService
                :Create(self.iconLabel, ak, {
                    ImageColor3 = b,
                })
                :Play()
            variables.tweenService:Create(self.title, ak, { TextColor3 = b }):Play()
        end

        function Tag.SetText(self, am)
            self.text = am
            self.title.Text = am or ""
            self.title.Visible = am ~= nil and am ~= ""
        end

        function Tag.SetIcon(self, am)
            self.icon = am
            image.assign(self.iconLabel, "Image", am)
            self.iconLabel.Visible = am ~= nil
        end

        function Tag.Set(self, am)
            if am.color or am.Color then
                self:SetColor(am.color or am.Color)
            end
            if am.text or am.Text or am.title or am.Title then
                self:SetText(am.text or am.Text or am.title or am.Title)
            end
            if am.icon ~= nil or am.Icon ~= nil then
                self:SetIcon(am.icon or am.Icon)
            end
        end

        function Tag.Remove(self)
            self.window:DestroySubtree(self.main)
            local am = table.find(self.window.tags, self)
            if am then
                table.remove(self.window.tags, am)
            end
            if #self.window.tags == 0 then
                self.window.tagContainer.Visible = false
            end
        end
        return Tag
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/text
    define(Rayfield_components_text, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Text = {}
        Text.__index = Text
        Text.__type = "Text"
        local moveable, locale, ah, ai, aj =
            require(script.Parent.Parent.utility.moveable),
            require(script.Parent.Parent.utility.locale),
            16,
            14,
            0.45

        function Text.new(ak, al)
            al = if typeof(al) == "table" then al else {}
            local am = setmetatable({
                tab = assert(ak, "Missing argument #1 (Tab expected)"),
                window = ak.window,
                name = tostring(al.name or al.Name or ""),
                text = tostring(al.text or al.Text or ""),
                icon = al.icon or al.Icon,
            }, Text)
            am.main = am.window:Create("Frame", {
                Size = UDim2.new(1, -20, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BorderSizePixel = 0,
                Name = if am.name ~= "" then am.name else "Text",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = am.tab.tabPage,
            }, { BackgroundTransparency = "ElementTransparency" })
            am.stroke = am.window:StyleElementBody(am.main)
            am.window:Create("UIPadding", {
                PaddingTop = UDim.new(0, 14),
                PaddingBottom = UDim.new(0, 14),
                PaddingLeft = UDim.new(0, 20),
                PaddingRight = UDim.new(0, 20),
                Parent = am.main,
            })
            am.window:Create(
                "UIListLayout",
                { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, Parent = am.main }
            )
            am.titleRow = am.window:Create("Frame", {
                Name = "Title",
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Parent = am.main,
            })
            am.window:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 6),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Parent = am.titleRow,
            })
            if am.icon then
                am.iconLabel = am.window:Create("ImageLabel", {
                    Image = am.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    Parent = am.titleRow,
                }, { ImageColor3 = "ContentColor" })
            end
            am.title = am.window:Create("TextLabel", {
                Text = locale.t(am.name),
                Size = UDim2.new(1, if am.icon then -22 else 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                RichText = true,
                TextSize = ah,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 1,
                TextTransparency = 1,
                Parent = am.titleRow,
            }, { TextColor3 = "TitlingColor", FontFace = "Font" })
            am.body = am.window:Create("TextLabel", {
                Text = locale.t(am.text),
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                RichText = true,
                TextSize = ai,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 2,
                TextTransparency = 1,
                Parent = am.main,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            am:_applyPresence()
            return am
        end

        function Text._applyPresence(self)
            self.titleRow.Visible = self.name ~= "" or self.icon ~= nil
            self.body.Visible = self.text ~= ""
        end

        function Text.Set(self, al)
            self.text = tostring(al)
            self.window:_bindLocale(self.body, "Text", self.text)
            self:_applyPresence()
        end

        function Text.SetTitle(self, al)
            self.name = tostring(al)
            self.window:_bindLocale(self.title, "Text", self.name)
            self:_applyPresence()
        end

        function Text._setShown(self, al, am)
            if al then
                self.window:_revealCommon(self, am)
            else
                self.window:_hideCommon(self, am)
            end
            self.window:_reveal(self.body, { TextTransparency = if al then aj else 1 }, am)
        end
        moveable(Text)
        return Text
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/toast
    define(Rayfield_components_toast, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Toast = {}
        Toast.__index = Toast
        Toast.__type = "Toast"
        local utility = script.Parent.Parent.utility
        local variables, functions, constants, image, HapticEngine, al, am, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r =
            require(utility.variables),
            require(utility.functions),
            require(utility.constants),
            require(utility.image),
            require(utility.HapticEngine),
            TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            24,
            32,
            18,
            18,
            10,
            28,
            12,
            8,
            140,
            320,
            6,
            UDim2.new(0.5, 0, 0.5, -180),
            UDim2.new(0.5, 0, 0.5, 180),
            UDim2.new(0.5, 0, 0.5, 0)

        local function s(t)
            return math.clamp(#t * 0.06 + 3, 3, 9)
        end

        local function t(u)
            if type(u) == "number" then
                return "rbxassetid://" .. tostring(u)
            end
            return u
        end

        function Toast.new(u, v, w)
            v = if typeof(v) == "table" then v else {}
            local x = setmetatable({
                window = assert(u, "Missing argument #1 (Window expected)"),
                title = v.title or v.Title or "",
                subtitle = v.subtitle or v.Subtitle,
                icon = v.icon or v.Icon,
                avatar = v.avatar or v.Avatar,
                minWidth = v.minWidth or v.MinWidth,
                subtitleAbove = v.subtitleAbove or v.SubtitleAbove or false,
                position = v.position or "Top",
                _hovered = false,
                _dismissed = false,
            }, Toast)
            x.duration = v.duration or v.Duration or s(x.title .. (x.subtitle or ""))
            local y = x.avatar ~= nil and x.avatar ~= 0
            local z = y or (x.icon ~= nil and x.icon ~= 0 and x.icon ~= "")
            x._iconImage = if y
                then image.avatar(x.avatar, function(A)
                    if x.iconLabel and not x._dismissed and x.main.Parent then
                        image.assign(x.iconLabel, "Image", A)
                    end
                end)
                elseif z then t(x.icon)
                else nil
            x._iconSize = if y then f else e
            x._leftPad = if y then i else g
            x._rightPad = if y then j else h
            x._minWidth = math.clamp(x.minWidth or 0, m, n)
            local A = x.subtitle ~= nil and x.subtitle ~= ""
            x.main = x.window:Create("Frame", {
                Name = "Toast",
                BackgroundTransparency = 1,
                Size = UDim2.new(0, 0, 0, 0),
                BorderSizePixel = 0,
                ZIndex = constants.zIndex.toast,
                Parent = w or x.window.toasts,
            })
            x.window:Create("UIPadding", {
                PaddingTop = UDim.new(0, l),
                Parent = x.main,
            })
            x.body = x.window:Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.new(1, 0, 1, 0),
                Position = if x.position == "Bottom" then q else p,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Active = true,
                BorderSizePixel = 0,
                ZIndex = constants.zIndex.toast,
                BackgroundTransparency = 1,
                Parent = x.main,
            })
            x.window:Create(
                "UIGradient",
                { Rotation = 270, Offset = Vector2.new(0, -0.1), Parent = x.body },
                { Color = { "WindowColor", functions.toColorSequence } }
            )
            x.window:Create("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = x.body,
            })
            x.stroke = x.window:Create(
                "UIStroke",
                { Transparency = 1, Parent = x.body },
                { Color = "SurfaceStroke" }
            )
            x.shadow = x.window:CreateGlow(x.body, "ShadowColor", 20, 1)
            x.window:Create(
                "UIPadding",
                {
                    PaddingLeft = UDim.new(0, x._leftPad),
                    PaddingRight = UDim.new(0, x._rightPad),
                    Parent = x.body,
                }
            )
            x.window:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, k),
                Parent = x.body,
            })
            if z then
                x.iconLabel = x.window:Create("ImageLabel", {
                    Image = x._iconImage,
                    Size = UDim2.fromOffset(x._iconSize, x._iconSize),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderSizePixel = 0,
                    LayoutOrder = 1,
                    ZIndex = constants.zIndex.toastContent,
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    Parent = x.body,
                }, if y then nil else { ImageColor3 = "ContentColor" })
                x.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = x.iconLabel })
            end
            x.container = x.window:Create("Frame", {
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, A and 32 or 16),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                ZIndex = constants.zIndex.toastContent,
                Parent = x.body,
            })
            x.window:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 1),
                Parent = x.container,
            })
            x.titleLabel = x.window:Create("TextLabel", {
                Text = x.title,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, 16),
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = if x.subtitleAbove then 2 else 1,
                ZIndex = constants.zIndex.toastContent,
                TextTransparency = 1,
                Parent = x.container,
            }, { TextColor3 = "ContentColor", FontFace = "TitleFont" })
            if A then
                x.subtitleLabel = x.window:Create("TextLabel", {
                    Text = x.subtitle,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Size = UDim2.fromOffset(0, 14),
                    BackgroundTransparency = 1,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    LayoutOrder = if x.subtitleAbove then 1 else 2,
                    ZIndex = constants.zIndex.toastContent,
                    TextTransparency = 1,
                    Parent = x.container,
                }, { TextColor3 = "ContentColor", FontFace = "Font" })
            end
            x.window._toastCount = (x.window._toastCount or 0) + 1
            x.main.LayoutOrder = -x.window._toastCount
            local B = x.window._liveToasts
            if not B then
                B = {}
                x.window._liveToasts = B
            end
            local C = B[x.main.Parent]
            if not C then
                C = {}
                B[x.main.Parent] = C
            end
            x._live = C
            table.insert(C, x)
            while #C > o do
                local D = table.remove(C, 1)
                if D and D ~= x then
                    task.spawn(D._dismiss, D)
                end
            end
            x._connections = {
                x.window:Connect(x.body.MouseEnter, function()
                    x._hovered = true
                end),
                x.window:Connect(x.body.MouseLeave, function()
                    x._hovered = false
                end),
                x.window:Connect(x.body.InputBegan, function(D)
                    if
                        D.UserInputType == Enum.UserInputType.MouseButton1
                        or D.UserInputType == Enum.UserInputType.Touch
                    then
                        x:_dismiss()
                    end
                end),
            }
            task.spawn(function()
                x:_show()
            end)
            return x
        end

        function Toast._measure(self)
            local v, w =
                functions.textWidth(self.window.theme.TitleFont, 16, self.title),
                if self.subtitleLabel then functions.textWidth(self.window.theme.Font, 14, self.subtitle) else 0
            local x, y =
                math.max(v, w), if self.iconLabel then self._leftPad + self._iconSize + k else self._leftPad
            local z = math.clamp(y + x + self._rightPad, self._minWidth, n)
            if y + x + self._rightPad > n then
                local A = n - y - self._rightPad
                for B, C in { self.titleLabel, self.subtitleLabel } do
                    if C then
                        C.AutomaticSize = Enum.AutomaticSize.None
                        C.TextTruncate = Enum.TextTruncate.AtEnd
                        C.Size = UDim2.fromOffset(A, C.Size.Y.Offset)
                    end
                end
            end
            local A = if self.subtitleLabel then 31 else 16
            local B = math.max(A, if self.iconLabel then self._iconSize else 0) + 18
            return z, B
        end

        function Toast._show(self)
            if not self.main.Parent then
                return
            end
            HapticEngine.notify()
            local v, w = self:_measure()
            if self._dismissed or not self.main.Parent then
                return
            end
            self.main.Size = UDim2.new(0, v, 0, 0)
            variables.tweenService:Create(self.main, am, { Size = UDim2.new(0, v, 0, w + l) }):Play()
            variables.tweenService:Create(self.body, al, { Position = r }):Play()
            variables.tweenService:Create(self.body, b, { BackgroundTransparency = 0 }):Play()
            variables.tweenService:Create(self.stroke, b, { Transparency = 0.9 }):Play()
            variables.tweenService:Create(self.shadow, c, { Transparency = 0.6 }):Play()
            variables.tweenService
                :Create(self.titleLabel, c, {
                    TextTransparency = 0,
                })
                :Play()
            task.wait(0.05)
            if self._dismissed or not self.main.Parent then
                return
            end
            if self.iconLabel then
                variables.tweenService:Create(self.iconLabel, c, { BackgroundTransparency = 0.95 }):Play()
                variables.tweenService
                    :Create(self.iconLabel, c, {
                        ImageTransparency = 0,
                    })
                    :Play()
            end
            task.wait(0.05)
            if self._dismissed or not self.main.Parent then
                return
            end
            if self.subtitleLabel then
                variables.tweenService:Create(self.subtitleLabel, c, { TextTransparency = 0.5 }):Play()
            end
            local x = 0
            while x < self.duration and not self._dismissed and self.main.Parent do
                local y = task.wait()
                if not self._hovered then
                    x += y
                end
            end
            self:_dismiss()
        end

        function Toast._dismiss(self)
            if self._dismissed then
                return
            end
            self._dismissed = true
            local v = self._live
            local w = v and table.find(v, self)
            if v and w then
                table.remove(v, w)
            end
            if not self.main.Parent then
                return
            end
            variables.tweenService:Create(self.body, b, { BackgroundTransparency = 1 }):Play()
            variables.tweenService:Create(self.stroke, b, { Transparency = 1 }):Play()
            variables.tweenService:Create(self.shadow, c, { Transparency = 1 }):Play()
            variables.tweenService:Create(self.titleLabel, c, { TextTransparency = 1 }):Play()
            if self.subtitleLabel then
                variables.tweenService:Create(self.subtitleLabel, c, { TextTransparency = 1 }):Play()
            end
            if self.iconLabel then
                variables.tweenService
                    :Create(self.iconLabel, c, {
                        ImageTransparency = 1,
                        BackgroundTransparency = 1,
                    })
                    :Play()
            end
            variables.tweenService:Create(self.body, d, { Size = UDim2.new(1, -60, 1, 0) }):Play()
            local x = variables.tweenService:Create(
                self.main,
                d,
                { Size = UDim2.new(0, self.main.Size.X.Offset, 0, 0) }
            )
            x:Play()
            x.Completed:Wait()
            if not self.main.Parent then
                return
            end
            for y, z in self._connections do
                self.window:Disconnect(z)
            end
            self.window:DestroySubtree(self.main)
        end
        return Toast
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/toggle
    define(Rayfield_components_toggle, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local Toggle = {}
        Toggle.__index = Toggle
        Toggle.__type = "Toggle"
        local utility = script.Parent.Parent.utility
        local variables, functions, moveable, lockable, locale, HapticEngine =
            require(utility.variables),
            require(utility.functions),
            require(utility.moveable),
            require(utility.lockable),
            require(utility.locale),
            require(utility.HapticEngine)

        function Toggle.new(am, b)
            b = if typeof(b) == "table" then b else {}
            local c = setmetatable({
                tab = assert(am, "Missing argument #1 (Tab expected)"),
                window = am.window,
                name = b.name or b.Name or "Switch",
                icon = b.icon or b.Icon,
                description = b.description or b.Description,
                forgetState = b.forgetState or b.ForgetState or am.forgetState,
                compact = am.compact or false,
                flag = b.flag
                    or b.Flag
                    or (
                        not (b.forgetState or b.ForgetState or am.forgetState)
                            and functions.deriveFlagFromName(b.name or b.Name or "Switch")
                        or nil
                    ),
                callback = b.callback or b.Callback or function() end,
                value = if (b.value or b.Value) ~= nil then (b.value or b.Value) else false,
            }, Toggle)
            c.window:_registerControl(c)
            if c.compact then
                c:_buildCompact()
            else
                c:_buildFull()
            end
            if c.description and not c.compact then
                c.descriptor = require(script.Parent.descriptor).new(c.tab, { description = c.description })
            end
            return c
        end

        function Toggle._buildSwitch(self, b)
            local c = self.window
            self.functionContainer = c:Create(
                "Frame",
                { BorderSizePixel = 0, Size = UDim2.fromOffset(50, 21), BackgroundTransparency = 1, Parent = b },
                { BackgroundColor3 = "ToggleTrack" }
            )
            c:Create("UICorner", { CornerRadius = UDim.new(0, 15), Parent = self.functionContainer })
            self.containerStroke = c:Create(
                "UIStroke",
                { Transparency = 1, Parent = self.functionContainer },
                { Color = "SurfaceStroke" }
            )
            self.indicator = c:Create("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromOffset(25, 17),
                Position = self.value and UDim2.new(1, -28, 0.5, 0) or UDim2.new(1, -47, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = self.value and self.window.theme.AccentColor
                    or self.window.theme.ToggleKnobOff,
                BackgroundTransparency = 1,
                Parent = self.functionContainer,
            })
            c:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.indicator })
            self.indicatorStroke = c:Create("UIStroke", {
                Color = self.value and self.window.theme.AccentStroke or Color3.fromRGB(255, 255, 255),
                Transparency = 1,
                Parent = self.indicator,
            })
            self.indicatorGlow = c:CreateGlow(self.indicator, "AccentColor", 20, 1)
            self.overlay = c:Create("Frame", {
                BorderSizePixel = 0,
                Size = UDim2.fromScale(1, 1),
                Position = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.new(0, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = self.functionContainer,
            }, {
                Visible = "DarkToggleOverlay",
            })
            c:Create("UICorner", { CornerRadius = UDim.new(0, 15), Parent = self.overlay })
            self.overlayGradient = c:Create("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
                }),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(1, 0.35),
                }),
                Parent = self.overlay,
            })
            return self.functionContainer
        end

        function Toggle._performToggle(self)
            HapticEngine.click()
            self.value = not self.value
            self:_animateIndicator()
            self.window:_runGuarded(self, self.callback, self.value)
            self.window:_persist(self)
        end

        function Toggle._buildFull(self)
            local b = self.window
            self.main = b:Create("Frame", {
                Size = UDim2.new(1, -20, 0, 41),
                BorderSizePixel = 0,
                Name = self.name,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Parent = self.tab.tabPage,
            }, {
                BackgroundTransparency = "ElementTransparency",
            })
            self.stroke = b:StyleElementBody(self.main)
            self.hoverOverlay = b:CreateHoverOverlay(self.main)
            self.container = b:Create("Frame", {
                BorderSizePixel = 0,
                Parent = self.main,
                Size = UDim2.new(0, 170, 0, 16),
                Position = UDim2.new(0, 20, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
            })
            self.containerLayout = b:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Parent = self.container,
            })
            if self.icon then
                self.iconLabel = b:Create("ImageLabel", {
                    Image = self.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    ImageTransparency = 1,
                    Parent = self.container,
                }, { ImageColor3 = "ContentColor" })
            end
            self.title = b:Create("TextLabel", {
                Text = locale.t(self.name),
                Size = UDim2.fromOffset(250, 16),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                AutomaticSize = Enum.AutomaticSize.X,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                LayoutOrder = 1,
                TextTransparency = 1,
                Parent = self.container,
            }, {
                TextColor3 = "ContentColor",
                FontFace = "Font",
            })
            self.interact = b:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                BorderSizePixel = 0,
                Position = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5),
                TextTransparency = 1,
                ZIndex = 10,
                Parent = self.main,
            })
            self:_buildSwitch(self.main)
            self.functionContainer.Position = UDim2.new(1, -15, 0, 20)
            self.functionContainer.AnchorPoint = Vector2.new(1, 0.5)
            self.window:_wireElementHover(self)
            self.window:ConnectFor(self, self.interact.MouseButton1Click, function()
                variables.tweenService
                    :Create(self.stroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Transparency = 1,
                    })
                    :Play()
                variables.tweenService
                    :Create(
                        self.main,
                        TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        { Size = UDim2.new(1, -26, 0, 41) }
                    )
                    :Play()
                self:_performToggle()
                task.wait(0.11)
                variables.tweenService
                    :Create(
                        self.main,
                        TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        { Size = UDim2.new(1, -20, 0, 41) }
                    )
                    :Play()
                variables.tweenService
                    :Create(
                        self.stroke,
                        TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { Transparency = self.window.theme.ElementStrokeTransparency }
                    )
                    :Play()
            end)
        end

        function Toggle._buildCompact(self)
            local b = self.window
            self.main, self.stroke, self.interact = b:_buildCompactRow(self.tab, self.name, 10)
            self.hoverOverlay = self.interact
            b:Create(
                "UIPadding",
                { PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15), Parent = self.interact }
            )
            b:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
                Padding = UDim.new(0, 10),
                Parent = self.interact,
            })
            self.container = b:Create("Frame", {
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, 16),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 0,
                Parent = self.interact,
            })
            b:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.container })
            b:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                Parent = self.container,
            })
            if self.icon then
                self.iconLabel = b:Create("ImageLabel", {
                    Image = self.icon,
                    Size = UDim2.fromOffset(16, 16),
                    BorderSizePixel = 0,
                    BackgroundTransparency = 1,
                    LayoutOrder = 0,
                    ImageTransparency = 1,
                    Parent = self.container,
                }, { ImageColor3 = "ContentColor" })
            end
            self.title = b:Create("TextLabel", {
                Text = locale.t(self.name),
                Size = UDim2.fromOffset(0, 16),
                AutomaticSize = Enum.AutomaticSize.X,
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                LayoutOrder = 1,
                TextTransparency = 1,
                Parent = self.container,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
            b:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.title })
            self:_buildSwitch(self.interact)
            self.functionContainer.LayoutOrder = 1
            self.window:_wireElementHover(self)
            self.window:ConnectFor(self, self.interact.MouseButton1Click, function()
                variables.tweenService
                    :Create(self.stroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Transparency = 1,
                    })
                    :Play()
                self:_performToggle()
                task.wait(0.11)
                variables.tweenService
                    :Create(
                        self.stroke,
                        TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { Transparency = self.window.theme.ElementStrokeTransparency }
                    )
                    :Play()
            end)
        end

        function Toggle._animateIndicator(self)
            local b = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
            if self.indicatorGlow then
                variables.tweenService
                    :Create(
                        self.indicatorGlow,
                        b,
                        { Transparency = self.value and self.window.theme.AccentGlow or 1 }
                    )
                    :Play()
            end
            if self.value then
                variables.tweenService
                    :Create(self.indicator, b, {
                        Position = UDim2.new(1, -28, 0.5, 0),
                        BackgroundColor3 = self.window.theme.AccentColor,
                        BackgroundTransparency = 0,
                    })
                    :Play()
                variables.tweenService
                    :Create(self.indicatorStroke, b, { Color = self.window.theme.AccentStroke, Transparency = 0 })
                    :Play()
            else
                variables.tweenService
                    :Create(self.indicator, b, {
                        Position = UDim2.new(1, -47, 0.5, 0),
                        BackgroundColor3 = self.window.theme.ToggleKnobOff,
                        BackgroundTransparency = self.window.theme.ToggleKnobOffTransparency,
                    })
                    :Play()
                variables.tweenService
                    :Create(
                        self.indicatorStroke,
                        b,
                        { Color = Color3.fromRGB(255, 255, 255), Transparency = 0.7 }
                    )
                    :Play()
            end
        end
        local am, b =
            TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0.35)

        function Toggle._setShown(self, d, e)
            local f = self.window
            if d then
                f:_revealCommon(self, e)
                f:_reveal(self.indicator, {
                    BackgroundColor3 = self.value and f.theme.AccentColor or f.theme.ToggleKnobOff,
                    BackgroundTransparency = self.value and 0 or f.theme.ToggleKnobOffTransparency,
                }, e, am)
                f:_reveal(self.indicatorStroke, {
                    Color = self.value and f.theme.AccentStroke or Color3.fromRGB(255, 255, 255),
                    Transparency = self.value and 0 or 0.7,
                }, e, am)
                f:_reveal(self.indicatorGlow, { Transparency = self.value and f.theme.AccentGlow or 1 }, e, b)
                f:_reveal(self.overlay, { BackgroundTransparency = 0 }, e, am)
                f:_reveal(self.containerStroke, { Transparency = 0.85 }, e, am)
                f:_reveal(
                    self.functionContainer,
                    { BackgroundTransparency = f.theme.ToggleTrackTransparency },
                    e,
                    am
                )
            else
                f:_hideCommon(self, e)
                f:_reveal(self.indicator, { BackgroundTransparency = 1 }, e, am)
                f:_reveal(self.indicatorStroke, { Transparency = 1 }, e, am)
                f:_reveal(self.indicatorGlow, { Transparency = 1 }, e, b)
                f:_reveal(self.overlay, {
                    BackgroundTransparency = 1,
                }, e, am)
                f:_reveal(self.containerStroke, { Transparency = 1 }, e, am)
                f:_reveal(self.functionContainer, {
                    BackgroundTransparency = 1,
                }, e, am)
            end
        end

        function Toggle._refreshTheme(self)
            local d, e, f =
                self.window.theme,
                TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                variables.tweenService
            f:Create(self.functionContainer, e, { BackgroundTransparency = d.ToggleTrackTransparency }):Play()
            f:Create(self.indicator, e, {
                BackgroundColor3 = self.value and d.AccentColor or d.ToggleKnobOff,
                BackgroundTransparency = self.value and 0 or d.ToggleKnobOffTransparency,
            }):Play()
            f:Create(
                self.indicatorStroke,
                e,
                { Color = self.value and d.AccentStroke or Color3.fromRGB(255, 255, 255) }
            ):Play()
            if self.indicatorGlow then
                f:Create(self.indicatorGlow, e, {
                    Transparency = self.value and d.AccentGlow or 1,
                }):Play()
            end
        end

        function Toggle._minWidth(self)
            local d = 90
            if self.icon then
                d += 21
            end
            d += functions.textWidth(self.window.theme.Font, 16, locale.resolve(self.name))
            return d
        end
        moveable(Toggle)
        lockable(Toggle)

        function Toggle.Set(self, d, e)
            local f = self.value ~= d
            self.value = d
            if f then
                self:_animateIndicator()
            end
            if not e then
                self.window:_runGuarded(self, self.callback, self.value)
                self.window:_persist(self)
            end
        end
        return Toggle
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/components/window
    define(Rayfield_components_window, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local utility = script.Parent.Parent.utility
        local image, functions, persistence, constants, locale, log, HapticEngine, windowSizing, layouts, chrome, search, sidebar, variables, themes, h =
            require(utility.image),
            require(utility.functions),
            require(utility.persistence),
            require(utility.constants),
            require(utility.locale),
            require(utility.log),
            require(utility.HapticEngine),
            require(utility.windowSizing),
            require(utility.layouts),
            require(script.Parent.chrome),
            require(script.Parent.search),
            require(script.Parent.sidebar),
            require(utility.variables),
            script.Parent.Parent.themes,
            {}
        h.__index = h
        local i, j, k, l, m =
            TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            UDim2.fromOffset(185, 50),
            UDim2.fromOffset(50, 50),
            UDim2.new(0.5, 0, 0, 20),
            UDim2.new(0.5, 0, 0, 12)
        local n, o, p, q, r, s, t, u, v =
            UDim2.new(0.5, 0, 0, l.Y.Offset + j.Y.Offset + 12),
            TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            320,
            41,
            0.55,
            0.55,
            0.04,
            8,
            2

        local function w(x): UDim2
            local y = variables.workspace.CurrentCamera
            return windowSizing.fit(y and y.ViewportSize, x)
        end
        local x, y =
            { "TopLeftRadius", "TopRightRadius", "BottomLeftRadius", "BottomRightRadius" }, (function()
                return (pcall(function()
                    local x = Instance.new("UICorner")
                    x.TopLeftRadius = UDim.new(0, 1)
                    x:Destroy()
                end))
            end)()

        local function z(A)
            return if A then layouts.sidebar else layouts.top
        end
        local A = {
            WindowColor = true,
            ElementGradient = true,
            ElementStrokeGradient = true,
            TabBackground = true,
            TabStroke = true,
            SliderProgress = true,
        }

        local function B(C, D)
            if A[C] and typeof(D) == "Color3" then
                return ColorSequence.new(D)
            end
            return D
        end

        local function C(D)
            return if typeof(D) == "ColorSequence" then D.Keypoints[1].Value else D
        end

        local function D(E, F)
            local G = E._toastsTop
            if not G then
                return
            end
            local H = if E._collapsedShown then n else m
            if not F or G.Position == H then
                G.Position = H
                return
            end
            variables.tweenService:Create(G, o, { Position = H }):Play()
        end

        local function E(F, G)
            local H = 0.299 * F.R + 0.587 * F.G + 0.114 * F.B
            local I = if H > 0.5 then Color3.new(0, 0, 0) else Color3.new(1, 1, 1)
            return F:Lerp(I, G)
        end

        local function F(G, H)
            if H.ElementGradient then
                local I = C(G.ElementGradient)
                if H.ElementStroke == nil then
                    G.ElementStroke = E(I, 0.28)
                end
                if H.ElementStrokeGradient == nil then
                    G.ElementStrokeGradient = ColorSequence.new(E(I, 0.4))
                end
                if H.ElementStrokeHover == nil then
                    G.ElementStrokeHover = E(I, 0.52)
                end
            end
            if H.TabBackground and H.TabStroke == nil then
                G.TabStroke = ColorSequence.new(E(C(G.TabBackground), 0.4))
            end
        end

        local function G(H)
            if typeof(H) == "table" then
                return H
            elseif typeof(H) == "string" then
                local I = themes:FindFirstChild(string.lower(H))
                if I then
                    return require(I)
                end
                log.warn("Rayfield: unknown theme '" .. H .. "', using default")
            elseif H ~= nil then
                log.warn([[Rayfield: invalid theme (expected a built-in name or a theme table), using default]])
            end
            return require(themes.default)
        end

        local function H(I)
            local default, K = table.clone(require(themes.default)), G(I)
            for L, M in K do
                default[L] = B(L, M)
            end
            if typeof(I) == "table" then
                F(default, K)
            end
            local L = if typeof(I) == "table" then I else nil
            if not (L and (L.Font or L.font)) then
                default.Font = variables.brandFont(Enum.FontWeight.Medium)
            end
            if not (L and (L.TitleFont or L.titleFont)) then
                default.TitleFont = variables.brandFont(Enum.FontWeight.SemiBold)
            end
            return default
        end

        function h.new(I)
            I = if typeof(I) == "table" then I else {}
            if I.translations or I.Translations then
                locale.register(I.translations or I.Translations)
            end
            if I.translator or I.Translator then
                locale.translator = I.translator or I.Translator
            end
            locale.setActive(I.locale or I.Locale or locale.detect())
            local default = I.fallbackFont or I.FallbackFont
            if default then
                variables.setFallbackFont(default)
            end
            local K = z(I.sidebarLayout or I.SidebarLayout)
            local L = setmetatable({
                name = I.name or I.Name or "Rayfield Window",
                subheading = I.subtitle or I.Subtitle,
                layout = K,
                size = w(K.mode),
                instances = {},
                connections = {},
                icon = I.icon or I.Icon,
                showName = I.showName or I.ShowName or "Rayfield",
                showIcon = I.showIcon or I.ShowIcon or constants.icons.rayfield,
                showIconOnly = I.showIconOnly or I.ShowIconOnly or false,
                profileText = I.profile or I.Profile,
                themeProperties = {},
                localeProperties = {},
                tabs = {},
                tabSections = {},
                tags = {},
                selectedTab = nil,
                theme = H(I.theme or I.Theme),
                controls = {},
                configuration = (function()
                    local L = I.configuration or I.Configuration
                    if not L then
                        return {}
                    end
                    return {
                        autoSave = L.autoSave or L.AutoSave,
                        autoLoad = L.autoLoad or L.AutoLoad,
                        fileName = L.fileName or L.FileName,
                        customFolder = L.customFolder or L.CustomFolder,
                    }
                end)(),
            }, h)
            L.Flags = setmetatable({}, {
                __index = function(M, N)
                    local O = L.controls[N]
                    return O and O.value
                end,
                __newindex = function(M, N, O)
                    local P = L.controls[N]
                    if not P then
                        log.warn("Rayfield: no flag '" .. tostring(N) .. "' to set")
                        return
                    end
                    P:Set(O)
                end,
                __iter = function()
                    local M
                    return function()
                        local N
                        M, N = next(L.controls, M)
                        if M then
                            return M, N.value
                        end
                        return nil
                    end
                end,
            })
            L.settings = {
                toggleKeybind = Enum.KeyCode.K,
                mouseOverride = true,
                keepOnScreen = true,
                welcomeToast = true,
                haptics = true,
                showProfile = true,
            }
            L.screenGui = L:Create("ScreenGui", {
                Name = variables.httpService:GenerateGUID(false),
                IgnoreGuiInset = true,
                ResetOnSpawn = false,
                Enabled = true,
                DisplayOrder = constants.displayOrder.window,
                ZIndexBehavior = Enum.ZIndexBehavior.Global,
                Parent = variables.guiContainer,
            })
            L.main = L:Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Name = L.name,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Size = UDim2.fromOffset((L.size.X.Offset - 50), 0),
                BackgroundTransparency = 1,
                Visible = false,
                Parent = L.screenGui,
            })
            L.drag = require(script.Parent.drag).new(L)
            L.windowCorner = L:Create("UICorner", { Parent = L.main }, { CornerRadius = "CornerRoundness" })
            L.windowStroke = L:Create(
                "UIStroke",
                { Transparency = 1, Parent = L.main },
                { Color = "SurfaceStroke" }
            )
            L.windowGradient = L:Create(
                "UIGradient",
                { Rotation = 270, Offset = Vector2.new(0, -0.1), Parent = L.main },
                { Color = { "WindowColor", functions.toColorSequence } }
            )
            L.bottomFade = L:Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(1, 1),
                Position = UDim2.fromScale(1, 1),
                Size = L.layout.fadeSize,
                ZIndex = constants.zIndex.bottomFade,
                BackgroundTransparency = 1,
                Parent = L.main,
            })
            L.bottomFadeCorner = L:_roundCorners(L.bottomFade, L.layout.fadeCorners)
            L.bottomFadeGradient = L:Create("UIGradient", {
                Rotation = 270,
                Offset = Vector2.new(0, 0.2),
                Transparency = L.layout.fadeTransparency,
                Parent = L.bottomFade,
            }, {
                Color = {
                    "WindowColor",
                    function(M)
                        return ColorSequence.new(functions.toColorSequence(M).Keypoints[1].Value)
                    end,
                },
            })
            L.topbar = L:Create("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 0, L.layout.topbarHeight),
                Active = true,
                Parent = L.main,
            })
            L.topContainer = L:Create("Frame", {
                Size = UDim2.new(0, 300, 0, 24),
                Position = UDim2.new(0, 25, 0.5, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                Parent = L.topbar,
            })
            L.topContainerLayout = L:Create("UIListLayout", {
                Padding = UDim.new(0, 8),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = L.topContainer,
            })
            L.titleContainer = L:Create("Frame", {
                Size = UDim2.fromOffset(50, 24),
                Position = UDim2.new(0, 25, 0.5, 0),
                AutomaticSize = Enum.AutomaticSize.XY,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Parent = L.topContainer,
            })
            L.titleContainerLayout = L:Create("UIListLayout", {
                Padding = UDim.new(0, 3),
                FillDirection = Enum.FillDirection.Vertical,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = L.titleContainer,
            })
            if L.name then
                L.title = L:Create("TextLabel", {
                    Text = locale.t(L.name),
                    FontFace = variables.brandFont(Enum.FontWeight.Medium),
                    Size = UDim2.fromOffset(50, 20),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundTransparency = 1,
                    TextSize = 20,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    TextTransparency = 1,
                    Parent = L.titleContainer,
                }, { FontFace = "Font", TextColor3 = "TitlingColor" })
            end
            if L.icon then
                L.topbarIcon = L:Create("ImageLabel", {
                    Image = L.icon,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromOffset(32, 32),
                    ImageTransparency = 1,
                    Parent = L.topContainer,
                }, { ImageColor3 = "TitlingColor" })
            end
            if L.subheading then
                L.subtitle = L:Create("TextLabel", {
                    Text = locale.t(L.subheading),
                    Size = UDim2.fromOffset(50, 12),
                    AutomaticSize = Enum.AutomaticSize.X,
                    BackgroundTransparency = 1,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextWrapped = true,
                    TextTransparency = 1,
                    Parent = L.titleContainer,
                }, { TextColor3 = "TitlingColor", FontFace = "Font" })
            end
            L.tagContainer = L:Create("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 25, 0.5, 0),
                Size = UDim2.fromOffset(50, 24),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Visible = false,
                Parent = L.topContainer,
            })
            L.tagContainerLayout = L:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = L.tagContainer,
            })
            L.windowShadow = L:CreateGlow(L.main, "ShadowColor", 20, 1)
            L.elements = L:Create("Frame", {
                Size = UDim2.new(1, 0, 1, -L.layout.chromeHeight),
                Position = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(1, 1),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                ClipsDescendants = true,
                Parent = L.main,
            })
            if L.layout.mode == "sidebar" then
                L.elementsCorner = L:_roundCorners(L.elements, L.layout.cardCorners)
                L.elementsStroke = L:Create(
                    "UIStroke",
                    { ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Transparency = 1, Parent = L.elements },
                    { Color = "SurfaceStroke" }
                )
                L:Create("UIGradient", {
                    Rotation = L.layout.cardStrokeRotation,
                    Transparency = L.layout.cardStrokeTransparency,
                    Parent = L.elementsStroke,
                })
            end
            L.elementsLayout = L:Create("UIPageLayout", {
                Padding = UDim.new(0, 0),
                FillDirection = L.layout.pageDirection,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                ScrollWheelInputEnabled = false,
                GamepadInputEnabled = false,
                TouchInputEnabled = false,
                EasingStyle = Enum.EasingStyle.Exponential,
                TweenTime = 0.4,
                Parent = L.elements,
            })
            if L.layout.mode == "sidebar" then
                sidebar.build(L, L.layout)
                sidebar.applyWidth(L, layouts.railWidthFor(L.layout, L.size.X.Offset))
            else
                L.tabList = L:Create("ScrollingFrame", {
                    Name = "Tabs",
                    Active = true,
                    Size = UDim2.new(1, 0, 0, L.layout.tabStripHeight),
                    Position = UDim2.new(0.5, 0, 0, L.layout.tabStripTop),
                    AnchorPoint = Vector2.new(0.5, 0),
                    BackgroundTransparency = 1,
                    AutomaticCanvasSize = Enum.AutomaticSize.X,
                    CanvasSize = UDim2.new(0, 0, 0, 0),
                    ScrollBarThickness = 0,
                    ScrollBarImageTransparency = 1,
                    ScrollingDirection = Enum.ScrollingDirection.X,
                    Parent = L.main,
                })
                L.tabListLayout = L:Create("UIListLayout", {
                    Padding = UDim.new(0, 7),
                    FillDirection = Enum.FillDirection.Horizontal,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Parent = L.tabList,
                })
                L:Create(
                    "UIPadding",
                    { PaddingLeft = UDim.new(0, 22), PaddingRight = UDim.new(0, 10), Parent = L.tabList }
                )
            end
            L.actionContainer = L:Create("Frame", {
                AnchorPoint = Vector2.new(1, 0.5),
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, 24),
                Position = UDim2.new(1, -20, 0.5, 0),
                BackgroundTransparency = 1,
                Parent = L.topbar,
            })
            L.actionsListLayout = L:Create("UIListLayout", {
                Padding = UDim.new(0, 5),
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = L.actionContainer,
            })
            L.rfSettings = L:CreateTab({
                name = "Rayfield Settings",
                customOrder = 1000,
                neglectSelector = true,
                forgetState = true,
            })
            require(script.Parent.action).new(L, {
                name = "Close",
                icon = constants.icons.close,
                order = 1,
                callback = function()
                    L:ToggleHide()
                end,
            })
            L.minimiseAction = require(script.Parent.action).new(L, {
                name = "Minimise",
                icon = constants.icons.minimise,
                order = 2,
                callback = function()
                    L:ToggleMinimise()
                end,
            })
            L.settingsAction = require(script.Parent.action).new(L, {
                name = "Settings",
                icon = constants.icons.settings,
                order = 3,
                linkedTab = L.rfSettings,
                callback = function()
                    L.rfSettings:Select()
                end,
            })
            search.build(L)
            L:_applyRailWidth()
            L.unloaded = false
            L.minimised = false
            L.hidden = true
            L.animating = false
            L._revealing = false
            L.hasShownOnce = false
            L._collapsedShown = false
            L:LoadSettings()
            if L.layout.mode == "sidebar" then
                sidebar.reflowProfile(L)
                sidebar.setSubtitle(L, L.profileText)
            end
            HapticEngine.setContainer(L.screenGui)
            HapticEngine.setEnabled(L.settings.haptics)
            chrome.buildCollapsedFace(L)
            L:_bindKeybind()
            L:_bindMouseOverride()
            L:_bindTopbarDrag()
            L:_watchViewport()
            L:_buildSettingsUI()
            L:_syncLiveAnimation()
            return L
        end

        function h._syncLiveAnimation(self)
            if not self.theme.LiveAnimation then
                self._liveAnimating = false
                return
            end
            if self._liveAnimating then
                return
            end
            self._liveAnimating = true
            self._liveGeneration = (self._liveGeneration or 0) + 1
            local default = self._liveGeneration
            task.spawn(function()
                local K, L = true, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                while self._liveGeneration == default and self._liveAnimating and not self.unloaded do
                    local M = variables.tweenService:Create(
                        self.windowGradient,
                        L,
                        { Offset = Vector2.new(if K then 0.4 else -0.2, 0), Rotation = (if K then 220 else 280) }
                    )
                    self._liveTween = M
                    M:Play()
                    M.Completed:Wait()
                    K = not K
                end
                if self._liveGeneration == default then
                    self._liveAnimating = false
                    self._liveTween = nil
                end
            end)
        end

        function h.ChangeTheme(self, default)
            local K = if typeof(default) == "table" then default else H(default)
            for L, M in K do
                self.theme[L] = B(L, M)
            end
            if typeof(default) == "table" then
                F(self.theme, K)
            end
            for L, M in self.themeProperties do
                for N, O in M do
                    local P = if typeof(O) == "table" then O[2](self.theme[O[1]]) else self.theme[O]
                    if typeof(P) == "Color3" or typeof(P) == "number" then
                        variables.tweenService
                            :Create(
                                L,
                                TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                                { [N] = P }
                            )
                            :Play()
                    else
                        L[N] = P
                    end
                end
            end
            if self.hidden then
                self._themeRefreshPending = true
            else
                self:_refreshElementThemes()
            end
            self:_syncLiveAnimation()
        end

        function h._refreshElementThemes(self)
            for default, K in self.tabs do
                for L, M in K.elements do
                    if M._refreshTheme then
                        M:_refreshTheme()
                    end
                end
            end
        end

        function h.CreateTab(self, default)
            assert(not self.unloaded, "Cannot create a tab on an unloaded window.")
            local K = require(script.Parent.tab).new(self, default)
            table.insert(self.tabs, K)
            if not K.neglectSelector then
                local L = true
                for M, N in self.tabs do
                    if N ~= K and not N.neglectSelector then
                        L = false
                        break
                    end
                end
                if L then
                    K:Select(true)
                end
                if not self.hidden and not self.minimised then
                    K.topbarItem.Visible = true
                    K:_applyVisual(
                        if self.selectedTab == K then "selected" else "unselected",
                        TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                    )
                end
            end
            return K
        end

        function h.CreateSection(self, default)
            assert(not self.unloaded, "Cannot create a section on an unloaded window.")
            local K = require(script.Parent.tabSection).new(self, default)
            table.insert(self.tabSections, K)
            if not K.inert and not self.hidden and not self.minimised then
                K:_setVisible(true)
                K:_setShown(true, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out))
            end
            return K
        end

        function h._setTabSectionsShown(self, default, K)
            for L, M in self.tabSections do
                M:_setShown(default, K)
            end
        end

        function h._setTabSectionsVisible(self, default)
            for K, L in self.tabSections do
                L:_setVisible(default)
            end
        end

        function h.CreateTag(self, default)
            assert(not self.unloaded, "Cannot create a tag on an unloaded window.")
            local K = require(script.Parent.tag).new(self, default)
            table.insert(self.tags, K)
            return K
        end

        function h._registerControl(self, default)
            if not default.flag or default.flag == "" or default.forgetState then
                return
            end
            local K = default.flag
            if self.controls[K] then
                local L = 2
                while self.controls[K .. L] do
                    L += 1
                end
                K = K .. L
                log.warn(
                    "Rayfield: duplicate config flag '"
                        .. default.flag
                        .. "', saving this one as '"
                        .. K
                        .. "'. Set a unique flag to keep it stable across sessions."
                )
            end
            default.flag = K
            self.controls[K] = default
            return K
        end

        function h._restoreLate(self, default)
            if not self._loadedConfig or not default.flag or default.forgetState then
                return
            end
            local K = self._loading
            self._loading = true
            persistence.applyTo(default, self._loadedConfig[default.flag])
            self._loading = K
        end

        function h._persist(self, default)
            if default.flag and not default.forgetState and self.configuration.autoSave and not self._loading then
                task.spawn(self.Save, self)
            end
        end

        function h._unregisterControl(self, default)
            if default.flag and self.controls[default.flag] == default then
                self.controls[default.flag] = nil
            end
        end

        function h._keybindUsing(self, default, K)
            if typeof(default) ~= "EnumItem" or default == Enum.KeyCode.Unknown then
                return nil
            end
            for L, M in self.tabs do
                for N, O in M.elements do
                    if O ~= K and O.__type == "Keybind" and O.value == default then
                        return O
                    end
                end
            end
            return nil
        end

        function h.Notify(self, default)
            if self.unloaded then
                return
            end
            if not self.notifications then
                self.notifications = self:Create("Frame", {
                    Name = "Notifications",
                    Size = UDim2.new(0, 300, 0, 800),
                    Position = UDim2.new(1, -20, 1, -20),
                    AnchorPoint = Vector2.new(1, 1),
                    BackgroundTransparency = 1,
                    Parent = self.screenGui,
                })
                self:Create("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = Enum.VerticalAlignment.Bottom,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 0),
                    Parent = self.notifications,
                })
            end
            return require(script.Parent.notification).new(self, default)
        end

        function h.Toast(self, default)
            if self.unloaded then
                return
            end
            default = if typeof(default) == "table" then default else {}
            local K = default.position or default.Position or "Top"
            local L = typeof(K) ~= "string" or K:lower() ~= "bottom"
            default.position = if L then "Top" else "Bottom"
            local M = if L then "_toastsTop" else "_toastsBottom"
            local N = self[M]
            if not N then
                N = self:Create("Frame", {
                    Name = "Toasts",
                    Size = UDim2.new(0, p, 1, -24),
                    Position = if L then m else UDim2.new(0.5, 0, 1, -12),
                    AnchorPoint = if L then Vector2.new(0.5, 0) else Vector2.new(0.5, 1),
                    BackgroundTransparency = 1,
                    ZIndex = constants.zIndex.toast,
                    Parent = self.screenGui,
                })
                self:Create("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    VerticalAlignment = if L then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Bottom,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, 0),
                    Parent = N,
                })
                self[M] = N
                if L then
                    D(self, false)
                end
            end
            return require(script.Parent.toast).new(self, default, N)
        end

        function h.Popup(self, default)
            if self.unloaded then
                return
            end
            return require(script.Parent.popup).new(self, default)
        end

        function h.Hide(self)
            if self.animating or self.hidden then
                return
            end
            if self._searching then
                search.close(self, { showTabs = false, jumpTo = self.selectedTab and self.selectedTab.tabPage })
            end
            if self._recordingKeybind then
                self._recordingKeybind:_stopRecording()
            end
            self.animating = true
            self._revealing = true
            self.hidden = true
            self.collapsedInteract.Visible = false
            if self.minimised then
                self.minimised = false
                image.assign(self.minimiseAction.iconLabel, "Image", constants.icons.minimise)
            end
            self._restorePosition = self.main.Position
            local default, K = self:_collapsedRect()
            local L, M, N, O =
                TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            variables.tweenService
                :Create(self.drag.dragCosmetic, L, { Size = UDim2.fromOffset(0, 4), BackgroundTransparency = 1 })
                :Play()
            task.delay(0.18, function()
                if not self.hidden then
                    return
                end
                self.drag.drag.Visible = false
            end)
            self:_fadeSurfaces(false, L)
            if self.title then
                variables.tweenService:Create(self.title, L, { TextTransparency = 1 }):Play()
            end
            if self.subtitle then
                variables.tweenService:Create(self.subtitle, L, { TextTransparency = 1 }):Play()
            end
            if self.topbarIcon then
                variables.tweenService:Create(self.topbarIcon, L, { ImageTransparency = 1 }):Play()
            end
            for P, Q in ipairs(self.actionContainer:GetChildren()) do
                if Q:IsA("Frame") then
                    variables.tweenService:Create(Q.ImageLabel, L, { ImageTransparency = 1 }):Play()
                end
            end
            for P, Q in self.tags do
                Q:_setShown(false, L)
            end
            for P, Q in pairs(self.tabs) do
                if not Q.neglectSelector and Q.topbarItem then
                    Q:_applyVisual("hidden", L)
                end
            end
            self:_setTabSectionsShown(false, L)
            self:_fadeSelectedElementsOut()
            local P = variables.tweenService:Create(self.main, M, { Size = K, Position = default })
            P.Completed:Connect(function()
                if self.unloaded or not self.hidden then
                    return
                end
                self._collapsedShown = true
                D(self, true)
                self.collapsedInteract.Visible = true
                self.animating = false
                self._revealing = false
            end)
            P:Play()
            variables.tweenService:Create(self.windowCorner, N, { CornerRadius = UDim.new(1, 0) }):Play()
            task.delay(0.18, function()
                if not self.hidden then
                    return
                end
                self.topbar.Visible = false
                self:_setContentVisible(false)
                chrome.setCollapsedShown(self, true, O)
            end)
        end

        function h.ToggleHide(self)
            if self.animating then
                return
            end
            if self.hidden then
                self:Show()
            else
                self:Hide()
            end
        end

        function h.ToggleMinimise(self)
            if self.animating or self.hidden then
                return
            end
            if self._searching then
                search.close(self, { showTabs = true })
            end
            self.animating = true
            local default, K =
                TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
            if self.minimised then
                self.minimised = false
                image.assign(self.minimiseAction.iconLabel, "Image", constants.icons.minimise)
                variables.tweenService:Create(self.main, default, { Size = self.size }):Play()
                self:_fadeSurfaces(true, K)
                variables.tweenService
                    :Create(self.drag.drag, default, {
                        Position = UDim2.new(
                            self.main.Position.X.Scale,
                            self.main.Position.X.Offset,
                            self.main.Position.Y.Scale,
                            self.main.Position.Y.Offset + self.size.Y.Offset / 2 + 15
                        ),
                    })
                    :Play()
                task.delay(0.2, function()
                    if self.minimised or self.hidden then
                        return
                    end
                    self:_setContentVisible(true)
                    for L, M in pairs(self.tabs) do
                        if not M.neglectSelector and M.topbarItem then
                            M.topbarItem.Visible = true
                            M:_applyVisual(if self.selectedTab == M then "selected" else "unselected", K)
                        end
                    end
                    self:_setTabSectionsVisible(true)
                    self:_setTabSectionsShown(true, K)
                    self:_revealElements(0.035, 0.4)
                end)
                task.delay(0.5, function()
                    self.animating = false
                end)
            else
                self.minimised = true
                image.assign(self.minimiseAction.iconLabel, "Image", constants.icons.maximise)
                self:_fadeSelectedElementsOut()
                for L, M in pairs(self.tabs) do
                    if not M.neglectSelector and M.topbarItem then
                        M:_applyVisual("hidden", K)
                    end
                end
                self:_setTabSectionsShown(false, K)
                task.delay(0.3, function()
                    if not self.minimised then
                        return
                    end
                    self:_setContentVisible(false)
                    for L, M in pairs(self.tabs) do
                        if not M.neglectSelector and M.topbarItem then
                            M.topbarItem.Visible = false
                        end
                    end
                    self:_setTabSectionsVisible(false)
                end)
                self:_fadeSurfaces(false, K)
                variables.tweenService
                    :Create(
                        self.main,
                        default,
                        { Size = UDim2.fromOffset(self.size.X.Offset, self.layout.topbarHeight) }
                    )
                    :Play()
                variables.tweenService
                    :Create(self.drag.drag, default, {
                        Position = UDim2.new(
                            self.main.Position.X.Scale,
                            self.main.Position.X.Offset,
                            self.main.Position.Y.Scale,
                            self.main.Position.Y.Offset + self.layout.topbarHeight / 2 + 15
                        ),
                    })
                    :Play()
                task.delay(0.5, function()
                    self.animating = false
                end)
            end
        end

        function h._syncDragBar(self)
            local default = self.drag and self.drag.drag
            if not default then
                return
            end
            local K, L = self.main.Position, self.size.Y.Offset / 2 + 15
            default.Position = UDim2.new(K.X.Scale, K.X.Offset, K.Y.Scale, K.Y.Offset + L)
        end

        function h._clampedPosition(self, default: UDim2): UDim2
            if not self.settings or not self.settings.keepOnScreen then
                return default
            end
            if default.X.Scale ~= 0 or default.Y.Scale ~= 0 then
                return default
            end
            local K, L, M, N = self.screenGui.AbsoluteSize, self.size.X.Offset / 2, self.size.Y.Offset / 2, 8
            local O, P =
                math.clamp(default.X.Offset, L + N, math.max(L + N, K.X - L - N)),
                math.clamp(default.Y.Offset, M + N, math.max(M + N, K.Y - M - N))
            if O == default.X.Offset and P == default.Y.Offset then
                return default
            end
            return UDim2.fromOffset(O, P)
        end

        function h._clampToScreen(self)
            self.main.Position = self:_clampedPosition(self.main.Position)
        end

        function h._applyWindowSize(self)
            if self.unloaded then
                return
            end
            local default = w(self.layout.mode)
            local K = default ~= self.size
            self.size = default
            self:_applyRailWidth()
            if self.hidden or self.minimised or self.animating or self._revealing then
                self._pendingResize = self._pendingResize or K
                return
            end
            if not K and not self._pendingResize then
                return
            end
            self._pendingResize = false
            self.main.Size = default
            self:_clampToScreen()
            self:_syncDragBar()
        end

        function h._applyRailWidth(self)
            if self.layout.mode ~= "sidebar" then
                return
            end
            sidebar.applyWidth(self, layouts.railWidthFor(self.layout, self.size.X.Offset))
        end

        function h._watchViewport(self)
            local default, K: RBXScriptConnection? = false
            local function L()
                if default then
                    return
                end
                default = true
                task.defer(function()
                    default = false
                    self:_applyWindowSize()
                end)
            end
            local function M()
                if K then
                    self:Disconnect(K)
                    K = nil
                end
                local N = variables.workspace.CurrentCamera
                if N then
                    K = self:Connect(N:GetPropertyChangedSignal("ViewportSize"), L)
                end
                L()
            end
            self:Connect(variables.workspace:GetPropertyChangedSignal("CurrentCamera"), M)
            M()
            local N = 0
            self:Connect(variables.runService.Heartbeat, function(O: number)
                N += O
                if N < v then
                    return
                end
                N = 0
                self:_applyWindowSize()
            end)
        end

        function h._bindKeybind(self)
            self:Connect(variables.userInputService.InputBegan, function(default, K)
                if K or self._recordingKeybind then
                    return
                end
                if
                    default.KeyCode == self.settings.toggleKeybind
                    or default.UserInputType == self.settings.toggleKeybind
                then
                    self:ToggleHide()
                end
            end)
        end

        function h._bindMouseOverride(self)
            local default = variables.userInputService
            local function K()
                return self.settings.mouseOverride and not self.hidden and not self.minimised
            end
            local function L()
                if not K() then
                    return
                end
                if default:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                    return
                end
                if default.MouseBehavior ~= Enum.MouseBehavior.Default then
                    default.MouseBehavior = Enum.MouseBehavior.Default
                end
                if not default.MouseIconEnabled then
                    default.MouseIconEnabled = true
                end
            end
            self:Connect(default:GetPropertyChangedSignal("MouseBehavior"), L)
            self:Connect(default:GetPropertyChangedSignal("MouseIconEnabled"), L)
            self:Connect(default.InputEnded, function(M)
                if M.UserInputType == Enum.UserInputType.MouseButton2 then
                    L()
                end
            end)
            self._freeMouse = L
        end

        function h._bindTopbarDrag(self)
            local default, K, L, M = variables.userInputService, false, Vector2.zero, Vector2.zero
            if self.screenGui and self.screenGui.IgnoreGuiInset then
                M = variables.guiService:GetGuiInset()
            end
            local function N()
                local O = default:GetMouseLocation() + L + M
                local P, Q = O.X, O.Y
                if self.settings and self.settings.keepOnScreen then
                    local R, S, T = self.main.AbsoluteSize, self.screenGui.AbsoluteSize, 8
                    local U, V = R.X / 2, R.Y / 2
                    P = math.clamp(P, U + T, math.max(U + T, S.X - U - T))
                    Q = math.clamp(Q, V + T, math.max(V + T, S.Y - V - T))
                end
                return UDim2.fromOffset(P, Q)
            end
            local function O(P, Q)
                for R, S in { self.tabList, self.actionContainer } do
                    local T, U = S.AbsolutePosition, S.AbsoluteSize
                    if P >= T.X and P <= T.X + U.X and Q >= T.Y and Q <= T.Y + U.Y then
                        return true
                    end
                end
                return false
            end
            self:Connect(self.topbar.InputBegan, function(P, Q)
                if Q then
                    return
                end
                local R = P.UserInputType.Name
                if R ~= "MouseButton1" and R ~= "Touch" then
                    return
                end
                if O(P.Position.X, P.Position.Y) then
                    return
                end
                if not self:_interactive() then
                    return
                end
                K = true
                if self.screenGui and self.screenGui.IgnoreGuiInset then
                    M = variables.guiService:GetGuiInset()
                end
                L = self.main.AbsolutePosition
                    + self.main.AbsoluteSize * self.main.AnchorPoint
                    - default:GetMouseLocation()
            end)
            self:Connect(default.InputEnded, function(P)
                local Q = P.UserInputType.Name
                if Q == "MouseButton1" or Q == "Touch" then
                    K = false
                end
            end)
            self:Connect(default.WindowFocusReleased, function()
                K = false
            end)
            self:Connect(variables.runService.RenderStepped, function()
                if not K then
                    return
                end
                if not self:_interactive() then
                    K = false
                    return
                end
                self.main.Position = N()
                if self.drag and self.drag.drag then
                    local P = self.main.Position
                    self.drag.drag.Position = UDim2.new(
                        P.X.Scale,
                        P.X.Offset,
                        P.Y.Scale,
                        P.Y.Offset + (self.main.Size.Y.Offset / 2 + 15)
                    )
                end
            end)
        end

        function h._buildSettingsUI(self)
            self.rfSettings:CreateSection({ name = "General" })
            self.rfSettings:CreateKeybind({
                name = "Toggle Keybind",
                icon = constants.icons.search,
                value = self.settings.toggleKeybind,
                isMenuToggle = true,
                onChanged = function(default)
                    self.settings.toggleKeybind = default
                    self:SaveSettings()
                end,
            })
            self.rfSettings:CreateToggle({
                name = "Unlock cursor while open",
                description = [[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],
                value = self.settings.mouseOverride,
                callback = function(default)
                    self.settings.mouseOverride = default
                    self:SaveSettings()
                end,
            })
            self.rfSettings:CreateToggle({
                name = "Welcome toast",
                description = [[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],
                value = self.settings.welcomeToast,
                callback = function(default)
                    self.settings.welcomeToast = default
                    self:SaveSettings()
                end,
            })
            self.rfSettings:CreateToggle({
                name = "Haptics",
                description = [[A subtle tap as you interact, on devices that support haptics.]],
                value = self.settings.haptics,
                callback = function(default)
                    self.settings.haptics = default
                    HapticEngine.setEnabled(default)
                    self:SaveSettings()
                end,
            })
            self.rfSettings:CreateSection({ name = "Window" })
            if self.layout.mode == "sidebar" and self.profile then
                self.rfSettings:CreateToggle({
                    name = "Show profile",
                    description = [[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
                    value = self.settings.showProfile,
                    callback = function(default)
                        sidebar.setProfileEnabled(self, default)
                        self:SaveSettings()
                    end,
                })
            end
            self.rfSettings:CreateToggle({
                name = "Keep window on screen",
                description = [[Stops the window being dragged off the edge of the screen and lost.]],
                value = self.settings.keepOnScreen,
                callback = function(default)
                    self.settings.keepOnScreen = default
                    self:SaveSettings()
                end,
            })
            self.rfSettings:CreateButton({
                name = "Reset Window Position",
                callback = function()
                    variables.tweenService
                        :Create(
                            self.main,
                            TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                            { Position = UDim2.new(0.5, 0, 0.5, 0) }
                        )
                        :Play()
                    variables.tweenService
                        :Create(
                            self.drag.drag,
                            TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                            { Position = UDim2.new(0.5, 0, 0.5, self.size.Y.Offset / 2 + 15) }
                        )
                        :Play()
                end,
            })
            if next(self.configuration) ~= nil then
                self.rfSettings:CreateSection({ name = "Configurations" })
                local default, K, L = self:ListConfigs()[1]
                local function M()
                    local N = self:ListConfigs()
                    K:Refresh(N)
                    if default and not table.find(N, default) then
                        default = N[1]
                    end
                    if default then
                        K:Set(default, true)
                    end
                end
                K = self.rfSettings:CreateDropdown({
                    name = "Saved Configurations",
                    icon = constants.icons.config,
                    options = self:ListConfigs(),
                    value = default,
                    placeholder = "No saved configurations",
                    callback = function(N)
                        J = N
                    end,
                })
                L = self.rfSettings:CreateInput({
                    name = "Configuration Name",
                    description = [[Name a new configuration, or leave blank to overwrite the selected one.]],
                    placeholder = "e.g. PvP Loadout",
                    clearOnFocus = false,
                })
                local N = self.rfSettings:CreateGroup()
                N:CreateButton({
                    name = "Save",
                    icon = constants.icons.config,
                    callback = function()
                        local O = L.value
                        if O == "" then
                            O = default
                        end
                        if not O or O == "" then
                            self:Toast({ title = locale.resolve("Name your configuration first") })
                            return
                        end
                        if self:Save(O) then
                            L:Set("")
                            J = O
                            M()
                            self:Toast({
                                title = locale.resolve("Saved configuration"),
                                subtitle = O,
                                icon = constants.icons.config,
                            })
                        else
                            self:Toast({
                                title = locale.resolve("Couldn't save configuration"),
                                subtitle = O,
                            })
                        end
                    end,
                })
                N:CreateButton({
                    name = "Load",
                    callback = function()
                        if not default or default == "" then
                            self:Toast({ title = locale.resolve("Pick a configuration to load") })
                            return
                        end
                        if self:_applyNamedConfig(default) then
                            self:Toast({
                                title = locale.resolve("Loaded configuration"),
                                subtitle = default,
                            })
                        else
                            self:Toast({
                                title = locale.resolve("Couldn't load configuration"),
                                subtitle = default,
                            })
                        end
                    end,
                })
                N:CreateButton({
                    name = "Delete",
                    callback = function()
                        local O = default
                        if not O or O == "" then
                            self:Toast({ title = locale.resolve("Pick a configuration to delete") })
                            return
                        end
                        if self:DeleteConfig(O) then
                            M()
                            self:Toast({ title = locale.resolve("Deleted configuration"), subtitle = O })
                        else
                            self:Toast({ title = locale.resolve("Couldn't delete configuration"), subtitle = O })
                        end
                    end,
                })
            end
        end

        function h.SetProfile(self, default)
            self.profileText = default
            sidebar.setSubtitle(self, default)
        end

        function h.SaveSettings(I)
            return persistence.saveSettings(I)
        end

        function h.LoadSettings(I)
            return persistence.loadSettings(I)
        end

        function h._roundCorners(self, default, K)
            if not K or not y then
                return self:Create("UICorner", { Parent = default }, { CornerRadius = "CornerRoundness" })
            end
            local L, M = { Parent = default }, {}
            for N, O in x do
                L[O] = UDim.new(0, 0)
            end
            for N, O in K do
                L[O] = nil
                M[O] = "CornerRoundness"
            end
            return self:Create("UICorner", L, M)
        end

        function h._setElementLocked(self, default, K, L)
            K = K == true
            local M = default.locked == true
            if M == K and not (K and L) then
                return
            end
            default.locked = K
            if not default.lockScrim then
                self:_buildLockScrim(default)
            end
            local N = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            if K then
                default.lockScrim.Visible = true
            end
            variables.tweenService
                :Create(default.lockScrim, N, { BackgroundTransparency = if K then r else 1 })
                :Play()
            if not K then
                task.delay(N.Time, function()
                    if not default.locked and default.lockScrim then
                        default.lockScrim.Visible = false
                    end
                end)
            end
            local O = default.descriptor
            if not O then
                return
            end
            if K then
                default._descriptionBefore = default._descriptionBefore or O.titleLabel.Text
                O.titleLabel.Text = locale.resolve(L or "This element is locked.")
            elseif default._descriptionBefore then
                O.titleLabel.Text = default._descriptionBefore
                default._descriptionBefore = nil
            end
            variables.tweenService:Create(O.titleLabel, N, { TextTransparency = if K then s else 0.7 }):Play()
        end

        function h._buildLockScrim(self, default)
            default.lockScrim = self:Create("TextButton", {
                Name = "ElementLock",
                Active = true,
                AutoButtonColor = false,
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                Text = "",
                TextTransparency = 1,
                ZIndex = constants.zIndex.elementLock,
                Visible = false,
                BackgroundTransparency = 1,
                Parent = default.main,
            }, { BackgroundColor3 = { "WindowColor", C } })
            self:Create("UICorner", { Parent = default.lockScrim }, { CornerRadius = "ElementCornerRadius" })
        end

        function h._setContentVisible(self, default)
            self.elements.Visible = default
            self.tabList.Visible = default
            if self.sidebar then
                self.sidebar.Visible = default
            end
        end

        function h._fadeSurfaces(self, default, K)
            local L = {
                [self.windowShadow] = { Transparency = if default then 0.6 else 1 },
                [self.windowStroke] = { Transparency = if default then 0.95 else 1 },
                [self.bottomFade] = {
                    BackgroundTransparency = if default then 0 else 1,
                },
            }
            if self.elementsStroke then
                L[self.elements] =
                    { BackgroundTransparency = if default then self.layout.cardTransparency else 1 }
                L[self.elementsStroke] = { Transparency = if default then 0 else 1 }
            end
            for M, N in L do
                if K then
                    variables.tweenService:Create(M, K, N):Play()
                else
                    for O, P in N do
                        M[O] = P
                    end
                end
            end
            sidebar.setProfileShown(self, default, K)
        end

        function h._fadeSelectedElementsOut(self)
            if self.selectedTab then
                for default, K in ipairs(self.selectedTab.elements) do
                    K:_setShown(false, true)
                end
            end
        end

        function h._revealElements(self, default, K)
            for L, M in pairs(self.tabs) do
                if M ~= self.selectedTab then
                    for N, O in ipairs(M.elements) do
                        O:_setShown(true, false)
                    end
                end
            end
            local L = self.selectedTab
            if not L then
                return
            end
            local M = L.tabPage
            local N = M.AbsolutePosition.Y
            local O, P, Q = N + M.AbsoluteWindowSize.Y, math.floor(K / default), 0
            for R, S in ipairs(L.elements) do
                local T = S.main.AbsolutePosition.Y
                local U = (T + S.main.AbsoluteSize.Y) > N and T < O
                if U then
                    S:_setShown(true, true)
                    Q += 1
                    if Q <= P then
                        task.wait(default)
                    end
                else
                    S:_setShown(true, false)
                end
            end
        end

        function h.Show(self)
            if self.animating or not self.hidden then
                return
            end
            self.animating = true
            self._revealing = true
            if self.configuration.autoLoad and not self._autoLoaded then
                self._autoLoaded = true
                local default, K = pcall(self.Load, self)
                if not default then
                    log.warn("Rayfield: Failed to load configuration - " .. tostring(K))
                end
            end
            self.hidden = false
            self.minimised = false
            if self._themeRefreshPending then
                self._themeRefreshPending = false
                self:_refreshElementThemes()
            end
            self.collapsedInteract.Visible = false
            if self._freeMouse then
                self._freeMouse()
            end
            if self.hasShownOnce then
                self:_quickRestore()
            else
                self.hasShownOnce = true
                self:_firstShow()
            end
        end

        function h._quickRestore(self)
            local default = self:_clampedPosition(self._restorePosition or UDim2.new(0.5, 0, 0.5, 0))
            self._restorePosition = default
            local K, L, M =
                TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                TweenInfo.new(0.28, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
            chrome.setCollapsedShown(
                self,
                false,
                TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            )
            local N = variables.tweenService:Create(self.main, K, { Size = self.size, Position = default })
            N.Completed:Connect(function()
                if self.hidden or self.unloaded then
                    return
                end
                self._collapsedShown = false
                D(self, true)
            end)
            N:Play()
            variables.tweenService
                :Create(self.windowCorner, L, { CornerRadius = self.theme.CornerRoundness })
                :Play()
            task.delay(0.22, function()
                self.topbar.Visible = true
                self:_setContentVisible(true)
                self:_fadeSurfaces(true, M)
                if self.topbarIcon then
                    variables.tweenService
                        :Create(self.topbarIcon, M, {
                            ImageTransparency = 0,
                        })
                        :Play()
                end
                if self.title then
                    variables.tweenService:Create(self.title, M, { TextTransparency = 0 }):Play()
                end
                if self.subtitle then
                    variables.tweenService:Create(self.subtitle, M, { TextTransparency = 0.7 }):Play()
                end
                for O, P in ipairs(self.actionContainer:GetChildren()) do
                    if P:IsA("Frame") then
                        variables.tweenService:Create(P.ImageLabel, M, { ImageTransparency = 0.6 }):Play()
                    end
                end
                if self.settingsAction and self.selectedTab == self.rfSettings then
                    variables.tweenService
                        :Create(self.settingsAction.iconLabel, M, {
                            ImageTransparency = 0.2,
                        })
                        :Play()
                end
                for O, P in self.tags do
                    P:_setShown(true, M)
                end
                for O, P in pairs(self.tabs) do
                    if not P.neglectSelector and P.topbarItem then
                        P.topbarItem.Visible = true
                        P:_applyVisual(if self.selectedTab == P then "selected" else "unselected", M)
                    end
                end
                self:_setTabSectionsVisible(true)
                self:_setTabSectionsShown(true, M)
                self:_revealElements(0.035, 0.4)
            end)
            task.delay(0.22, function()
                self.drag.drag.Position = UDim2.new(
                    default.X.Scale,
                    default.X.Offset,
                    default.Y.Scale,
                    default.Y.Offset + self.size.Y.Offset / 2 + 15
                )
                self.drag.dragCosmetic.Size = UDim2.fromOffset(0, 4)
                self.drag.dragCosmetic.BackgroundTransparency = 1
                self.drag.drag.Visible = true
                variables.tweenService
                    :Create(
                        self.drag.dragCosmetic,
                        K,
                        { Size = UDim2.fromOffset(100, 4), BackgroundTransparency = 0.7 }
                    )
                    :Play()
            end)
            task.delay(0.6, function()
                self.animating = false
                self._revealing = false
            end)
        end

        function h._firstShow(self)
            self:_setContentVisible(true)
            self.drag.drag.Visible = false
            self.main.Visible = true
            variables.tweenService
                :Create(
                    self.main,
                    TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
                    { BackgroundTransparency = 0, Size = self.size }
                )
                :Play()
            task.wait(0.85)
            self:_fadeSurfaces(true, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))
            task.wait(0.3)
            if self.icon then
                variables.tweenService
                    :Create(
                        self.topbarIcon,
                        TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        { ImageTransparency = 0 }
                    )
                    :Play()
            end
            if self.title then
                variables.tweenService
                    :Create(
                        self.title,
                        TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        {
                            TextTransparency = 0,
                        }
                    )
                    :Play()
            end
            task.wait(0.1)
            if self.subtitle then
                variables.tweenService
                    :Create(
                        self.subtitle,
                        TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                        { TextTransparency = 0.7 }
                    )
                    :Play()
            end
            for default, K in ipairs(self.actionContainer:GetChildren()) do
                if K:IsA("Frame") then
                    task.wait(0.02)
                    variables.tweenService
                        :Create(
                            K.ImageLabel,
                            TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                            { ImageTransparency = 0.6 }
                        )
                        :Play()
                end
            end
            for default, K in self.tags do
                K:_setShown(true, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))
            end
            task.wait(0.2)
            task.spawn(function()
                local default = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                self:_setTabSectionsVisible(true)
                self:_setTabSectionsShown(true, default)
                local K = 0
                for L, M in pairs(self.tabs) do
                    if not M.neglectSelector then
                        M.topbarItem.Visible = true
                        M:_applyVisual(if self.selectedTab == M then "selected" else "unselected", default)
                        M:_spinGradients()
                        K += 1
                        if K <= u then
                            task.wait(t)
                        end
                    end
                end
            end)
            self:_revealElements(0.03, 2)
            task.wait(1)
            self:_syncDragBar()
            self.drag.drag.Visible = true
            variables.tweenService
                :Create(
                    self.drag.dragCosmetic,
                    TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 0.7 }
                )
                :Play()
            variables.tweenService
                :Create(
                    self.drag.dragCosmetic,
                    TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {
                        Size = UDim2.fromOffset(100, 4),
                    }
                )
                :Play()
            self.animating = false
            self._revealing = false
            local default = variables.localPlayer
            if default and self.settings.welcomeToast and chrome.isNewUser() then
                self:Toast({
                    title = default.DisplayName,
                    subtitle = locale.resolve("Signed in as"),
                    subtitleAbove = true,
                    avatar = default.UserId,
                    minWidth = 220,
                })
            end
        end

        function h.GetPath(I)
            return persistence.getPath(I)
        end

        function h.Save(I, default)
            if default ~= nil and (type(default) ~= "string" or default == "") then
                return false
            end
            return persistence.save(I, default)
        end

        function h.Load(I, default)
            if default ~= nil and (type(default) ~= "string" or default == "") then
                return false
            end
            return persistence.load(I, default)
        end

        function h._applyNamedConfig(self, default)
            if not self:Load(default) then
                return false
            end
            local K, L = persistence.getPath(self)
            self._loadedConfigPath = L
            self:Save()
            return true
        end

        function h.ListConfigs(I)
            return persistence.list(I)
        end

        function h.DeleteConfig(I, default)
            return persistence.delete(I, default)
        end

        function h.Get(self, default)
            local K = self.controls[default]
            return K and K.value
        end

        function h.Set(self, default, K)
            local L = self.controls[default]
            if not L then
                return false
            end
            L:Set(K)
            return true
        end

        function h._jumpTo(self, default)
            if default then
                self.elementsLayout:JumpTo(default)
            end
        end

        function h.Navigate(self, default)
            if default == nil then
                return
            end
            local K
            for L, M in self.tabs do
                if M == default or M.name == default or M.tabPage == default then
                    K = M
                    break
                end
            end
            if not K then
                return
            end
            K:Select()
        end

        function h.Create(self, default, K, L)
            assert(typeof(default) == "string", "Invalid argument #1 (string expected)")
            local M = Instance.new(default)
            if L and self.theme then
                for N, O in L do
                    M[N] = (if typeof(O) == "table" then O[2](self.theme[O[1]]) else self.theme[O])
                end
                self.themeProperties[M] = L
            end
            if K then
                for N, O in K do
                    if locale.isToken(O) then
                        self:_bindLocale(M, N, locale.sourceOf(O))
                    else
                        image.assign(M, N, O)
                    end
                end
            end
            table.insert(self.instances, M)
            return M
        end

        function h._bindLocale(self, default, K, L)
            default[K] = locale.resolve(L)
            local M = self.localeProperties[default]
            if not M then
                M = {}
                self.localeProperties[default] = M
            end
            M[K] = L
        end

        function h.SetLocale(self, default)
            locale.setActive(default)
            for K, L in self.localeProperties do
                for M, N in L do
                    K[M] = locale.resolve(N)
                end
            end
        end

        function h.SetTranslator(I, default)
            locale.translator = default
        end

        function h.RegisterTranslations(self, default)
            locale.register(default)
            self:SetLocale(locale.current)
        end

        function h.CreateGlow(self, default, K, L, M)
            local N = { BlurRadius = UDim.new(0, L), Transparency = M, ZIndex = -1, Parent = default }
            if typeof(K) == "string" then
                return self:Create("UIShadow", N, {
                    Color = {
                        K,
                        function(O)
                            return if typeof(O) == "ColorSequence" then O.Keypoints[1].Value else O
                        end,
                    },
                })
            end
            N.Color = K
            return self:Create("UIShadow", N)
        end

        function h._flashResult(self, default, K)
            local L = default.box
            if not L then
                return
            end
            local M, N, O, P, Q, R =
                default.glow,
                default.boxStroke,
                K and constants.accent.on or self.theme.ErrorColor,
                K and constants.accent.onStroke or self.theme.ErrorStrokeColor,
                TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            variables.tweenService:Create(L, Q, { BackgroundColor3 = O }):Play()
            if N then
                variables.tweenService:Create(N, Q, { Color = P, Transparency = 0.4 }):Play()
            end
            if M then
                variables.tweenService:Create(M, Q, { Color = P, Transparency = 0.6 }):Play()
            end
            default._flashToken = (default._flashToken or 0) + 1
            local S = default._flashToken
            task.delay(0.22, function()
                if default._flashToken ~= S then
                    return
                end
                variables.tweenService
                    :Create(L, R, {
                        BackgroundColor3 = self.theme.FieldBackground,
                    })
                    :Play()
                if N then
                    variables.tweenService
                        :Create(N, R, { Color = self.theme.SurfaceStroke, Transparency = 0.85 })
                        :Play()
                end
                if M then
                    variables.tweenService
                        :Create(M, R, { Color = self.theme.FieldGlow, Transparency = default._glowIdle or 1 })
                        :Play()
                end
            end)
        end

        function h.CreateHoverOverlay(self, default)
            local K = self:Create("Frame", {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                BorderSizePixel = 0,
                ZIndex = 1,
                Parent = default,
            })
            self:Create("UICorner", {
                Parent = K,
            }, { CornerRadius = "ElementCornerRadius" })
            return K
        end

        function h._wireElementHover(self, default)
            local K, L = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), self.theme
            self:ConnectFor(default, default.main.MouseEnter, function()
                if not self:_interactive() then
                    return
                end
                variables.tweenService
                    :Create(
                        default.stroke,
                        K,
                        { Transparency = L.ElementStrokeHoverTransparency, Color = L.ElementStrokeHover }
                    )
                    :Play()
                variables.tweenService:Create(default.title, K, { TextColor3 = L.ElementTextHoverColor }):Play()
                if default.hoverOverlay then
                    variables.tweenService
                        :Create(default.hoverOverlay, K, { BackgroundTransparency = 0.97 })
                        :Play()
                end
            end)
            self:ConnectFor(default, default.main.MouseLeave, function()
                variables.tweenService
                    :Create(
                        default.stroke,
                        K,
                        { Transparency = L.ElementStrokeTransparency, Color = L.ElementStroke }
                    )
                    :Play()
                variables.tweenService:Create(default.title, K, { TextColor3 = L.ContentColor }):Play()
                if default.hoverOverlay then
                    variables.tweenService:Create(default.hoverOverlay, K, { BackgroundTransparency = 1 }):Play()
                end
            end)
        end

        function h._runGuarded(self, default, K, ...)
            if default.locked then
                return
            end
            local L = table.pack(...)
            task.spawn(function()
                local M, N = pcall(function()
                    return K(table.unpack(L, 1, L.n))
                end)
                if M or default._errored then
                    return
                end
                default._errored = true
                local O, P =
                    default.flashTarget or default.main,
                    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                variables.tweenService:Create(O, P, { BackgroundColor3 = self.theme.ErrorColor }):Play()
                variables.tweenService:Create(default.stroke, P, { Color = self.theme.ErrorStrokeColor }):Play()
                if default.title then
                    default.title.Text = locale.resolve("Error, log recorded in console.")
                end
                log.warn(
                    `Rayfield encountered an error, with the callback for a {default.__type} component named '{J.name}':`
                )
                log.print(N)
                task.wait(1)
                if default.title then
                    default.title.Text = locale.resolve(default.name)
                end
                variables.tweenService
                    :Create(
                        O,
                        TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                        { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
                    )
                    :Play()
                variables.tweenService
                    :Create(
                        default.stroke,
                        TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { Color = self.theme.ElementStroke }
                    )
                    :Play()
                default._errored = false
            end)
        end

        function h.StyleElementBody(self, default)
            self:Create("UIGradient", { Rotation = 270, Parent = default }, { Color = "ElementGradient" })
            self:Create("UICorner", { Parent = default }, { CornerRadius = "ElementCornerRadius" })
            return self:Create(
                "UIStroke",
                { Transparency = 1, Parent = default },
                { Color = "ElementStroke", Transparency = "ElementStrokeTransparency" }
            )
        end

        function h._buildCompactRow(self, default, K, L)
            local M = self:Create("Frame", {
                Name = K,
                Size = UDim2.fromOffset(0, q),
                AutomaticSize = Enum.AutomaticSize.X,
                ClipsDescendants = true,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Parent = default.tabPage,
            }, { BackgroundTransparency = "ElementTransparency" })
            local N = self:StyleElementBody(M)
            self:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = M })
            self:Create("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalFlex = Enum.UIFlexAlignment.Fill,
                Parent = M,
            })
            local O = self:Create("TextButton", {
                Text = "",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, q),
                BorderSizePixel = 0,
                TextTransparency = 1,
                ZIndex = L or 1,
                Parent = M,
            })
            self:Create("UICorner", { Parent = O }, {
                CornerRadius = "ElementCornerRadius",
            })
            return M, N, O
        end

        function h.StyleElementPanel(self, default)
            self:Create("UIGradient", { Rotation = 270, Parent = default }, { Color = "ElementGradient" })
            self:Create("UICorner", { Parent = default }, { CornerRadius = "ElementCornerRadius" })
            local K = self:Create(
                "UIStroke",
                { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = default }
            )
            self:Create("UIGradient", { Rotation = 270, Parent = K }, { Color = "ElementStrokeGradient" })
            return K
        end

        function h._reveal(I, default, K, L, M)
            if not default then
                return
            end
            if L then
                variables.tweenService:Create(default, M or i, K):Play()
            else
                for N, O in K do
                    default[N] = O
                end
            end
        end

        function h._revealCommon(self, default, K)
            self:_reveal(default.stroke, { Transparency = self.theme.ElementStrokeTransparency }, K)
            self:_reveal(default.title, { TextTransparency = 0 }, K)
            self:_reveal(default.main, {
                BackgroundTransparency = self.theme.ElementTransparency or 0,
            }, K)
            if default.iconLabel then
                self:_reveal(default.iconLabel, { ImageTransparency = 0 }, K)
            end
            if default.descriptor then
                self:_reveal(default.descriptor.titleLabel, { TextTransparency = 0.7 }, K)
            end
        end

        function h._hideCommon(self, default, K)
            self:_reveal(default.stroke, { Transparency = 1 }, K)
            self:_reveal(default.title, { TextTransparency = 1 }, K)
            self:_reveal(default.main, {
                BackgroundTransparency = 1,
            }, K)
            if default.iconLabel then
                self:_reveal(default.iconLabel, { ImageTransparency = 1 }, K)
            end
            if default.descriptor then
                self:_reveal(default.descriptor.titleLabel, { TextTransparency = 1 }, K)
            end
        end

        function h._collapsedRect(self)
            local default = if self.showIconOnly then k else j
            if self._collapsedPosition then
                return self._collapsedPosition, default
            end
            local K = UDim2.new(l.X.Scale, l.X.Offset, l.Y.Scale, l.Y.Offset + default.Y.Offset / 2)
            return K, default
        end

        function h._interactive(self)
            return not self.animating and not self.hidden
        end

        function h._settled(self)
            return not self.hidden and not self._revealing
        end

        function h.Connect(self, default, K)
            local L = default:Connect(K)
            table.insert(self.connections, L)
            return L
        end

        function h.ConnectFor(self, default, K, L)
            local M = self:Connect(K, L)
            default.connections = default.connections or {}
            table.insert(default.connections, M)
            return M
        end

        function h.Disconnect(self, default)
            if not default then
                return
            end
            local K = table.find(self.connections, default)
            if K then
                table.remove(self.connections, K)
            end
            default:Disconnect()
        end

        function h.DestroySubtree(self, default)
            if not default then
                return
            end
            local K = { [default] = true }
            for L, M in default:GetDescendants() do
                K[M] = true
            end
            for L = #self.instances, 1, -1 do
                local M = self.instances[L]
                if K[M] then
                    table.remove(self.instances, L)
                    self.themeProperties[M] = nil
                    self.localeProperties[M] = nil
                end
            end
            default:Destroy()
        end

        function h.DisconnectMany(self, default, K)
            if not K or #K == 0 then
                return
            end
            local L = {}
            for M, N in K do
                L[N] = true
                N:Disconnect()
            end
            local function M(N)
                if not N then
                    return
                end
                local O = 0
                for P = 1, #N do
                    local Q = N[P]
                    if not L[Q] then
                        O += 1
                        N[O] = Q
                    end
                end
                for P = #N, O + 1, -1 do
                    N[P] = nil
                end
            end
            M(self.connections)
            if default and default ~= self then
                M(default.connections)
            end
        end

        function h.DestroySubtrees(self, default)
            if not default or #default == 0 then
                return
            end
            local K = {}
            for L, M in default do
                K[M] = true
                for N, O in M:GetDescendants() do
                    K[O] = true
                end
            end
            local L = 0
            for M = 1, #self.instances do
                local N = self.instances[M]
                if K[N] then
                    self.themeProperties[N] = nil
                    self.localeProperties[N] = nil
                else
                    L += 1
                    self.instances[L] = N
                end
            end
            for M = #self.instances, L + 1, -1 do
                self.instances[M] = nil
            end
            for M, N in default do
                N:Destroy()
            end
        end

        function h.Unload(self)
            self.unloaded = true
            HapticEngine.teardown()
            HapticEngine.releaseContainer(self.screenGui)
            if self._liveTween then
                self._liveTween:Cancel()
                self._liveTween = nil
            end
            for default = #self.connections, 1, -1 do
                self.connections[default]:Disconnect()
            end
            for default = #self.instances, 1, -1 do
                self.instances[default]:Destroy()
            end
            table.clear(self.connections)
            table.clear(self.instances)
            table.clear(self.themeProperties)
            table.clear(self.localeProperties)
            table.clear(self.controls)
            table.clear(self.tabs)
        end
        return h
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield/types
    define(Rayfield_types, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        export type Theme = string | { [string]: any }
        export type Translator = (source: string, localeId: string) -> string?
        export type Translations = { [string]: { [string]: string } }
        export type WindowConfiguration = {
            autoSave: boolean?,
            autoLoad: boolean?,
            fileName: string?,
            customFolder: string?,
        }
        export type WindowProps = {
            name: string?,
            subtitle: string?,
            theme: Theme?,
            icon: (string | number)?,
            showName: string?,
            showIcon: (string | number)?,
            showIconOnly: boolean?,
            sidebarLayout: boolean?,
            profile: string?,
            configuration: WindowConfiguration?,
            fallbackFont: (Font | Enum.Font)?,
            locale: string?,
            translations: Translations?,
            translator: Translator?,
        }
        export type TabProps = {
            name: string?,
            icon: (string | number)?,
        }
        export type TagProps = {
            text: string?,
            title: string?,
            icon: (string | number)?,
            color: Color3?,
            order: number?,
        }
        export type SectionProps = { name: string?, icon: (string | number)? }
        export type TextProps = { name: string?, text: string?, icon: (string | number)? }
        export type DividerProps = { text: string?, spacing: number?, line: boolean? }
        export type GroupProps = { direction: string? }
        export type ButtonProps = {
            name: string?,
            description: string?,
            icon: (string | number)?,
            callback: (() -> ())?,
        }
        export type ToggleProps = {
            name: string?,
            description: string?,
            icon: (string | number)?,
            flag: string?,
            value: boolean?,
            forgetState: boolean?,
            callback: ((value: boolean) -> ())?,
        }
        export type SliderProps = {
            name: string?,
            description: string?,
            icon: (string | number)?,
            flag: string?,
            range: { number }?,
            increment: number?,
            value: number?,
            suffix: string?,
            minimal: boolean?,
            forgetState: boolean?,
            callback: ((value: number, dragging: boolean) -> ())?,
        }
        export type DropdownProps = {
            name: string?,
            description: string?,
            icon: (string | number)?,
            flag: string?,
            options: { string }?,
            value: (string | { string })?,
            multiSelect: boolean?,
            placeholder: string?,
            forgetState: boolean?,
            callback: ((value: any) -> ())?,
        }
        export type InputProps = {
            name: string?,
            description: string?,
            icon: (string | number)?,
            flag: string?,
            value: string?,
            placeholder: string?,
            numeric: boolean?,
            clearOnFocus: boolean?,
            forgetState: boolean?,
            callback: ((value: string) -> ())?,
        }
        export type KeybindProps = {
            name: string?,
            description: string?,
            icon: (string | number)?,
            flag: string?,
            value: (EnumItem | string)?,
            forgetState: boolean?,
            isMenuToggle: boolean?,
            hold: boolean?,
            holdThreshold: number?,
            callback: ((value: EnumItem | boolean) -> ())?,
            onChanged: ((key: EnumItem) -> ())?,
        }
        export type ColorPickerProps = {
            name: string?,
            description: string?,
            icon: (string | number)?,
            flag: string?,
            color: Color3?,
            alpha: number?,
            forgetState: boolean?,
            callback: ((value: Color3, alpha: number) -> ())?,
        }
        export type StatProps = {
            name: string?,
            description: string?,
            icon: (string | number)?,
            prefix: string?,
            suffix: string?,
            value: number?,
            display: string?,
            compact: boolean?,
            changeMode: string?,
            changeBaseline: string?,
            numberEasing: boolean?,
        }
        export type ProgressProps = {
            name: string?,
            description: string?,
            icon: (string | number)?,
            range: { number }?,
            value: number?,
            steps: number?,
            text: string?,
            format: ((value: number, min: number, max: number) -> string)?,
            showValue: boolean?,
            indeterminate: boolean?,
        }
        export type ConsoleProps = {
            name: string?,
            description: string?,
            text: string?,
            height: number?,
            follow: boolean?,
            maxLines: number?,
        }
        export type NotifyProps =
            { title: string?, content: string?, icon: (string | number)?, duration: number? }
        export type ToastProps = {
            title: string?,
            subtitle: string?,
            subtitleAbove: boolean?,
            icon: (string | number)?,
            avatar: number?,
            minWidth: number?,
            duration: number?,
            position: "Top" | "Bottom"?,
        }
        export type PopupBox = { title: string?, description: string?, icon: (string | number)? }
        export type PopupOption = { text: string?, style: string?, callback: (() -> ())? }
        export type PopupProps = {
            title: string?,
            subtitle: string?,
            icon: (string | number)?,
            content: string?,
            boxes: { PopupBox }?,
            options: { PopupOption }?,
            dismissable: boolean?,
        }
        export type Moveable = {
            MoveTo: (self: any, index: number) -> (),
            MoveToTop: (self: any) -> (),
            MoveToBottom: (self: any) -> (),
            MoveUp: (self: any) -> (),
            MoveDown: (self: any) -> (),
        }
        export type Lockable = {
            Lock: (self: any, reason: string?) -> (),
            Unlock: (self: any) -> (),
            IsLocked: (self: any) -> boolean,
        }
        export type Button = Moveable & Lockable & {}
        export type Toggle = Moveable & Lockable & {
            value: boolean,
            Set: (self: Toggle, value: boolean, skipCallback: boolean?) -> (),
        }
        export type Slider = Moveable & Lockable & {
            value: number,
            Set: (self: Slider, value: number, skipCallback: boolean?) -> (),
        }
        export type Dropdown = Moveable & Lockable & {
            value: { string },
            Set: (self: Dropdown, value: string | { string }, skipCallback: boolean?) -> (),
            Refresh: (self: Dropdown, options: { string }) -> (),
            Add: (self: Dropdown, option: string) -> (),
            Remove: (self: Dropdown, option: string) -> (),
        }
        export type Input = Moveable & Lockable & {
            value: string,
            Set: (self: Input, value: string, skipCallback: boolean?) -> (),
        }
        export type Keybind = Moveable & Lockable & {
            value: EnumItem,
            Set: (self: Keybind, value: EnumItem | string, skipChanged: boolean?) -> (),
        }
        export type ColorPicker = Moveable & Lockable & {
            value: Color3,
            alpha: number,
            Set: (self: ColorPicker, value: Color3 | string, skipCallback: boolean?) -> (),
            SetAlpha: (self: ColorPicker, alpha: number, skipCallback: boolean?) -> (),
        }
        export type Stat = Moveable & {
            value: number,
            Set: (self: Stat, value: number) -> (),
            ResetBaseline: (self: Stat, value: number?) -> (),
        }
        export type Progress = Moveable & {
            value: number,
            Set: (self: Progress, value: number) -> (),
            Get: (self: Progress) -> number,
            GetPercentage: (self: Progress) -> number,
            SetRange: (self: Progress, min: number, max: number) -> (),
            SetText: (self: Progress, text: string?) -> (),
            SetIndeterminate: (self: Progress, state: boolean) -> (),
            Remove: (self: Progress) -> (),
        }
        export type Console = Moveable & {
            Set: (self: Console, text: string) -> (),
            Append: (self: Console, line: string) -> (),
            Clear: (self: Console) -> (),
            Get: (self: Console) -> string,
            Copy: (self: Console) -> boolean,
            SetHeight: (self: Console, height: number) -> (),
            Remove: (self: Console) -> (),
        }
        export type Section = Moveable & {}
        export type TabSection = { Remove: (self: TabSection) -> () }
        export type Text = Moveable & {
            name: string,
            text: string,
            Set: (self: Text, text: string) -> (),
            SetTitle: (self: Text, title: string) -> (),
        }
        export type Divider = Moveable & { text: string, Set: (self: Divider, text: string?) -> () }
        export type Tag = {
            Set: (self: Tag, props: TagProps) -> (),
            SetColor: (self: Tag, color: Color3) -> (),
            SetText: (self: Tag, text: string?) -> (),
            SetIcon: (self: Tag, icon: (string | number)?) -> (),
            Remove: (self: Tag) -> (),
        }
        export type Popup = { Close: (self: Popup) -> () }
        export type Group = Moveable & {
            CreateButton: (self: Group, props: ButtonProps) -> Button,
            CreateToggle: (self: Group, props: ToggleProps) -> Toggle,
            CreateSwitch: (self: Group, props: ToggleProps) -> Toggle,
            CreateStat: (self: Group, props: StatProps) -> Stat,
            CreateSlider: (self: Group, props: SliderProps) -> Slider,
            CreateDropdown: (self: Group, props: DropdownProps) -> Dropdown?,
            CreateSection: (self: Group, props: SectionProps) -> Section?,
            CreateText: (self: Group, props: TextProps) -> Text?,
            CreateDivider: (self: Group, props: DividerProps?) -> Divider?,
            CreateGroup: (self: Group, props: GroupProps?) -> Group,
        }
        export type Tab = {
            Select: (self: Tab, noAnimation: boolean?) -> (),
            Deselect: (self: Tab, noAnimation: boolean?) -> (),
            Remove: (self: Tab) -> (),
            CreateButton: (self: Tab, props: ButtonProps) -> Button,
            CreateToggle: (self: Tab, props: ToggleProps) -> Toggle,
            CreateSwitch: (self: Tab, props: ToggleProps) -> Toggle,
            CreateSlider: (self: Tab, props: SliderProps) -> Slider,
            CreateDropdown: (self: Tab, props: DropdownProps) -> Dropdown,
            CreateInput: (self: Tab, props: InputProps) -> Input,
            CreateKeybind: (self: Tab, props: KeybindProps) -> Keybind,
            CreateColorPicker: (self: Tab, props: ColorPickerProps) -> ColorPicker,
            CreateStat: (self: Tab, props: StatProps) -> Stat,
            CreateProgress: (self: Tab, props: ProgressProps) -> Progress,
            CreateConsole: (self: Tab, props: ConsoleProps) -> Console,
            CreateSection: (self: Tab, props: SectionProps) -> Section,
            CreateText: (self: Tab, props: TextProps) -> Text,
            CreateDivider: (self: Tab, props: DividerProps?) -> Divider,
            CreateGroup: (self: Tab, props: GroupProps?) -> Group,
        }
        export type Window = {
            unloaded: boolean,
            Flags: { [string]: any },
            CreateTab: (self: Window, props: TabProps) -> Tab,
            CreateSection: (self: Window, props: SectionProps) -> TabSection,
            CreateTag: (self: Window, props: TagProps) -> Tag,
            Notify: (self: Window, props: NotifyProps) -> (),
            Toast: (self: Window, props: ToastProps) -> (),
            Popup: (self: Window, props: PopupProps) -> Popup?,
            Show: (self: Window) -> (),
            Hide: (self: Window) -> (),
            ToggleHide: (self: Window) -> (),
            ToggleMinimise: (self: Window) -> (),
            Navigate: (self: Window, tab: string | Tab) -> (),
            ChangeTheme: (self: Window, theme: Theme) -> (),
            SetLocale: (self: Window, localeId: string) -> (),
            SetTranslator: (self: Window, translator: Translator?) -> (),
            RegisterTranslations: (self: Window, translations: Translations) -> (),
            Save: (self: Window, name: string?) -> boolean,
            Load: (self: Window, name: string?) -> boolean,
            ListConfigs: (self: Window) -> { string },
            DeleteConfig: (self: Window, name: string) -> boolean,
            GetPath: (self: Window) -> (string, string),
            Get: (self: Window, flag: string) -> any,
            Set: (self: Window, flag: string, value: any) -> boolean,
            Unload: (self: Window) -> (),
        }
        export type Rayfield = { CreateWindow: (self: Rayfield, props: WindowProps) -> Window }
        return {}
    end)

    -- ----------------------------------------------------------------------
    -- Rayfield
    define(Rayfield, function(script, require)
        -- deobfuscated from Rayfield Gen2 v1.2.0

        local variables, image, locale, constants, types =
            require(script.utility.variables),
            require(script.utility.image),
            require(script.utility.locale),
            require(script.utility.constants),
            require(script.types)
        export type Theme = types.Theme
        export type Translator = types.Translator
        export type Translations = types.Translations
        export type WindowConfiguration = types.WindowConfiguration
        export type WindowProps = types.WindowProps
        export type TabProps = types.TabProps
        export type TagProps = types.TagProps
        export type SectionProps = types.SectionProps
        export type GroupProps = types.GroupProps
        export type ButtonProps = types.ButtonProps
        export type ToggleProps = types.ToggleProps
        export type SliderProps = types.SliderProps
        export type DropdownProps = types.DropdownProps
        export type InputProps = types.InputProps
        export type KeybindProps = types.KeybindProps
        export type ColorPickerProps = types.ColorPickerProps
        export type StatProps = types.StatProps
        export type ProgressProps = types.ProgressProps
        export type ConsoleProps = types.ConsoleProps
        export type TextProps = types.TextProps
        export type DividerProps = types.DividerProps
        export type NotifyProps = types.NotifyProps
        export type ToastProps = types.ToastProps
        export type PopupBox = types.PopupBox
        export type PopupOption = types.PopupOption
        export type PopupProps = types.PopupProps
        export type Moveable = types.Moveable
        export type Lockable = types.Lockable
        export type Window = types.Window
        export type Tab = types.Tab
        export type Group = types.Group
        export type Button = types.Button
        export type Toggle = types.Toggle
        export type Slider = types.Slider
        export type Dropdown = types.Dropdown
        export type Input = types.Input
        export type Keybind = types.Keybind
        export type ColorPicker = types.ColorPicker
        export type Stat = types.Stat
        export type Progress = types.Progress
        export type Console = types.Console
        export type Section = types.Section
        export type TabSection = types.TabSection
        export type Text = types.Text
        export type Divider = types.Divider
        export type Tag = types.Tag
        export type Popup = types.Popup
        export type Rayfield = types.Rayfield
        type WindowModule = { new: (types.WindowProps) -> types.Window }
        local k = {} :: Rayfield

        local function l()
            local m = Instance.new("ScreenGui")
            m.Name = variables.httpService:GenerateGUID(false)
            m.ClipToDeviceSafeArea = false
            m.DisplayOrder = constants.displayOrder.banner
            m.IgnoreGuiInset = true
            m.ResetOnSpawn = false
            m.Enabled = true
            m.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
            m.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
            m.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            m.Parent = variables.guiContainer
            local n = Instance.new("ImageLabel")
            n.Name = "Banner"
            n.AnchorPoint = Vector2.new(0.5, 0.5)
            n.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            n.BackgroundTransparency = 1
            n.BorderColor3 = Color3.fromRGB(0, 0, 0)
            n.BorderSizePixel = 0
            n.Image = image.resolve(constants.icons.banner)
            n.Position = UDim2.fromScale(0.5, 0.5)
            n.Size = UDim2.fromOffset(262, 60)
            n.Parent = m
            return m
        end

        function k.CreateWindow(m, n: j.WindowProps): j.Window
            local o, p: j.Window?, q: (() -> ())? = (l())
            if variables.secureMode then
                image.preload(function(r)
                    if r <= 0 then
                        return
                    end
                    local function s()
                        if not p or p.unloaded then
                            return
                        end
                        p:Notify({
                            title = locale.resolve("Secure mode"),
                            content = if r == 1
                                then locale.resolve("An asset couldn't be cached and won't appear.")
                                else locale.resolve("Some assets couldn't be cached and won't appear."),
                        })
                    end
                    if p then
                        s()
                    else
                        q = s
                    end
                end)
            end
            local r, s = pcall(function()
                return (require(script.components.window) :: WindowModule).new(n)
            end)
            if not r then
                o:Destroy()
                error(s, 0)
            end
            local t = s :: j.Window
            p = t
            if q then
                task.spawn(q)
                q = nil
            end
            if variables.secureMode then
                task.spawn(function()
                    local u, v =
                        variables.fontManager:loadFont(constants.fontAsset, Enum.FontWeight.Medium),
                        variables.fontManager:loadFont(constants.fontAsset, Enum.FontWeight.SemiBold)
                    if
                        not t.unloaded
                        and u
                        and v
                        and u ~= variables.fallbackFont
                        and v ~= variables.fallbackFont
                    then
                        t:ChangeTheme({ Font = u, TitleFont = v })
                    end
                end)
            end
            task.spawn(function()
                task.wait(0.5)
                o:Destroy()
                task.wait(0.5)
                if not t.unloaded then
                    t:Show()
                end
            end)
            return t
        end
        return k
    end)

    -- ----------------------------------------------------------------------
    return require(Rayfield)
end)()

-- ======================================================================
-- MonoUI -> Rayfield Gen2 adapter.
--
-- MonoMM2 ships its own 3,700-line UI library and drives it through a small API.
-- Rather than rewrite ~3,500 lines of feature code, this implements that API on
-- top of Rayfield, so the feature code below runs untouched.
--
-- Model differences that shape the mapping:
--   MonoUI:   tab -> category -> section -> module -> per-module settings drawer
--   Rayfield:        tab                 -> section -> elements (no drawer)
-- so a MonoUI *category* becomes a Rayfield *tab*, and a module's settings are
-- laid out directly beneath the module instead of behind a drawer.

local function MakeMonoUI(Rayfield)
    local MonoUI = {}

    local function noop() end

    -- Unmapped MonoUI methods (cosmetic ones: SetSmoothScroll, ToggleFullscreen,
    -- Refresh...) resolve to a no-op rather than erroring. Only capitalised keys,
    -- so plain field reads such as `Menu.uiSettings` still return their value.
    MonoUI.__index = function(_, k)
        local v = rawget(MonoUI, k)
        if v ~= nil then
            return v
        end
        if type(k) == "string" and k:sub(1, 1):match("%u") then
            return noop
        end
        return nil
    end

    local function words(s)
        return (tostring(s):gsub("(%l)(%u)", "%1 %2"))
    end

    -- Rayfield derives a config flag from the element name, so two modules that
    -- each have a "Speed" slider would collide. Namespace every flag explicitly.
    local function flagFor(...)
        return (table.concat({ ... }, "_"):gsub("[^%w_]", ""))
    end

    function MonoUI.new(cfg)
        cfg = cfg or {}
        local self = setmetatable({}, MonoUI)

        local title = cfg.Title or "Mono"
        self.window = Rayfield:CreateWindow({
            Name = title,
            Subtitle = cfg.Version,
            SidebarLayout = true,
            -- Without this the collapsed pill reads "Rayfield" rather than the
            -- script's own name.
            ShowName = title,
            Configuration = { AutoSave = true, AutoLoad = true, FileName = title },
        })

        self.categories, self.tabs, self.allModules = {}, {}, {}
        self.uiSettings = {} -- the feature code table.inserts into this directly
        self.tourSteps = {}
        return self
    end

    -- MonoUI's top-level tabs (Players/Server/Configs/Settings/Credits) are pages
    -- the library fills in itself. Rayfield supplies its own settings and config
    -- UI, so these are recorded and otherwise ignored.
    function MonoUI:Tab(name)
        local tab = { name = name }
        table.insert(self.tabs, tab)

        -- Players and Server are pages MonoUI builds itself. Rebuilt here on
        -- Rayfield elements. Configs/Settings/Credits are dropped: Rayfield
        -- ships its own equivalents.
        if name == "Players" then
            self:_buildPlayersPage()
        elseif name == "Server" then
            self:_buildServerPage()
        end
        return tab
    end

    -- Ordered after the feature categories (which default to 0) but before
    -- Rayfield's own settings tab (1000).
    local PAGE_ORDER = { Keybinds = 899, Players = 900, Server = 901 }

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Stats = game:GetService("Stats")

    local function copyToClipboard(text)
        local fn = (getgenv and getgenv().setclipboard) or setclipboard
        if typeof(fn) == "function" then
            pcall(fn, tostring(text))
            return true
        end
        return false
    end

    -- Anything that lists players re-syncs here on join/leave: the Players page
    -- picker, and every `GetValues` dropdown the feature code declares (the
    -- teleport modules each get one). Connections are bound once, on first use.
    function MonoUI:_onPlayersChanged(fn)
        if not self._playerWatchers then
            self._playerWatchers = {}
            local function resync()
                -- deferred so GetPlayers() no longer includes a leaver
                task.defer(function()
                    for _, watcher in self._playerWatchers do
                        pcall(watcher)
                    end
                end)
            end
            self.window:Connect(Players.PlayerAdded, resync)
            self.window:Connect(Players.PlayerRemoving, resync)
        end
        table.insert(self._playerWatchers, fn)
    end

    local function clock(seconds)
        seconds = math.floor(seconds)
        local h, m = math.floor(seconds / 3600), math.floor(seconds % 3600 / 60)
        if h > 0 then
            return string.format("%dh %dm", h, m)
        elseif m > 0 then
            return string.format("%dm %ds", m, seconds % 60)
        end
        return seconds .. "s"
    end

    function MonoUI:_buildPlayersPage()
        local tab = self.window:CreateTab({ Name = "Players", CustomOrder = PAGE_ORDER.Players })
        local selected

        local function names()
            local list = {}
            for _, p in Players:GetPlayers() do
                table.insert(list, p.Name)
            end
            table.sort(list)
            return list
        end

        tab:CreateSection({ Name = "Player" })
        local picker
        local detail = tab:CreateText({ Name = "Select a player", Text = "" })

        local function render()
            local plr = selected and Players:FindFirstChild(selected)
            if not plr then
                detail:SetTitle("Select a player")
                detail:Set("")
                return
            end

            local me = Players.LocalPlayer
            local rows = {
                { "User ID", plr.UserId },
                { "Display name", plr.DisplayName },
                { "Username", plr.Name },
                { "Account age", plr.AccountAge .. " days" },
                { "Membership", (tostring(plr.MembershipType):gsub("Enum.MembershipType.", "")) },
                { "Locale", plr.LocaleId ~= "" and plr.LocaleId or "?" },
                { "Team", plr.Team and plr.Team.Name or "None" },
                { "Follows you", tostring(me and plr.FollowUserId == me.UserId) },
            }

            local char = plr.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                table.insert(rows, { "Health", string.format("%d / %d", hum.Health, hum.MaxHealth) })
            end
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local myRoot = me and me.Character and me.Character:FindFirstChild("HumanoidRootPart")
            if root and myRoot then
                table.insert(
                    rows,
                    { "Distance", string.format("%d studs", (root.Position - myRoot.Position).Magnitude) }
                )
            end

            -- MonoUI lets the script append game-specific rows via Menu.DetailExtra.
            -- rawget, because the no-op __index would otherwise hand back a function.
            local extraFn = rawget(self, "DetailExtra")
            if extraFn then
                local ok, extra = pcall(extraFn, plr)
                if ok and type(extra) == "table" then
                    for _, grp in ipairs(extra) do
                        if grp.Section then
                            table.insert(rows, { "-- " .. grp.Section, "" })
                        end
                        for _, pair in ipairs(grp.Rows or {}) do
                            table.insert(rows, { pair[1], pair[2] })
                        end
                    end
                end
            end

            local lines = {}
            for _, r in rows do
                table.insert(lines, r[1] .. ":  " .. tostring(r[2]))
            end
            detail:SetTitle(plr.DisplayName .. "  (@" .. plr.Name .. ")")
            detail:Set(table.concat(lines, "\n"))
        end

        picker = tab:CreateDropdown({
            Name = "Player",
            Options = names(),
            Placeholder = "Pick a player",
            ForgetState = true,
            Callback = function(v)
                selected = v
                render()
            end,
        })

        tab:CreateButton({
            Name = "Refresh details",
            Callback = render,
        })

        tab:CreateButton({
            Name = "Copy user ID",
            Callback = function()
                local plr = selected and Players:FindFirstChild(selected)
                if plr and copyToClipboard(plr.UserId) then
                    self.window:Toast({ Title = "Copied", Subtitle = tostring(plr.UserId) })
                end
            end,
        })

        self:_onPlayersChanged(function()
            picker:Refresh(names())
            render()
        end)

        self.pagePlayers = tab
    end

    function MonoUI:_buildServerPage()
        local tab = self.window:CreateTab({ Name = "Server", CustomOrder = PAGE_ORDER.Server })

        local function info(name, value)
            return tab:CreateText({ Name = name, Text = tostring(value) })
        end

        tab:CreateSection({ Name = "Place" })
        info("Place ID", game.PlaceId)
        info("Place version", game.PlaceVersion)
        info("Universe ID", game.GameId)
        info("Creator ID", game.CreatorId)
        info("Creator type", game.CreatorType.Name)

        tab:CreateSection({ Name = "Session" })
        local jobId = game.JobId ~= "" and game.JobId or "(studio / no job id)"
        info("Job ID", jobId)
        info("Max players", Players.MaxPlayers)
        info("Preferred players", Players.PreferredPlayers)
        info("Streaming enabled", tostring(workspace.StreamingEnabled))
        info("Filtering enabled", tostring(workspace.FilteringEnabled))
        local uptime = info("Uptime", "-")

        tab:CreateButton({
            Name = "Copy Job ID",
            Callback = function()
                if copyToClipboard(game.JobId) then
                    self.window:Toast({ Title = "Job ID copied" })
                end
            end,
        })

        tab:CreateSection({ Name = "Live" })
        local statPlayers = tab:CreateStat({ Name = "Players", Value = #Players:GetPlayers() })
        local statFps = tab:CreateStat({ Name = "FPS", Value = 60 })
        local statPing = tab:CreateStat({ Name = "Ping", Value = 0, Suffix = " ms" })
        local statMem = tab:CreateStat({ Name = "Memory", Value = 0, Suffix = " MB" })

        local started, frames, acc = os.clock(), 0, 0
        self.window:Connect(RunService.Heartbeat, function(dt)
            frames += 1
            acc += dt
            if acc < 1 then
                return
            end

            statFps:Set(math.floor(frames / acc + 0.5))
            frames, acc = 0, 0

            statPlayers:Set(#Players:GetPlayers())
            uptime:Set(clock(os.clock() - started))

            pcall(function()
                statMem:Set(math.floor(Stats:GetTotalMemoryUsageMb()))
                local item = Stats.Network.ServerStatsItem["Data Ping"]
                statPing:Set(math.floor(tonumber(item:GetValueString():match("%d+%.?%d*")) or 0))
            end)
        end)

        self.pageServer = tab
    end

    function MonoUI:Category(name, icon)
        local cat = { name = name, icon = icon, ui = self, modules = {} }

        -- Created lazily: "Favorites" is populated by MonoUI itself and would
        -- otherwise show up as an empty tab.
        function cat:_tab()
            if not self._rfTab then
                self._rfTab = self.ui.window:CreateTab({ Name = self.name })
            end
            return self._rfTab
        end

        function cat:Section(sectionName)
            self:_tab():CreateSection({ Name = sectionName })
            self._section = sectionName
            return self
        end

        function cat:Module(opts)
            return self.ui:_module(self, opts or {})
        end

        function cat:Adopt() end
        function cat:Drop() end

        table.insert(self.categories, cat)
        return cat
    end

    function MonoUI:_module(cat, opts)
        local tab = cat:_tab()
        local m = {
            name = opts.Name or "Module",
            desc = opts.Desc or "",
            info = opts.Info,
            bind = opts.Bind,
            state = opts.Default and true or false,
            callback = opts.Callback,
            action = opts.Action and true or false,
            hold = opts.Hold and true or false,
            category = cat,
            ui = self,
            settings = {},
        }

        -- MonoUI shows Desc inline and Info in the drawer; Rayfield has one
        -- description slot, so join them when both are present.
        local description = m.info or m.desc
        if m.info and m.desc ~= "" then
            description = m.desc .. "\n\n" .. m.info
        end

        if opts.Action then
            m.element = tab:CreateButton({
                Name = words(m.name),
                Description = description,
                Callback = function()
                    if m.callback then
                        m.callback(true)
                    end
                end,
            })
        else
            m.element = tab:CreateToggle({
                Name = words(m.name),
                Description = description,
                Value = m.state,
                Flag = flagFor(cat.name, m.name),
                Callback = function(v)
                    m.state = v
                    if m.callback then
                        m.callback(v)
                    end
                end,
            })
        end

        -- Binds are not created here. In MonoUI any module can be bound at runtime
        -- from its row, so every module gets a keybind on the Keybinds page once
        -- they all exist; opts.Bind becomes that keybind's default.

        function m:Get()
            return self.state
        end

        function m:Toggle(v)
            if v == nil then
                v = not self.state
            end
            self.state = v and true or false
            if self.element and self.element.Set then
                self.element:Set(self.state)
            end
        end

        function m:SetDesc(t)
            self.desc = t
        end

        function m:SetBind(k)
            self.bind = k
            if self.keybind then
                self.keybind:Set(k or Enum.KeyCode.Unknown, true)
            end
        end

        function m:SetFavorite() end

        function m:Setting(cfg)
            table.insert(self.settings, cfg)
            self.ui:_setting(tab, self, cfg)
            return self
        end

        table.insert(cat.modules, m)
        table.insert(self.allModules, m)
        return m
    end

    function MonoUI:_setting(tab, m, cfg)
        local kind = cfg.Type or "Toggle"
        local title = cfg.Title or cfg.Text or kind
        local flag = flagFor(m.category.name, m.name, title)
        local cb = cfg.Callback or noop

        if kind == "Slider" then
            return tab:CreateSlider({
                Name = title,
                Range = { cfg.Min or 0, cfg.Max or 100 },
                Increment = cfg.Step or cfg.Increment or 1,
                Value = cfg.Default or cfg.Min or 0,
                Suffix = cfg.Suffix,
                Flag = flag,
                Callback = function(v)
                    cb(v)
                end,
            })
        elseif kind == "Dropdown" then
            -- MonoUI re-evaluates GetValues every time its drawer opens; Rayfield
            -- wants the options up front. Seed them, then re-sync on join/leave so
            -- the teleport target lists stay current.
            local dynamic = cfg.GetValues
            local values = cfg.Values or (dynamic and cfg.GetValues()) or {}
            local handle = tab:CreateDropdown({
                Name = title,
                Options = values,
                Value = cfg.Default,
                -- a live player list is not worth persisting between sessions
                ForgetState = dynamic and true or nil,
                Flag = (not dynamic) and flag or nil,
                Callback = function(v)
                    cb(v)
                end,
            })
            if dynamic then
                self:_onPlayersChanged(function()
                    -- Refresh keeps the current selection when it is still in the
                    -- list, and fires the callback when it is not.
                    handle:Refresh(cfg.GetValues())
                end)
            end
            return handle
        elseif kind == "Toggle" then
            return tab:CreateToggle({
                Name = title,
                Value = cfg.Default and true or false,
                Flag = flag,
                Callback = function(v)
                    cb(v)
                end,
            })
        elseif kind == "Keybind" then
            return tab:CreateKeybind({
                Name = title,
                Value = cfg.Default,
                Flag = flag,
                OnChanged = function(k)
                    cb(k)
                end,
            })
        elseif kind == "Button" then
            return tab:CreateButton({
                Name = title,
                Callback = function()
                    cb()
                end,
            })
        elseif kind == "Section" then
            return tab:CreateSection({ Name = cfg.Text or title })
        elseif kind == "Label" then
            return tab:CreateText({ Text = cfg.Text or title })
        end
        return nil
    end

    function MonoUI:Notify(cfg)
        cfg = cfg or {}
        return self.window:Notify({
            Title = cfg.Title or "Mono",
            Content = cfg.Content or cfg.Body or "",
            Duration = cfg.Duration,
        })
    end

    function MonoUI:Confirm(cfg)
        cfg = cfg or {}
        return self.window:Popup({
            Title = cfg.Title or "Confirm",
            Content = cfg.Body or cfg.Content,
            Options = {
                { text = cfg.ConfirmText or "Confirm", style = "danger", callback = cfg.OnConfirm },
                { text = cfg.CancelText or "Cancel", callback = cfg.OnCancel },
            },
        })
    end

    function MonoUI:AddTourStep(cfg)
        table.insert(self.tourSteps, cfg)
    end

    function MonoUI:StartTour()
        self:Notify({
            Title = "Tour unavailable",
            Content = "The guided tour points at MonoUI's own window chrome, which Rayfield does not have."
                .. " Each feature's explanation is in its description instead.",
        })
    end

    -- MonoUI puts a bindable chip on every module row. Rayfield rows have no such
    -- slot, and a keybind under all 49 toggles would bury the features, so the
    -- binds are collected onto one page. Built from Present() because that is the
    -- last thing the feature code calls, by which point every module exists.
    function MonoUI:_buildKeybindsPage()
        if self.pageKeybinds or #self.allModules == 0 then
            return
        end
        local tab = self.window:CreateTab({ Name = "Keybinds", CustomOrder = PAGE_ORDER.Keybinds })
        self.pageKeybinds = tab

        tab:CreateText({
            Name = "Binds",
            Text = "Set a key against any feature to toggle it without opening the menu."
                .. " Click a key to rebind, right-click to clear.",
        })

        local currentCategory
        for _, m in self.allModules do
            if m.category ~= currentCategory then
                currentCategory = m.category
                tab:CreateSection({ Name = currentCategory.name })
            end

            m.keybind = tab:CreateKeybind({
                Name = words(m.name),
                Value = m.bind,
                Hold = m.hold,
                Flag = flagFor(m.category.name, m.name, "bind"),
                Callback = function(v)
                    if m.action then
                        if m.callback then
                            m.callback(true)
                        end
                    elseif m.hold then
                        -- a Hold keybind reports true on press and false on release
                        m:Toggle(v == true)
                    else
                        m:Toggle()
                    end
                end,
                OnChanged = function(k)
                    m.bind = k
                end,
            })
        end
    end

    function MonoUI:Present()
        self:_buildKeybindsPage()
        self.window:Show()
    end

    function MonoUI:Minimize()
        self.window:ToggleMinimise()
    end

    function MonoUI:Restore()
        self.window:Show()
    end

    function MonoUI:Destroy()
        self.window:Unload()
    end

    function MonoUI:SelectTab() end

    function MonoUI:SelectCategory(cat)
        if cat and cat._rfTab then
            self.window:Navigate(cat._rfTab)
        end
    end

    function MonoUI:GetConfig()
        return self.window.Flags
    end

    function MonoUI:LoadConfig(name)
        return self.window:Load(name)
    end

    function MonoUI:SaveConfig(name)
        return self.window:Save(name)
    end

    function MonoUI:ResetSettings()
        self:Notify({
            Title = "Settings",
            Content = "Rayfield keeps its own settings; nothing to reset here.",
        })
    end

    return MonoUI
end

-- ======================================================================
-- Mono MM2 feature code
-- ======================================================================

local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting         = game:GetService("Lighting")
local TeleportService  = game:GetService("TeleportService")
local HttpService      = game:GetService("HttpService")
local RS               = game:GetService("ReplicatedStorage")
local TweenService     = game:GetService("TweenService")
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
local VirtualUser; pcall(function() VirtualUser=game:GetService("VirtualUser") end)
local GuiService       = game:GetService("GuiService")

local LocalPlayer = Players.LocalPlayer
local Camera      = workspace.CurrentCamera

local rndSeed = Random.new(tick() * 1e6 % 2147483647)
local function rnd(len)
    local pool = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local out = {}
    for i = 1, (len or rndSeed:NextInteger(9, 15)) do
        local j = rndSeed:NextInteger(1, #pool)
        out[i] = pool:sub(j, j)
    end
    return table.concat(out)
end
local Fallback={n=0,used={}}
function Fallback.note(system,level,why,mods)
    Fallback.n=Fallback.n+1
    Fallback.used[Fallback.n]={system=system,level=level,why=why,mods=mods or {}}
end
function Fallback.text()
    if Fallback.n==0 then return nil end
    local out={}
    for i=1,Fallback.n do
        local f=Fallback.used[i]
        out[#out+1]=f.system.." is using "..f.level.." because "..f.why.."."
        if #f.mods>0 then out[#out+1]="   Affects: "..table.concat(f.mods,", ") end
    end
    return table.concat(out,"\n")
end

local function protect(inst)
    pcall(function()
        if typeof(syn) == "table" and syn.protect_gui then syn.protect_gui(inst)
        elseif typeof(protectgui) == "function" then protectgui(inst) end
    end)
end

local mountTarget
do
    local mountLevel
    local function try(f) local ok,v=pcall(f); if ok and typeof(v)=="Instance" then return v end end
    mountTarget = typeof(gethui)=="function" and try(gethui) or nil
    if mountTarget then mountLevel="gethui" end
    if not mountTarget then
        mountTarget = try(function()
            local c=game:GetService("CoreGui")
            local probe=Instance.new("Folder"); probe.Parent=c; probe:Destroy()
            return c
        end)
        if mountTarget then mountLevel="CoreGui" end
    end
    if not mountTarget then
        mountTarget = try(function() return LocalPlayer:FindFirstChildOfClass("PlayerGui") end)
            or LocalPlayer:WaitForChild("PlayerGui",10)
        mountLevel="PlayerGui"
    end
    if mountLevel~="gethui" then
        Fallback.note("Menu hiding",mountLevel,
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            mountLevel=="CoreGui" and "gethui is missing, so the menu is in CoreGui where the game could find it"
                or "gethui and CoreGui are both blocked, so the menu sits in PlayerGui in plain sight",
            {"the whole menu","ESP drawings"})
    end
end
local GENV = (typeof(getgenv) == "function") and getgenv() or nil

pcall(function() if GENV and GENV.MONO_Unload then GENV.MONO_Unload() end end)
pcall(function()
    if GENV and type(GENV.MONO_GUIS) == "table" then
        for _, g in ipairs(GENV.MONO_GUIS) do pcall(function() g:Destroy() end) end
    end
end)
for _, g in ipairs(mountTarget:GetChildren()) do
    if g.Name == "Obsidian" or g.Name == "MONO_ESP" or g.Name == "MONO_MINI" then pcall(function() g:Destroy() end) end
end
local TRACKED = {}
if GENV then GENV.MONO_GUIS = TRACKED end
pcall(function()
    if STATE and STATE.onCleanup then
        STATE.onCleanup(function()
            pcall(function() if GENV and GENV.MONO_Unload then GENV.MONO_Unload() end end)
            pcall(function() if typeof(cleardrawcache) == "function" then cleardrawcache() end end)
        end)
    end
end)
local function trackGui(inst) table.insert(TRACKED, inst); protect(inst); return inst end

if false then
    return error("",0)
end
local MonoUI = MakeMonoUI(Rayfield)

local UI={}
local Window
local Unloaded=false
local function isDead() return Unloaded or (Window and Window._destroyed) end

local function create(class,props,children)
    local o=Instance.new(class)
    for k,v in pairs(props or {}) do o[k]=v end
    for _,c in ipairs(children or {}) do c.Parent=o end
    return o
end
local flags={autoKill=false,autoFlingMurderer=false,autoFlingSheriff=false,knifeWalls=false,gunWalls=false,instantKnife=false,gunEsp=false,gunEspDist=false,autoGun=false,aimbot=false,silentAim=false,showFov=false,
    fly=false,flySpeed=60,noclip=false,infJump=false,unlockCam=false,
    espBox=false,espChams=false,footsteps=false,footMine=false,espFill=false,espNames=false,espRoleTags=false,espSkeleton=false,killFeed=false,coinEsp=false,espTracers=false,espAvatar=false,espMaxDist=0,espTracerFrom="Bottom",espBox3D=false,
    fullbright=false,fpsBoost=false,autoCoins=false,murdererNotify=false,antiAfk=false,
    flingPower=10000,flingSeconds=1,trapEsp=false,antiTrap=false,antiFling=false}
local COLLECT_SPEED=16
local aimFov=120
local flinging=false
local Mono={
    tpAt=-10, TP_GRACE=2.5,
    plrs={},
    unclip=setmetatable({},{__mode="k"}),
    mobUp=false, mobDown=false, mobAim=false,
    camThru=nil,
    COIN_MAX_DIST=250,
    wantPS=false,
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    wantNoclip=false,
    tagOwners={},
    guiN=0, guiT=0, guiIns=0,
}
function Mono.teleporting() return os.clock()-Mono.tpAt<Mono.TP_GRACE end
function Mono.markTeleport() Mono.tpAt=os.clock() end
Mono.selfTpAt=-10
function Mono.markSelfTP() Mono.selfTpAt=os.clock() end
function Mono.selfTeleporting() return os.clock()-Mono.selfTpAt<0.35 end
local instantFiredAt=-10
local unstick
local conns={}
local function bind(sig,fn) local c=sig:Connect(fn);table.insert(conns,c);return c end
local function notify(msg,t)
    if not Window then return end
    return Window:Notify({Title="Mono",Content=tostring(msg),Duration=t or 3})
end
function Mono.aimCenter()
    local m=UserInputService:GetMouseLocation()
    local x,y=m.X,m.Y
    local ml=LocalPlayer:FindFirstChild("PlayerScripts")
    ml=ml and ml:FindFirstChild("MouseLock")
    if ml and ml:GetAttribute("Enabled")==true
        and UserInputService.PreferredInput~=Enum.PreferredInput.Gamepad then
        local vs=Camera.ViewportSize
        x,y=vs.X*0.5,vs.Y*0.5
    end
    return Vector2.new(x,y)
end
function Mono.aimViewport() return Mono.aimCenter() end
function Mono.mouseGui()
    local c=Mono.aimCenter()
    local ins=GuiService:GetGuiInset()
    return Vector2.new(c.X-ins.X, c.Y-ins.Y)
end

local MM2_UNIVERSE=66654135
local hopFallbackPlace
local function fetchServers(placeId,maxPages,order)
    local out,cursor={},nil
    for _=1,(maxPages or 4) do
        local url="https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder="..(order or "Asc").."&limit=100"
        if cursor then url=url.."&cursor="..HttpService:UrlEncode(cursor) end
        local ok,res=pcall(function() return game:HttpGet(url) end)
        if not ok then break end
        local ok2,d=pcall(function() return HttpService:JSONDecode(res) end)
        if not (ok2 and d and d.data) then break end
        for _,sv in ipairs(d.data) do out[#out+1]=sv end
        cursor=d.nextPageCursor
        if not cursor then break end
    end
    return out
end
bind(TeleportService.TeleportInitFailed,function(plr)
    if plr==LocalPlayer then Mono.hopFailed=true end
end)
local function hopServers(placeId,excludeJob,fallbackTeleport)
    task.spawn(function()
        local function gather(all,minFree)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            local t={}
            for _,sv in ipairs(all) do
                if sv.id and sv.id~=excludeJob
                    and ((sv.maxPlayers or 0)-(sv.playing or 0))>=minFree then t[#t+1]=sv end
            end
            return t
        end
        local all=fetchServers(placeId,2,"Desc")
        local cand=gather(all,2)
        if #cand==0 then
            all=fetchServers(placeId,3,"Asc")
            cand=gather(all,2)
        end
        if #cand==0 then cand=gather(all,1) end
        if #cand==0 then
            if fallbackTeleport then
                notify("Letting Roblox pick a server...")
                pcall(function() TeleportService:Teleport(placeId,LocalPlayer) end)
            else
                notify("No joinable servers came back, try again in a moment",5)
            end
            return
        end
        table.sort(cand,function(a,b) return (a.playing or 0)>(b.playing or 0) end)
        local top=math.min(#cand,15)
        for i=top,2,-1 do local j=math.random(1,i); cand[i],cand[j]=cand[j],cand[i] end
        hopFallbackPlace=placeId
        for i=1,math.min(#cand,4) do
            Mono.hopFailed=false
            local sv=cand[i]
            pcall(function() TeleportService:TeleportToPlaceInstance(placeId,sv.id,LocalPlayer) end)
            local t0=os.clock()
            while os.clock()-t0<7 and not Mono.hopFailed do task.wait(0.2) end
            if not Mono.hopFailed then return end
            notify("That server filled up, trying another...",2)
        end
        hopFallbackPlace=nil
        notify("Every server tried was full, try again in a moment",5)
    end)
end
local function rejoin() notify("Rejoining..."); pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId,game.JobId,LocalPlayer) end) end
local function serverHop() notify("Finding a server..."); hopServers(game.PlaceId,game.JobId,true) end
if game.GameId~=MM2_UNIVERSE then
    local gui=trackGui(create("ScreenGui",{Name=rnd(),ResetOnSpawn=false,IgnoreGuiInset=true,
        DisplayOrder=1000,Parent=mountTarget}))
    local shade=create("Frame",{Name=rnd(),Size=UDim2.fromScale(1,1),
        BackgroundColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=1,
        BorderSizePixel=0,ZIndex=1,Parent=gui})
    local PAD,CARD_W=24,352
    local BODY_W=CARD_W-PAD*2
    local BODY_TEXT="Mono only works in Murder Mystery 2.\nJoin an MM2 server and run the script again."
    local LINE_H=1.15
    local bodyH=36
    do
        local okS,sz=pcall(function()
            return game:GetService("TextService"):GetTextSize(
                BODY_TEXT,14,Enum.Font.BuilderSans,Vector2.new(BODY_W,1000))
        end)
        if okS and sz then bodyH=math.ceil(sz.Y*LINE_H)+2 end
    end
    local TITLE_Y,TITLE_H,GAP,BTN_H=PAD,22,14,34
    local BODY_Y=TITLE_Y+TITLE_H+GAP
    local CARD_H=BODY_Y+bodyH+22+BTN_H+PAD
    local card=create("Frame",{Name=rnd(),AnchorPoint=Vector2.new(0.5,0.5),
        Position=UDim2.fromScale(0.5,0.5),
        Size=UDim2.fromOffset(math.floor(CARD_W*0.94),math.floor(CARD_H*0.94)),
        BackgroundColor3=Color3.fromRGB(30,30,30),BackgroundTransparency=1,
        BorderSizePixel=0,ZIndex=2,Parent=gui},
        {create("UICorner",{CornerRadius=UDim.new(0,12)})})
    local edge=create("UIStroke",{Color=Color3.fromRGB(52,52,52),Thickness=1,Transparency=1,
        ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Parent=card})
    local title=create("TextLabel",{Name=rnd(),BackgroundTransparency=1,
        Position=UDim2.fromOffset(PAD,TITLE_Y),Size=UDim2.fromOffset(BODY_W,TITLE_H),
        Font=Enum.Font.BuilderSansBold,TextSize=18,TextColor3=Color3.fromRGB(255,255,255),
        TextTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        Text="Wrong game",ZIndex=3,Parent=card})
    local body=create("TextLabel",{Name=rnd(),BackgroundTransparency=1,
        Position=UDim2.fromOffset(PAD,BODY_Y),Size=UDim2.fromOffset(BODY_W,bodyH),
        Font=Enum.Font.BuilderSans,TextSize=14,TextColor3=Color3.fromRGB(150,150,150),
        LineHeight=LINE_H,
        TextTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,
        TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,
        Text=BODY_TEXT,ZIndex=3,Parent=card})
    local okBtn=create("TextButton",{Name=rnd(),AnchorPoint=Vector2.new(1,1),
        Position=UDim2.new(1,-PAD,1,-PAD),Size=UDim2.fromOffset(96,BTN_H),
        BackgroundColor3=Color3.fromRGB(205,205,205),BackgroundTransparency=1,
        AutoButtonColor=false,Text="",ZIndex=3,Parent=card},
        {create("UICorner",{CornerRadius=UDim.new(0,8)})})
    local okLbl=create("TextLabel",{Name=rnd(),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
        Font=Enum.Font.BuilderSansMedium,TextSize=14,TextColor3=Color3.fromRGB(26,26,26),
        TextTransparency=1,Text="OK",ZIndex=4,Parent=okBtn})

    local IN=TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
    local function fade(to)
        TweenService:Create(shade,to and IN or TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.In),
            {BackgroundTransparency=to and 0.5 or 1}):Play()
        local ti=to and IN or TweenInfo.new(0.18,Enum.EasingStyle.Quad,Enum.EasingDirection.In)
        TweenService:Create(card,ti,{BackgroundTransparency=to and 0 or 1}):Play()
        TweenService:Create(edge,ti,{Transparency=to and 0.25 or 1}):Play()
        TweenService:Create(title,ti,{TextTransparency=to and 0 or 1}):Play()
        TweenService:Create(body,ti,{TextTransparency=to and 0 or 1}):Play()
        TweenService:Create(okBtn,ti,{BackgroundTransparency=to and 0 or 1}):Play()
        TweenService:Create(okLbl,ti,{TextTransparency=to and 0 or 1}):Play()
    end
    fade(true)
    TweenService:Create(card,TweenInfo.new(0.24,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
        {Size=UDim2.fromOffset(CARD_W,CARD_H)}):Play()

    okBtn.MouseEnter:Connect(function()
        TweenService:Create(okBtn,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(235,235,235)}):Play()
    end)
    okBtn.MouseLeave:Connect(function()
        TweenService:Create(okBtn,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(205,205,205)}):Play()
    end)

    local closing=false
    local function dismiss()
        if closing then return end
        closing=true
        Unloaded=true
        fade(false)
        task.delay(0.2,function()
            pcall(function() gui:Destroy() end)
            pcall(function() if GENV then GENV.MONO_Unload=nil end end)
        end)
    end
    okBtn.MouseButton1Click:Connect(dismiss)

    pcall(function() if GENV then GENV.MONO_Unload=function()
        Unloaded=true
        pcall(function() gui:Destroy() end)
        GENV.MONO_Unload=nil
    end end end)
    return
end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece

local EspGui=trackGui(create("ScreenGui",{Name=rnd(),ResetOnSpawn=false,IgnoreGuiInset=false,DisplayOrder=998,Parent=mountTarget}))
do
    local lineMT={}
    local function apply(t)
        local f=rawget(t,"_f")
        if not (f and f.Parent) then return end
        local a,b=rawget(t,"_From"),rawget(t,"_To")
        if not (a and b) then return end
        local d=b-a
        f.Position=UDim2.fromOffset((a.X+b.X)*0.5,(a.Y+b.Y)*0.5)
        f.Size=UDim2.fromOffset(math.max(d.Magnitude,1),math.max(rawget(t,"_Thickness") or 1,1))
        f.Rotation=math.deg(math.atan2(d.Y,d.X))
    end
    local function remove(t)
        local f=rawget(t,"_f")
        if f then pcall(function() f:Destroy() end) end
    end
    lineMT.__index=function(t,k)
        if k=="Remove" then return remove end
        return rawget(t,"_"..k)
    end
    lineMT.__newindex=function(t,k,v)
        rawset(t,"_"..k,v)
        local f=rawget(t,"_f")
        if not (f and f.Parent) then return end
        if k=="Visible" then f.Visible=(v==true)
        elseif k=="Color" then f.BackgroundColor3=v
        elseif k=="Transparency" then f.BackgroundTransparency=1-(tonumber(v) or 1)
        elseif k=="From" or k=="To" or k=="Thickness" then apply(t) end
    end
    Mono.hasDrawing=(typeof(Drawing)=="table") and (pcall(function()
        local probe=Drawing.new("Line"); probe:Remove()
    end))
    if not Mono.hasDrawing then
        Fallback.note("ESP lines","GUI frames",
            "your executor has no Drawing library, so lines are built from rotated frames, which costs more on a weak device",
            {"Box ESP","3D Box ESP","Skeleton ESP","Tracers","Show FOV Circle"})
    end
    Mono.drawn={}
    function Mono.trackDraw(o) Mono.drawn[o]=true; return o end
    function Mono.dropDraw(o)
        if o==nil then return end
        Mono.drawn[o]=nil
        pcall(function() o:Remove() end)
    end
    function Mono.clearDrawn()
        for o in pairs(Mono.drawn) do pcall(function() o:Remove() end) end
        table.clear(Mono.drawn)
    end
    function Mono.newLine(thickness)
        if Mono.hasDrawing then
            local l=Drawing.new("Line"); l.Thickness=thickness; l.Transparency=1; l.Visible=false
            return Mono.trackDraw(l)
        end
        local t=setmetatable({},lineMT)
        rawset(t,"_f",create("Frame",{Name=rnd(),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,
            BackgroundColor3=Color3.new(1,1,1),Visible=false,ZIndex=3,Parent=EspGui}))
        rawset(t,"_Thickness",thickness)
        rawset(t,"_Visible",false)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        return t
    end
end

local CRC; pcall(function() CRC=require(RS:WaitForChild("Modules"):WaitForChild("CurrentRoundClient")) end)
local function roundData(plr) return CRC and CRC.PlayerData and CRC.PlayerData[plr.Name] end
local function getHRP(ch) return ch and ch:FindFirstChild("HumanoidRootPart") end
local function badVec(v)
    if typeof(v)~="Vector3" then return true end
    if v.X~=v.X or v.Y~=v.Y or v.Z~=v.Z then return true end
    local inf=math.huge
    if v.X==inf or v.X==-inf then return true end
    if v.Y==inf or v.Y==-inf then return true end
    if v.Z==inf or v.Z==-inf then return true end
    return false
end
local function badCF(cf)
    if typeof(cf)~="CFrame" then return true end
    local p=cf.Position
    if badVec(p) then return true end
    if math.abs(p.X)>1e6 or math.abs(p.Y)>1e6 or math.abs(p.Z)>1e6 then return true end
    return false
end
local function charHasWeapon(ch,kind)
    for _,t in ipairs(ch:GetChildren()) do
        if t:IsA("Tool") then
            if kind=="Gun" and (t.Name=="Gun" or t:FindFirstChild("Shoot")) then return true end
            if kind=="Knife" and (t.Name=="Knife" or t:FindFirstChild("Events")) then return true end
        end
    end
    return false
end
local CollectionService=game:GetService("CollectionService")
function Mono.refreshTags()
    for _,tag in ipairs({"Weapon_Gun","Weapon_Knife"}) do
        local m=Mono.tagOwners[tag]
        if m then table.clear(m) else m={}; Mono.tagOwners[tag]=m end
        for _,t in ipairs(CollectionService:GetTagged(tag)) do
            local par=t.Parent
            if par then m[par]=true end
        end
    end
end
Mono.refreshTags()
local function playerHasTagged(plr,tag)
    local m=Mono.tagOwners[tag]; if not m then return false end
    local ch=plr.Character
    if ch and m[ch] then return true end
    local bp=plr:FindFirstChildOfClass("Backpack")
    if bp and m[bp] then return true end
    return false
end
local function computeRole(plr)
    local d=roundData(plr)
    local r=d and d.Role
    if r=="Murderer" then return "Murderer" end
    if r=="Sheriff" or r=="Hero" then return r end
    local ch=plr.Character
    if playerHasTagged(plr,"Weapon_Gun") or (ch and charHasWeapon(ch,"Gun")) then return "Hero" end
    if playerHasTagged(plr,"Weapon_Knife") or (ch and charHasWeapon(ch,"Knife")) then return "Murderer" end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    return r or "Innocent"
end
local function computeAlive(plr)
    local d=roundData(plr); if d and d.Dead==true then return false end
    local ch=plr.Character; local hum=ch and ch:FindFirstChildOfClass("Humanoid")
    return ch and hum and hum.Health>0 and getHRP(ch)
end
local CACHE_TTL=0.05
local roleCache,aliveCache,cacheStamp={},{},0
local function sweepCaches()
    local now=os.clock()
    if now-cacheStamp>CACHE_TTL then
        table.clear(roleCache); table.clear(aliveCache); cacheStamp=now
        Mono.refreshTags()
    end
    if now-(Mono.rosterAt or 0)>2 then
        Mono.rosterAt=now
        Mono.refreshPlrs()
    end
end
local function roleOf(plr)
    sweepCaches()
    local v=roleCache[plr]
    if v==nil then v=computeRole(plr); roleCache[plr]=v end
    return v
end
local function alive(plr)
    sweepCaches()
    local v=aliveCache[plr]
    if v==nil then v=computeAlive(plr) or false; aliveCache[plr]=v end
    return v
end
function Mono.hasBody(plr)
    local ch=plr.Character
    if not ch then return nil end
    local hum=ch:FindFirstChildOfClass("Humanoid")
    if not (hum and hum.Health>0) then return nil end
    local hrp=ch:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    return ch,hum,hrp
end
local function myRole() return roleOf(LocalPlayer) end
local function isGunRole(role) return role=="Sheriff" or role=="Hero" end
local function isEnemyOf(myrole,role)
    if myrole=="Murderer" then return true end
    if isGunRole(myrole) then return role=="Murderer" end
    return false
end
function Mono.refreshPlrs()
    local ok,list=pcall(function() return Players:GetPlayers() end)
    if ok and type(list)=="table" then Mono.plrs=list end
end
Mono.refreshPlrs()
bind(Players.PlayerAdded,Mono.refreshPlrs)
bind(Players.PlayerRemoving,function()
    task.defer(Mono.refreshPlrs)
end)
local function findMurderer() for _,p in ipairs(Mono.plrs) do if roleOf(p)=="Murderer" then return p end end end
local function findWeapon(n) local ch=LocalPlayer.Character; local bp=LocalPlayer:FindFirstChildOfClass("Backpack"); return (ch and ch:FindFirstChild(n)) or (bp and bp:FindFirstChild(n)) end
local function equip(tool) local ch=LocalPlayer.Character; local hum=ch and ch:FindFirstChildOfClass("Humanoid"); if tool and hum and tool.Parent~=ch then pcall(function() hum:EquipTool(tool) end) end end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece

function Mono.aimPointFor(p)
    local ch=p and p.Character; local hrp=ch and getHRP(ch); if not hrp then return end
    local part=ch:FindFirstChild("UpperTorso") or ch:FindFirstChild("Torso") or hrp
    return part.Position
end
Mono.WALL_BACKOFF=0.6

local KNIFE_PARTS={"HumanoidRootPart","UpperTorso","LowerTorso","Torso","Head"}
local function knifeKill(ev,targetChar)
    if not (ev and targetChar) then return end
    local ht=ev:FindFirstChild("HandleTouched"); local ks=ev:FindFirstChild("KnifeStabbed")
    if not ht then return end
    if ks then ks:FireServer() end
    for _,pn in ipairs(KNIFE_PARTS) do
        local part=targetChar:FindFirstChild(pn)
        if part then ht:FireServer(part) return end
    end
end
Mono.SNAP_HEIGHT=5
Mono.GUN_COOLDOWN=3.25
Mono.SNAP_COOLDOWN=3.25
Mono.snapAt=-10
local snapping=false
function Mono.gunOrigin()
    local ch=LocalPlayer.Character
    local hrp=ch and ch:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local att=hrp:FindFirstChild("GunRaycastAttachment")
    if att then return att.WorldCFrame end
    return hrp.CFrame
end

function Mono.aimPoint(ch)
    local part=ch:FindFirstChild("HumanoidRootPart") or ch:FindFirstChild("UpperTorso")
        or ch:FindFirstChild("Torso") or ch:FindFirstChild("Head")
    return part and part.Position
end

function Mono.gunBusy(lead)
    local gun=findWeapon("Gun")
    if not gun then return false end
    if os.clock()-Mono.snapAt<Mono.GUN_COOLDOWN-(lead or 0) then return true end
    return false
end
do
    local cs=RS:FindFirstChild("ClientServices")
    local ws=cs and cs:FindFirstChild("WeaponService")
    local gf=ws and ws:FindFirstChild("GunFired")
    if gf and gf:IsA("RemoteEvent") then
        bind(gf.OnClientEvent,function(handle)
            local ch=LocalPlayer.Character
            if ch and typeof(handle)=="Instance" and handle:IsDescendantOf(ch) then
                local rt=os.clock()-Mono.snapAt
                if rt>0 and rt<1.5 then Mono.shotLag=(Mono.shotLag or 0.08)*0.7+rt*0.3 end
                Mono.snapAt=os.clock()
            end
        end)
    end
end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece

local function snapShot(target)
    if snapping then return false end
    local lagT=math.clamp(Mono.shotLag or 0.08,0.03,0.25)
    local preLock=math.clamp(lagT*1.5,0.12,0.35)
    if Mono.gunBusy(preLock) then return false end
    local gun=findWeapon("Gun"); if not gun then return false end
    local shoot=gun:FindFirstChild("Shoot"); if not shoot then return false end
    local myHrp=getHRP(LocalPlayer.Character)
    local tChar=target and target.Character
    local tHrp=tChar and getHRP(tChar)
    if not (myHrp and tHrp and Mono.canAct()) then return false end
    snapping=true

    local home=myHrp.CFrame
    local homeVel=myHrp.AssemblyLinearVelocity
    local myHum=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    local homeState=myHum and myHum:GetState() or nil
    local fired=false

    pcall(function()
        equip(gun)
        local deadline=os.clock()+0.4
        while os.clock()<deadline do
            local h=getHRP(LocalPlayer.Character)
            if h and h:FindFirstChild("GunRaycastAttachment") then break end
            RunService.Heartbeat:Wait()
        end

        Mono.markSelfTP()
        local aim=Mono.aimPoint(tChar)
        if not aim then return end
        local side=home.Position-aim
        side=Vector3.new(side.X,0,side.Z)
        if side.Magnitude<0.5 then
            local lv=tHrp.CFrame.LookVector
            side=Vector3.new(lv.X,0,lv.Z)
        end
        if side.Magnitude<0.5 then side=Vector3.new(0,0,1) end
        side=side.Unit
        local rp=RaycastParams.new()
        rp.FilterType=Enum.RaycastFilterType.Exclude
        rp.FilterDescendantsInstances={tChar,LocalPlayer.Character}
        if workspace:Raycast(aim,side*Mono.SNAP_HEIGHT,rp) then side=-side end
        local relOff=side*Mono.SNAP_HEIGHT

        local chest=aim
        local function lockOn(dur)
            local t0=os.clock()
            repeat
                local h=getHRP(LocalPlayer.Character)
                local tr=target.Character and getHRP(target.Character)
                if not (h and tr) then return false end
                if Mono.teleporting() then return false end
                local nxt=Mono.aimPoint(target.Character)
                if nxt and (nxt-chest).Magnitude>60 then return false end
                chest=nxt or chest
                h.CFrame=CFrame.new(chest+relOff,chest)
                h.AssemblyLinearVelocity=Vector3.zero
                h.AssemblyAngularVelocity=Vector3.zero
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
                Mono.markSelfTP()
                RunService.Heartbeat:Wait()
            until os.clock()-t0>=dur
            return true
        end

        if not lockOn(preLock) then return end

        local origin=Mono.gunOrigin()
        if origin then
            local tr2=target.Character and getHRP(target.Character)
            local vel=tr2 and tr2.AssemblyLinearVelocity or Vector3.zero
            shoot:FireServer(origin,CFrame.new(chest+vel*lagT))
            Mono.snapAt=os.clock()
            fired=true
            lockOn(math.clamp(lagT*2,0.16,0.5))
        end
    end)

    RunService.Heartbeat:Wait()
    Mono.markSelfTP()
    local h3=getHRP(LocalPlayer.Character)
    if h3 then
        h3.CFrame=home
        h3.AssemblyLinearVelocity=homeVel
        h3.AssemblyAngularVelocity=Vector3.zero
    end
    local hum3=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum3 then
        if homeState and homeState~=Enum.HumanoidStateType.Dead then
            pcall(function() hum3:ChangeState(homeState) end)
        else
            pcall(function() hum3:ChangeState(Enum.HumanoidStateType.GettingUp) end)
        end
        pcall(function() hum3:Move(hum3.MoveDirection,false) end)
    end
    snapping=false
    return fired
end
local function enemies()
    local role=myRole(); local list={}
    if isGunRole(role) then local m=findMurderer(); if m and alive(m) then table.insert(list,m) end
    else for _,p in ipairs(Mono.plrs) do if p~=LocalPlayer and alive(p) then table.insert(list,p) end end end
    return list,role
end
local function fovTarget()
    local mr=myRole()
    local center=Mono.aimViewport(); local best,bd
    for _,p in ipairs(Mono.plrs) do
        if p~=LocalPlayer and alive(p) then
            local pr=roleOf(p)
            if isEnemyOf(mr,pr) or pr=="Murderer" then
                local hrp=getHRP(p.Character)
                if hrp then
                    local v,on=Camera:WorldToViewportPoint(hrp.Position)
                    if on and v.Z>0 then
                        local d=(Vector2.new(v.X,v.Y)-center).Magnitude
                        if d<=aimFov and (not bd or d<bd) then bd,best=d,p end
                    end
                end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            end
        end
    end
    return best
end

task.spawn(function() while not isDead() do
  local okLoop,errLoop=pcall(function()
    if flags.autoKill then
        local list,role=enemies()
        if role=="Murderer" then
            local knife=findWeapon("Knife"); local ev=knife and knife:FindFirstChild("Events")
            if ev then equip(knife)
                for _,tgt in ipairs(list) do
                    if not flags.autoKill then break end
                    knifeKill(ev,tgt.Character)
                end
            end
            task.wait(0.05)
        elseif isGunRole(role) then
            local m=list[1]
            if m and alive(m) then snapShot(m) end
            task.wait(0.05)
        else task.wait(0.1) end
    else task.wait(0.08) end
  end)
  if not okLoop then warn("[MONO] auto kill: "..tostring(errLoop)); task.wait(0.25) end
end end)
local FovCircle=create("Frame",{Name=rnd(),AnchorPoint=Vector2.new(.5,.5),Position=UDim2.fromScale(.5,.5),Size=UDim2.fromOffset(240,240),BackgroundTransparency=1,BorderSizePixel=0,Visible=false,Parent=EspGui},
    {create("UICorner",{CornerRadius=UDim.new(1,0)}),create("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1.5,Transparency=0.25})})
bind(RunService.RenderStepped,function()
    if flags.showFov and (flags.aimbot or flags.silentAim) then
        FovCircle.Visible=true; FovCircle.Size=UDim2.fromOffset(aimFov*2,aimFov*2); local mp=Mono.mouseGui(); FovCircle.Position=UDim2.fromOffset(mp.X,mp.Y)
    else FovCircle.Visible=false end
    if flags.aimbot or Mono.mobAim then
        local t=fovTarget()
        if t then local th=t.Character:FindFirstChild("Head") or getHRP(t.Character)
            if th then Camera.CFrame=Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position,th.Position),0.45) end end
    end
end)
local silentAimPos
local function crosshairAnyPlayerPos(radius)
    local center=Mono.aimViewport()
    local best,bd
    for _,p in ipairs(Mono.plrs) do
        if p~=LocalPlayer and alive(p) then
            local ch=p.Character; local hrp=getHRP(ch)
            if hrp then
                local sp=Camera:WorldToViewportPoint(hrp.Position)
                if sp.Z>0 then
                    local d=(Vector2.new(sp.X,sp.Y)-center).Magnitude
                    if d<=radius and (not bd or d<bd) then
                        bd=d
                        best=p
                    end
                end
            end
        end
    end
    return best and Mono.aimPointFor(best) or nil
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
end
Mono.SILENT_HOLD=1.8
function Mono.crosshairPlayer(radius)
    local center=Mono.aimViewport()
    local best,bd
    for _,p in ipairs(Mono.plrs) do
        if p~=LocalPlayer and alive(p) then
            local hrp=getHRP(p.Character)
            if hrp then
                local sp=Camera:WorldToViewportPoint(hrp.Position)
                if sp.Z>0 then
                    local d=(Vector2.new(sp.X,sp.Y)-center).Magnitude
                    if d<=radius and (not bd or d<bd) then bd=d; best=p end
                end
            end
        end
    end
    return best
end
local function computeSilentTarget()
    if myRole()~="Murderer" then Mono.silentPlr=nil return nil end
    local p=Mono.crosshairPlayer(aimFov)
    if p then
        Mono.silentPlr=p
        Mono.silentAt=os.clock()
        return Mono.aimPointFor(p)
    end
    local last=Mono.silentPlr
    if last and os.clock()-(Mono.silentAt or -10)<Mono.SILENT_HOLD and alive(last) then
        local held=Mono.aimPointFor(last)
        if held then return held end
    end
    Mono.silentPlr=nil
    return nil
end
local function aimRay()
    local c=Mono.aimCenter()
    return Camera:ViewportPointToRay(c.X,c.Y)
end
local function wallAimPos()
    local ray=aimRay()
    local origin,dir=ray.Origin,ray.Direction.Unit
    local far=origin+dir*300
    local chars={}
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer and alive(p) and p.Character then chars[#chars+1]=p.Character end
    end
    if #chars==0 then return nil,far end
    local params=RaycastParams.new()
    params.FilterType=Enum.RaycastFilterType.Include
    params.FilterDescendantsInstances=chars
    local hit=workspace:Raycast(origin,dir*300,params)
    if hit then return hit.Position,far end
    return crosshairAnyPlayerPos(aimFov),far
end
local wallSnapPos, wallFarPos, myHrpPos
bind(RunService.Heartbeat,function()
    silentAimPos = flags.silentAim and computeSilentTarget() or nil
    if flags.knifeWalls or flags.gunWalls then
        wallSnapPos, wallFarPos = wallAimPos()
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    else
        wallSnapPos, wallFarPos = nil, nil
    end
    local h=getHRP(LocalPlayer.Character); myHrpPos = h and h.Position or nil
end)
Mono.hookOk=pcall(function()
    if typeof(hookmetamethod)~="function" or typeof(newcclosure)~="function"
        or typeof(checkcaller)~="function" or typeof(getnamecallmethod)~="function" then
        error("executor has no __namecall hooking")
    end
    local oldNamecall
    oldNamecall=hookmetamethod(game,"__namecall",newcclosure(function(self,...)
        if not Unloaded and not checkcaller() and getnamecallmethod()=="FireServer" then
            local nm=self.Name
            if nm=="Shoot" or nm=="KnifeThrown" then
                if nm=="Shoot" and flags.silentAim and not snapping and not Mono.gunBusy()
                    and os.clock()-Mono.snapAt>=Mono.SNAP_COOLDOWN and isGunRole(myRole()) then
                    local ft=fovTarget()
                    if ft then
                        task.spawn(function() snapShot(ft) end)
                        return
                    end
                end
                local walls=(nm=="Shoot" and flags.gunWalls) or (nm=="KnifeThrown" and flags.knifeWalls)
                if nm=="KnifeThrown" and flags.instantKnife and os.clock()-instantFiredAt<0.6 then
                    return
                end
                local silent=flags.silentAim and silentAimPos
                local wallTarget
                if walls then
                    if nm=="Shoot" then wallTarget=wallSnapPos
                    else wallTarget=wallSnapPos or wallFarPos end
                end
                local retarget=(silent and silentAimPos) or wallTarget or nil
                if retarget then
                    local n=select("#",...)
                    if n>=2 then
                        local a={...}
                        if typeof(a[2])=="CFrame" then
                            if retarget then a[2]=CFrame.new(retarget) end
                            if walls and retarget and myHrpPos and typeof(a[1])=="CFrame" then
                                local tp=a[2].Position
                                local d=tp-myHrpPos
                                d=(d.Magnitude>0.1) and d.Unit or Vector3.new(0,0,-1)
                                a[1]=CFrame.new(tp-d*Mono.WALL_BACKOFF,tp)
                            end
                            return oldNamecall(self,table.unpack(a,1,n))
                        end
                    end
                end
            end
        end
        return oldNamecall(self,...)
    end))
end)

local WeaponService
pcall(function() WeaponService=require(RS:WaitForChild("ClientServices"):WaitForChild("WeaponService")) end)
local function gameAimCFrame()
    if WeaponService then
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        local ok,cf=pcall(function() return WeaponService:GetMouseTargetCFrame() end)
        if ok and typeof(cf)=="CFrame" then return cf end
    end
    local ray=aimRay()
    return CFrame.new(ray.Origin+ray.Direction.Unit*300)
end
if not Mono.hookOk then
    Fallback.note("Weapon retargeting","direct fire",
        "your executor cannot hook __namecall, so Mono fires the weapon remote itself instead of quietly redirecting the shot the game already sends",
        {"Silent Aim","Gun Through Walls","Knife Through Walls","Instant Knife Throw"})
    bind(UserInputService.InputBegan,function(input,processed)
        if processed or isDead() then return end
        local it=input.UserInputType
        if it~=Enum.UserInputType.MouseButton1 and it~=Enum.UserInputType.Touch then return end
        if not (flags.gunWalls or flags.knifeWalls or flags.silentAim) then return end
        task.spawn(function()
            local ch=LocalPlayer.Character
            if not (ch and Mono.canAct()) then return end
            local mine=getHRP(ch); if not mine then return end
            local gun=ch:FindFirstChild("Gun")
            if gun and gun:FindFirstChild("Shoot") then
                if Mono.gunBusy() then return end
                if flags.silentAim and isGunRole(myRole()) then
                    local ft=fovTarget()
                    if ft then snapShot(ft) return end
                end
                if flags.gunWalls then
                    local snap=wallAimPos()
                    if snap then
                        local d=snap-mine.Position
                        d=(d.Magnitude>0.1) and d.Unit or Vector3.new(0,0,-1)
                        pcall(function() gun.Shoot:FireServer(CFrame.new(snap-d*2,snap),CFrame.new(snap)) end)
                    end
                end
                return
            end
            local knife=ch:FindFirstChild("Knife")
            local ev=knife and knife:FindFirstChild("Events")
            local thrown=ev and ev:FindFirstChild("KnifeThrown")
            if thrown and (flags.knifeWalls or flags.silentAim) then
                local snap=(flags.silentAim and crosshairAnyPlayerPos(aimFov)) or wallAimPos()
                if snap then
                    local d=snap-mine.Position
                    d=(d.Magnitude>0.1) and d.Unit or Vector3.new(0,0,-1)
                    local h2=knife:FindFirstChild("Handle")
                    local o2
                    if flags.knifeWalls or not h2 then
                        o2=CFrame.new(snap-d*Mono.WALL_BACKOFF,snap)
                    else
                        o2=h2.CFrame
                    end
                    pcall(function() thrown:FireServer(o2,CFrame.new(snap)) end)
                end
            end
        end)
    end)
end

local function throwKnifeNow(ignoreCooldown)
    local ch=LocalPlayer.Character
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    if not ch then return false end
    local knife=ch:FindFirstChild("Knife")
    if not knife then
        local bp=LocalPlayer:FindFirstChild("Backpack")
        local stowed=bp and bp:FindFirstChild("Knife")
        if stowed then
            local hum=ch:FindFirstChildOfClass("Humanoid")
            if hum then pcall(function() hum:EquipTool(stowed) end) end
            knife=ch:FindFirstChild("Knife") or stowed
        end
    end
    if not knife then return false end
    local ev=knife:FindFirstChild("Events")
    local thrown=ev and ev:FindFirstChild("KnifeThrown")
    if not thrown then return false end
    if knife:GetAttribute("Disabled")==true then return false end
    if not ignoreCooldown then
        local cd=2*(tonumber(knife:GetAttribute("ThrowSpeed")) or 1)
        if os.clock()-instantFiredAt<cd then return false end
    end
    local target=silentAimPos
    if not target then
        if flags.knifeWalls then
            local snap,far=wallAimPos()
            target=snap or far
        else
            target=gameAimCFrame().Position
        end
    end
    if not target then return false end
    local hrp=getHRP(ch); if not hrp then return false end
    local d=target-hrp.Position
    d=(d.Magnitude>0.1) and d.Unit or Vector3.new(0,0,-1)
    instantFiredAt=os.clock()
    local handle=knife:FindFirstChild("Handle")
    local origin
    if flags.knifeWalls or not handle then
        origin=CFrame.new(target-d*Mono.WALL_BACKOFF,target)
    else
        origin=handle.CFrame
    end
    thrown:FireServer(origin,CFrame.new(target))
    return true
end
bind(UserInputService.InputBegan,function(input,gpe)
    if gpe then return end
    if input.UserInputType~=Enum.UserInputType.MouseButton2 then return end
    if flags.instantKnife then throwKnifeNow(false) end
end)
task.spawn(function()
    local ok,act=pcall(function()
        local ic=LocalPlayer:WaitForChild("PlayerGui",10):WaitForChild("InputContext",10)
        return ic:WaitForChild("GameplayContext",10):WaitForChild("Throw",10)
    end)
    if ok and act then
        pcall(function()
            bind(act.Pressed,function()
                if flags.instantKnife then throwKnifeNow(false) end
            end)
        end)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    end
end)

local controlModule
local function getControls()
    if not controlModule then
        pcall(function()
            controlModule=require(LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
        end)
    end
    return controlModule
end
local lastJumpAt=-10
local flyBV,flyBG
local function startFly() local ch=LocalPlayer.Character; local hrp=getHRP(ch); local hum=ch and ch:FindFirstChildOfClass("Humanoid")
    if not (hrp and hum) then return end; hum.PlatformStand=true; Mono.wantPS=true
    flyBV=create("BodyVelocity",{MaxForce=Vector3.new(1,1,1)*9e9,P=9e4,Velocity=Vector3.zero,Parent=hrp})
    flyBG=create("BodyGyro",{MaxTorque=Vector3.new(1,1,1)*9e9,P=9e4,CFrame=hrp.CFrame,Parent=hrp}) end
local function stopFly() local ch=LocalPlayer.Character; local hum=ch and ch:FindFirstChildOfClass("Humanoid")
    if hum then hum.PlatformStand=false end; Mono.wantPS=false; if flyBV then flyBV:Destroy();flyBV=nil end; if flyBG then flyBG:Destroy();flyBG=nil end end
bind(RunService.RenderStepped,function()
    if not flags.fly or not flyBV then return end
    local hrp=getHRP(LocalPlayer.Character); if not hrp then return end
    local dir=Vector3.zero; local look,right=Camera.CFrame.LookVector,Camera.CFrame.RightVector
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir+=look end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir-=look end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir+=right end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir-=right end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) or Mono.mobUp then dir+=Vector3.new(0,1,0) end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or Mono.mobDown then dir-=Vector3.new(0,1,0) end
    if dir.Magnitude==0 then
        local c=getControls()
        local mv=c and c:GetMoveVector()
        if mv and mv.Magnitude>0 then dir=dir+(look*(-mv.Z))+(right*mv.X) end
    end
    if os.clock()-lastJumpAt<0.25 then dir+=Vector3.new(0,1,0) end
    flyBV.Velocity=(dir.Magnitude>0 and dir.Unit or Vector3.zero)*flags.flySpeed; flyBG.CFrame=Camera.CFrame
end)
do
    local TOUCH_ONLY=UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    local pad,btns=nil,{}
    local function build()
        local gui=trackGui(create("ScreenGui",{Name=rnd(),ResetOnSpawn=false,IgnoreGuiInset=false,
            DisplayOrder=999,Parent=mountTarget}))
        pad=create("Frame",{Name=rnd(),AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-20,1,-150),
            Size=UDim2.fromOffset(70,252),BackgroundTransparency=1,Visible=false,Parent=gui})
        local grip=create("Frame",{Name=rnd(),Size=UDim2.fromOffset(70,18),BackgroundColor3=Color3.fromRGB(19,19,21),
            BackgroundTransparency=0.25,BorderSizePixel=0,Parent=pad},
            {create("UICorner",{CornerRadius=UDim.new(1,0)}),
             create("Frame",{Name=rnd(),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),
                Size=UDim2.fromOffset(26,2),BackgroundColor3=Color3.fromRGB(150,150,155),
                BackgroundTransparency=0.3,BorderSizePixel=0},{create("UICorner",{CornerRadius=UDim.new(1,0)})})})
        local function pill(y,glyph,set)
            local b=create("TextButton",{Name=rnd(),Position=UDim2.fromOffset(0,y),Size=UDim2.fromOffset(70,70),
                BackgroundColor3=Color3.fromRGB(19,19,21),BackgroundTransparency=0.15,AutoButtonColor=false,
                Text=glyph,TextColor3=Color3.fromRGB(238,238,240),TextSize=27,Font=Enum.Font.GothamMedium,
                Visible=false,Parent=pad},
                {create("UICorner",{CornerRadius=UDim.new(1,0)}),
                 create("UIStroke",{Color=Color3.fromRGB(72,72,76),Thickness=1,Transparency=0.35})})
            b.InputBegan:Connect(function(i)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
                if i.UserInputType==Enum.UserInputType.Touch then set(true); b.BackgroundTransparency=0 end
            end)
            b.InputEnded:Connect(function(i)
                if i.UserInputType==Enum.UserInputType.Touch then set(false); b.BackgroundTransparency=0.15 end
            end)
            return b
        end
        btns.up=pill(26,"▲",function(v) Mono.mobUp=v end)
        btns.down=pill(117,"▼",function(v) Mono.mobDown=v end)
        btns.aim=pill(208,"◎",function(v) Mono.mobAim=v end)

        local drag,startPos,startIn=false,nil,nil
        grip.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.Touch then
                drag=true; startPos=pad.Position; startIn=i.Position
            end
        end)
        grip.InputEnded:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.Touch then drag=false end
        end)
        bind(UserInputService.InputChanged,function(i)
            if drag and i.UserInputType==Enum.UserInputType.Touch and startPos then
                local d=i.Position-startIn
                pad.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,
                    startPos.Y.Scale,startPos.Y.Offset+d.Y)
            end
        end)
    end

    local last=0
    bind(RunService.Heartbeat,function()
        if not TOUCH_ONLY then return end
        local now=os.clock()
        if now-last<0.25 then return end
        last=now
        local wantFly=flags.fly and true or false
        local wantAim=flags.aimbot and true or false
        if not (wantFly or wantAim) then
            if pad then pad.Visible=false end
            Mono.mobUp,Mono.mobDown,Mono.mobAim=false,false,false
            return
        end
        if not pad then build() end
        btns.up.Visible=wantFly
        btns.down.Visible=wantFly
        btns.aim.Visible=wantAim
        btns.aim.Position=UDim2.fromOffset(0,wantFly and 208 or 26)
        pad.Size=UDim2.fromOffset(70,26+(wantFly and 182 or 0)+(wantAim and 70 or 0))
        pad.Visible=true
    end)
end

local charParts,charPartsFor={},nil
local function refreshCharParts(ch)
    charParts={}
    if Mono.cpConn then Mono.cpConn:Disconnect(); Mono.cpConn=nil end
    if not ch then charPartsFor=nil return end
    for _,p in ipairs(ch:GetDescendants()) do
        if p:IsA("BasePart") then charParts[#charParts+1]=p end
    end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    charPartsFor=ch
    Mono.cpConn=ch.DescendantAdded:Connect(function(d)
        if ch==charPartsFor and d:IsA("BasePart") then charParts[#charParts+1]=d end
    end)
    table.insert(conns,Mono.cpConn)
end
local function getCharParts(ch)
    if ch~=charPartsFor then refreshCharParts(ch) end
    return charParts
end
bind(LocalPlayer.CharacterAdded,function(ch)
    task.defer(function() refreshCharParts(ch) end)
end)
if LocalPlayer.Character then refreshCharParts(LocalPlayer.Character) end
local function uncollide(ch)
    for _,p in ipairs(getCharParts(ch)) do
        if p.Parent and p.CanCollide then p.CanCollide=false; Mono.unclip[p]=true end
    end
end
function Mono.recollide(hum,force)
    if (not force) and (flags.noclip or flinging or Mono.wantNoclip) then return end
    for p in pairs(Mono.unclip) do
        if p.Parent then p.CanCollide=true end
    end
    table.clear(Mono.unclip)
    if hum then
        pcall(function() hum:ChangeState(Enum.HumanoidStateType.GettingUp) end)
    end
end

bind(RunService.Stepped,function()
    if flinging and os.clock()-(Mono.flingAt or 0)>(flags.flingSeconds or 3)+8 then flinging=false end
    if not (flags.noclip or flinging or Mono.wantNoclip) then
        if next(Mono.unclip) then
            Mono.recollide(LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
        end
        return
    end
    local ch=LocalPlayer.Character; if not ch then return end
    uncollide(ch)
end)
bind(UserInputService.JumpRequest,function() lastJumpAt=os.clock() if flags.infJump then local hum=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end end end)

local origMaxZoom=LocalPlayer.CameraMaxZoomDistance
local function setUnlockCam(on) pcall(function() LocalPlayer.CameraMaxZoomDistance=on and 10000 or origMaxZoom end) end
local camCams,origOccUpdate
local function getCams()
    if camCams then return camCams end
    if os.clock()-(Mono.camTryAt or -10)<2 then return nil end
    Mono.camTryAt=os.clock()
    pcall(function() camCams=require(LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetCameras() end)
    return camCams
end
local function setCamThruWalls(on)
    if Mono.camThru==on then return end
    Mono.camThru=on
    local cams=getCams(); if not cams then Mono.camThru=nil return end
    local occ=cams.activeOcclusionModule; if not (occ and occ.Update) then return end
    if on and not occ.__monoHook then
        origOccUpdate=occ.Update; occ.__monoHook=true
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        occ.Update=function(_,_,desiredCF,desiredFocus) return desiredCF,desiredFocus end
    elseif (not on) and occ.__monoHook then
        occ.Update=origOccUpdate; occ.__monoHook=false
    end
end
bind(RunService.Heartbeat,function()
    if flags.unlockCam and LocalPlayer.CameraMaxZoomDistance<9999 then setUnlockCam(true) end
    setCamThruWalls(flags.unlockCam and flags.noclip)
end)

local espStore={}
Mono.TextService=game:GetService("TextService")
Mono.nameHidden=setmetatable({},{__mode="k"})
function Mono.setRobloxNames(hide)
    for _,p in ipairs(Mono.plrs) do
        if p~=LocalPlayer then
            local hum=p.Character and p.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                if hide then
                    if Mono.nameHidden[hum]==nil then
                        Mono.nameHidden[hum]={hum.DisplayDistanceType,hum.HealthDisplayDistance,hum.NameDisplayDistance}
                    end
                    if hum.DisplayDistanceType~=Enum.HumanoidDisplayDistanceType.None then
                        hum.DisplayDistanceType=Enum.HumanoidDisplayDistanceType.None
                    end
                else
                    local o=Mono.nameHidden[hum]
                    if o then
                        pcall(function()
                            hum.DisplayDistanceType=o[1]
                            hum.HealthDisplayDistance=o[2]
                            hum.NameDisplayDistance=o[3]
                        end)
                        Mono.nameHidden[hum]=nil
                    end
                end
            end
        end
    end
end

local function clearEsp(plr) local e=espStore[plr]; if not e then return end
    if e.hl then e.hl:Destroy() end; if e.bb then e.bb:Destroy() end; espStore[plr]=nil end
function Mono.espRole(plr)
    local d=roundData(plr)
    if d and d.Dead==true then return "Innocent" end
    return roleOf(plr)
end
local function espColor(role) if not flags.espRoleTags then return Color3.fromRGB(214,214,220) end
    if role=="Murderer" then return Color3.fromRGB(255,80,80) elseif isGunRole(role) then return Color3.fromRGB(90,150,255) else return Color3.fromRGB(95,225,125) end end
local function tagOf(role) return role=="Murderer" and "[M]" or isGunRole(role) and "[S]" or "[I]" end
local guiRects={}
function Mono.addRect(o)
    if not (o and o.Visible and o.AbsoluteSize.X>1 and o.AbsoluteSize.Y>1) then return end
    if o:IsA("Frame") and o.BackgroundTransparency>=1 then
        for _,c in ipairs(o:GetChildren()) do
            if c:IsA("GuiObject") then Mono.addRect(c) end
        end
        return
    end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    local p,s=o.AbsolutePosition,o.AbsoluteSize
    local oy=p.Y+Mono.guiIns
    Mono.guiN=Mono.guiN+1
    local r=guiRects[Mono.guiN]
    if r then r[1],r[2],r[3],r[4]=p.X,oy,p.X+s.X,oy+s.Y
    else guiRects[Mono.guiN]={p.X,oy,p.X+s.X,oy+s.Y} end
end
local function refreshGuiRects(force)
    local now=os.clock()
    if not force and now-Mono.guiT<0.1 then return end
    Mono.guiT=now
    Mono.guiIns=GuiService:GetGuiInset().Y
    Mono.guiN=0
    local sg=Window and Window.gui
    if sg then
        for _,c in ipairs(sg:GetChildren()) do
            if c:IsA("GuiObject") then Mono.addRect(c) end
        end
    end
end
local function pointBlocked(x,y)
    for i=1,Mono.guiN do
        local r=guiRects[i]
        if x>=r[1] and x<=r[3] and y>=r[2] and y<=r[4] then return true end
    end
    return false
end
local function rectBlocked(x1,y1,x2,y2)
    for i=1,Mono.guiN do
        local r=guiRects[i]
        if x1<=r[3] and x2>=r[1] and y1<=r[4] and y2>=r[2] then return true end
    end
    return false
end
local function ensureEsp(plr) if espStore[plr] then return espStore[plr] end
    local e={}
    e.hl=create("Highlight",{Name=rnd(),FillTransparency=1,OutlineTransparency=0,Enabled=false,DepthMode=Enum.HighlightDepthMode.AlwaysOnTop,Parent=EspGui})
    e.bb=create("BillboardGui",{Name=rnd(),Size=UDim2.fromOffset(198,40),AlwaysOnTop=true,Enabled=false,
        StudsOffsetWorldSpace=Vector3.new(0,3.2,0),Parent=EspGui})

    e.scale=create("UIScale",{Scale=1,Parent=e.bb})
    e.card=create("Frame",{Name=rnd(),AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,1),
        Size=UDim2.fromOffset(198,32),BackgroundColor3=Color3.fromRGB(16,16,18),BackgroundTransparency=0.2,
        BorderSizePixel=0,Parent=e.bb},
        {create("UICorner",{CornerRadius=UDim.new(0,10)}),
         create("UIGradient",{Rotation=90,
             Transparency=NumberSequence.new({
                 NumberSequenceKeypoint.new(0,0.04),
                 NumberSequenceKeypoint.new(1,0.28)})})})
    e.edge=create("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=0.75,
        ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Parent=e.card})

    e.avatar=create("ImageLabel",{Name=rnd(),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,8,0.5,0),
        Size=UDim2.fromOffset(22,22),BackgroundColor3=Color3.fromRGB(38,38,44),BackgroundTransparency=0.25,
        ScaleType=Enum.ScaleType.Fit,Image="",Parent=e.card},
        {create("UICorner",{CornerRadius=UDim.new(0,6)})})

    e.name=create("TextLabel",{Name=rnd(),BackgroundTransparency=1,AnchorPoint=Vector2.new(0,0.5),
        Position=UDim2.new(0,36,0.5,0),Size=UDim2.new(1,-116,0,15),Font=Enum.Font.GothamBold,TextSize=13,
        TextXAlignment=Enum.TextXAlignment.Left,
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        Text="",TextColor3=Color3.fromRGB(255,255,255),Parent=e.card})

    e.sub=create("TextLabel",{Name=rnd(),BackgroundTransparency=1,AnchorPoint=Vector2.new(1,0.5),
        Position=UDim2.new(1,-10,0.5,0),Size=UDim2.fromOffset(74,14),Font=Enum.Font.Gotham,TextSize=11,
        TextXAlignment=Enum.TextXAlignment.Right,Text="",TextColor3=Color3.fromRGB(176,176,188),Parent=e.card})

    espStore[plr]=e; return e end
task.spawn(function() while not isDead() do
    local anyEsp=flags.espChams or flags.espNames or flags.espRoleTags
    if not anyEsp then
        if next(espStore) then for p in pairs(espStore) do clearEsp(p) end end
        task.wait(0.5)
        continue
    end
    if Mono._rnFlag~=flags.espNames or os.clock()-(Mono._rnAt or 0)>0.5 then
        Mono._rnFlag=flags.espNames
        Mono._rnAt=os.clock()
        Mono.setRobloxNames(flags.espNames)
    end
    local camP=Camera.CFrame.Position
    for _,plr in ipairs(Mono.plrs) do if plr~=LocalPlayer then
        local ch,_,tHRP=Mono.hasBody(plr)
        if anyEsp and ch then
            local e=ensureEsp(plr); local role=Mono.espRole(plr); local col=espColor(role)
            local wantCh=flags.espChams and true or false
            if e._ch~=wantCh then e._ch=wantCh; e.hl.Enabled=wantCh end
            if wantCh then
                if e.hl.Adornee~=ch then e.hl.Adornee=ch end
                local ft=flags.espFill and 0.6 or 1
                if e._hlCol~=col then e._hlCol=col; e.hl.OutlineColor=col; e.hl.FillColor=col end
                if e._hlFill~=ft then e._hlFill=ft; e.hl.FillTransparency=ft end
            end
            local dist=math.floor((tHRP.Position-camP).Magnitude)
            local inRange=(flags.espMaxDist<=0 or dist<=flags.espMaxDist)
            e.dist=dist
            e.inRange=inRange
            e.col=col
            if flags.espNames and inRange then
                e.bb.Enabled=true; e.bb.Adornee=ch:FindFirstChild("Head") or tHRP
                local nm=plr.Name
                if flags.espRoleTags then nm=tagOf(role).."  "..nm end
                if e._nm~=nm then
                    e._nm=nm
                    e.name.Text=nm
                    e._nw=nil
                end
                local rd=roundData(plr); local coins=rd and rd.Coins
                local sub=dist.."m"
                if coins then sub=coins.."c  ·  "..sub end
                if e._sub~=sub then e._sub=sub; e.sub.Text=sub end
                if e._col~=col then e._col=col; e.name.TextColor3=col; e.edge.Color=col end

                local near,far=18,220
                local t=math.clamp((dist-near)/(far-near),0,1)
                local dim=t*0.55
                if e._dim~=dim then
                    e._dim=dim
                    e.scale.Scale=1-(t*0.45)
                    e.card.BackgroundTransparency=0.2+dim*0.5
                    e.edge.Transparency=0.75+dim*0.2
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
                    e.name.TextTransparency=dim
                    e.sub.TextTransparency=math.min(1,dim*1.25)
                    e.avatar.ImageTransparency=dim
                end
                local wantAv=flags.espAvatar and true or false
                if e._av~=wantAv then
                    e._av=wantAv
                    e.avatar.Visible=wantAv
                    e.name.Position=UDim2.new(0,wantAv and 36 or 12,0.5,0)
                    e._nw=nil
                end
                if e._nw~=(nm..sub..tostring(wantAv)) then
                    e._nw=nm..sub..tostring(wantAv)
                    local okN,nz=pcall(function()
                        return Mono.TextService:GetTextSize(nm,e.name.TextSize,e.name.Font,Vector2.new(4000,40))
                    end)
                    local okS,sz2=pcall(function()
                        return Mono.TextService:GetTextSize(sub,e.sub.TextSize,e.sub.Font,Vector2.new(4000,40))
                    end)
                    local nw=okN and nz.X or (#nm*8)
                    local sw=okS and sz2.X or (#sub*6)
                    local left=wantAv and 36 or 12
                    local w=math.clamp(math.ceil(left+nw+14+sw+10),150,520)
                    e.name.Size=UDim2.fromOffset(math.ceil(nw)+2,15)
                    e.sub.Size=UDim2.fromOffset(math.ceil(sw)+2,14)
                    e.card.Size=UDim2.fromOffset(w,32)
                    e.bb.Size=UDim2.fromOffset(w,40)
                end
                if flags.espAvatar and e.avatar.Image=="" and os.clock()-(e._avAt or -99)>4 then
                    local uid=plr.UserId
                    e._avAt=os.clock()
                    task.spawn(function()
                        local ok,url=pcall(function()
                            return Players:GetUserThumbnailAsync(uid,
                                Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size48x48)
                        end)
                        if ok and url and e.avatar and e.avatar.Parent then e.avatar.Image=url end
                    end)
                end
            else e.bb.Enabled=false end
        else clearEsp(plr) end
    end end
    task.wait(0.05)
end end)

local boxStore={}
local function clearBox(plr)
    local b=boxStore[plr]
    if b then for _,l in ipairs(b) do Mono.dropDraw(l) end; boxStore[plr]=nil end
end
local function ensureBox(plr)
    local b=boxStore[plr]
    if b then return b end
    b={}
    for i=1,4 do
        b[i]=Mono.newLine(1)
    end
    boxStore[plr]=b; return b
end
local tracerStore={}
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
local function clearTracer(plr)
    local t=tracerStore[plr]
    if t then Mono.dropDraw(t); tracerStore[plr]=nil end
end
local function ensureTracer(plr)
    local t=tracerStore[plr]
    if t then return t end
    t=Mono.newLine(2)
    tracerStore[plr]=t; return t
end
local function tracerOrigin()
    local vp=Camera.ViewportSize
    local from=flags.espTracerFrom
    if from=="Top" then return Vector2.new(vp.X*0.5,0)
    elseif from=="Center" then return Vector2.new(vp.X*0.5,vp.Y*0.5)
    elseif from=="Bottom Left" then return Vector2.new(0,vp.Y)
    elseif from=="Bottom Right" then return Vector2.new(vp.X,vp.Y)
    elseif from=="Mouse" then
        local m=UserInputService:GetMouseLocation()
        return Vector2.new(m.X,m.Y)
    end
    return Vector2.new(vp.X*0.5,vp.Y)
end

local CORNERS={
    Vector3.new(-1,-1,-1),Vector3.new(-1,-1,1),Vector3.new(-1,1,-1),Vector3.new(-1,1,1),
    Vector3.new(1,-1,-1),Vector3.new(1,-1,1),Vector3.new(1,1,-1),Vector3.new(1,1,1),
}
Mono.boundsCache=setmetatable({},{__mode="k"})
Mono.bodyCache=setmetatable({},{__mode="k"})
function Mono.bodyParts(ch)
    local e=Mono.bodyCache[ch]
    if e then
        if not e.dirty then return e.list end
    else
        e={dirty=true,list={}}
        Mono.bodyCache[ch]=e
        local function soil() e.dirty=true end
        ch.ChildAdded:Connect(soil)
        ch.ChildRemoved:Connect(soil)
    end
    local l=e.list
    table.clear(l)
    for _,d in ipairs(ch:GetChildren()) do
        if d:IsA("BasePart") then l[#l+1]=d end
    end
    e.dirty=false
    return l
end
local function charBounds(ch)
    local hrp=getHRP(ch); if not hrp then return nil end
    local base=hrp.CFrame
    local minX,minY,minZ=math.huge,math.huge,math.huge
    local maxX,maxY,maxZ=-math.huge,-math.huge,-math.huge
    local found=false
    local body=Mono.bodyParts(ch)
    for i=1,#body do
        local d=body[i]
        if d.Parent then
            local rel=base:PointToObjectSpace(d.Position)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            local h=d.Size*0.5
            local r=math.max(h.X,h.Y,h.Z)
            if rel.X-h.X<minX then minX=rel.X-h.X end
            if rel.X+h.X>maxX then maxX=rel.X+h.X end
            if rel.Y-h.Y<minY then minY=rel.Y-h.Y end
            if rel.Y+h.Y>maxY then maxY=rel.Y+h.Y end
            if rel.Z-r<minZ then minZ=rel.Z-r end
            if rel.Z+r>maxZ then maxZ=rel.Z+r end
            found=true
        end
    end
    if not found then return base,Vector3.new(4,6,2) end
    local size=Vector3.new(maxX-minX,maxY-minY,maxZ-minZ)
    local off=Vector3.new((minX+maxX)*0.5,(minY+maxY)*0.5,(minZ+maxZ)*0.5)
    local prev=Mono.boundsCache[ch]
    if prev then
        local a=0.25
        size=prev.size:Lerp(size,a)
        off=prev.off:Lerp(off,a)
        prev.size,prev.off=size,off
    else
        Mono.boundsCache[ch]={size=size,off=off}
    end
    return base*CFrame.new(off),size
end
local box3Store={}
local function clearBox3(plr)
    local b=box3Store[plr]
    if b then for _,l in ipairs(b) do Mono.dropDraw(l) end; box3Store[plr]=nil end
end
local function ensureBox3(plr)
    local b=box3Store[plr]
    if b then return b end
    b={}
    for i=1,12 do b[i]=Mono.newLine(1) end
    box3Store[plr]=b; return b
end
local BOX3_EDGES={
    {1,2},{1,3},{1,5},{2,4},{2,6},{3,4},{3,7},{4,8},{5,6},{5,7},{6,8},{7,8},
}

local R15Bones={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"}}
local R6Bones={{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}
local skelStore={}
local function clearSkel(plr)
    local s=skelStore[plr]
    if not s then return end
    for _,l in ipairs(s.lines) do Mono.dropDraw(l) end
    skelStore[plr]=nil
end
local function ensureSkel(plr,ch)
    local bones=ch:FindFirstChild("UpperTorso") and R15Bones or R6Bones
    local s=skelStore[plr]
    if s and s.bones==bones and s.char==ch then return s end
    if s then clearSkel(plr) end
    s={bones=bones,lines={},char=ch,uniq={},pair={},vx={},vy={},vok={}}
    local idx={}
    for i=1,#bones do
        s.lines[i]=Mono.newLine(2)
        local ja,jb
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        for k=1,2 do
            local p=ch:FindFirstChild(bones[i][k])
            local j
            if p then
                j=idx[p]
                if not j then s.uniq[#s.uniq+1]=p; j=#s.uniq; idx[p]=j end
            end
            if k==1 then ja=j else jb=j end
        end
        s.pair[i]={ja,jb}
    end
    skelStore[plr]=s; return s
end
bind(RunService.RenderStepped,function()
    local doBox,doSkel,doTracer,doBox3=flags.espBox,flags.espSkeleton,flags.espTracers,flags.espBox3D
    if not doBox and next(boxStore) then for p in pairs(boxStore) do clearBox(p) end end
    if not doSkel and next(skelStore) then for p in pairs(skelStore) do clearSkel(p) end end
    if not doTracer and next(tracerStore) then for p in pairs(tracerStore) do clearTracer(p) end end
    if not doBox3 and next(box3Store) then for p in pairs(box3Store) do clearBox3(p) end end
    if not (doBox or doSkel or doTracer or doBox3) then return end
    refreshGuiRects()
    local needCorners=doBox or doBox3
    local camCF=Camera.CFrame
    local camPos,camLook=camCF.Position,camCF.LookVector
    local tOrigin=doTracer and tracerOrigin() or nil
    for _,plr in ipairs(Mono.plrs) do if plr~=LocalPlayer then
        local ch,_,cullRoot=Mono.hasBody(plr)
        if ch then
            if cullRoot and (cullRoot.Position-camPos):Dot(camLook)<=0 then
                local hb=boxStore[plr]
                if hb then for i=1,#hb do hb[i].Visible=false end end
                local h3=box3Store[plr]
                if h3 then for i=1,#h3 do h3[i].Visible=false end end
                local ht=tracerStore[plr]
                if ht then ht.Visible=false end
                local hs=skelStore[plr]
                if hs then
                    for i=1,#hs.lines do local l=hs.lines[i]; if l then l.Visible=false end end
                end
                continue
            end
            local col=espColor(Mono.espRole(plr))

            local pts,okPts
            local bx1,by1,bx2,by2
            local allAhead=false
            if needCorners then
                local cf,size=charBounds(ch)
                if cf then
                    pts,okPts={},true
                    bx1,by1,bx2,by2=math.huge,math.huge,-math.huge,-math.huge
                    local half=size*0.5
                    local hx,hy,hz=half.X,half.Y,half.Z
                    local ahead=0
                    for i=1,8 do
                        local c=CORNERS[i]
                        local v=Camera:WorldToViewportPoint(
                            cf:PointToWorldSpace(Vector3.new(c.X*hx,c.Y*hy,c.Z*hz)))
                        pts[i]=Vector2.new(v.X,v.Y)
                        if v.Z>0 then
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
                            ahead=ahead+1
                            if v.X<bx1 then bx1=v.X end
                            if v.X>bx2 then bx2=v.X end
                            if v.Y<by1 then by1=v.Y end
                            if v.Y>by2 then by2=v.Y end
                        end
                    end
                    allAhead=(ahead==8)
                    if ahead<4 then okPts=false end
                    if okPts and ((bx2-bx1)<1 or (by2-by1)<1) then okPts=false end
                else okPts=false end
            end
            local blocked=okPts and rectBlocked(bx1,by1,bx2,by2) or false

            if doBox then
                local b=ensureBox(plr)
                if okPts and not blocked then
                    local tl,tr=Vector2.new(bx1,by1),Vector2.new(bx2,by1)
                    local bl,br=Vector2.new(bx1,by2),Vector2.new(bx2,by2)
                    local segs={{tl,tr},{tr,br},{br,bl},{bl,tl}}
                    for i=1,4 do
                        local seg,l=segs[i],b[i]
                        l.From,l.To,l.Color,l.Visible=seg[1],seg[2],col,true
                    end
                else
                    for _,l in ipairs(b) do l.Visible=false end
                end
            end
            if doBox3 then
                local b=ensureBox3(plr)
                if okPts and allAhead and not blocked then
                    for i=1,12 do
                        local e2=BOX3_EDGES[i]
                        local l=b[i]
                        l.From,l.To,l.Color,l.Visible=pts[e2[1]],pts[e2[2]],col,true
                    end
                else
                    for _,l in ipairs(b) do l.Visible=false end
                end
            end
            if doTracer then
                local t=ensureTracer(plr)
                local tx,ty
                local thrp=cullRoot
                local far=false
                if thrp and flags.espMaxDist>0 then
                    far=(thrp.Position-camPos).Magnitude>flags.espMaxDist
                end
                if not far then
                    if okPts then
                        tx,ty=(bx1+bx2)*0.5,by2
                    elseif thrp then
                        local v=Camera:WorldToViewportPoint(thrp.Position-Vector3.new(0,3,0))
                        if v.Z>0 then tx,ty=v.X,v.Y end
                    end
                end
                if tx and not pointBlocked(tx,ty) then
                    t.From=tOrigin; t.To=Vector2.new(tx,ty); t.Color=col; t.Visible=true
                else t.Visible=false end
            end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            if doSkel then
                local s=ensureSkel(plr,ch)
                local rootHrp=cullRoot
                local vis=false
                if rootHrp then
                    local rv=Camera:WorldToViewportPoint(rootHrp.Position)
                    local vp=Camera.ViewportSize
                    vis=rv.Z>0 and rv.X>-250 and rv.X<vp.X+250 and rv.Y>-250 and rv.Y<vp.Y+250
                end
                if not vis then
                    for i=1,#s.lines do local l=s.lines[i]; if l then l.Visible=false end end
                else
                    local uq,vx,vy,vok=s.uniq,s.vx,s.vy,s.vok
                    for j=1,#uq do
                        local p=uq[j]
                        if p.Parent then
                            local v=Camera:WorldToViewportPoint(p.Position)
                            vx[j],vy[j],vok[j]=v.X,v.Y,v.Z>0
                        else vok[j]=false end
                    end
                    for i=1,#s.bones do
                        local line=s.lines[i]
                        if line then
                            local pr=s.pair[i]
                            local ja,jb=pr[1],pr[2]
                            if ja and jb and vok[ja] and vok[jb]
                                and not pointBlocked(vx[ja],vy[ja]) and not pointBlocked(vx[jb],vy[jb]) then
                                line.From=Vector2.new(vx[ja],vy[ja]); line.To=Vector2.new(vx[jb],vy[jb])
                                line.Color=col; line.Visible=true
                            else line.Visible=false end
                        end
                    end
                end
            end
        else
            if doBox then clearBox(plr) end
            if doSkel then clearSkel(plr) end
            if doTracer then clearTracer(plr) end
            if doBox3 then clearBox3(plr) end
        end
    end end
end)
bind(Players.PlayerRemoving,function(plr) clearEsp(plr); clearSkel(plr); clearBox(plr); clearTracer(plr); clearBox3(plr) end)

local coinContainerRef
local function getCoinContainer()
    if coinContainerRef and coinContainerRef.Parent then return coinContainerRef end
    local map=CollectionService:GetTagged("CurrentMap")[1]
    coinContainerRef=(map and map:FindFirstChild("CoinContainer")) or workspace:FindFirstChild("CoinContainer",true)
    return coinContainerRef
end
local function coinTaken(d) local c=d:GetAttribute("Collected"); return c==true or c=="true" end
local function freshCoins()
    local out={}
    local tagged=CollectionService:GetTagged("ServerCoinPart")
    if #tagged>0 then
        for _,d in ipairs(tagged) do
            if d:IsA("BasePart") and d.Parent and not coinTaken(d) then out[#out+1]=d end
        end
        return out
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    end
    local c=getCoinContainer()
    if c then for _,d in ipairs(c:GetChildren()) do if d:IsA("BasePart") and (d:GetAttribute("CoinID")~=nil or d.Name=="Coin_Server") and not coinTaken(d) then out[#out+1]=d end end end
    return out
end
local coinCache={}
task.spawn(function() while not isDead() do
    if flags.coinEsp or flags.autoCoins then
        coinCache=freshCoins(); task.wait(0.2)
    else
        if #coinCache>0 then coinCache={} end
        task.wait(1)
    end
end end)
local coinEspStore={}
task.spawn(function() while not isDead() do
    if flags.coinEsp then local seen={}
        for _,coin in ipairs(coinCache) do seen[coin]=true
            if not coinEspStore[coin] then
                local vis=coin:FindFirstChild("CoinVisual"); local ad=(vis and vis:FindFirstChild("MainCoin")) or vis or coin
                coinEspStore[coin]=create("Highlight",{Name=rnd(),Adornee=ad,FillColor=Color3.fromRGB(255,205,55),FillTransparency=0.25,OutlineColor=Color3.fromRGB(255,235,150),OutlineTransparency=0,DepthMode=Enum.HighlightDepthMode.AlwaysOnTop,Parent=EspGui}) end end
        for coin,hl in pairs(coinEspStore) do if not seen[coin] or not coin.Parent then hl:Destroy();coinEspStore[coin]=nil end end
    elseif next(coinEspStore) then for coin,hl in pairs(coinEspStore) do hl:Destroy();coinEspStore[coin]=nil end end
    task.wait(0.15)
end end)

local GameplayR=RS:WaitForChild("Remotes"):WaitForChild("Gameplay")

for _,rn in ipairs({"TeleportToPart","RoundStart","RoundEndFade","LoadingMap","GameOver","VictoryScreen"}) do
    local r=GameplayR:FindFirstChild(rn)
    if r and r:IsA("RemoteEvent") then bind(r.OnClientEvent,Mono.markTeleport) end
end
bind(LocalPlayer.CharacterAdded,Mono.markTeleport)

local coinBagFull=false
local CoinCollectedR=GameplayR:FindFirstChild("CoinCollected")
local CoinsStartedR=GameplayR:FindFirstChild("CoinsStarted")
if CoinCollectedR then bind(CoinCollectedR.OnClientEvent,function(_,collected,capacity)
    if type(collected)=="number" and type(capacity)=="number" and capacity>0 and collected>=capacity then
        if not coinBagFull then
            coinBagFull=true
            if flags.autoCoins then notify("Coin bag full, auto collect stopped",4) end
        end
    end
end) end
if CoinsStartedR then bind(CoinsStartedR.OnClientEvent,function() coinBagFull=false end) end

local farmBlack={}
task.spawn(function()
    local target,since,farming,prevWS
    local function standDown()
        if not farming then return end
        farming=false
        local ch2=LocalPlayer.Character
        local hum2=ch2 and ch2:FindFirstChildOfClass("Humanoid")
        if hum2 then pcall(function() hum2.PlatformStand=false; if prevWS then hum2.WalkSpeed=prevWS end end) end
        Mono.wantPS=false
        Mono.wantNoclip=false
        Mono.recollide(hum2)
        unstick(ch2)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        prevWS=nil
    end
    while not isDead() do
        if flags.autoCoins and not coinBagFull and alive(LocalPlayer) and not Mono.teleporting() then
            local ch=LocalPlayer.Character; local hrp=getHRP(ch); local hum=ch and ch:FindFirstChildOfClass("Humanoid")
            if hrp and hum then
                local coin,bd
                for _,c in ipairs(coinCache) do
                    if c.Parent and not coinTaken(c) and not (farmBlack[c] and os.clock()<farmBlack[c]) then
                        local d=(c.Position-hrp.Position).Magnitude
                        if d<=Mono.COIN_MAX_DIST and (not bd or d<bd) then bd,coin=d,c end
                    end
                end
                if coin then
                    if not farming then farming=true; prevWS=hum.WalkSpeed; pcall(function() hum.PlatformStand=true end); Mono.wantPS=true; Mono.wantNoclip=true end
                    local spd=COLLECT_SPEED
                    pcall(function() hum.WalkSpeed=spd end)
                    if coin~=target then target=coin; since=os.clock() end
                    if os.clock()-since>5 then farmBlack[coin]=os.clock()+8; target=nil; task.wait()
                    else
                        local dt=RunService.RenderStepped:Wait()
                        uncollide(ch)
                        local dir=coin.Position-hrp.Position
                        if dir.Magnitude>2 then hrp.CFrame=CFrame.new(hrp.Position+dir.Unit*math.min(dir.Magnitude,spd*dt)); hrp.AssemblyLinearVelocity=Vector3.zero end
                        if typeof(firetouchinterest)=="function" then pcall(function() firetouchinterest(hrp,coin,0);firetouchinterest(hrp,coin,1) end) end
                    end
                else
                    standDown()
                    target=nil; task.wait(0.25)
                end
            else task.wait(0.1) end
        else
            standDown()
            target=nil; task.wait(0.2)
        end
    end
end)

local function findDroppedGun()
    for _,p in ipairs(CollectionService:GetTagged("GunDrop")) do
        if p:IsA("BasePart") and p:IsDescendantOf(workspace) then return p end
    end
    local map=CollectionService:GetTagged("CurrentMap")[1]
    if map then
        local g=map:FindFirstChild("GunDrop")
        if g and g:IsA("BasePart") then return g end
    end
    for _,d in ipairs(workspace:GetChildren()) do
        if d:IsA("BasePart") and d.Name=="GunDrop" then return d end
        if d:IsA("Model") then
            local g=d:FindFirstChild("GunDrop")
            if g and g:IsA("BasePart") then return g end
        end
    end
end
local droppedGun
local gunEspHL,gunEspBB
task.spawn(function() while not isDead() do
    if not flags.gunEsp then
        if gunEspHL then gunEspHL.Enabled=false end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        if gunEspBB then gunEspBB.Enabled=false end
        task.wait(0.5)
        continue
    end
    local h=droppedGun
    if h and h.Parent then
        if not gunEspHL then gunEspHL=create("Highlight",{Name=rnd(),FillColor=Color3.fromRGB(90,150,255),FillTransparency=0.35,OutlineColor=Color3.fromRGB(170,210,255),OutlineTransparency=0,DepthMode=Enum.HighlightDepthMode.AlwaysOnTop,Parent=EspGui}) end
        if not gunEspBB then
            gunEspBB=create("BillboardGui",{Name=rnd(),Size=UDim2.fromOffset(160,18),AlwaysOnTop=true,StudsOffsetWorldSpace=Vector3.new(0,2,0),Parent=EspGui},
                {create("TextLabel",{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Font=Enum.Font.GothamBold,TextSize=12,TextColor3=Color3.fromRGB(140,190,255),TextStrokeTransparency=.4,Text="GUN"})})
        end
        gunEspHL.Adornee=h; gunEspHL.Enabled=true
        gunEspBB.Adornee=h; gunEspBB.Enabled=flags.gunEspDist
        if flags.gunEspDist then
            local hrp=getHRP(LocalPlayer.Character)
            local dist=hrp and math.floor((h.Position-hrp.Position).Magnitude) or 0
            local lbl=gunEspBB:FindFirstChildOfClass("TextLabel"); if lbl then lbl.Text="DROPPED GUN  ·  "..dist.."m" end
        end
    else
        if gunEspHL then gunEspHL.Enabled=false end
        if gunEspBB then gunEspBB.Enabled=false end
    end
    task.wait(0.1)
end end)
local grabbing=false
local function touchGun(h)
    local hrp=getHRP(LocalPlayer.Character)
    if not (hrp and h and h.Parent) then return false end
    if typeof(firetouchinterest)=="function" then
        pcall(function()
            for _=1,4 do
                firetouchinterest(hrp,h,0)
                firetouchinterest(hrp,h,1)
            end
        end)
    end
    return findWeapon("Gun")~=nil
end
function Mono.canAct()
    if Mono.teleporting() then return false end
    local ch=LocalPlayer.Character
    if not ch or not ch.Parent then return false end
    local hum=ch:FindFirstChildOfClass("Humanoid")
    if not (hum and hum.Health>0) then return false end
    if not getHRP(ch) then return false end
    if LocalPlayer:GetAttribute("Alive")==false then return false end
    local d=roundData(LocalPlayer)
    if d and d.Dead==true then return false end
    return true
end
local function grabGunOnce(target)
    if grabbing then return false end
    local h=target or droppedGun or findDroppedGun()
    local hrp=getHRP(LocalPlayer.Character)
    if not (h and h.Parent and hrp and Mono.canAct()) then return false end
    grabbing=true
    if touchGun(h) then
        notify("Grabbed the Sheriff gun")
        grabbing=false
        return true
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    end
    local back=hrp.CFrame
    for _=1,10 do
        local myhrp=getHRP(LocalPlayer.Character)
        if not (myhrp and h.Parent) then break end
        if not Mono.canAct() then break end
        Mono.markSelfTP()
        myhrp.CFrame=CFrame.new(h.Position); myhrp.AssemblyLinearVelocity=Vector3.zero
        if touchGun(h) then break end
        RunService.Heartbeat:Wait()
    end
    local myhrp=getHRP(LocalPlayer.Character)
    if myhrp then myhrp.CFrame=back; myhrp.AssemblyLinearVelocity=Vector3.zero end
    local got=findWeapon("Gun")~=nil
    if got then notify("Grabbed the Sheriff gun") end
    grabbing=false
    return got
end
local function onGunAppeared(inst)
    if not (inst and inst:IsA("BasePart") and inst:IsDescendantOf(workspace)) then return end
    droppedGun=inst
    if flags.autoGun and not grabbing and myRole()~="Murderer" and not findWeapon("Gun") and Mono.canAct() then
        task.spawn(grabGunOnce,inst)
    end
end
pcall(function()
    bind(CollectionService:GetInstanceAddedSignal("GunDrop"),onGunAppeared)
    bind(CollectionService:GetInstanceRemovedSignal("GunDrop"),function(i)
        if droppedGun==i then droppedGun=nil end
    end)
end)
bind(workspace.DescendantAdded,function(d)
    if d.Name=="GunDrop" then task.defer(onGunAppeared,d) end
end)
task.spawn(function() while not isDead() do
    if flags.gunEsp or flags.autoGun then
        local g=findDroppedGun()
        droppedGun=g
        if g and flags.autoGun and not grabbing and myRole()~="Murderer" and not findWeapon("Gun") and Mono.canAct() then
            grabGunOnce(g)
        end
    elseif droppedGun then droppedGun=nil end
    task.wait((flags.gunEsp or flags.autoGun) and 0.1 or 0.6)
end end)

Mono.lightStore=nil
Mono.shadowOrig=nil
function Mono.shadowsOff()
    if Mono.shadowOrig==nil then Mono.shadowOrig=Lighting.GlobalShadows end
    pcall(function() Lighting.GlobalShadows=false end)
end
function Mono.shadowsRestore()
    if flags.fullbright or flags.fpsBoost then return end
    if Mono.shadowOrig~=nil then
        pcall(function() Lighting.GlobalShadows=Mono.shadowOrig end)
        Mono.shadowOrig=nil
    end
end
function Mono.brightApply()
    if not Mono.lightStore then
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        Mono.lightStore={Lighting.Brightness,Lighting.ClockTime,Lighting.Ambient,
            Lighting.OutdoorAmbient,Lighting.FogEnd,Lighting.FogStart,Lighting.ExposureCompensation}
    end
    pcall(function()
        Lighting.Brightness=math.max(Lighting.Brightness,3)
        Lighting.ClockTime=14
        Lighting.Ambient=Color3.new(1,1,1)
        Lighting.OutdoorAmbient=Color3.new(1,1,1)
        Lighting.FogStart=1e6
        Lighting.FogEnd=1e6
        Lighting.ExposureCompensation=0
    end)
    Mono.shadowsOff()
end
function Mono.brightRestore()
    local s=Mono.lightStore
    if s then
        pcall(function()
            Lighting.Brightness,Lighting.ClockTime,Lighting.Ambient=s[1],s[2],s[3]
            Lighting.OutdoorAmbient,Lighting.FogEnd,Lighting.FogStart,Lighting.ExposureCompensation=s[4],s[5],s[6],s[7]
        end)
        Mono.lightStore=nil
    end
    Mono.shadowsRestore()
end
function Mono.gfxApply()
    local atm=Lighting:FindFirstChildOfClass("Atmosphere")
    if atm and not Mono.atmStore then
        Mono.atmStore={atm,atm.Density,atm.Haze,atm.Glare}
        pcall(function() atm.Density=0; atm.Haze=0; atm.Glare=0 end)
    end
    Mono.shadowsOff()
end
function Mono.gfxRestore()
    local a=Mono.atmStore
    if a then
        pcall(function() if a[1].Parent then a[1].Density=a[2]; a[1].Haze=a[3]; a[1].Glare=a[4] end end)
        Mono.atmStore=nil
    end
    Mono.shadowsRestore()
end
local function setFullbright(on)
    if on then Mono.brightApply() else Mono.brightRestore() end
end
local fpsStore,fpsConn
local function fxKill(e,store)
    if store[e]~=nil then return end
    if e:IsA("PostEffect") then if e.Enabled then e.Enabled=false; store[e]={"en"} end
    elseif e:IsA("ParticleEmitter") or e:IsA("Trail") or e:IsA("Smoke") or e:IsA("Fire") or e:IsA("Sparkles") or e:IsA("Beam") then if e.Enabled then e.Enabled=false; store[e]={"en"} end
    elseif e:IsA("Decal") or e:IsA("Texture") then store[e]={"tr",e.Transparency}; e.Transparency=1
    elseif e:IsA("SurfaceAppearance") then store[e]={"par",e.Parent}; e.Parent=nil
    elseif e:IsA("BasePart") then
        local mat,refl=e.Material,e.Reflectance
        local tex=e:IsA("MeshPart") and e.TextureID or nil
        if mat~=Enum.Material.SmoothPlastic or refl~=0 or (tex and tex~="") then
            store[e]={"part",mat,refl,tex}
            pcall(function()
                e.Material=Enum.Material.SmoothPlastic
                e.Reflectance=0
                if tex and tex~="" then e.TextureID="" end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            end)
        end
    end
end
local function setFPSBoost(on)
    if on then
        fpsStore={changed=Mono.fxPending or {}}
        Mono.fxPending=nil
        Mono.gfxApply()
        local terrain=workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            local okD,d=pcall(function() return terrain.Decoration end)
            if okD then fpsStore.decor=d; pcall(function() terrain.Decoration=false end) end
            fpsStore.water={terrain.WaterWaveSize,terrain.WaterWaveSpeed,terrain.WaterReflectance}
            terrain.WaterWaveSize=0;terrain.WaterWaveSpeed=0;terrain.WaterReflectance=0
        end
        fpsConn=workspace.DescendantAdded:Connect(function(e) if flags.fpsBoost and fpsStore then task.defer(fxKill,e,fpsStore.changed) end end)
        task.spawn(function() local s=fpsStore.changed; local n=0
            for _,e in ipairs(Lighting:GetDescendants()) do fxKill(e,s) end
            for _,e in ipairs(workspace:GetDescendants()) do
                if not (flags.fpsBoost and fpsStore and fpsStore.changed==s) then return end
                fxKill(e,s); n+=1; if n%900==0 then RunService.Heartbeat:Wait() end
            end
        end)
    elseif fpsStore then
        local s=fpsStore.changed
        Mono.fxPending=s
        Mono.gfxRestore()
        local terrain=workspace:FindFirstChildOfClass("Terrain")
        if terrain and fpsStore.water then terrain.WaterWaveSize,terrain.WaterWaveSpeed,terrain.WaterReflectance=fpsStore.water[1],fpsStore.water[2],fpsStore.water[3] end
        if terrain and fpsStore.decor~=nil then pcall(function() terrain.Decoration=fpsStore.decor end) end
        if fpsConn then fpsConn:Disconnect();fpsConn=nil end; fpsStore=nil
        task.spawn(function() local n=0 for e,info in pairs(s) do
            if Mono.fxPending~=s then return end
            pcall(function()
            if info[1]=="en" then e.Enabled=true
            elseif info[1]=="tr" then e.Transparency=info[2]
            elseif info[1]=="par" then e.Parent=info[2]
            elseif info[1]=="part" then
                e.Material=info[2]; e.Reflectance=info[3]
                if info[4] and info[4]~="" then e.TextureID=info[4] end
            end end)
            s[e]=nil
            n+=1; if n%900==0 then RunService.Heartbeat:Wait() end end
            if Mono.fxPending==s then Mono.fxPending=nil end end)
    end
end
unstick=function(ch)
    if not ch then return end
    local hrp=getHRP(ch); if not hrp then return end
    task.spawn(function()
        local params=RaycastParams.new()
        params.FilterType=Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances={ch}
        local from=hrp.Position+Vector3.new(0,6,0)
        local hit=workspace:Raycast(from,Vector3.new(0,-200,0),params)
        Mono.markSelfTP()
        if hit then
            hrp.CFrame=CFrame.new(hit.Position+Vector3.new(0,3.5,0))
        else
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            hrp.CFrame=hrp.CFrame+Vector3.new(0,4,0)
        end
        hrp.AssemblyLinearVelocity=Vector3.zero
        RunService.Heartbeat:Wait()
        for p in pairs(Mono.unclip) do
            if p.Parent and p.Name~="HumanoidRootPart" then p.CanCollide=true end
        end
        table.clear(Mono.unclip)
    end)
end
local function tpTo(pos)
    local hrp=getHRP(LocalPlayer.Character); if not hrp then return false end
    Mono.markSelfTP()
    hrp.CFrame=CFrame.new(pos+Vector3.new(0,3,0))
    return true
end

local function resolvePlayer(v)
    if typeof(v)=="Instance" and v:IsA("Player") then return v end
    if type(v)=="table" then
        for k,on in pairs(v) do
            local cand=(on==true) and k or on
            if typeof(cand)=="Instance" and cand:IsA("Player") then return cand end
            if type(cand)=="string" then local p=resolvePlayer(cand); if p then return p end end
        end
        return nil
    end
    if type(v)=="string" and #v>0 then
        local p=Players:FindFirstChild(v); if p and p:IsA("Player") then return p end
        local lv=v:lower()
        for _,q in ipairs(Mono.plrs) do
            if q.Name:lower()==lv or (q.DisplayName or ""):lower()==lv then return q end
        end
    end
    return nil
end

Mono.canClaim=(typeof(sethiddenproperty)=="function")
if not Mono.canClaim then
    Fallback.note("Fling","velocity only",
        "your executor has no sethiddenproperty, so Mono cannot claim the target's physics and has to rely on raw velocity, which lands far less often",
        {"Fling Player","Fling All Players","Auto Fling Murderer","Auto Fling Sheriff"})
end
Mono.flungAt=setmetatable({},{__mode="k"})
Mono.FLING_MAX_DY=140
Mono.FLING_MAX_RISE=320
function Mono.voidY()
    local ok,v=pcall(function() return workspace.FallenPartsDestroyHeight end)
    return (ok and type(v)=="number") and v or -500
end
function Mono.alreadyFlung(p)
    local hrp=p and p.Character and getHRP(p.Character)
    if not hrp then return true end
    if os.clock()-(Mono.flungAt[p] or -60)<4 then return true end
    if hrp.AssemblyLinearVelocity.Magnitude>100 then return true end
    if hrp.Position.Y<Mono.voidY()+150 then return true end
    local mine=getHRP(LocalPlayer.Character)
    if mine then
        local dy=hrp.Position.Y-mine.Position.Y
        if dy<-60 or dy>120 then return true end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    end
    return false
end

local function flingPlayer(p,keepPos)
    if flinging then return false,"already flinging someone" end
    local myCh=LocalPlayer.Character; local myHrp=getHRP(myCh)
    local hum=myCh and myCh:FindFirstChildOfClass("Humanoid")
    local tHrp=p and p.Character and getHRP(p.Character)
    if not (myHrp and hum and tHrp) then return false,"they have no character right now" end
    local back=keepPos or myHrp.CFrame
    if Mono.teleporting() then return false,"the round just moved you, try again in a second" end
    if math.abs(tHrp.Position.Y-back.Position.Y)>Mono.FLING_MAX_DY then return false,"they are too far above or below you" end
    if tHrp.AssemblyLinearVelocity.Magnitude>340 then return false,"they are already flying, wait for them to land" end

    Mono.flingAt=os.clock()
    flinging=true
    local moved=false
    local movel=0.1
    local t0=os.clock()
    local claimed
    while os.clock()-t0<flags.flingSeconds do
        if Mono.teleporting() then break end
        RunService.Heartbeat:Wait()
        local h=getHRP(LocalPlayer.Character)
        local t=p.Character and getHRP(p.Character)
        if not (h and t and h.Parent and t.Parent) then break end
        local tp=t.Position
        if tp.Y<Mono.voidY()+400 then break end
        if t.AssemblyLinearVelocity.Magnitude>340 then break end
        if tp.Y>back.Position.Y+Mono.FLING_MAX_RISE then break end
        if tp.Y<back.Position.Y-Mono.FLING_MAX_DY then break end
        h.CFrame=t.CFrame
        moved=true
        Mono.flungAt[p]=os.clock()
        if Mono.canClaim then
            pcall(function() sethiddenproperty(h,"PhysicsRepRootPart",t) end)
            claimed=h
        end
        local vel=h.AssemblyLinearVelocity
        h.AssemblyLinearVelocity=vel*flags.flingPower+Vector3.new(0,flags.flingPower,0)
        RunService.RenderStepped:Wait()
        if not h.Parent then break end
        h.AssemblyLinearVelocity=vel
        RunService.Stepped:Wait()
        if not h.Parent then break end
        h.AssemblyLinearVelocity=vel+Vector3.new(0,movel,0)
        movel=-movel
    end

    local function release(part)
        if part and Mono.canClaim then pcall(function() sethiddenproperty(part,"PhysicsRepRootPart",nil) end) end
    end
    release(claimed)
    local nowHrp=getHRP(LocalPlayer.Character)
    if nowHrp and nowHrp~=claimed then release(nowHrp) end

    if not moved then
        flinging=false
        Mono.recollide(LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"),true)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        return false,"could not get a grip on them, try again"
    end

    local home=CFrame.new(back.Position+Vector3.new(0,4,0))
    for _=1,6 do
        local ch2=LocalPlayer.Character
        if not ch2 then break end
        for _,pp in ipairs(getCharParts(ch2)) do
            if pp.Parent then
                pp.AssemblyLinearVelocity=Vector3.zero
                pp.AssemblyAngularVelocity=Vector3.zero
            end
        end
        RunService.Heartbeat:Wait()
    end
    local h2=getHRP(LocalPlayer.Character)
    if h2 then
        h2.CFrame=home
        h2.AssemblyLinearVelocity=Vector3.zero
        h2.AssemblyAngularVelocity=Vector3.zero
    end
    flinging=false
    local hum2=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    Mono.recollide(hum2,true)
    local watch=os.clock()
    while os.clock()-watch<1.5 do
        RunService.Heartbeat:Wait()
        if Mono.teleporting() then break end
        local h3=getHRP(LocalPlayer.Character)
        if not h3 then break end
        local lv=h3.AssemblyLinearVelocity
        local av=h3.AssemblyAngularVelocity
        if badVec(lv) or badVec(av) or lv.Magnitude>200 or av.Magnitude>25 then
            h3.AssemblyLinearVelocity=Vector3.zero
            h3.AssemblyAngularVelocity=Vector3.zero
            h3.CFrame=home
        end
    end
    Mono.recollide(LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"),true)
    return true
end
local function flingAll()
    local myHrp=getHRP(LocalPlayer.Character)
    if not myHrp then notify("You have no character"); return end
    local home=myHrp.CFrame
    task.spawn(function()
        local n=0
        for _,p in ipairs(Mono.plrs) do
            if p~=LocalPlayer and Mono.hasBody(p) then
                if flingPlayer(p,home) then n=n+1 end
                task.wait(0.1)
            end
        end
        local h=getHRP(LocalPlayer.Character)
        if h then h.CFrame=home; h.AssemblyLinearVelocity=Vector3.zero end
        notify("Flung "..n.." player"..(n==1 and "" or "s"))
    end)
end
task.spawn(function() while not isDead() do
    if (flags.autoFlingMurderer or flags.autoFlingSheriff)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        and Mono.hasBody(LocalPlayer) and not flinging and not Mono.teleporting() then
        local want
        for _,p in ipairs(Mono.plrs) do
            if p~=LocalPlayer and alive(p) and p.Character and getHRP(p.Character) then
                local r=roleOf(p)
                if ((flags.autoFlingMurderer and r=="Murderer")
                    or (flags.autoFlingSheriff and isGunRole(r)))
                    and not Mono.alreadyFlung(p) then
                    want=p; break
                end
            end
        end
        if want then flingPlayer(want) end
    end
    task.wait(0.5)
end end)

local MURD_ALERT_RANGE=50
local murdNotif=nil
local murdInRange=false
local function closeMurdNotif()
    murdInRange=false
    if murdNotif then
        pcall(function() murdNotif:Close() end)
        murdNotif=nil
    end
end
bind(RunService.Heartbeat,function()
    if not flags.murdererNotify then closeMurdNotif() return end
    local hrp=getHRP(LocalPlayer.Character)
    local m=findMurderer()
    local mh=(m and m~=LocalPlayer and alive(m)) and getHRP(m.Character) or nil
    if not (hrp and mh) then closeMurdNotif() return end
    local d=math.floor((mh.Position-hrp.Position).Magnitude)
    if d>MURD_ALERT_RANGE then
        if murdInRange then closeMurdNotif() end
        return
    end
    if not murdInRange then
        murdInRange=true
        murdNotif=Window:Notify({
            Title="Murderer Nearby",
            Content=(m.DisplayName or m.Name).."  ·  "..d.."m",
            Icon="triangle-alert",
            Duration=4,
        })
    end
end)

local GiveWeaponR=GameplayR:FindFirstChild("GiveWeapon")
if GiveWeaponR then bind(GiveWeaponR.OnClientEvent,function(w) if w=="Knife" or w=="Gun" then notify("You are the "..(w=="Knife" and "MURDERER" or "SHERIFF").."!",3) end end) end

do
    local function feedNotify(name,killType,role,color)
        local tag = role and (" ["..(role=="Murderer" and "M" or isGunRole(role) and "S" or "I").."]") or ""
        Window:Notify({Title="Kill Feed",Content=tostring(name)..tag.."  ·  "..tostring(killType or "Eliminated"),Duration=4,Color=color})
    end
    local recentKillEvent={}
    local KillEventR=GameplayR:FindFirstChild("KillEvent")
    if KillEventR then bind(KillEventR.OnClientEvent,function(victim,roleColor,_,killType)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        if not victim then return end
        local nm=tostring(victim)
        recentKillEvent[nm]=os.clock()
        if flags.killFeed then
            local p=Players:FindFirstChild(nm)
            feedNotify(nm,killType,p and roleOf(p) or nil,
                typeof(roleColor)=="Color3" and roleColor or nil)
        end
    end) end
    local lastDead={}
    local function scanDeaths()
        if not (CRC and CRC.PlayerData) then return end
        for name,d in pairs(CRC.PlayerData) do
            local dead = (d.Dead==true)
            local was = lastDead[name]
            if was==false and dead then
                local seen=recentKillEvent[name]
                if flags.killFeed and not (seen and os.clock()-seen<2) then
                    feedNotify(name,nil,d.Role)
                end
            end
            lastDead[name]=dead
        end
    end
    local function watchDeaths(plr)
        if plr==LocalPlayer then return end
        local function hookChar(ch)
            local hum=ch and ch:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            local c
            c=hum.Died:Connect(function()
                local nm=plr.Name
                local seen=recentKillEvent[nm]
                if flags.killFeed and not (seen and os.clock()-seen<2) then
                    recentKillEvent[nm]=os.clock()
                    feedNotify(plr.DisplayName or nm,nil,roleOf(plr))
                end
            end)
            table.insert(conns,c)
        end
        if plr.Character then hookChar(plr.Character) end
        table.insert(conns,plr.CharacterAdded:Connect(function(ch)
            task.defer(function() hookChar(ch) end)
        end))
    end
    for _,p in ipairs(Mono.plrs) do watchDeaths(p) end
    bind(Players.PlayerAdded,watchDeaths)
    local PlayerDataChangedR=GameplayR:FindFirstChild("PlayerDataChanged")
    if PlayerDataChangedR then bind(PlayerDataChangedR.OnClientEvent,function() task.defer(scanDeaths) end) end
    local RoundStartR=GameplayR:FindFirstChild("RoundStart")
    if RoundStartR then bind(RoundStartR.OnClientEvent,function()
        lastDead={}; recentKillEvent={}; coinBagFull=false
        task.defer(scanDeaths)
    end) end
    task.spawn(function() while not isDead() do
        if flags.killFeed then scanDeaths(); task.wait(0.2) else task.wait(0.75) end
    end end)
end

bind(TeleportService.TeleportInitFailed,function(_,_,_,_)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    local p=hopFallbackPlace
    if not p then return end
    hopFallbackPlace=nil
    notify("That server was full, letting Roblox pick one")
    pcall(function() TeleportService:Teleport(p,LocalPlayer) end)
end)
Mono.afkFires=0
bind(LocalPlayer.Idled,function()
    if not flags.antiAfk then return end
    if not VirtualUser then pcall(function() VirtualUser=game:GetService("VirtualUser") end) end
    if not VirtualUser then return end
    local ch=LocalPlayer.Character
    local armed=false
    if ch then
        for _,t in ipairs(ch:GetChildren()) do
            if t:IsA("Tool") then armed=true break end
        end
    end
    local ok=pcall(function()
        VirtualUser:CaptureController()
        if armed then
            VirtualUser:MoveMouse(Vector2.new(0,0))
            VirtualUser:MoveMouse(Vector2.new(2,2))
        else
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)
    if not ok then return end
    Mono.afkFires=Mono.afkFires+1
    if Mono.afkFires==1 then notify("Anti AFK is working, you will not be kicked",4) end
end)

do
    local TrapSystem=RS:FindFirstChild("TrapSystem")
    local trapHls={}
    local function dropTrap(part)
        local h=trapHls[part]
        if h then pcall(function() h.hl:Destroy() end); pcall(function() h.bb:Destroy() end); trapHls[part]=nil end
    end
    local function addTrap(part)
        if trapHls[part] or not part:IsA("BasePart") then return end
        local hl=create("Highlight",{Name=rnd(),Adornee=part,FillColor=Color3.fromRGB(255,90,255),
            FillTransparency=0.4,OutlineColor=Color3.fromRGB(255,170,255),OutlineTransparency=0,
            DepthMode=Enum.HighlightDepthMode.AlwaysOnTop,Enabled=false,Parent=EspGui})
        local bb=create("BillboardGui",{Name=rnd(),Size=UDim2.fromOffset(90,16),AlwaysOnTop=true,
            StudsOffsetWorldSpace=Vector3.new(0,2,0),Adornee=part,Enabled=false,Parent=EspGui},
            {create("TextLabel",{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Font=Enum.Font.GothamBold,
                TextSize=12,TextColor3=Color3.fromRGB(255,150,255),TextStrokeTransparency=.4,Text="TRAP"})})
        trapHls[part]={hl=hl,bb=bb}
    end
    for _,d in ipairs(workspace:GetDescendants()) do
        if d.Name=="TrapVisual" then addTrap(d) end
    end
    bind(workspace.DescendantAdded,function(d)
        if d.Name=="TrapVisual" then task.defer(addTrap,d) end
    end)
    bind(workspace.DescendantRemoving,function(d)
        if trapHls[d] then dropTrap(d) end
    end)
    task.spawn(function() while not isDead() do
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        for part,h in pairs(trapHls) do
            if not part.Parent then dropTrap(part)
            else
                h.hl.Enabled=flags.trapEsp
                h.bb.Enabled=flags.trapEsp
            end
        end
        task.wait(0.1)
    end end)

    if TrapSystem then
        local thl=TrapSystem:FindFirstChild("TrapHitLocal")
        if thl then
            bind(thl.OnClientEvent,function()
                if not flags.antiTrap then return end
                task.spawn(function()
                    local ch=LocalPlayer.Character
                    local hum=ch and ch:FindFirstChildOfClass("Humanoid")
                    if not hum then return end
                    local want=16
                    pcall(function() want=tonumber(UI.walkSpeed) or 16 end)
                    local t0=os.clock()
                    while os.clock()-t0<4.6 do
                        if hum.Parent then
                            if hum.WalkSpeed<want then hum.WalkSpeed=want end
                            if hum.JumpPower<40 then hum.UseJumpPower=true; hum.JumpPower=50 end
                        end
                        RunService.Heartbeat:Wait()
                    end
                end)
            end)
        end
    end
end
do
    local MAX_LINEAR=200
    local MAX_ANGULAR=20
    local ANCHOR_MIN=35
    local lastGood=nil
    local lastGoodAt=0
    local otherParts={}
    local flipped=setmetatable({},{__mode="k"})
    local nParts=0
    local function addPart(d)
        if d:IsA("BasePart") then
            nParts=nParts+1
            otherParts[nParts]=d
            if flags.antiFling and d.CanCollide then d.CanCollide=false; flipped[d]=true end
        end
    end
    local function restoreOthers()
        for d in pairs(flipped) do
            if d and d.Parent and d:IsA("BasePart") then d.CanCollide=true end
        end
        table.clear(flipped)
    end
    Mono.antiFlingRestore=restoreOthers
    local function hookChar(ch)
        if not ch then return end
        for _,d in ipairs(ch:GetDescendants()) do addPart(d) end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        bind(ch.DescendantAdded,function(d)
            if flags.antiFling then task.defer(addPart,d) end
        end)
    end
    local function rebuildOthers()
        table.clear(otherParts)
        nParts=0
        for _,p in ipairs(Mono.plrs) do
            if p~=LocalPlayer and p.Character then
                for _,d in ipairs(p.Character:GetDescendants()) do addPart(d) end
            end
        end
    end
    local function watch(p)
        if p==LocalPlayer then return end
        hookChar(p.Character)
        bind(p.CharacterAdded,function(ch) task.defer(function() hookChar(ch); rebuildOthers() end) end)
    end
    for _,p in ipairs(Mono.plrs) do watch(p) end
    bind(Players.PlayerAdded,function(p) watch(p); task.defer(rebuildOthers) end)
    bind(Players.PlayerRemoving,function() task.defer(rebuildOthers) end)
    task.spawn(function() while not isDead() do
        if flags.antiFling then rebuildOthers() end
        task.wait(3)
    end end)

    local function selfBusy()
        return flinging or flags.fly
    end
    local function guard()
        if not flags.antiFling or selfBusy() then return end
        local ch=LocalPlayer.Character
        local hrp=getHRP(ch)
        if not hrp then lastGood=nil return end

        if badCF(hrp.CFrame) then
            if lastGood then pcall(function() hrp.CFrame=lastGood end) end
            hrp.AssemblyLinearVelocity=Vector3.zero
            hrp.AssemblyAngularVelocity=Vector3.zero
            return
        end

        local lv=hrp.AssemblyLinearVelocity
        if badVec(lv) then hrp.AssemblyLinearVelocity=Vector3.zero
        elseif lv.Magnitude>MAX_LINEAR then hrp.AssemblyLinearVelocity=lv.Unit*MAX_LINEAR end
        local av=hrp.AssemblyAngularVelocity
        if badVec(av) or av.Magnitude>MAX_ANGULAR then hrp.AssemblyAngularVelocity=Vector3.zero end

        local hum0=ch:FindFirstChildOfClass("Humanoid")
        local maxRise=60
        if hum0 and hum0.UseJumpPower then maxRise=math.max(60,hum0.JumpPower*1.4) end
        local lv2=hrp.AssemblyLinearVelocity
        if (not flags.infJump) and lv2.Y>maxRise then
            hrp.AssemblyLinearVelocity=Vector3.new(lv2.X,maxRise,lv2.Z)
        end

        local cp=getCharParts(ch)
        for i=1,#cp do
            local p=cp[i]
            if p.Parent then
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
                if badVec(p.AssemblyLinearVelocity) then p.AssemblyLinearVelocity=Vector3.zero end
                local pav=p.AssemblyAngularVelocity
                if badVec(pav) or pav.Magnitude>MAX_ANGULAR then p.AssemblyAngularVelocity=Vector3.zero end
                if badCF(p.CFrame) and lastGood then pcall(function() p.CFrame=lastGood end) end
            end
        end

        if not Mono.wantPS then
            if hum0 and hum0.PlatformStand then hum0.PlatformStand=false end
        end

        local now=os.clock()
        local exempt = Mono.teleporting() or Mono.selfTeleporting() or flags.autoCoins
        if lastGood and not exempt then
            local dt=math.clamp(now-lastGoodAt,1/240,0.5)
            local allow=math.max(ANCHOR_MIN,(MAX_LINEAR+100)*dt)
            if (hrp.Position-lastGood.Position).Magnitude>allow then
                pcall(function() hrp.CFrame=lastGood end)
                hrp.AssemblyLinearVelocity=Vector3.zero
                hrp.AssemblyAngularVelocity=Vector3.zero
                return
            end
        end
        lastGood=hrp.CFrame
        lastGoodAt=now
    end
    local function sweepCollide()
        if not flags.antiFling or flinging then return end
        for i=1,nParts do
            local d=otherParts[i]
            if d and d.Parent and d.CanCollide then d.CanCollide=false; flipped[d]=true end
        end
    end
    bind(RunService.Heartbeat,sweepCollide)
    bind(RunService.Stepped,guard)
    bind(RunService.Heartbeat,guard)
    bind(RunService.RenderStepped,guard)

    local MOVERS={"BodyVelocity","BodyAngularVelocity","BodyThrust","BodyForce","BodyPosition","BodyGyro",
        "LinearVelocity","AngularVelocity","VectorForce","Torque","AlignPosition","AlignOrientation",
        "RocketPropulsion"}
    local function isMover(d)
        for _,c in ipairs(MOVERS) do if d:IsA(c) then return true end end
        return false
    end
    local function killMover(d)
        if d==flyBV or d==flyBG or flags.fly or flinging then return end
        if d.Parent then pcall(function() d:Destroy() end) end
    end
    local function watchSelf(ch)
        if not ch then return end
        bind(ch.DescendantAdded,function(d)
            if not flags.antiFling or flags.fly then return end
            if not isMover(d) then return end
            task.defer(killMover,d)
        end)
    end
    task.spawn(function() while not isDead() do
        if flags.antiFling and not flags.fly and not flinging then
            local ch=LocalPlayer.Character
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            if ch then
                for _,d in ipairs(ch:GetDescendants()) do
                    if isMover(d) then killMover(d) end
                end
            end
        end
        task.wait(0.5)
    end end)
    watchSelf(LocalPlayer.Character)
    bind(LocalPlayer.CharacterAdded,watchSelf)
end

local Menu = MonoUI.new({
    Title = "Mono", Version = "v1", Width = 860, Height = 560,
    LogoUrl = "https://raw.githubusercontent.com/fleecelolll/MonoMM2/main/Mono%20MM2%20Logo.png",
    LogoCache = "Mono MM2/logo-mm2.png",
    LogoHeight = 46, LogoAspect = 3,
    LogoMarkRect = { 19, 88, 200, 141 },
})
Window = Menu

Menu:Tab("Modules"); Menu:Tab("Players"); Menu:Tab("Server"); Menu:Tab("Configs"); Menu:Tab("Settings"); Menu:Tab("Credits")

Menu:Category("Favorites", "star")
local Combat    = Menu:Category("Combat",    "crosshair")
local PlayerCat = Menu:Category("Player",    "user")
local Visuals   = Menu:Category("Visuals",   "eye")
local Teleport  = Menu:Category("Teleport",  "map-pin")
local Safety    = Menu:Category("Safety",    "shield")
local Utility   = Menu:Category("Utility",   "wrench")


Combat:Section("Murderer + Sheriff")
do
    local m = Combat:Module({ Name = "Auto Kill", Desc = "As murderer, knifes everyone still alive in the round. As sheriff, snap-shots the murderer", Callback = function(v) flags.autoKill=v end, Info = "As murderer, it knifes everyone still alive in the round at once, with no distance limit, so it ends the round instantly. Anyone already dead and sitting in the lobby is skipped. As sheriff or hero it snap-shots the murderer instead: it locks onto them at a fixed offset, rides along with them for a few frames so the server sees the two of you in the correct relative position, fires point blank and returns you. Riding along is what makes it land on someone running or jumping, because your position and theirs go stale together instead of separately. The server only accepts one gun shot every 3.2 seconds and silently discards anything sent sooner, so this waits that long between attempts." })
    m:Setting{ Type = "Slider", Title = "Snap Height", Min = 5, Max = 9, Default = 5, Callback = function(v) Mono.SNAP_HEIGHT=v end }
    m:Setting{ Type = "Label", Wrap = true, Text = "5 is the measured sweet spot and you should not need to change it. Over a logged sample every shot that landed came from between 2.3 and 2.75 studs of the target, and every shot outside that band missed on both sides. Closer than about 2.2 puts the muzzle inside their hitbox, where a ray that starts inside a part passes straight out without registering. The muzzle sits 3.45 studs ahead of you, so height 5 places it 2.44 studs away, in the middle of the band." }
    m:Setting{ Type = "Label", Wrap = true, Text = "Gun cooldown is fixed at 3.25s. The server only accepts one shot every 3.2s and silently throws away anything fired sooner, so there is no useful setting below that." }
end
do
    local m = Combat:Module({ Name = "Aimbot", Desc = "Snaps your camera to the closest enemy in your FOV", Hold = true, Callback = function(v) flags.aimbot=v end, Info = "Snaps your camera to the closest enemy inside the FOV circle. As murderer it tracks anyone, otherwise it tracks the murderer. Bind a key and it only aims while that key is held; leave it toggled on and it aims continuously. Adjust the radius with the FOV slider, and turn on Show FOV to see it." })
    m:Setting{ Type = "Slider", Title = "FOV", Min = 40, Max = 400, Default = 120, Callback = function(v) aimFov=v end }
end
do
    local m = Combat:Module({ Name = "Silent Aim", Desc = "Your shots and throws go to the closest player in your FOV", Callback = function(v) flags.silentAim=v end, Info = "Your shots and throws go to the closest player in your FOV. As murderer it redirects the knife where you threw it, and it keeps hold of whoever you picked for a moment so drifting off them during the throw's wind up does not lose the lock. As sheriff or hero, pulling the trigger locks onto whoever is in the circle and snap-shots them, since the gun is checked against your position. Set the radius with the Aimbot FOV slider." })
end
do
    local m = Combat:Module({ Name = "Show FOV Circle", Desc = "Draws the aim radius", Callback = function(v) flags.showFov=v end, Info = "Draws the aim radius. Only visible while an aim feature is on." })
end

Combat:Section("Sheriff")
do
    local m = Combat:Module({ Name = "Gun Through Walls", Desc = "Your shots ignore geometry", Callback = function(v) flags.gunWalls=v end, Info = "Your shots ignore geometry. Aim near a player rather than exactly at them - through a wall it falls back to whoever is closest inside the Aimbot FOV circle, since you cannot aim precisely at someone you cannot see. Does not shoot for you." })
end
do
    local m = Combat:Module({ Name = "Dropped Gun ESP", Desc = "Highlights the sheriff gun once it is on the ground", Callback = function(v) flags.gunEsp=v end, Info = "Highlights the sheriff gun once it is lying on the ground." })
end
do
    local m = Combat:Module({ Name = "Gun ESP Distance", Desc = "Adds a distance label to the dropped gun highlight", Callback = function(v) flags.gunEspDist=v end, Info = "Adds a distance label to the dropped gun highlight." })
end
do
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    local m = Combat:Module({ Name = "Auto Grab Gun", Desc = "Grabs the dropped gun the moment it appears, then returns you", Callback = function(v) flags.autoGun=v end, Info = "Grabs the dropped gun the moment it appears, then returns you." })
end
do
    local m = Combat:Module({ Name = "Grab Gun Now", Desc = "One-off grab of the dropped gun", Action = true, Callback = function()
        if findWeapon("Gun") then notify("You already have a gun"); return end
        if not (droppedGun or findDroppedGun()) then notify("No dropped gun on the map"); return end
        grabGunOnce()
    end, Info = "One-off grab of the dropped gun" })
end

Combat:Section("Murderer")
do
    local m = Combat:Module({ Name = "Knife Through Walls", Desc = "Your thrown knives ignore geometry", Callback = function(v) flags.knifeWalls=v end, Info = "Your thrown knives ignore geometry. Aim at a player or anywhere on the map. Does not throw for you." })
end
do
    local m = Combat:Module({ Name = "Instant Knife Throw", Desc = "Skips the wind up and the flight time so the knife lands at once", Callback = function(v) flags.instantKnife=v end, Info = "Skips the wind up and the flight time, so the knife lands the instant you press throw. Walls still block it unless Knife Through Walls is on." })
end

PlayerCat:Section("Movement")
do
    local m = PlayerCat:Module({ Name = "Fly", Desc = "Free movement in any direction", Callback = function(v) flags.fly=v; if v then startFly() else stopFly() end end, Info = "Free movement relative to your camera. On a keyboard use WASD with Space to rise and Ctrl to drop. On a touch screen use your normal movement stick, and the up and down buttons Mono adds to the side of the screen." })
    m:Setting{ Type = "Slider", Title = "Speed", Min = 20, Max = 250, Default = 60, Callback = function(v) flags.flySpeed=v end }
end
do
    local m = PlayerCat:Module({ Name = "Noclip", Desc = "Walk through walls", Callback = function(v) flags.noclip=v
        if not v then
            local ch=LocalPlayer.Character
            Mono.recollide(ch and ch:FindFirstChildOfClass("Humanoid"))
        end
    end, Info = "Walk through walls. Forced on during a fling, which needs it." })
end
do
    local m = PlayerCat:Module({ Name = "Infinite Jump", Desc = "Jump again any time, including mid-air", Callback = function(v) flags.infJump=v end, Info = "Jump again any time, including mid-air." })
end
do
    local m = PlayerCat:Module({ Name = "Unlock Camera", Desc = "Removes the zoom limit", Callback = function(v) flags.unlockCam=v; setUnlockCam(v) end, Info = "Removes the zoom limit. Combined with Noclip the camera also passes through walls." })
end

PlayerCat:Section("Stats")
do
    local m = PlayerCat:Module({ Name = "Reset Character", Desc = "Kills you so you respawn", Action = true, Callback = function()
        local h=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if h then h.Health=0 else notify("You have no character right now") end end, Info = "Kills you so you respawn" })
end

Visuals:Section("Player ESP")
do
    local m = Visuals:Module({ Name = "Nametag ESP", Desc = "Name, distance and round coins above each player", Callback = function(v) flags.espNames=v; if not v then pcall(Mono.setRobloxNames,false) end end, Info = "Name, distance and round coins above each player." })
end
do
    local m = Visuals:Module({ Name = "Box ESP", Desc = "2D rectangle around each player that tracks their pose", Callback = function(v) flags.espBox=v end, Info = "2D rectangle around each player that tracks their pose." })
end
do
    local m = Visuals:Module({ Name = "3D Box ESP", Desc = "Draws a box around each player in world space",
        Info = "A twelve-edge box fitted to the player's actual bounding box, so it turns with them and keeps true perspective at any distance.",
        Callback = function(v) flags.espBox3D=v end })
end
do
    local m = Visuals:Module({ Name = "Chams", Desc = "Colored through-wall outline on each player", Callback = function(v) flags.espChams=v end, Info = "Colored through-wall outline on each player, visible through geometry." })
    m:Setting{ Type = "Toggle", Title = "Fill Body", Default = false,
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        Callback = function(v) flags.espFill=v end }
end
do
    local m = Visuals:Module({ Name = "Role Tags", Desc = "Colors every ESP by role and shows [M] [S] [I] tags", Callback = function(v) flags.espRoleTags=v end, Info = "Colors every ESP by role and shows [M] [S] [I] tags." })
end
do
    local m = Visuals:Module({ Name = "Avatar Icons", Desc = "Shows each player's headshot on their nametag",
        Callback = function(v) flags.espAvatar=v end, Info = "Fetches the player's headshot thumbnail once and caches it on the nametag card." })
end
do
    local m = Visuals:Module({ Name = "Tracers", Desc = "Draws a line from your chosen origin to each player",
        Callback = function(v) flags.espTracers=v end, Info = "A thin line from your chosen origin to each player, colored by their role." })
    m:Setting{ Type = "Dropdown", Title = "Origin",
        Values = { "Bottom", "Bottom Left", "Bottom Right", "Center", "Top", "Mouse" },
        Default = "Bottom", Callback = function(v) flags.espTracerFrom=v end }
end
do
    local m = Visuals:Module({ Name = "ESP Distance Limit", Desc = "Hides nametags and tracers past a set range",
        Callback = function(v) flags.espMaxDist = v and (Mono.espLimit or 250) or 0 end, Info = "With this off every player is shown regardless of range." })
    m:Setting{ Type = "Slider", Title = "Max Distance", Min = 25, Max = 1000, Default = 250,
        Callback = function(v) Mono.espLimit = v; if m:Get() then flags.espMaxDist = v end end }
end
do
    local m = Visuals:Module({ Name = "Skeleton ESP", Desc = "Draws bone lines over each player", Callback = function(v) flags.espSkeleton=v end, Info = "Draws bone lines over each player." })
end

do
    local FS = { prints = {}, last = setmetatable({}, { __mode = "k" }),
                 side = setmetatable({}, { __mode = "k" }),
                 folder = nil, life = 8, at = 0,
                 ray = RaycastParams.new() }
    FS.ray.FilterType = Enum.RaycastFilterType.Exclude

    function FS.tint(role)
        if role == "Murderer" then return Color3.fromRGB(255, 80, 80) end
        if isGunRole(role) then return Color3.fromRGB(90, 150, 255) end
        return Color3.fromRGB(95, 225, 125)
    end
    function FS.clear()
        for i = #FS.prints, 1, -1 do
            local e = FS.prints[i]
            pcall(function() e.part:Destroy() end)
            if e.toe then pcall(function() e.toe:Destroy() end) end
            FS.prints[i] = nil
        end
        table.clear(FS.last); table.clear(FS.side)
        if FS.folder then pcall(function() FS.folder:Destroy() end); FS.folder = nil end
    end
    function FS.drop(cf, col)
        if #FS.prints >= 220 then
            local old = table.remove(FS.prints, 1)
            if old then
                pcall(function() old.part:Destroy() end)
                if old.toe then pcall(function() old.toe:Destroy() end) end
            end
        end
        if not (FS.folder and FS.folder.Parent) then
            FS.folder = create("Folder", { Name = rnd(), Parent = workspace })
        end
        local part = create("Part", { Name = rnd(), Anchored = true, CanCollide = false,
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            CanQuery = false, CanTouch = false, CastShadow = false,
            Size = Vector3.new(0.4, 0.07, 0.66), Material = Enum.Material.Neon,
            Color = col, Transparency = 0.15, CFrame = cf, Parent = FS.folder },
            { create("SpecialMesh", { MeshType = Enum.MeshType.Sphere }) })
        local toe = create("Part", { Name = rnd(), Anchored = true, CanCollide = false,
            CanQuery = false, CanTouch = false, CastShadow = false,
            Size = Vector3.new(0.26, 0.06, 0.2), Material = Enum.Material.Neon,
            Color = col, Transparency = 0.15,
            CFrame = cf * CFrame.new(0, 0, -0.46), Parent = FS.folder },
            { create("SpecialMesh", { MeshType = Enum.MeshType.Sphere }) })
        FS.prints[#FS.prints + 1] = { part = part, toe = toe, born = os.clock() }
    end

    bind(RunService.Heartbeat, function()
        if not flags.footsteps then
            if #FS.prints > 0 or FS.folder then FS.clear() end
            return
        end
        local now = os.clock()
        for i = #FS.prints, 1, -1 do
            local e = FS.prints[i]
            local age = now - e.born
            if age >= FS.life or not e.part.Parent then
                pcall(function() e.part:Destroy() end)
                if e.toe then pcall(function() e.toe:Destroy() end) end
                table.remove(FS.prints, i)
            else
                local t = 0.15 + 0.85 * (age / FS.life)
                e.part.Transparency = t
                if e.toe then e.toe.Transparency = t end
            end
        end
        if now - FS.at < 0.08 then return end
        FS.at = now
        local me = LocalPlayer.Character
        for _, plr in ipairs(Mono.plrs) do
            local ch, _, hrp = Mono.hasBody(plr)
            if (plr ~= LocalPlayer or flags.footMine) and ch then
                if hrp then
                    local pos = hrp.Position
                    local prev = FS.last[plr]
                    if not prev then
                        FS.last[plr] = pos
                    elseif (pos - prev).Magnitude >= 3.5 then
                        FS.last[plr] = pos
                        FS.ray.FilterDescendantsInstances = { ch, me, FS.folder }
                        local hit = workspace:Raycast(pos, Vector3.new(0, -8, 0), FS.ray)
                        if hit then
                            local n = hit.Normal
                            local travel = pos - prev
                            local look = (travel.Magnitude > 0.5) and travel.Unit or hrp.CFrame.LookVector
                            local fwd = look - n * look:Dot(n)
                            fwd = (fwd.Magnitude > 1e-3) and fwd.Unit or Vector3.new(0, 0, -1)
                            local side = fwd:Cross(n)
                            FS.side[plr] = not FS.side[plr]
                            local base = hit.Position + side * (FS.side[plr] and 0.3 or -0.3) + n * 0.045
                            FS.drop(CFrame.lookAt(base, base + fwd, n), FS.tint(Mono.espRole(plr)))
                        end
                    end
                end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            end
        end
    end)

    local m = Visuals:Module({ Name = "Footstep Trails",
        Desc = "Leaves a colored trail of footprints behind every player",
        Callback = function(v) flags.footsteps = v; if not v then FS.clear() end end,
        Info = "Leaves a trail of footprints behind every player, colored by role: red for the murderer, blue for the sheriff or hero, green for innocents. The game's own Footsteps perk is murderer only and shows innocents in one color, so this replaces it rather than revealing it. The prints are drawn on your machine only, so nobody else sees them." })
    m:Setting{ Type = "Slider", Title = "Trail Length", Min = 3, Max = 30, Default = 8,
        Format = function(v) return v .. "s" end,
        Callback = function(v) FS.life = v end }
    m:Setting{ Type = "Toggle", Title = "Include My Own", Default = false,
        Callback = function(v) flags.footMine = v end }
end

Visuals:Section("World & Render")
do
    local m = Visuals:Module({ Name = "Coin ESP", Desc = "Highlights every uncollected coin on the map", Callback = function(v) flags.coinEsp=v end, Info = "Highlights every uncollected coin on the map." })
end
do
    local m = Visuals:Module({ Name = "Trap ESP", Desc = "Untested. Shows the murderer's invisible traps through walls", Callback = function(v) flags.trapEsp=v end, Info = "Untested. Murderer traps turn up rarely enough that this has never been confirmed working, so it may not behave as intended. What it is meant to do: traps are invisible by design, and this draws them through walls so you can walk around them." })
end
do
    local m = Visuals:Module({ Name = "Kill Feed", Desc = "Notifies you of every elimination, in any role including innocent", Callback = function(v) flags.killFeed=v end, Info = "Notifies you of every elimination, in any role including innocent." })
end
do
    local m = Visuals:Module({ Name = "Fullbright", Desc = "Removes darkness so nowhere on the map is unlit", Callback = function(v) flags.fullbright=v; setFullbright(v) end, Info = "Removes darkness so nowhere on the map is unlit." })
end
do
    local m = Visuals:Module({ Name = "FPS Boost", Desc = "Strips textures, shadows, particles and post effects", Callback = function(v) flags.fpsBoost=v; setFPSBoost(v) end, Info = "Flattens every part to plain untextured plastic and removes shadows, particles, decals, sun rays, bloom and atmospheric haze, which is where most of the frame cost in a heavy map goes. It leaves your brightness alone, so if the map is dark it stays dark. Turn on Fullbright as well if you want it lit flat. Everything is reversed when you turn it off or unload." })
end

local function targetList()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then t[#t + 1] = p.Name end
    end
    if #t == 0 then t[1] = "(nobody else here)" end
    return t
end
local function targetSetting(m)
    m.tpTarget = nil
    m:Setting{ Type = "Dropdown", Title = "Target", GetValues = targetList,
        Callback = function(v) m.tpTarget = v end }
end
local function targetOf(m)
    return resolvePlayer(m and m.tpTarget) or resolvePlayer(UI.tpPlayer)
end


Teleport:Section("Player Actions")
do
    local m
    m = Teleport:Module({ Name = "Teleport To Player", Desc = "Drops you just above the selected player", Action = true, Callback = function()
        local p=targetOf(m)
        if not p then notify("Pick a player first"); return end
        local ch=p.Character; local h=ch and ch:FindFirstChildOfClass("Humanoid"); local root=(h and h.RootPart) or getHRP(ch)
        if not root then notify((p.DisplayName or p.Name).." is dead, no character to teleport to"); return end
        if tpTo(root.Position) then notify("Teleported to "..(p.DisplayName or p.Name))
        else notify("You have no character right now") end end, Info = "Drops you just above the selected player" })
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    targetSetting(m)
end
do
    local m
    m = Teleport:Module({ Name = "Fling Player", Desc = "Launches the selected player using physics", Action = true, Callback = function()
        local p=targetOf(m)
        if not p then notify("Pick a player first"); return end
        if not (p.Character and getHRP(p.Character)) then notify((p.DisplayName or p.Name).." is dead, nothing to fling"); return end
        notify("Flinging "..(p.DisplayName or p.Name))
        task.spawn(function()
            local ok,why=flingPlayer(p)
            if not ok and why then notify(why,4) end
        end) end, Info = "Launches the selected player using physics. You return to where you were." })
    targetSetting(m)
end
do
    local m
    m = Teleport:Module({ Name = "Loop Fling", Desc = "Keeps flinging the selected player over and over",
        Callback = function(v)
            if not v then return end
            task.spawn(function()
                local lastWhy
                while m:Get() and not isDead() do
                    local p = targetOf(m)
                    if not p then
                        notify("Pick a player first")
                        m:Toggle(false)
                        break
                    end
                    if Mono.hasBody(LocalPlayer) and p.Character and getHRP(p.Character)
                        and not Mono.alreadyFlung(p) and not flinging and not Mono.teleporting() then
                        local ok, why = flingPlayer(p)
                        if ok then
                            lastWhy = nil
                        elseif why and why ~= lastWhy then
                            lastWhy = why
                            notify(why, 3)
                        end
                    end
                    task.wait(0.4)
                end
            end)
        end,
        Info = "Keeps flinging one player for as long as this is on, waiting for them to land before going again. It skips them while they are already sailing through the air or heading for the void, so it will not follow them down." })
    targetSetting(m)
end
do
    local m = Teleport:Module({ Name = "Fling All Players", Desc = "Flings everyone in the server one after another, then puts you back", Action = true, Callback = flingAll, Info = "Flings everyone in the server one after another, then puts you back" })
end
do
    local m = Teleport:Module({ Name = "Auto Fling Murderer", Desc = "Flings the murderer on sight, over and over, for as long as this is on", Callback = function(v) flags.autoFlingMurderer=v end, Info = "Flings the murderer on sight, over and over, for as long as this is on." })
end
do
    local m = Teleport:Module({ Name = "Auto Fling Sheriff", Desc = "Flings the sheriff on sight, over and over, for as long as this is on", Callback = function(v) flags.autoFlingSheriff=v end, Info = "Flings whoever is holding the gun, sheriff or hero, on sight, over and over, for as long as this is on." })
end

Teleport:Section("Coins")
do
    local m = Teleport:Module({ Name = "Auto Collect Coins", Desc = "Walks you coin to coin at normal speed", Callback = function(v) flags.autoCoins=v; if v then if coinBagFull then notify("Coin bag is already full") else notify("Auto collect on") end end end, Info = "Walks you coin to coin at normal speed. Idles while you are dead, in the lobby, or when no coins are out, and stops on its own when your bag is full." })
end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
do
    local m = Teleport:Module({ Name = "Teleport To Nearest Coin", Desc = "One hop to the closest uncollected coin", Action = true, Callback = function()
        local hrp=getHRP(LocalPlayer.Character)
        if not hrp then notify("You have no character right now"); return end
        local pool=coinCache
        if #pool==0 then pool=freshCoins() end
        local best,bd
        for _,c in ipairs(pool) do
            if c.Parent and not coinTaken(c) then
                local d=(c.Position-hrp.Position).Magnitude
                if not bd or d<bd then bd,best=d,c end
            end
        end
        if not best then notify("No coins on map"); return end
        if tpTo(best.Position) then notify("Teleported to coin") else notify("You have no character right now") end end, Info = "One hop to the closest uncollected coin" })
end

Safety:Section("Protection")
do
    local m = Safety:Module({ Name = "Anti Fling", Desc = "Blocks other exploiters from flinging you", Callback = function(v) flags.antiFling=v
        if not v and Mono.antiFlingRestore then Mono.antiFlingRestore() end
    end, Info = "Blocks other exploiters from flinging you. It works two ways: it turns off collision on everyone else so they cannot shove you, and it anchors you back if something throws you further than you could physically travel. The collision half keeps running even while you fly. The anchor half stands down while the game teleports you between rounds, while Auto Collect Coins is moving you, and briefly after Mono teleports you itself, since it cannot tell those apart from an attack." })
end
do
    local m = Safety:Module({ Name = "Anti Trap", Desc = "Untested. Keeps your speed when you walk into a murderer trap", Callback = function(v) flags.antiTrap=v end, Info = "Untested. Murderer traps turn up rarely enough that this has never been confirmed working, so it may not behave as intended. What it is meant to do: cancel the slow when you walk into a trap, so you keep full speed." })
end

Safety:Section("Awareness")
do
    local m = Safety:Module({ Name = "Murderer Notify", Desc = "Warns you when the murderer comes within 50 studs", Callback = function(v) flags.murdererNotify=v end, Info = "Pops a warning the moment the murderer gets within 50 studs of you, with their name and how far away they were. It fires once per approach and only re-arms after they leave that range again, so it will not spam you while they are nearby." })
end
do
    local m = Safety:Module({ Name = "Anti AFK", Desc = "Stops the 20 minute idle kick", Callback = function(v) flags.antiAfk=v end, Info = "Stops the 20 minute idle kick. Roblox tells the game you have gone idle about every two minutes, and Mono answers with a fake input that resets the timer, so you are never kicked. It notifies you the first time it fires so you know it is alive, then stays quiet. While you are holding a weapon it nudges the mouse instead of right clicking, so it can never throw your knife while you are away." })
end

Utility:Section("Actions")
do
    Mono.origFps = (function()
        local ok, v = pcall(function()
            return UserSettings():GetService("UserGameSettings").FramerateCap
        end)
        if ok and type(v) == "number" and v >= 0 then return math.floor(v + 0.5) end
        if typeof(getfpscap) == "function" then
            local ok2, v2 = pcall(getfpscap)
            if ok2 and type(v2) == "number" and v2 >= 0 then return math.floor(v2 + 0.5) end
        end
        return nil
    end)()
    if Mono.origFps == nil then
        Mono.origFps = 0
        Fallback.note("FPS Cap", "release to unlimited",
            "neither your executor nor Roblox would report your current frame cap, so turning the cap back off releases it entirely instead of restoring your own limit",
            {"FPS Cap"})
    end
    local value = 60
    local function apply(v)
        if typeof(setfpscap) ~= "function" then return end
        pcall(setfpscap, v)
    end
    local m = Utility:Module({ Name = "FPS Cap", Desc = "Limits your frame rate to save battery and heat",
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        Callback = function(on) apply(on and value or (Mono.origFps or 0)) end,
        Info = "Limits your frame rate. Worth having on a phone or a weak laptop, where an uncapped frame rate is what makes the device run hot and drain the battery. Set the slider to 0 for unlimited. The lowest real cap is 5, because anything under that leaves the game unplayable. Turning it off puts you back on whatever cap you had before Mono loaded, not on unlimited." })
    m:Setting{ Type = "Slider", Title = "FPS Limit", Min = 0, Max = 360, Default = 60,
        Adjust = function(v) if v > 0 and v < 5 then return 5 end return v end,
        Format = function(v) return v == 0 and "Unlimited" or tostring(v) end,
        Callback = function(v) value = v; if m:Get() then apply(v) end end }
    m:Setting{ Type = "Label", Text = "0 = unlimited. The lowest cap you can set is 5, so you cannot make the game unplayable by accident.", Wrap = true }
    if typeof(setfpscap) ~= "function" then
        Fallback.note("FPS Cap","no cap control",
            "your executor has no setfpscap, so the frame rate cannot be limited at all",
            {"FPS Cap"})
    end
end
do
    local m = Utility:Module({ Name = "Rejoin", Desc = "Rejoins this same server", Action = true, Callback = rejoin, Info = "Rejoins this same server" })
end
do
    local m = Utility:Module({ Name = "Server Hop", Desc = "Joins the busiest server that still has room", Action = true, Callback = serverHop, Info = "Joins the busiest server that still has room for you, never the one you are already in. If that server fills up before you arrive it moves on to the next one." })
end

do
    local value = 16
    local apply = function(v) UI.walkSpeed=v; local h=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if h then h.WalkSpeed=v end end
    local m = PlayerCat:Module({ Name = "Walk Speed", Desc = "Sets how fast you run", Callback = function(on)
        apply(on and value or 16)
    end, Info = "Sets how fast you run. The default is 16. Going well above that is an easy way to get kicked, so raise it gently." })
    m:Setting{ Type = "Slider", Title = "Walk Speed", Min = 16, Max = 120, Default = 16,
        Callback = function(v) value = v; if m:Get() then apply(v) end end }
end
do
    local value = 50
    local apply = function(v) local h=LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if h then h.UseJumpPower=true;h.JumpPower=v end end
    local m = PlayerCat:Module({ Name = "Jump Power", Desc = "Raises how high you jump", Callback = function(on)
        apply(on and value or 50)
    end, Info = "Raises how high you jump. The default is 50. Large values are very obvious to other players, so raise it gently." })
    m:Setting{ Type = "Slider", Title = "Jump Power", Min = 50, Max = 250, Default = 50,
        Callback = function(v) value = v; if m:Get() then apply(v) end end }
end
do
    local value = 70
    local apply = function(v) pcall(function() Camera.FieldOfView=v end) end
    local m = Visuals:Module({ Name = "Field of View", Desc = "Widens the camera so you see more around you", Callback = function(on)
        apply(on and value or 70)
    end, Info = "Widens the camera so you see more around you. The default is 70. This only changes what you see, never what the server knows." })
    m:Setting{ Type = "Slider", Title = "Field of View", Min = 70, Max = 120, Default = 70,
        Callback = function(v) value = v; if m:Get() then apply(v) end end }
end


Menu.TargetChanged = function(name, on)
    UI.tpPlayer = on and name or nil
end

Menu.DetailExtra = function(p)
    local rd = roundData(p)
    return {
        { Section = "MM2", Rows = {
            { "Role",     roleOf(p) .. ((rd and rd.Dead) and "  (dead)" or "") },
            { "Level",    tostring(p:GetAttribute("Level") or "?") },
            { "Prestige", tostring(p:GetAttribute("Prestige") or "?") },
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            { "XP",       tostring(p:GetAttribute("XP") or "?") },
            { "Perk",     tostring((rd and rd.Perk) or p:GetAttribute("EquippedPerk") or "?") },
            { "Knife",    tostring(p:GetAttribute("EquippedKnife") or "?"), true },
            { "Gun",      tostring(p:GetAttribute("EquippedGun") or "?"), true },
        } },
    }
end

Menu.onDestroy = function()
    Unloaded = true
    if GENV and GENV.MONO_Unload then pcall(GENV.MONO_Unload) return end
    pcall(function() for _, c in ipairs(conns) do c:Disconnect() end end)
    table.clear(conns)
    pcall(function() Mono.clearDrawn() end)
end

Mono.requestUnload = function()
    Menu:Confirm({
        Title = "Unload Mono?",
        Body = "This turns every feature off, puts your walk speed, jump power, camera and lighting back the way they were, and removes every trace of Mono from the game. You can run the script again any time.",
        ConfirmText = "Unload Mono",
        CancelText = "Cancel",
        OnConfirm = function() Menu:Destroy() end,
    })
end
Menu.onCloseRequest = Mono.requestUnload

pcall(function()
    if not GENV then return end
    GENV.MONO_Unload = function()
        if Mono.unloading then return end
        Mono.unloading = true
        pcall(function()
            for _, m in ipairs(Menu.allModules) do
                if not m.action and m.state then pcall(function() m:Toggle(false) end) end
            end
        end)
        task.wait()
        task.wait()
        Unloaded = true
        pcall(function() Mono.setRobloxNames(false) end)
        pcall(function() setCamThruWalls(false) end)
        pcall(function() setUnlockCam(false) end)
        pcall(function() stopFly() end)
        pcall(function() setFullbright(false) end)
        pcall(function() setFPSBoost(false) end)
        pcall(function() if Mono.antiFlingRestore then Mono.antiFlingRestore() end end)
        pcall(function()
            local ch = LocalPlayer.Character
            Mono.recollide(ch and ch:FindFirstChildOfClass("Humanoid"), true)
        end)
        pcall(function() for _, c in ipairs(conns) do c:Disconnect() end end)
        table.clear(conns)
        pcall(function() Mono.clearDrawn() end)
        pcall(function() if typeof(cleardrawcache) == "function" then cleardrawcache() end end)
        pcall(function() if Menu._releaseWheel then Menu._releaseWheel() end end)
        pcall(function() game:GetService("ContextActionService"):UnbindAction("MonoWheelSink") end)
        pcall(function() if GENV.MONOUI_CLEANUP then GENV.MONOUI_CLEANUP() end end)
        pcall(function() if GENV.__mono_gui then GENV.__mono_gui:Destroy() end end)
        pcall(function() for _, g in ipairs(TRACKED) do pcall(function() g:Destroy() end) end end)
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        table.clear(TRACKED)
        GENV.MONO_Unload = nil
        GENV.MONOUI = nil
        GENV.__mono_gui = nil
        GENV.MONOUI_CLEANUP = nil
        GENV.MONO_GUIS = nil
    end
end)

Mono.menuKey = "RightShift"
Mono.keyPretty = {
    RightShift = "Right Shift", LeftShift = "Left Shift",
    RightControl = "Right Ctrl", LeftControl = "Left Ctrl",
    RightAlt = "Right Alt", LeftAlt = "Left Alt",
    MouseButton1 = "Left Click", MouseButton2 = "Right Click", MouseButton3 = "Middle Click",
}
function Mono.keyName()
    local n = Mono.menuKey
    if not n then return "no key" end
    return Mono.keyPretty[n] or n
end
do
    bind(UserInputService.InputBegan, function(i, gp)
        if gp or isDead() then return end
        if Mono.menuKey and i.KeyCode.Name == Mono.menuKey then
            if Menu.minimized then Menu:Restore() else Menu:Minimize() end
        end
    end)
    table.insert(Menu.uiSettings, { Type = "Section", Text = "MENU" })
    table.insert(Menu.uiSettings, { Type = "Keybind", Title = "Menu Toggle Key",
        Default = "RightShift",
        Callback = function(v)
            Mono.menuKey = v
            if Mono.onMenuKey then pcall(Mono.onMenuKey) end
        end })
end

do
    Mono.DIR = "Mono MM2"
    Mono.STATE = Mono.DIR .. "/settings.txt"

    function Mono.ensureFolder()
        if typeof(makefolder) ~= "function" or typeof(isfolder) ~= "function" then return false end
        local ok = pcall(function()
            if not isfolder(Mono.DIR) then makefolder(Mono.DIR) end
            if not isfolder(Mono.DIR .. "/configs") then makefolder(Mono.DIR .. "/configs") end
        end)
        if not ok then return false end
        local ok2, there = pcall(isfolder, Mono.DIR)
        return ok2 and there == true
    end

    function Mono.readState()
        if typeof(isfile) ~= "function" or typeof(readfile) ~= "function" then return nil end
        local okf, there = pcall(isfile, Mono.STATE)
        if not (okf and there) then return nil end
        local ok, raw = pcall(readfile, Mono.STATE)
        if not (ok and type(raw) == "string") then return nil end
        return raw:lower():match("tutorial_completed%s*=%s*(%a+)") == "true"
    end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece

    function Mono.writeState(done)
        if typeof(writefile) ~= "function" then return false end
        return (pcall(writefile, Mono.STATE,
            "tutorial_completed = " .. (done and "true" or "false") .. "\n"))
    end

    do
        local folderOk = Mono.ensureFolder()
        local state = folderOk and Mono.readState() or nil
        if folderOk and state == nil then
            if Mono.writeState(false) then state = false end
        end
        Mono.fileOk = folderOk and state ~= nil
        Mono.tutorialDone = (state == true)
        if not Mono.fileOk then
            Fallback.note("First run tutorial", "always on",
                "Mono could not create its " .. Mono.DIR .. " folder or the settings file inside it, "
                .. "which usually means the executor is missing makefolder or writefile, so nothing can "
                .. "remember that you already finished the tutorial and it will run on every execution",
                { "the tutorial", "Configs", "Auto Save Toggles" })
        end
    end

    local function firstRun()
        return not Mono.tutorialDone
    end

    local function catButton(name)
        for _, c in ipairs(Menu.categories) do
            if c.name == name then return c.button end
        end
    end
    local function moduleRow(name)
        for _, m in ipairs(Menu.allModules) do
            if m.name == name then return m.row end
        end
    end
    local function moduleBit(name, kind)
        for _, m in ipairs(Menu.allModules) do
            if m.name == name then
                if kind == "chip" then return m.chip end
                if kind == "star" then return m.starImg and m.starImg.Parent end
                return m.row
            end
        end
    end
    local function iconAt(row, i)
        if not row then return nil end
        local b = {}
        for _, c in ipairs(row:GetChildren()) do if c:IsA("TextButton") then b[#b + 1] = c end end
        table.sort(b, function(x, y) return x.LayoutOrder < y.LayoutOrder end)
        return b[i]
    end
    local function topIconAt(i) return iconAt(Menu.midIcons, i) end
    local function winIconAt(i) return iconAt(Menu.winIcons, i) end
    local function tabButton(name)
        for _, t in ipairs(Menu.tabs) do
            if t.name == name then return t.button end
        end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
    end

    Menu:AddTourStep({ Title = "Welcome to Mono",
        Body = "A quick tour of the menu. You can skip at any point, and reopen this from Utility.",
        Target = nil })
    Menu:AddTourStep({ Title = "Categories",
        Body = "Features are grouped here. Combat, Player, Visuals, Teleport, Safety and Utility.",
        Target = function() return catButton("Combat") end })
    Menu:AddTourStep({ Title = "Turn a feature on",
        Body = "Click anywhere on a row to toggle it, not just the switch on the right.",
        Before = function() local c = catButton("Combat") if c then Menu:SelectCategory(Menu.categories[2]) end end,
        Target = function() return moduleRow("Auto Kill") end })
    Menu:AddTourStep({ Title = "Keybinds",
        Body = "Click the key chip, then press any key to bind it. Right click the chip to clear it.",
        Target = function() return moduleBit("Auto Kill", "chip") end })
    Menu:AddTourStep({ Title = "Per-feature settings",
        Body = "The three dots open that feature's own options, plus its full description.",
        Target = function()
            local m = moduleRow("Auto Kill")
            if not m then return end
            for _, c in ipairs(m:GetChildren()) do
                if c:IsA("TextButton") and c.AbsoluteSize.X <= 40
                    and c.AbsolutePosition.X > m.AbsolutePosition.X + m.AbsoluteSize.X - 44 then return c end
            end
            return m
        end })
    Menu:AddTourStep({ Title = "Favorites",
        Body = "Star a feature and it appears in a Favorites category at the top.",
        Target = function() return moduleBit("Auto Kill", "star") end })
    Menu:AddTourStep({ Title = "Refresh",
        Body = "Reloads whichever tab you are on. On Modules it also clears the search box.",
        Target = function() return topIconAt(1) end })
    Menu:AddTourStep({ Title = "Compact mode",
        Body = "Shrinks the rows and hides the sidebar. Sweep your mouse to the left edge to bring it back.",
        Target = function() return topIconAt(2) end })
    Menu:AddTourStep({ Title = "Settings",
        Body = "Accent color, font, text size, layout, opacity and window size all live in this tab.",
        Target = function() return tabButton("Settings") end })
    Menu:AddTourStep({ Title = "Minimize",
        Body = "Collapses the menu to a small M badge. Drag it anywhere, click it to reopen.",
        Target = function() return winIconAt(1) end })
    Menu:AddTourStep({ Title = "Fullscreen",
        Body = "Fills the screen. Press again to go back to the windowed size.",
        Target = function() return winIconAt(2) end })
    Menu:AddTourStep({ Title = "Close",
        Body = "Unloads Mono completely, turning every feature off and undoing its changes.",
        Target = function() return winIconAt(3) end })
    Menu:AddTourStep({ Title = "That's it",
        Body = Mono.keyName() .. " hides and shows the menu, and you can change that key in Settings. Have fun.",
        Target = nil })

    if typeof(writefile)~="function" or typeof(readfile)~="function" or typeof(listfiles)~="function" then
        Fallback.note("Saved settings","memory only",
            "your executor cannot write files, so anything you set lives only until you leave",
            {"Configs","Auto Save Toggles","the first-run tour will replay every time"})
    end

    local AS = { path = Mono.DIR .. "/autosave.json", on = false, pending = false }
    function AS.write(now)
        if not AS.on then return end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
        if now then
            AS.pending = false
            pcall(function() writefile(AS.path, HttpService:JSONEncode(Menu:GetConfig())) end)
            return
        end
        if AS.pending then return end
        AS.pending = true
        task.delay(0.4, function()
            AS.pending = false
            if not AS.on then return end
            pcall(function() writefile(AS.path, HttpService:JSONEncode(Menu:GetConfig())) end)
        end)
    end
    function AS.load()
        local ok, raw = pcall(readfile, AS.path)
        if not ok or not raw then return false end
        local okd, data = pcall(function() return HttpService:JSONDecode(raw) end)
        if not okd then return false end
        Menu:LoadConfig(data)
        return true
    end

    function AS.clear()
        if typeof(delfile) ~= "function" then return false end
        if typeof(isfile) == "function" then
            local ok, there = pcall(isfile, AS.path)
            if not (ok and there) then return false end
        end
        return (pcall(delfile, AS.path))
    end

    Menu.onStateChanged = function() AS.write() end

    table.insert(Menu.uiSettings, { Type = "Toggle", Title = "Auto Save Toggles", Default = false,
        Info = "saving",
        Callback = function(v)
            AS.on = v
            if v then
                AS.write(true)
                notify("Auto save on. Your toggles are saved as you change them", 3)
            else
                AS.clear()
                notify("Auto save off. The saved toggles have been deleted", 3)
            end
        end })
    local function execName()
        local name
        if typeof(identifyexecutor)=="function" then
            local ok,a,b=pcall(identifyexecutor)
            if ok and type(a)=="string" and a~="" then
                name=a
                if type(b)=="string" and b~="" then name=name.." "..b end
            end
        end
        if not name and typeof(getexecutorname)=="function" then
            local ok,a=pcall(getexecutorname)
            if ok and type(a)=="string" and a~="" then name=a end
        end
        return name or "unknown"
    end
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece

    local function showCompat()
        local body=Fallback.text()
        local tag="\n\nDetected executor: "..execName()
        if not body then
            Menu:Notify({ Title = "Compatibility", Duration = 6,
                Content = "Everything Mono needs is available on your executor. No features are running in a reduced mode."..tag })
            return
        end
        Menu:Notify({ Title = "Some features are running reduced", Duration = 18,
            Content = "Your executor is missing something Mono normally uses, so it fell back to a weaker method. "
                .. "This is usually a limited or outdated executor rather than anything you did.\n\n"
                .. body .. "\n\nEverything still works, it is just louder or less reliable. "
                .. "You can re-read this any time from Settings."..tag })
    end
    Mono.showCompat = showCompat

    table.insert(Menu.uiSettings, { Type = "Section", Text = "RESET" })
    table.insert(Menu.uiSettings, { Type = "Button", Title = "Clear All Keybinds",
        Callback = function()
            for _, mm in ipairs(Menu.allModules) do mm:SetBind(nil) end
            notify("Every keybind cleared", 3)
        end })
    table.insert(Menu.uiSettings, { Type = "Button", Title = "Unfavorite All",
        Callback = function()
            for _, mm in ipairs(Menu.allModules) do mm:SetFavorite(false) end
        end })
    table.insert(Menu.uiSettings, { Type = "Button", Title = "Reset All Settings",
        Callback = function()
            Menu:Confirm({
                Title = "Reset all settings?",
                Body = "Every appearance, layout and behavior setting goes back to how it was when Mono first loaded. Your keybinds, favorites, saved configs and which features are turned on are all left alone.",
                ConfirmText = "Reset",
                CancelText = "Cancel",
                OnConfirm = function()
                    Menu:ResetSettings()
                    notify("Settings reset to default", 3)
                end,
            })
        end })

    table.insert(Menu.uiSettings, { Type = "Section", Text = "ACTIONS" })
    table.insert(Menu.uiSettings, { Type = "Button", Title = "Compatibility Report",
        Callback = function() Menu:CloseDrawer(); task.delay(0.25, showCompat) end })
    table.insert(Menu.uiSettings, { Type = "Button", Title = "Replay Tour",
        Callback = function()
            Menu:CloseDrawer()
            for _, t in ipairs(Menu.tabs) do
                if t.name == "Modules" then Menu:SelectTab(t) break end
            end
            task.delay(0.4, function() Menu:StartTour() end)
        end })
    table.insert(Menu.uiSettings, { Type = "Button", Title = "Unload Mono",
        Callback = function() Menu:CloseDrawer(); task.delay(0.28, Mono.requestUnload) end })

    task.delay(1.2, function()
        local okf, there = pcall(function()
            return typeof(isfile) == "function" and isfile(AS.path) == true
        end)
        if okf and there then
-- Script and UI originally created by and uploaded by https://robloxscripts.com/user/Fleece
            for _, cfg in ipairs(Menu.uiSettings) do
                if cfg.Title == "Auto Save Toggles" then cfg.Value = true end
            end
            AS.on = true
            if AS.load() then notify("Restored your saved toggles", 3) end
        end
    end)

    Menu.onTourEnd = function()
        Mono.tutorialDone = true
        Mono.writeState(true)
    end

    if firstRun() then
        task.delay(0.9, function() Menu:StartTour() end)
    else
        Mono.greet = notify("Mono loaded  " .. Mono.keyName() .. " to hide", 4)
        Mono.onMenuKey = function()
            local g = Mono.greet
            if g and g.SetContent then
                pcall(function() g:SetContent("Mono loaded  " .. Mono.keyName() .. " to hide") end)
            end
        end
    end
    if Fallback.n > 0 then
        task.delay(2.4, function() if Mono.showCompat then Mono.showCompat() end end)
    end
end

task.delay(0.25, function()
    if Unloaded then return end
    pcall(function() Menu:Refresh(false) end)
    pcall(function() Menu:Present() end)
end)
