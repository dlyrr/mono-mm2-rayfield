-- Rayfield/utility/flagNames  (bundle module #47)
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
