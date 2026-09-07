-- Rayfield/components/tabSelector  (bundle module #25)
-- deobfuscated from Rayfield Gen2 v1.2.0

local utility = script.Parent.Parent.utility
local variables, functions, locale, ai =
    require(utility.variables), require(utility.functions), require(utility.locale), {}

local function aj(ak: string?): string
    if type(ak) ~= "string" or ak == "" then
        return "?"
    end
    local al = utf8.offset(ak, 2)
    local am = if al then string.sub(ak, 1, al - 1) else ak
    return string.upper(am)
end
ai.states = {
    top = {
        selected = { background = 0, stroke = 0, content = 0 },
        hover = { background = 0.4, stroke = 0.3, content = 0.3 },
        unselected = {
            background = 0.8,
            stroke = 0.65,
            content = 0.5,
        },
        hidden = { background = 1, stroke = 1, content = 1 },
    },
    sidebar = {
        selected = { background = 0.4, stroke = 0.5, content = 0, shadow = 0.8 },
        hover = { background = 0.7, stroke = 0.8, content = 0.3, shadow = 1 },
        unselected = { background = 1, stroke = 1, content = 0.5, shadow = 1 },
        hidden = { background = 1, stroke = 1, content = 1, shadow = 1 },
    },
}

local function ak(al, am, b)
    al.topbarItemGradient = al.window:Create(
        "UIGradient",
        { Rotation = 90, Parent = am },
        { Color = { "TabBackground", functions.toColorSequence } }
    )
    al.topbarItemStrokeGradient = al.window:Create(
        "UIGradient",
        { Rotation = 90, Parent = b },
        { Color = { "TabStroke", functions.toColorSequence } }
    )
end

local function al(am, b, c)
    if c and not am.icon then
        am.topbarItemInitial = am.window:Create("TextLabel", {
            Text = aj(am.name),
            Size = UDim2.fromOffset(b, b),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextSize = b - 4,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            Visible = false,
            TextTransparency = 1,
            Parent = am.topbarItemContainer,
        }, { TextColor3 = "TabColor", FontFace = "Font" })
    end
    if am.icon then
        am.topbarItemIcon = am.window:Create("ImageLabel", {
            Image = am.icon,
            Size = UDim2.fromOffset(b, b),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ImageTransparency = 1,
            Parent = am.topbarItemContainer,
        }, { ImageColor3 = "TabColor" })
    end
    if am.name then
        am.topbarItemTitle = am.window:Create("TextLabel", {
            Text = locale.t(am.name),
            Size = UDim2.fromOffset(0, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextSize = 16,
            AutomaticSize = Enum.AutomaticSize.XY,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            LayoutOrder = 1,
            TextTransparency = 1,
            Parent = am.topbarItemContainer,
        }, { TextColor3 = "TabColor", FontFace = "Font" })
    end
end

local function am(b)
    b.topbarItem = b.window:Create("Frame", {
        Name = b.name,
        Size = UDim2.fromOffset(0, 34),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Visible = false,
        LayoutOrder = b.customOrder or 0,
        Parent = b.window.tabList,
    })
    b.topbarItemInteract = b.window:Create("TextButton", {
        Active = false,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
        Text = "",
        TextTransparency = 1,
        Parent = b.topbarItem,
    })
    b.window:Create("UICorner", { Parent = b.topbarItem }, { CornerRadius = "PillCornerRadius" })
    b.topbarItemStroke = b.window:Create("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 1,
        Parent = b.topbarItem,
    })
    ak(b, b.topbarItem, b.topbarItemStroke)
    b.topbarItemContainer = b.window:Create("Frame", {
        Size = UDim2.fromOffset(0, 34),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = b.topbarItem,
    })
    b.window:Create(
        "UIPadding",
        { PaddingLeft = UDim.new(0, 13), PaddingRight = UDim.new(0, 14), Parent = b.topbarItemContainer }
    )
    b.topbarItemLayout = b.window:Create("UIListLayout", {
        Padding = UDim.new(0, 6),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = b.topbarItemContainer,
    })
    al(b, 16, false)
end

local function b(c, d)
    c.topbarItem = c.window:Create("Frame", {
        Name = c.name,
        Size = UDim2.new(1, -d.rowInset * 2, 0, d.rowHeight),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Visible = false,
        LayoutOrder = c.customOrder or 0,
        Parent = c.window.tabList,
    })
    c.topbarItemInteract = c.window:Create("TextButton", {
        Active = false,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
        Text = "",
        TextTransparency = 1,
        Parent = c.topbarItem,
    })
    c.window:Create("UICorner", { CornerRadius = UDim.new(0, d.rowCornerRadius), Parent = c.topbarItem })
    c.topbarItemStroke = c.window:Create("UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(255, 255, 255),
        Transparency = 1,
        Parent = c.topbarItem,
    })
    ak(c, c.topbarItem, c.topbarItemStroke)
    c.topbarItemShadow = c.window:Create("UIShadow", {
        BlurRadius = UDim.new(0, 20),
        Color = Color3.fromRGB(255, 255, 255),
        Offset = UDim2.new(0, 0, 0, -15),
        Spread = UDim2.new(0, 10, 0, -30),
        ZIndex = -1,
        Transparency = 1,
        Parent = c.topbarItem,
    })
    c.topbarItemContainer = c.window:Create("Frame", {
        Size = UDim2.new(1, -d.rowPadding, 0, 24),
        Position = UDim2.new(0, d.rowPadding, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = c.topbarItem,
    })
    c.topbarItemLayout = c.window:Create("UIListLayout", {
        Padding = UDim.new(0, d.rowContentSpacing),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = c.topbarItemContainer,
    })
    al(c, d.rowIconSize, true)
end

function ai.build(c, d)
    if d.mode == "sidebar" then
        b(c, d)
    else
        am(c)
    end
end

function ai.setRowCollapsed(self, d, e)
    if e.mode ~= "sidebar" or not self.topbarItem then
        return
    end
    if self.topbarItemTitle then
        self.topbarItemTitle.Visible = not d
    end
    if self.topbarItemInitial then
        self.topbarItemInitial.Visible = d
    end
    local f = if d then 0 else e.rowPadding
    self.topbarItemContainer.Size = UDim2.new(1, -f, 0, 24)
    self.topbarItemContainer.Position = UDim2.new(0, f, 0.5, 0)
    self.topbarItemLayout.HorizontalAlignment = if d
        then Enum.HorizontalAlignment.Center
        else Enum.HorizontalAlignment.Left
end

function ai.applyVisual(self, d, e)
    local f = {
        [self.topbarItem] = { BackgroundTransparency = d.background },
        [self.topbarItemStroke] = {
            Transparency = d.stroke,
        },
    }
    if self.topbarItemIcon then
        f[self.topbarItemIcon] = { ImageTransparency = d.content }
    end
    if self.topbarItemTitle then
        f[self.topbarItemTitle] = { TextTransparency = d.content }
    end
    if self.topbarItemInitial then
        f[self.topbarItemInitial] = { TextTransparency = d.content }
    end
    if self.topbarItemShadow and d.shadow then
        f[self.topbarItemShadow] = {
            Transparency = d.shadow,
        }
    end
    for g, h in f do
        if e then
            variables.tweenService:Create(g, e, h):Play()
        else
            for i, j in h do
                g[i] = j
            end
        end
    end
end
return ai
