-- Rayfield/components/progress  (bundle module #17)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Progress = {}
Progress.__index = Progress
Progress.__type = "Progress"
local utility = script.Parent.Parent.utility
local variables, functions, moveable, locale, ak, al, am, b, c, d, e, f, g, h, i =
    require(utility.variables),
    require(utility.functions),
    require(utility.moveable),
    require(utility.locale),
    60,
    8,
    20,
    6,
    6,
    16,
    14,
    0.4,
    TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.85), NumberSequenceKeypoint.new(1, 0) }),
    0.9
local j = TweenInfo.new(i, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, -1, true)

local function k(l: unknown): number?
    local m = tonumber(l)
    if m == nil or m ~= m or math.abs(m) == math.huge then
        return nil
    end
    return m
end

function Progress.new(l, m)
    m = if typeof(m) == "table" then m else {}
    local n = k(m.steps or m.Steps)
    n = if n and n >= 2 then math.floor(n) else nil
    local o = m.range or m.Range
    local p, q = k(o and o[1]) or 0, k(o and o[2]) or n or 1
    if p > q then
        p, q = q, p
    end
    local r = setmetatable({
        tab = assert(l, "Missing argument #1 (Tab expected)"),
        window = l.window,
        name = m.name or m.Name or "Progress",
        icon = m.icon or m.Icon,
        description = m.description or m.Description,
        min = p,
        max = q,
        steps = n,
        value = 0,
        text = m.text or m.Text,
        format = m.format or m.Format,
        showValue = if m.showValue == nil then true else m.showValue == true,
        indeterminate = m.indeterminate or m.Indeterminate or false,
    }, Progress)
    r.value = r:_clamp(k(m.value or m.Value) or p)
    r:_build()
    if r.description then
        r.descriptor = require(script.Parent.descriptor).new(r.tab, { description = r.description })
    end
    return r
end

function Progress._clamp(self, m: number): number
    return math.clamp(k(m) or self.min, self.min, self.max)
end

function Progress._ratio(self): number
    local m = self.max - self.min
    if m <= 0 then
        return 1
    end
    return (self.value - self.min) / m
end

function Progress._filledSteps(self): number
    local m = self.steps :: number
    return math.clamp(math.round(self:_ratio() * m), 0, m)
end

function Progress._readout(self): string
    if self.text then
        return locale.resolve(self.text)
    end
    if self.format then
        local m, n = pcall(self.format, self.value, self.min, self.max)
        if m and type(n) == "string" then
            return n
        end
    end
    if self.steps then
        return string.format("%d/%d", self:_filledSteps(), self.steps)
    end
    return string.format("%d%%", math.round(self:_ratio() * 100))
end

function Progress._build(self)
    self.main = self.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, ak),
        BorderSizePixel = 0,
        Name = self.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = self.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })
    self.stroke = self.window:StyleElementBody(self.main)
    self.container = self.window:Create("Frame", {
        Size = UDim2.new(0, 170, 0, d),
        Position = UDim2.new(0, am, 0, 20),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = self.main,
    })
    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 6),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
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
        Size = UDim2.fromOffset(250, d),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = d,
        AutomaticSize = Enum.AutomaticSize.X,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        LayoutOrder = 1,
        TextTransparency = 1,
        Parent = self.container,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    self.readout = self.window:Create("TextLabel", {
        Text = self:_readout(),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -am, 0, 20),
        Size = UDim2.fromOffset(50, e),
        AutomaticSize = Enum.AutomaticSize.X,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = e,
        TextXAlignment = Enum.TextXAlignment.Right,
        Visible = self.showValue,
        TextTransparency = 1,
        Parent = self.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    if self.steps then
        self:_buildSteps()
        return
    end
    self.track = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -16),
        Size = UDim2.new(1, -am * 2, 0, al),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Parent = self.main,
    }, { BackgroundColor3 = "SliderBackground" })
    self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.track })
    self.fill = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5),
        Size = UDim2.fromScale(if self.indeterminate then 0 else self:_ratio(), 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundTransparency = 1,
        Parent = self.track,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.fill })
    self.window:Create(
        "UIGradient",
        { Offset = Vector2.new(0, 0.5), Rotation = 2, Transparency = h, Parent = self.fill },
        { Color = {
            "SliderProgress",
            functions.toColorSequence,
        } }
    )
    self.fillGlow = self.window:CreateGlow(self.fill, "AccentColor", 20, 1)
    if self.indeterminate then
        self:_startSweep()
    end
