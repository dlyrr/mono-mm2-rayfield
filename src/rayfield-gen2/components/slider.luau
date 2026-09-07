-- Rayfield/components/slider  (bundle module #21)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Slider = {}
Slider.__index = Slider
Slider.__type = "Slider"
local utility = script.Parent.Parent.utility
local variables, functions, odometer, moveable, lockable, locale, HapticEngine =
    require(utility.variables),
    require(utility.functions),
    require(utility.odometer),
    require(utility.moveable),
    require(utility.lockable),
    require(utility.locale),
    require(utility.HapticEngine)

local function b(c)
    local d = 0
    while d < 6 do
        local e = c * 10 ^ d
        if math.abs(e - math.round(e)) < 1e-9 then
            break
        end
        d += 1
    end
    return d
end

local function c(d, e, f)
    local g = d[1] + math.round((f - d[1]) / e) * e
    return math.clamp(g, d[1], d[2])
end
local d, e, f, g, h, i =
    TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    300,
    Vector2.new(35, 20),
    Vector2.new(41, 22)

local function j(k: number): UDim2
    return UDim2.new(k, 0, 1, 0)
end

local function k(): UDim2
    return UDim2.new(1, 0, 0.5, 0)
end

local function l(m: number, n: number, o: number): number
    return math.clamp((m - n) / o, 0, 1)
end

function Slider.new(m, n)
    n = if typeof(n) == "table" then n else {}
    local o = setmetatable({
        tab = assert(m, "Missing argument #1 (Tab expected)"),
        window = m.window,
        name = n.name or n.Name or "Slider",
        icon = n.icon or n.Icon,
        description = n.description or n.Description,
        forgetState = n.forgetState or n.ForgetState or m.forgetState,
        range = n.range or n.Range or {
            0,
            100,
        },
        increment = n.increment or n.Increment or 1,
        suffix = n.suffix or n.Suffix or "",
        callback = n.callback or n.Callback or function() end,
        dragging = false,
        minimal = n.minimal or n.Minimal or false,
        _handleWidth = h.X,
    }, Slider)
    assert(
        typeof(o.range) == "table" and typeof(o.range[1]) == "number" and typeof(o.range[2]) == "number",
        "A slider range needs two numbers, like { 0, 100 }."
    )
    if o.range[1] > o.range[2] then
        o.range = { o.range[2], o.range[1] }
    end
    if o.increment <= 0 then
        o.increment = 1
    end
    o.value = if (n.value or n.Value) ~= nil
        then (n.value or n.Value)
        elseif (n.currentValue or n.CurrentValue) ~= nil then (n.currentValue or n.CurrentValue)
        else o.range[1]
    o.value = c(o.range, o.increment, o.value)
    o._decimals = b(o.increment)
    o.flag = n.flag or n.Flag or (not o.forgetState and functions.deriveFlagFromName(o.name) or nil)
    o.window:_registerControl(o)
    o.main = o.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 65),
        BorderSizePixel = 0,
        Name = o.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = o.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })
    o.stroke = o.window:StyleElementBody(o.main)
    o._lastValue = o.value
    if not o.minimal then
        o:_buildLabel()
    end
    o.track = o.window:Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -15, 0.5, 0),
        Size = UDim2.fromOffset(222, 14),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Parent = o.main,
    }, { BackgroundColor3 = "SliderBackground" })
    o.window:Create("UICorner", { CornerRadius = UDim.new(0, 13), Parent = o.track })
    o.progress = o.window:Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(0, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundTransparency = 1,
        Parent = o.track,
    })
    o.window:Create("UICorner", { CornerRadius = UDim.new(0, 13), Parent = o.progress })
    o.window:Create("UIGradient", {
        Offset = Vector2.new(0, 0.5),
        Rotation = 2,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.85),
            NumberSequenceKeypoint.new(1, 0),
        }),
        Parent = o.progress,
    }, { Color = {
        "SliderProgress",
        functions.toColorSequence,
    } })
    o.progressGlow = o.window:CreateGlow(o.progress, "AccentColor", 20, 1)
    o.handle = o.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = k(),
        Size = UDim2.fromOffset(h.X, h.Y),
        BorderSizePixel = 0,
        ZIndex = 50,
        BackgroundTransparency = 1,
        Parent = o.progress,
    }, { BackgroundColor3 = "SliderHandle" })
    o.window:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = o.handle,
    })
    o.handleGlow = o.window:CreateGlow(o.handle, Color3.fromRGB(255, 255, 255), 10, 1)
    o.handleStroke = o.window:Create(
        "UIStroke",
        { Transparency = 1, Parent = o.handle },
        { Color = "SliderStroke" }
    )
    o.interact = o.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextTransparency = 1,
        ZIndex = 10,
        Parent = o.track,
    })
    o.window:ConnectFor(o, o.main.MouseEnter, function()
        if not o.window:_interactive() then
            return
        end
        variables.tweenService
            :Create(o.track, d, { BackgroundColor3 = o.window.theme.SliderBackgroundHover })
            :Play()
    end)
    o.window:ConnectFor(o, o.main.MouseLeave, function()
        variables.tweenService
            :Create(o.track, d, { BackgroundColor3 = o.window.theme.SliderBackground })
            :Play()
    end)
    o.window:ConnectFor(o, o.interact.InputBegan, function(p)
        if
            p.UserInputType == Enum.UserInputType.MouseButton1
            or p.UserInputType == Enum.UserInputType.Touch
        then
            HapticEngine.click()
            o.dragging = true
            o:_setHeld(true)
            o:_updateFromMouse()
            if o._dragConnection then
                o._dragConnection:Disconnect()
                o._dragConnection = nil
            end
            o._dragConnection = variables.runService.RenderStepped:Connect(function()
                if o.window.unloaded or not o.dragging then
                    if o._dragConnection then
                        o._dragConnection:Disconnect()
                        o._dragConnection = nil
                    end
                    return
                end
                o:_updateFromMouse()
            end)
        end
    end)
    o.window:ConnectFor(o, variables.userInputService.InputEnded, function(p)
        if
            p.UserInputType == Enum.UserInputType.MouseButton1
            or p.UserInputType == Enum.UserInputType.Touch
        then
            o:_endDrag()
        end
    end)
    o.window:ConnectFor(o, variables.userInputService.WindowFocusReleased, function()
        o:_endDrag()
    end)
    if o.description and not o.minimal then
        o.descriptor = require(script.Parent.descriptor).new(o.tab, { description = o.description })
    end
    o.window:ConnectFor(o, o.main:GetPropertyChangedSignal("AbsoluteSize"), function()
        if o.window.animating or (o.window.hidden and o.window.hasShownOnce) then
            return
        end
        o:_applyLayout()
    end)
    o:_applyLayout()
    if o.minimal then
        o.main.Size = UDim2.new(1, -20, 0, 41)
        o.track.AnchorPoint = Vector2.new(0.5, 0.5)
        o.track.Position = UDim2.new(0.5, 0, 0.5, 0)
        o.track.Size = UDim2.new(1, -30, 0, 14)
    end
    o:_renderProgress()
    return o
