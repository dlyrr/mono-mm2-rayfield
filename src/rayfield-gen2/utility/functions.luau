-- Rayfield/utility/functions  (bundle module #49)
-- deobfuscated from Rayfield Gen2 v1.2.0

local ae, textMetrics, colors, flagNames =
    {}, require(script.Parent.textMetrics), require(script.Parent.colors), require(script.Parent.flagNames)
ae.textWidth = textMetrics.textWidth
ae.textHeight = textMetrics.textHeight
ae.deriveFlagFromName = flagNames.deriveFlagFromName
ae.contrastColor = colors.contrastColor
ae.toColorSequence = colors.toColorSequence
ae.contrastText = colors.contrastText
return ae
