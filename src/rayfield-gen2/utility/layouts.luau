-- Rayfield/utility/layouts  (bundle module #52)
-- deobfuscated from Rayfield Gen2 v1.2.0

local ae, af = {}, 64
local ag, ah, ai = af - 1, 38, 3
export type Mode = "top" | "sidebar"
export type Layout = {
    mode: Mode,
    topbarHeight: number,
    chromeHeight: number,
    pageDirection: Enum.FillDirection,
    fadeSize: UDim2,
    fadeTransparency: NumberSequence,
    fadeCorners: { string }?,
    tabStripTop: number?,
    tabStripHeight: number?,
    railWidth: number?,
    railCollapsedWidth: number?,
    railCollapseBelow: number?,
    rowHeight: number?,
    rowCornerRadius: number?,
    rowSpacing: number?,
    railPadding: number?,
    rowInset: number?,
    rowPadding: number?,
    rowContentSpacing: number?,
    rowIconSize: number?,
    footerHeight: number?,
    avatarSize: number?,
    cardTransparency: number?,
    cardStrokeRotation: number?,
    cardStrokeTransparency: NumberSequence?,
    cardCorners: { string }?,
}
ae.top = {
    mode = "top" :: Mode,
    topbarHeight = af,
    chromeHeight = ag + ah + ai,
    tabStripTop = ag,
    tabStripHeight = ah,
    pageDirection = Enum.FillDirection.Horizontal,
    fadeSize = UDim2.new(1, 0, -9.3E-2, 100),
    fadeTransparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.4414, 0),
        NumberSequenceKeypoint.new(0.7007, 0.631),
        NumberSequenceKeypoint.new(1, 1),
    }),
} :: Layout
ae.sidebar = {
    mode = "sidebar" :: Mode,
    topbarHeight = af,
    chromeHeight = af,
    railWidth = 219,
    railCollapsedWidth = 64,
    railCollapseBelow = 589,
    rowHeight = 38,
    rowCornerRadius = 14,
    rowSpacing = 4,
    railPadding = 17,
    rowInset = 15,
    rowPadding = 10,
    rowContentSpacing = 6,
    rowIconSize = 20,
    footerHeight = 60,
    avatarSize = 34,
    pageDirection = Enum.FillDirection.Vertical,
    cardTransparency = 0.98,
    cardStrokeRotation = 55,
    cardCorners = { "TopLeftRadius", "BottomRightRadius" },
    cardStrokeTransparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.9),
        NumberSequenceKeypoint.new(0.128, 0.95),
        NumberSequenceKeypoint.new(0.414, 0.985),
        NumberSequenceKeypoint.new(1, 1),
    }),
    fadeSize = UDim2.new(1, 0, 0, 55),
    fadeTransparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0),
        NumberSequenceKeypoint.new(0.377, 0),
        NumberSequenceKeypoint.new(1, 1),
    }),
    fadeCorners = { "BottomRightRadius" },
} :: Layout

function ae.get(aj: unknown): Layout?
    if aj == "sidebar" then
        return ae.sidebar
    elseif aj == "top" then
        return ae.top
    end
    return nil
end

function ae.railWidthFor(aj: Layout, ak: number): number
    if aj.mode ~= "sidebar" then
        return 0
    end
    local al = aj.railWidth :: number
    if ak < (aj.railCollapseBelow :: number) then
        return aj.railCollapsedWidth :: number
    end
    return al
end
return ae
