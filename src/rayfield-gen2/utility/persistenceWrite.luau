-- Rayfield/utility/persistenceWrite  (bundle module #65)
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
