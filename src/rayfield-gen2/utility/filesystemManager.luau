-- Rayfield/utility/filesystemManager  (bundle module #46)
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