end

function Slider._buildLabel(self)
    self.container = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 20, 0.5, 0),
        Size = UDim2.fromOffset(170, 33),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = self.main,
    })
    self.containerLayout = self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 2),
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.container,
    })
    self.titleContainer = self.window:Create(
        "Frame",
        {
            Size = UDim2.new(1, 0, 0, 16),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 5,
            Parent = self.container,
        }
    )
    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.titleContainer,
    })
    self.titleFlex =
        self.window:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.None, Parent = self.titleContainer })
    if self.icon then
        self.iconLabel = self.window:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ZIndex = 5,
            ImageTransparency = 1,
            Parent = self.titleContainer,
        }, { ImageColor3 = "ContentColor" })
    end
    self.title = self.window:Create("TextLabel", {
        Text = locale.t(self.name),
        Size = UDim2.new(1, 0, 0, 16),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        RichText = true,
        LayoutOrder = 1,
        ZIndex = 5,
        TextTransparency = 1,
        Parent = self.titleContainer,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    self.window:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.title })
    self.valueHost = self.window:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 6,
        LayoutOrder = 1,
        Parent = self.container,
    })
    self.valueOdo = odometer.new(
        self.window,
        self.valueHost,
        { textSize = 15, alignment = Enum.HorizontalAlignment.Left, transparency = 1, duration = 0.28 }
    )
    self.valueOdo:snap(self:_format(self.value))
end

function Slider._setMainHeight(self, n)
    if self._widthManaged then
        self.main.Size = UDim2.new(self.main.Size.X.Scale, self.main.Size.X.Offset, 0, n)
    else
        self.main.Size = UDim2.new(1, -20, 0, n)
    end
end

function Slider._applyLayout(self)
    if self.minimal then
        return
    end
    local n = self.main.AbsoluteSize.X
    local o = if n > 0 and n < g then "narrow" else "wide"
    if self._layoutMode == o then
        return
    end
    self._layoutMode = o
    if o == "narrow" then
        self:_setMainHeight(70)
        self.container.AnchorPoint = Vector2.new(0, 0)
        self.container.Position = UDim2.new(0, 20, 0, 14)
        self.container.Size = UDim2.new(1, -40, 0, 16)
        self.containerLayout.FillDirection = Enum.FillDirection.Horizontal
        self.titleFlex.FlexMode = Enum.UIFlexMode.Fill
        self.valueHost.AutomaticSize = Enum.AutomaticSize.X
        self.valueHost.Size = UDim2.new(0, 0, 0, 16)
        self.track.AnchorPoint = Vector2.new(0.5, 1)
        self.track.Position = UDim2.new(0.5, 0, 1, -14)
        self.track.Size = UDim2.new(1, -30, 0, 14)
    else
        self:_setMainHeight(65)
        self.container.AnchorPoint = Vector2.new(0, 0.5)
        self.container.Position = UDim2.new(0, 20, 0.5, 0)
        self.container.Size = UDim2.new(0, 170, 0, 33)
        self.containerLayout.FillDirection = Enum.FillDirection.Vertical
        self.titleFlex.FlexMode = Enum.UIFlexMode.None
        self.valueHost.AutomaticSize = Enum.AutomaticSize.None
        self.valueHost.Size = UDim2.new(1, 0, 0, 16)
        self.track.AnchorPoint = Vector2.new(1, 0.5)
        self.track.Position = UDim2.new(1, -15, 0.5, 0)
        self.track.Size = UDim2.new(0, 222, 0, 14)
    end
