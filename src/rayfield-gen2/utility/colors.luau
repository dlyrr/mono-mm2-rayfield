-- Rayfield/utility/colors  (bundle module #42)
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
