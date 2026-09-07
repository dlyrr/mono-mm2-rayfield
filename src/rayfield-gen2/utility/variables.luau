-- Rayfield/utility/variables  (bundle module #69)
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