end

function Slider._format(self, n)
    local o = string.format("%." .. self._decimals .. "f", n)
    if self.suffix ~= "" then
        return o .. " " .. self.suffix
    end
    return o
end

function Slider._pillTravel(self)
    return math.max(self.track.AbsoluteSize.X, 0)
end

function Slider._renderProgress(self, n)
    local o = self.range[2] - self.range[1]
    local p = if o ~= 0 then math.clamp((self.value - self.range[1]) / o, 0, 1) else 0
    local q = j(p)
    if n then
        variables.tweenService:Create(self.progress, n, { Size = q }):Play()
    else
        self.progress.Size = q
    end
end

function Slider._updateFromMouse(self)
    local n = self:_pillTravel()
    if n <= 0 then
        return
    end
    local o = l(variables.userInputService:GetMouseLocation().X, self.track.AbsolutePosition.X, n)
    local p = c(self.range, self.increment, self.range[1] + o * (self.range[2] - self.range[1]))
    if p ~= self.value then
        self.value = p
        if self.valueOdo then
            self.valueOdo:snap(self:_format(p))
        end
        self._lastValue = p
        self:_renderProgress(f)
        self:_fireCallback(p)
    end
end

function Slider._endDrag(self)
    if not self.dragging then
        return
    end
    self.dragging = false
    self:_setHeld(false)
    if self._dragConnection then
        self._dragConnection:Disconnect()
        self._dragConnection = nil
    end
    self.window:_persist(self)
end

function Slider._setHeld(self, n)
    if not n then
        self:_fireCallback(self.value)
    end
    local o = if n then i else h
    self._handleWidth = o.X
    variables.tweenService
        :Create(
            self.handle,
            e,
            { Size = UDim2.fromOffset(o.X, o.Y), BackgroundTransparency = if n then 0.7 else 0 }
        )
        :Play()
    variables.tweenService:Create(self.handleStroke, e, { Transparency = if n then 0.6 else 1 }):Play()
    self:_renderProgress(e)
end

function Slider._fireCallback(self, n)
    self.window:_runGuarded(self, self.callback, n, self.dragging == true)
end

function Slider.Set(self, n, o)
    n = c(self.range, self.increment, n)
    self.value = n
    if self.valueOdo then
        self.valueOdo:to(self:_format(n), n >= (self._lastValue or n))
    end
    self._lastValue = n
    self:_renderProgress(d)
    if not o then
        self:_fireCallback(n)
        self.window:_persist(self)
    end
end
local m = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0.35)

function Slider._setShown(self, o, p)
    local q = self.window
    if o then
        q:_revealCommon(self, p)
        q:_reveal(self.track, { BackgroundTransparency = 0 }, p)
        q:_reveal(self.progress, {
            BackgroundTransparency = 0,
        }, p)
        q:_reveal(self.handle, { BackgroundTransparency = 0 }, p)
        if self.valueOdo then
            self.valueOdo:reveal(0.3, p)
        end
        q:_reveal(self.progressGlow, { Transparency = math.max(0.55, q.theme.AccentGlow) }, p, m)
        q:_reveal(self.handleGlow, { Transparency = 0.8 }, p, m)
    else
        q:_hideCommon(self, p)
        q:_reveal(self.track, { BackgroundTransparency = 1 }, p)
        q:_reveal(self.progress, {
            BackgroundTransparency = 1,
        }, p)
        q:_reveal(self.handle, { BackgroundTransparency = 1 }, p)
        if self.valueOdo then
            self.valueOdo:reveal(1, p)
        end
        q:_reveal(self.progressGlow, { Transparency = 1 }, p, m)
        q:_reveal(self.handleGlow, { Transparency = 1 }, p, m)
    end
end

function Slider._refreshTheme(self)
    variables.tweenService
        :Create(
            self.progressGlow,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { Transparency = math.max(0.55, self.window.theme.AccentGlow) }
        )
        :Play()
end

function Slider._minWidth(self)
    if self.minimal then
        return 100
    end
    local o = 40
    if self.icon then
        o += 22
    end
    o += functions.textWidth(self.window.theme.Font, 16, locale.resolve(self.name))
    o += 12
    o += functions.textWidth(self.window.theme.Font, 15, self:_format(self.value))
    return math.max(o, 160)
end
moveable(Slider)
lockable(Slider)
return Slider
