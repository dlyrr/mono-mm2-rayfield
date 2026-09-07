-- Rayfield/utility/enums  (bundle module #44)
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
