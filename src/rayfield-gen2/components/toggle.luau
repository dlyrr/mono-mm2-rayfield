-- Rayfield/components/toggle  (bundle module #29)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Toggle = {}
Toggle.__index = Toggle
Toggle.__type = "Toggle"
local utility = script.Parent.Parent.utility
local variables, functions, moveable, lockable, locale, HapticEngine =
    require(utility.variables),
    require(utility.functions),
    require(utility.moveable),
    require(utility.lockable),
    require(utility.locale),
    require(utility.HapticEngine)

function Toggle.new(am, b)
    b = if typeof(b) == "table" then b else {}
    local c = setmetatable({
        tab = assert(am, "Missing argument #1 (Tab expected)"),
        window = am.window,
        name = b.name or b.Name or "Switch",
        icon = b.icon or b.Icon,
        description = b.description or b.Description,
        forgetState = b.forgetState or b.ForgetState or am.forgetState,
        compact = am.compact or false,
        flag = b.flag
            or b.Flag
            or (
                not (b.forgetState or b.ForgetState or am.forgetState)
                    and functions.deriveFlagFromName(b.name or b.Name or "Switch")
                or nil
            ),
        callback = b.callback or b.Callback or function() end,
        value = if (b.value or b.Value) ~= nil then (b.value or b.Value) else false,
    }, Toggle)
    c.window:_registerControl(c)
    if c.compact then
        c:_buildCompact()
    else
        c:_buildFull()
    end
    if c.description and not c.compact then
        c.descriptor = require(script.Parent.descriptor).new(c.tab, { description = c.description })
    end
    return c
end

function Toggle._buildSwitch(self, b)
    local c = self.window
    self.functionContainer = c:Create(
        "Frame",
        { BorderSizePixel = 0, Size = UDim2.fromOffset(50, 21), BackgroundTransparency = 1, Parent = b },
        { BackgroundColor3 = "ToggleTrack" }
    )
    c:Create("UICorner", { CornerRadius = UDim.new(0, 15), Parent = self.functionContainer })
    self.containerStroke = c:Create(
        "UIStroke",
        { Transparency = 1, Parent = self.functionContainer },
        { Color = "SurfaceStroke" }
    )
    self.indicator = c:Create("Frame", {
        BorderSizePixel = 0,
        Size = UDim2.fromOffset(25, 17),
        Position = self.value and UDim2.new(1, -28, 0.5, 0) or UDim2.new(1, -47, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = self.value and self.window.theme.AccentColor or self.window.theme.ToggleKnobOff,
        BackgroundTransparency = 1,
        Parent = self.functionContainer,
    })
    c:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.indicator })
    self.indicatorStroke = c:Create("UIStroke", {
        Color = self.value and self.window.theme.AccentStroke or Color3.fromRGB(255, 255, 255),
        Transparency = 1,
        Parent = self.indicator,
    })
    self.indicatorGlow = c:CreateGlow(self.indicator, "AccentColor", 20, 1)
    self.overlay = c:Create("Frame", {
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0, 0),
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = self.functionContainer,
    }, {
        Visible = "DarkToggleOverlay",
    })
    c:Create("UICorner", { CornerRadius = UDim.new(0, 15), Parent = self.overlay })
    self.overlayGradient = c:Create("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30)),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(1, 0.35),
        }),
        Parent = self.overlay,
    })
    return self.functionContainer
end

function Toggle._performToggle(self)
    HapticEngine.click()
    self.value = not self.value
    self:_animateIndicator()
    self.window:_runGuarded(self, self.callback, self.value)
    self.window:_persist(self)
end

function Toggle._buildFull(self)
    local b = self.window
    self.main = b:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 41),
        BorderSizePixel = 0,
        Name = self.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = self.tab.tabPage,
    }, {
        BackgroundTransparency = "ElementTransparency",
    })
    self.stroke = b:StyleElementBody(self.main)
    self.hoverOverlay = b:CreateHoverOverlay(self.main)
    self.container = b:Create("Frame", {
        BorderSizePixel = 0,
        Parent = self.main,
        Size = UDim2.new(0, 170, 0, 16),
        Position = UDim2.new(0, 20, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
    })
    self.containerLayout = b:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Parent = self.container,
    })
    if self.icon then
        self.iconLabel = b:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ImageTransparency = 1,
            Parent = self.container,
        }, { ImageColor3 = "ContentColor" })
    end
    self.title = b:Create("TextLabel", {
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
    }, {
        TextColor3 = "ContentColor",
        FontFace = "Font",
    })
    self.interact = b:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(1, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
        TextTransparency = 1,
        ZIndex = 10,
        Parent = self.main,
    })
    self:_buildSwitch(self.main)
    self.functionContainer.Position = UDim2.new(1, -15, 0, 20)
    self.functionContainer.AnchorPoint = Vector2.new(1, 0.5)
    self.window:_wireElementHover(self)
    self.window:ConnectFor(self, self.interact.MouseButton1Click, function()
        variables.tweenService
            :Create(self.stroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Transparency = 1,
            })
            :Play()
        variables.tweenService
            :Create(
                self.main,
                TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                { Size = UDim2.new(1, -26, 0, 41) }
            )
            :Play()
        self:_performToggle()
        task.wait(0.11)
        variables.tweenService
            :Create(
                self.main,
                TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                { Size = UDim2.new(1, -20, 0, 41) }
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

function Toggle._buildCompact(self)
    local b = self.window
    self.main, self.stroke, self.interact = b:_buildCompactRow(self.tab, self.name, 10)
    self.hoverOverlay = self.interact
    b:Create(
        "UIPadding",
        { PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15), Parent = self.interact }
    )
    b:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
        Padding = UDim.new(0, 10),
        Parent = self.interact,
    })
    self.container = b:Create("Frame", {
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, 16),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 0,
        Parent = self.interact,
    })
    b:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.container })
    b:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Parent = self.container,
    })
    if self.icon then
        self.iconLabel = b:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            ImageTransparency = 1,
            Parent = self.container,
        }, { ImageColor3 = "ContentColor" })
    end
    self.title = b:Create("TextLabel", {
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
        Parent = self.container,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    b:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.title })
    self:_buildSwitch(self.interact)
    self.functionContainer.LayoutOrder = 1
    self.window:_wireElementHover(self)
    self.window:ConnectFor(self, self.interact.MouseButton1Click, function()
        variables.tweenService
            :Create(self.stroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Transparency = 1,
            })
            :Play()
        self:_performToggle()
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

