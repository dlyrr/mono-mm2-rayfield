-- Rayfield/themes/cobalt  (bundle module #33)
-- deobfuscated from Rayfield Gen2 v1.2.0

return {
    WindowColor = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 16, 34)),
        ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(20, 26, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 36, 66)),
    }),
    ShadowColor = Color3.fromRGB(6, 8, 20),
    ElementStroke = Color3.fromRGB(44, 52, 82),
    ElementGradient = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 32, 58)),
        ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(30, 38, 66)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 38, 66)),
    }),
    ElementStrokeGradient = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 66, 104)),
        ColorSequenceKeypoint.new(0.9999, Color3.fromRGB(70, 82, 124)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(56, 66, 104)),
    }),
    ElementStrokeHover = Color3.fromRGB(64, 76, 116),
    TabBackground = ColorSequence.new(Color3.fromRGB(48, 58, 92), Color3.fromRGB(30, 38, 64)),
    TabStroke = ColorSequence.new(Color3.fromRGB(78, 92, 140), Color3.fromRGB(48, 58, 92)),
    SliderBackground = Color3.fromRGB(40, 48, 78),
    SliderBackgroundHover = Color3.fromRGB(54, 64, 100),
    SliderProgress = ColorSequence.new(Color3.fromRGB(64, 132, 248), Color3.fromRGB(42, 104, 224)),
    AccentColor = Color3.fromRGB(48, 120, 240),
    AccentStroke = Color3.fromRGB(96, 164, 255),
    ToggleKnobOff = Color3.fromRGB(196, 206, 232),
    StatBackground = Color3.fromRGB(20, 26, 48),
    DropdownHighlight = Color3.fromRGB(48, 120, 240),
    NeutralButton = Color3.fromRGB(40, 48, 78),
    NeutralButtonHover = Color3.fromRGB(54, 64, 100),
    NeutralButtonStroke = Color3.fromRGB(120, 138, 195),
}
