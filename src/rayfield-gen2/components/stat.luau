-- Rayfield/components/stat  (bundle module #22)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Statistic = {}
Statistic.__index = Statistic
Statistic.__type = "Statistic"
local utility = script.Parent.Parent.utility
local variables, functions, odometer, moveable, constants, locale, log =
    require(utility.variables),
    require(utility.functions),
    require(utility.odometer),
    require(utility.moveable),
    require(utility.constants),
    require(utility.locale),
    require(utility.log)
local b, c, d, e =
    constants.statAccents,
    NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.85), NumberSequenceKeypoint.new(1, 0) }),
    41,
    TweenInfo.new(0.6, Enum.EasingStyle.Exponential)

local function f(g)
    return g.fill.Keypoints[1].Value
end

local function g(h)
    if h > 0 then
        return string.format("+%.1f%%", h)
    elseif h < 0 then
        return string.format("%.1f%%", h)
    else
        return "0%"
    end
end

local function h(i)
    if typeof(i) ~= "number" then
        return tostring(i)
    end
    local j = math.round(math.abs(i))
    local k = string.format("%.0f", j)
    local l = k:reverse():gsub("%d%d%d", "%0,"):reverse()
    if l:sub(1, 1) == "," then
        l = l:sub(2)
    end
    return if i < 0 and j ~= 0 then "-" .. l else l
end

local function i(j)
    local k = math.round(j)
    if k > 0 then
        return "+" .. h(k)
    elseif k < 0 then
        return h(k)
    else
        return "0"
    end
end

function Statistic.new(j, k)
    k = if typeof(k) == "table" then k else {}
    local l = setmetatable({
        tab = assert(j, "Missing argument #1 (Tab expected)"),
        window = j.window,
        name = k.name or k.Name or "Statistic",
        icon = k.icon or k.Icon,
        description = k.description or k.Description,
        value = if (k.value or k.Value) ~= nil then (k.value or k.Value) else 0,
        _hasValue = (k.value or k.Value) ~= nil,
        numberEasing = if (k.numberEasing ~= nil)
            then k.numberEasing
            elseif k.NumberEasing ~= nil then k.NumberEasing
            else true,
        changeMode = k.changeMode or k.ChangeMode or "percentage",
        changeBaseline = k.changeBaseline or k.ChangeBaseline or "previous",
        prefix = k.prefix or k.Prefix or "",
        suffix = k.suffix or k.Suffix or "",
        compact = k.compact or k.Compact or j.compact or false,
        display = (k.display or k.Display or "value"),
        _initialValue = if (k.value or k.Value) ~= nil then (k.value or k.Value) else nil,
        _lastChange = 0,
    }, Statistic)
    if l.compact then
        l:_buildCompact()
    else
        l:_buildFull()
    end
    if l.description then
        if l.compact then
            log.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{l.name}'.`)
        else
            l.descriptor = require(script.Parent.descriptor).new(l.tab, { description = l.description })
        end
    end
    return l
end

function Statistic._buildFull(self)
    local k = self.window
    self.main = k:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 90),
        BorderSizePixel = 0,
        Name = self.name,
        ZIndex = 5,
        BackgroundTransparency = 1,
        Parent = self.tab.tabPage,
    }, { BackgroundColor3 = "StatBackground", BackgroundTransparency = "ElementTransparency" })
    k:Create("UICorner", { Parent = self.main }, { CornerRadius = "ElementCornerRadius" })
    self.stroke = k:Create(
        "UIStroke",
        { Transparency = 1, Color = Color3.fromRGB(255, 255, 255), Parent = self.main },
        { Transparency = "ElementStrokeTransparency" }
    )
    self.strokeGradient = k:Create(
        "UIGradient",
        {
            Rotation = 2,
            Offset = Vector2.new(0, 0.5),
            Color = b.neutral.stroke,
            Transparency = c,
            Parent = self.stroke,
        }
    )
    self.titleContainer = k:Create("Frame", {
        Size = UDim2.new(1, -40, 0, 32),
        Position = UDim2.fromOffset(20, 15),
        BorderSizePixel = 0,
        LayoutOrder = -1,
        BackgroundTransparency = 1,
        ZIndex = 5,
        Parent = self.main,
    })
    self.gradientContainer = k:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromOffset(0, 0),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        ZIndex = 5,
        Parent = self.main,
    })
    self.glow = k:CreateGlow(self.main, f(b.neutral), 13, 1)
    self.title = k:Create("TextLabel", {
        Text = locale.t(self.name),
        Size = UDim2.fromOffset(300, 19),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 19,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        LayoutOrder = 1,
        ZIndex = 10,
        TextTransparency = 1,
        Parent = self.titleContainer,
    }, { TextColor3 = "ContentColor", FontFace = "TitleFont" })
    self.mainGradient = k:Create("UIGradient", {
        Rotation = 2,
        Offset = Vector2.new(0, 0.5),
        Color = b.neutral.fill,
        Transparency = c,
        Parent = self.gradientContainer,
    })
    k:Create("UICorner", { Parent = self.gradientContainer }, { CornerRadius = "ElementCornerRadius" })
    if self.icon then
        self.iconLabel = k:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(32, 32),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ZIndex = 10,
            ImageTransparency = 1,
            Parent = self.titleContainer,
        }, { ImageColor3 = "ContentColor" })
    end
    self.containerLayout = k:Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.titleContainer,
    })
    self.valueHost = k:Create("Frame", {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 20, 1, -15),
        Size = UDim2.fromOffset(200, 20),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 10,
        Parent = self.main,
    })
    self.changeHost = k:Create("Frame", {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -20, 1, -15),
        Size = UDim2.fromOffset(200, 15),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 10,
        Parent = self.main,
    })
    self.valueOdo = odometer.new(
        k,
        self.valueHost,
        { textSize = 20, alignment = Enum.HorizontalAlignment.Left, transparency = 1 }
    )
    self.valueOdo:snap(self:_formatValue(self.value))
    self.changeOdo = odometer.new(
        k,
        self.changeHost,
        { textSize = 15, alignment = Enum.HorizontalAlignment.Right, transparency = 1 }
    )
    self.changeOdo:snap(self:_formatChange(0))
    self._accentGradients = { self.strokeGradient, self.mainGradient }
