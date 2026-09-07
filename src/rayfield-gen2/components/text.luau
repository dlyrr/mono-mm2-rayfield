-- Rayfield/components/text  (bundle module #27)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Text = {}
Text.__index = Text
Text.__type = "Text"
local moveable, locale, ah, ai, aj =
    require(script.Parent.Parent.utility.moveable), require(script.Parent.Parent.utility.locale), 16, 14, 0.45

function Text.new(ak, al)
    al = if typeof(al) == "table" then al else {}
    local am = setmetatable({
        tab = assert(ak, "Missing argument #1 (Tab expected)"),
        window = ak.window,
        name = tostring(al.name or al.Name or ""),
        text = tostring(al.text or al.Text or ""),
        icon = al.icon or al.Icon,
    }, Text)
    am.main = am.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        Name = if am.name ~= "" then am.name else "Text",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = am.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })
    am.stroke = am.window:StyleElementBody(am.main)
    am.window:Create("UIPadding", {
        PaddingTop = UDim.new(0, 14),
        PaddingBottom = UDim.new(0, 14),
        PaddingLeft = UDim.new(0, 20),
        PaddingRight = UDim.new(0, 20),
        Parent = am.main,
    })
    am.window:Create(
        "UIListLayout",
        { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, Parent = am.main }
    )
    am.titleRow = am.window:Create("Frame", {
        Name = "Title",
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Parent = am.main,
    })
    am.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Parent = am.titleRow,
    })
    if am.icon then
        am.iconLabel = am.window:Create("ImageLabel", {
            Image = am.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ImageTransparency = 1,
            Parent = am.titleRow,
        }, { ImageColor3 = "ContentColor" })
    end
    am.title = am.window:Create("TextLabel", {
        Text = locale.t(am.name),
        Size = UDim2.new(1, if am.icon then -22 else 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        RichText = true,
        TextSize = ah,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        TextTransparency = 1,
        Parent = am.titleRow,
    }, { TextColor3 = "TitlingColor", FontFace = "Font" })
    am.body = am.window:Create("TextLabel", {
        Text = locale.t(am.text),
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        RichText = true,
        TextSize = ai,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 2,
        TextTransparency = 1,
        Parent = am.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    am:_applyPresence()
    return am
end

function Text._applyPresence(self)
    self.titleRow.Visible = self.name ~= "" or self.icon ~= nil
    self.body.Visible = self.text ~= ""
end

function Text.Set(self, al)
    self.text = tostring(al)
    self.window:_bindLocale(self.body, "Text", self.text)
    self:_applyPresence()
end

function Text.SetTitle(self, al)
    self.name = tostring(al)
    self.window:_bindLocale(self.title, "Text", self.name)
    self:_applyPresence()
end

function Text._setShown(self, al, am)
    if al then
        self.window:_revealCommon(self, am)
    else
        self.window:_hideCommon(self, am)
    end
    self.window:_reveal(self.body, { TextTransparency = if al then aj else 1 }, am)
end
moveable(Text)
return Text
