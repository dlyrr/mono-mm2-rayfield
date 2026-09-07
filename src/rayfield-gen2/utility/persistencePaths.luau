-- Rayfield/utility/persistencePaths  (bundle module #63)
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