end

function Statistic._buildCompact(self)
    local k, l = self.window, self.tab.compact or false
    self.main = k:Create("Frame", {
        Name = self.name,
        Size = if l then UDim2.fromOffset(0, d) else UDim2.new(1, -20, 0, d),
        AutomaticSize = if l then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
        ClipsDescendants = true,
        BorderSizePixel = 0,
        ZIndex = 5,
        BackgroundTransparency = 1,
        Parent = self.tab.tabPage,
    }, { BackgroundColor3 = "StatBackground", BackgroundTransparency = "ElementTransparency" })
    k:Create("UICorner", { Parent = self.main }, { CornerRadius = "ElementCornerRadius" })
    self.stroke = k:Create(
        "UIStroke",
        { Transparency = 1, Color = Color3.fromRGB(255, 255, 255), Parent = self.main },
        {
            Transparency = "ElementStrokeTransparency",
        }
    )
    self.strokeGradient = k:Create(
        "UIGradient",
        {
            Rotation = 2,
            Offset = Vector2.new(0, 0.5),
            Color = b.neutral.stroke,
            Transparency = c,
            Parent = self.stroke,
        }
    )
    if l then
        k:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = self.main })
    end
    k:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        Parent = self.main,
    })
    self.card = k:Create("Frame", {
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, d),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 5,
        BackgroundTransparency = 1,
        Parent = self.main,
    })
    k:Create("UICorner", { Parent = self.card }, { CornerRadius = "ElementCornerRadius" })
    self.mainGradient = k:Create(
        "UIGradient",
        {
            Rotation = 2,
            Offset = Vector2.new(0, 0.5),
            Color = b.neutral.fill,
            Transparency = c,
            Parent = self.card,
        }
    )
    k:Create(
        "UIPadding",
        { PaddingLeft = UDim.new(0, 15), PaddingRight = UDim.new(0, 15), Parent = self.card }
    )
    k:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
        Padding = UDim.new(0, 10),
        Parent = self.card,
    })
    self.titleContainer = k:Create("Frame", {
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, 16),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 0,
        ZIndex = 6,
        Parent = self.card,
    })
    k:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.titleContainer })
    k:Create("UIListLayout", {
        Padding = UDim.new(0, 6),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.titleContainer,
    })
    if self.icon then
        self.iconLabel = k:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(20, 20),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 0,
            ZIndex = 6,
            ImageTransparency = 1,
            Parent = self.titleContainer,
        }, {
            ImageColor3 = "ContentColor",
        })
    end
    self.title = k:Create("TextLabel", {
        Text = locale.t(self.name),
        Size = UDim2.fromOffset(0, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        LayoutOrder = 1,
        ZIndex = 6,
        TextTransparency = 1,
        Parent = self.titleContainer,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    k:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Shrink, Parent = self.title })
    self.readoutHost = k:Create("Frame", {
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, 18),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        ZIndex = 6,
        Parent = self.card,
    })
    self.readoutOdo = odometer.new(k, self.readoutHost, {
        textSize = 17,
        alignment = Enum.HorizontalAlignment.Right,
        transparency = 1,
    })
    self.readoutOdo:snap(self.display == "change" and self:_formatChange(0) or self:_formatValue(self.value))
    self._accentGradients = { self.strokeGradient, self.mainGradient }
end

function Statistic._setAccent(self, k, l)
    local m = b[k]
    self.strokeGradient.Color = m.stroke
    self.mainGradient.Color = m.fill
    if self.glow then
        self.glow.Color = f(m)
    end
    local n, o =
        if l == 1 then 14 elseif l == -1 then -10 else 2,
        if l == 1
            then Vector2.new(0.04, 0.5)
            elseif l == -1 then Vector2.new(-4E-2, 0.5)
            else Vector2.new(0, 0.5)
    for p, q in self._accentGradients do
        variables.tweenService:Create(q, e, { Rotation = n, Offset = o }):Play()
    end
end

function Statistic._formatValue(self, k)
    return self.prefix .. h(k) .. self.suffix
