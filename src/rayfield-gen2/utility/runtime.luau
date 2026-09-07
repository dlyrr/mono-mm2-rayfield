-- Rayfield/utility/runtime  (bundle module #66)
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
