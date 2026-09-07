-- Rayfield/utility/persistenceSettings  (bundle module #64)
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
        autoloadConfig = ak.settings.autoloadConfig,
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
    if type(c.autoloadConfig) == "string" then
        al.settings.autoloadConfig = c.autoloadConfig
    end
    return true
end
return aj
