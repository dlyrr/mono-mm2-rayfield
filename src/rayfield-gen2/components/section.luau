-- Rayfield/components/section  (bundle module #19)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Section = {}
Section.__index = Section
Section.__type = "Section"
local moveable, locale =
    require(script.Parent.Parent.utility.moveable), require(script.Parent.Parent.utility.locale)

function Section.new(ah, ai)
    ai = if typeof(ai) == "table" then ai else {}
    local aj = setmetatable({
        tab = assert(ah, "Missing argument #1 (Tab expected)"),
        window = ah.window,
        name = ai.name or ai.Name or "Section",
        icon = ai.icon or ai.Icon,
    }, Section)
    local ak = if #aj.tab.elements == 0 then 0 else 13
    aj.main = aj.window:Create("Frame", {
        Size = UDim2.new(1, -40, 0, 20 + ak),
        BorderSizePixel = 0,
        Name = aj.name,
        BackgroundTransparency = 1,
        Parent = aj.tab.tabPage,
    })
    if ak > 0 then
        aj.window:Create("UIPadding", { PaddingTop = UDim.new(0, ak), Parent = aj.main })
    end
    aj.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Parent = aj.main,
    })
    if aj.icon then
        aj.iconLabel = aj.window:Create("ImageLabel", {
            Image = aj.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ImageTransparency = 1,
            Parent = aj.main,
        }, { ImageColor3 = "ContentColor" })
    end
    aj.title = aj.window:Create("TextLabel", {
        Text = locale.t(aj.name),
        Size = UDim2.fromOffset(0, 16),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 15,
        AutomaticSize = Enum.AutomaticSize.X,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        LayoutOrder = 1,
        TextTransparency = 1,
        Parent = aj.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    return aj
end

function Section._setShown(self, ai, aj)
    local ak = self.window
    ak:_reveal(self.title, { TextTransparency = if ai then 0.6 else 1 }, aj)
    if self.iconLabel then
        ak:_reveal(self.iconLabel, { ImageTransparency = if ai then 0.65 else 1 }, aj)
    end
end
moveable(Section)
return Section