function Toggle._animateIndicator(self)
    local b = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
    if self.indicatorGlow then
        variables.tweenService
            :Create(
                self.indicatorGlow,
                b,
                { Transparency = self.value and self.window.theme.AccentGlow or 1 }
            )
            :Play()
    end
    if self.value then
        variables.tweenService
            :Create(self.indicator, b, {
                Position = UDim2.new(1, -28, 0.5, 0),
                BackgroundColor3 = self.window.theme.AccentColor,
                BackgroundTransparency = 0,
            })
            :Play()
        variables.tweenService
            :Create(self.indicatorStroke, b, { Color = self.window.theme.AccentStroke, Transparency = 0 })
            :Play()
    else
        variables.tweenService
            :Create(self.indicator, b, {
                Position = UDim2.new(1, -47, 0.5, 0),
                BackgroundColor3 = self.window.theme.ToggleKnobOff,
                BackgroundTransparency = self.window.theme.ToggleKnobOffTransparency,
            })
            :Play()
        variables.tweenService
            :Create(self.indicatorStroke, b, { Color = Color3.fromRGB(255, 255, 255), Transparency = 0.7 })
            :Play()
    end
end
local am, b =
    TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0.35)

function Toggle._setShown(self, d, e)
    local f = self.window
    if d then
        f:_revealCommon(self, e)
        f:_reveal(self.indicator, {
            BackgroundColor3 = self.value and f.theme.AccentColor or f.theme.ToggleKnobOff,
            BackgroundTransparency = self.value and 0 or f.theme.ToggleKnobOffTransparency,
        }, e, am)
        f:_reveal(self.indicatorStroke, {
            Color = self.value and f.theme.AccentStroke or Color3.fromRGB(255, 255, 255),
            Transparency = self.value and 0 or 0.7,
        }, e, am)
        f:_reveal(self.indicatorGlow, { Transparency = self.value and f.theme.AccentGlow or 1 }, e, b)
        f:_reveal(self.overlay, { BackgroundTransparency = 0 }, e, am)
        f:_reveal(self.containerStroke, { Transparency = 0.85 }, e, am)
        f:_reveal(self.functionContainer, { BackgroundTransparency = f.theme.ToggleTrackTransparency }, e, am)
    else
        f:_hideCommon(self, e)
        f:_reveal(self.indicator, { BackgroundTransparency = 1 }, e, am)
        f:_reveal(self.indicatorStroke, { Transparency = 1 }, e, am)
        f:_reveal(self.indicatorGlow, { Transparency = 1 }, e, b)
        f:_reveal(self.overlay, {
            BackgroundTransparency = 1,
        }, e, am)
        f:_reveal(self.containerStroke, { Transparency = 1 }, e, am)
        f:_reveal(self.functionContainer, {
            BackgroundTransparency = 1,
        }, e, am)
    end
end

function Toggle._refreshTheme(self)
    local d, e, f =
        self.window.theme,
        TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        variables.tweenService
    f:Create(self.functionContainer, e, { BackgroundTransparency = d.ToggleTrackTransparency }):Play()
    f:Create(self.indicator, e, {
        BackgroundColor3 = self.value and d.AccentColor or d.ToggleKnobOff,
        BackgroundTransparency = self.value and 0 or d.ToggleKnobOffTransparency,
    }):Play()
    f:Create(
        self.indicatorStroke,
        e,
        { Color = self.value and d.AccentStroke or Color3.fromRGB(255, 255, 255) }
    ):Play()
    if self.indicatorGlow then
        f:Create(self.indicatorGlow, e, {
            Transparency = self.value and d.AccentGlow or 1,
        }):Play()
    end
end

function Toggle._minWidth(self)
    local d = 90
    if self.icon then
        d += 21
    end
    d += functions.textWidth(self.window.theme.Font, 16, locale.resolve(self.name))
    return d
end
moveable(Toggle)
lockable(Toggle)

function Toggle.Set(self, d, e)
    local f = self.value ~= d
    self.value = d
    if f then
        self:_animateIndicator()
    end
    if not e then
        self.window:_runGuarded(self, self.callback, self.value)
        self.window:_persist(self)
    end
end
return Toggle
