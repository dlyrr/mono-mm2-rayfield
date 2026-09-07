-- Rayfield/components/descriptor  (bundle module #8)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Descriptor = {}
Descriptor.__index = Descriptor
Descriptor.__type = "Descriptor"
local locale = require(script.Parent.Parent.utility.locale)

function Descriptor.new(h, i)
    i = if typeof(i) == "table" then i else {}
    local j = setmetatable({
        tab = assert(h, "Missing argument #1 (Tab expected)"),
        window = h.window,
        description = i.description or i.Description or "",
    }, Descriptor)
    j.main = j.window:Create("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Size = UDim2.new(1, -30, 0, 0),
        Parent = j.tab.tabPage,
    })
    j.window:Create("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder, Parent = j.main })
    j.titleLabel = j.window:Create("TextLabel", {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        RichText = true,
        Size = UDim2.new(1, -90, 0, 0),
        Text = locale.t(j.description),
        TextSize = 12,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTransparency = 1,
        Parent = j.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    j.window:Create("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        Size = UDim2.fromOffset(0, 15),
        Parent = j.main,
    })
    return j
end
return Descriptor
