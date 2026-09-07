-- Rayfield/components/button  (bundle module #4)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Button = {}
Button.__index = Button
Button.__type = "Button"
local utility = script.Parent.Parent.utility
local variables, functions, moveable, lockable, locale, HapticEngine =
    require(utility.variables),
    require(utility.functions),
    require(utility.moveable),
    require(utility.lockable),
    require(utility.locale),
    require(utility.HapticEngine)

function Button.new(n, o)
    o = if typeof(o) == "table" then o else {}
    local p = setmetatable({
        tab = assert(n, "Missing argument #1 (Tab expected)"),
        window = n.window,
        name = o.name or o.Name or "Button",
        icon = o.icon or o.Icon,
        description = o.description or o.Description,
        compact = n.compact or false,
        callback = o.callback or o.Callback or function() end,
    }, Button)
    if p.compact then
        p:_buildCompact()
    else
        p:_buildFull()
    end
    if p.description and not p.compact then
        p.descriptor = require(script.Parent.descriptor).new(p.tab, { description = p.description })
    end
    return p
end

function Button._runCallback(self)
    self.window:_runGuarded(self, self.callback)
end

function Button._buildFull(self)
    self.main = self.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 43),
        BorderSizePixel = 0,
        Name = self.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = self.tab.tabPage,
    }, {
        BackgroundTransparency = "ElementTransparency",
    })
    self.stroke = self.window:StyleElementBody(self.main)
    self.hoverOverlay = self.window:CreateHoverOverlay(self.main)
    self.container = self.window:Create("Frame", {
        BorderSizePixel = 0,
        Parent = self.main,
        Size = UDim2.new(0, 170, 0, 16),
        Position = UDim2.new(0, 20, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
    })
    self.containerLayout = self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Parent = self.container,
    })
    if self.icon then
        self.iconLabel = self.window:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ImageTransparency = 1,
            Parent = self.container,
        }, { ImageColor3 = "ContentColor" })
    end
    self.title = self.window:Create("TextLabel", {
        Text = locale.t(self.name),
        Size = UDim2.fromOffset(250, 16),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 16,
        AutomaticSize = Enum.AutomaticSize.X,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        LayoutOrder = 1,
        TextTransparency = 1,
        Parent = self.container,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    self.interact = self.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        TextTransparency = 1,
        Parent = self.main,
    })
    self.window:_wireElementHover(self)
    self.window:ConnectFor(self, self.interact.MouseButton1Click, function()
        HapticEngine.click()
        variables.tweenService
            :Create(
                self.stroke,
                TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { Transparency = 1 }
            )
            :Play()
        variables.tweenService
            :Create(
                self.main,
                TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                { Size = UDim2.new(1, -26, 0, 43) }
            )
            :Play()
        self:_runCallback()
        task.wait(0.11)
        variables.tweenService
            :Create(
                self.main,
                TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                { Size = UDim2.new(1, -20, 0, 43) }
            )
            :Play()
        variables.tweenService
            :Create(
                self.stroke,
                TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { Transparency = self.window.theme.ElementStrokeTransparency }
            )
            :Play()
    end)
end

function Button._buildCompact(self)
    local o = self.window
    self.main, self.stroke, self.interact = o:_buildCompactRow(self.tab, self.name)
    self.hoverOverlay = self.interact
    o:Create(
        "UIPadding",
        { PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 16), Parent = self.interact }
    )
    o:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 6),
        Parent = self.interact,
    })
    if self.icon then
        self.iconLabel = o:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            ImageTransparency = 1,
            Parent = self.interact,
        }, { ImageColor3 = "ContentColor" })
    end
    self.title = o:Create("TextLabel", {
        Text = locale.t(self.name),
        Size = UDim2.fromOffset(0, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        LayoutOrder = 1,
        TextTransparency = 1,
        Parent = self.interact,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    o:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.title })
    self.window:_wireElementHover(self)
    self.window:ConnectFor(self, self.interact.MouseButton1Click, function()
        HapticEngine.click()
        variables.tweenService
            :Create(
                self.stroke,
                TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { Transparency = 1 }
            )
            :Play()
        self:_runCallback()
        task.wait(0.11)
        variables.tweenService
            :Create(
                self.stroke,
                TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { Transparency = self.window.theme.ElementStrokeTransparency }
            )
            :Play()
    end)
end

function Button._setShown(self, o, p)
    if o then
        self.window:_revealCommon(self, p)
    else
        self.window:_hideCommon(self, p)
    end
end

function Button._minWidth(self)
    local o = 32
    if self.icon then
        o += 22
    end
    o += functions.textWidth(self.window.theme.Font, 16, locale.resolve(self.name))
    return o
end
moveable(Button)
lockable(Button)
return Button