end

function Progress._buildSteps(self)
    local m = self.steps :: number
    self.track = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -17),
        Size = UDim2.new(1, -am * 2, 0, b),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = self.main,
    })
    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, c),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.track,
    })
    self.stepFrames = {}
    for n = 1, m do
        local o = self.window:Create("Frame", {
            Size = UDim2.new(1 / m, -(c * (m - 1)) / m, 1, 0),
            BorderSizePixel = 0,
            LayoutOrder = n,
            BackgroundTransparency = 1,
            Parent = self.track,
        }, { BackgroundColor3 = "SliderBackground" })
        self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = o })
        local p = self.window:Create("Frame", {
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
            ZIndex = 2,
            BackgroundTransparency = 1,
            Parent = o,
        })
        self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = p })
        self.window:Create(
            "UIGradient",
            { Rotation = 90, Parent = p },
            { Color = { "SliderProgress", functions.toColorSequence } }
        )
        table.insert(self.stepFrames, { segment = o, fill = p })
    end
end

function Progress._startSweep(self)
    if self._sweep or self.steps then
        return
    end
    self.fill.AnchorPoint = Vector2.new(0, 0.5)
    self.fill.Position = UDim2.fromScale(0, 0.5)
    self.fill.Size = UDim2.fromScale(0, 1)
    self._sweep = variables.tweenService:Create(self.fill, j, { Size = UDim2.fromScale(1, 1) })
    self._sweep:Play()
end

function Progress._stopSweep(self)
    if not self._sweep then
        return
    end
    self._sweep:Cancel()
    self._sweep = nil
    self.fill.AnchorPoint = Vector2.new(0, 0.5)
    self.fill.Position = UDim2.fromScale(0, 0.5)
end

function Progress._render(self, m: boolean?)
    self.readout.Text = self:_readout()
    if self.steps then
        if not self._shown then
            return
        end
        local n = self:_filledSteps()
        for o, p in self.stepFrames do
            local q = if o <= n then 0 else 1
            if m == false then
                p.fill.BackgroundTransparency = q
            else
                variables.tweenService
                    :Create(p.fill, g, {
                        BackgroundTransparency = q,
                    })
                    :Play()
            end
        end
        return
    end
    local n = UDim2.fromScale(self:_ratio(), 1)
    if m == false then
        self.fill.Size = n
    else
        variables.tweenService:Create(self.fill, g, { Size = n }):Play()
    end
end

function Progress.Set(self, m)
    self.value = self:_clamp(m)
    if self.indeterminate then
        self.indeterminate = false
        self:_stopSweep()
    end
    self:_render()
end

function Progress.Get(self): number
    return self.value
end

function Progress.GetPercentage(self): number
    return self:_ratio()
end

function Progress.SetRange(self, m, n)
    m = k(m) or self.min
    n = k(n) or self.max
    if m > n then
        m, n = n, m
    end
    self.min, self.max = m, n
    self.value = self:_clamp(self.value)
    self:_render()
end

function Progress.SetText(self, m)
    self.text = m
    self.readout.Text = self:_readout()
end

function Progress.SetIndeterminate(self, m)
    m = m == true
    if m == self.indeterminate then
        return
    end
    self.indeterminate = m
    if m then
        self:_startSweep()
    else
        self:_stopSweep()
        self:_render(false)
    end
end

function Progress._setShown(self, m, n)
    local o = self.window
    self._shown = m
    o:_reveal(self.readout, { TextTransparency = if m then f else 1 }, n)
    if m then
        o:_revealCommon(self, n)
    else
        o:_hideCommon(self, n)
    end
    if self.steps then
        local p = self:_filledSteps()
        for q, r in self.stepFrames do
            o:_reveal(r.segment, { BackgroundTransparency = if m then 0 else 1 }, n)
            o:_reveal(r.fill, { BackgroundTransparency = if m and q <= p then 0 else 1 }, n)
        end
        return
    end
    o:_reveal(self.track, {
        BackgroundTransparency = if m then 0 else 1,
    }, n)
    o:_reveal(self.fill, { BackgroundTransparency = if m then 0 else 1 }, n)
    o:_reveal(self.fillGlow, { Transparency = if m then o.theme.AccentGlow else 1 }, n)
end

function Progress.Remove(self)
    self:_stopSweep()
    if self.descriptor then
        self.descriptor:Remove()
    end
    self.main:Destroy()
end
moveable(Progress)
return Progress