end

function Statistic._formatChange(self, k)
    if self.changeMode == "absolute" then
        return i(k)
    else
        return g(k)
    end
end

function Statistic._showValue(self, k, l, m, n)
    if self.numberEasing and not n then
        k:to(self:_formatValue(l), l >= m)
    else
        k:snap(self:_formatValue(l))
    end
end

function Statistic._updateFullReadouts(self, k, l, m, n, o, p)
    self:_showValue(self.valueOdo, k, l, p)
    if o then
        self.changeOdo:snap(o)
        self._lastChange = 0
    elseif self.numberEasing and not n then
        self.changeOdo:to(self:_formatChange(m), m >= self._lastChange)
        self._lastChange = m
    else
        self.changeOdo:snap(self:_formatChange(m or 0))
        self._lastChange = m or 0
    end
end

function Statistic._updateCompactReadout(self, k, l, m, n, o, p)
    if self.display == "change" then
        if o then
            self.readoutOdo:snap(o)
            self._lastChange = 0
        elseif self.numberEasing and not n then
            self.readoutOdo:to(self:_formatChange(m), m >= self._lastChange)
            self._lastChange = m
        else
            self.readoutOdo:snap(self:_formatChange(m or 0))
            self._lastChange = m or 0
        end
    else
        self:_showValue(self.readoutOdo, k, l, p)
    end
end

function Statistic.Set(self, k)
    assert(typeof(k) == "number", "Statistic:Set() - value must be a number, got " .. typeof(k))
    local l, m = self.value, not self._hasValue
    self.value = k
    self._hasValue = true
    if m then
        self._initialValue = k
    end
    local n = if self.changeBaseline == "initial" then self._initialValue else l
    local o, p, q, r, s = m or n == k
    if o then
        p = 0
        r = "neutral"
        s = 0
    elseif n == 0 then
        local t, u =
            if k > 0 then "+" else "-", if self.changeMode == "percentage" then "\u{221e}%" else "\u{221e}"
        q = t .. u
        r = if k > 0 then "positive" else "negative"
        s = if k > 0 then 1 else -1
    elseif self.changeMode == "percentage" then
        p = ((k - n) / math.abs(n)) * 100
        s = if p > 0 then 1 elseif p < 0 then -1 else 0
        r = if s == 1 then "positive" elseif s == -1 then "negative" else "neutral"
    else
        p = k - n
        s = if p > 0 then 1 elseif p < 0 then -1 else 0
        r = if s == 1 then "positive" elseif s == -1 then "negative" else "neutral"
    end
    self:_setAccent(r, s)
    if self.compact then
        self:_updateCompactReadout(k, l, p, o, q, m)
    else
        self:_updateFullReadouts(k, l, p, o, q, m)
    end
end

function Statistic.ResetBaseline(self, k)
    local l, m, n = self.value, not self._hasValue, if typeof(k) == "number" then k else self.value
    self._initialValue = n
    self.value = n
    self._hasValue = true
    self._lastChange = 0
    if self.compact then
        if self.display == "change" then
            self.readoutOdo:snap(self:_formatChange(0))
        else
            self:_showValue(self.readoutOdo, n, l, m)
        end
    else
        self.changeOdo:snap(self:_formatChange(0))
        self:_showValue(self.valueOdo, n, l, m)
    end
    self:_setAccent("neutral", 0)
end

function Statistic._setShown(self, k, l)
    local m = self.window
    if self.compact then
        m:_reveal(self.main, {
            BackgroundTransparency = if k then (self.window.theme.ElementTransparency or 0) else 1,
        }, l)
        m:_reveal(
            self.stroke,
            { Transparency = if k then self.window.theme.ElementStrokeTransparency else 1 },
            l
        )
        m:_reveal(self.card, { BackgroundTransparency = if k then 0 else 1 }, l)
        m:_reveal(self.title, { TextTransparency = if k then 0 else 1 }, l)
        if self.iconLabel then
            m:_reveal(self.iconLabel, { ImageTransparency = if k then 0 else 1 }, l)
        end
        self.readoutOdo:reveal(if k then 0 else 1, l)
        return
    end
    if k then
        m:_revealCommon(self, l)
        m:_reveal(self.gradientContainer, { BackgroundTransparency = 0 }, l)
        m:_reveal(self.glow, { Transparency = 0.82 }, l)
        self.valueOdo:reveal(0, l)
        self.changeOdo:reveal(0, l)
    else
        m:_hideCommon(self, l)
        m:_reveal(self.gradientContainer, { BackgroundTransparency = 1 }, l)
        m:_reveal(self.glow, {
            Transparency = 1,
        }, l)
        self.valueOdo:reveal(1, l)
        self.changeOdo:reveal(1, l)
    end
end

function Statistic._minWidth(self)
    local k = 40
    if self.icon then
        k += 26
    end
    k += functions.textWidth(self.window.theme.Font, 16, locale.resolve(self.name))
    local l = if self.display == "change" then self:_formatChange(0) else self:_formatValue(self.value)
    k += functions.textWidth(self.window.theme.Font, 17, l)
    return k
end
moveable(Statistic)
return Statistic
