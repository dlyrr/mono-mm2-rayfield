-- Rayfield/utility/odometer  (bundle module #58)
-- deobfuscated from Rayfield Gen2 v1.2.0

local variables = require(script.Parent.variables)
local af, ag = variables.textService, {}
ag.__index = ag
local ah = 20

local function ai(aj, ak, al)
    local am = Instance.new("GetTextBoundsParams")
    am.Text = al
    am.Font = aj
    am.Size = ak
    am.Width = math.huge
    local b, c = pcall(af.GetTextBoundsAsync, af, am)
    return if b then c else Vector2.new(ak * 0.6, ak)
end
local aj = {}

local function ak(al, am)
    local b = tostring(al.Family)
        .. "|"
        .. tostring(al.Weight)
        .. "|"
        .. tostring(al.Style)
        .. "|"
        .. tostring(am)
    local c = aj[b]
    if c then
        return c
    end
    local d, e = {}, 0
    for f = 0, 9 do
        local g = math.ceil(ai(al, am, tostring(f)).X)
        d[f] = g
        if g > e then
            e = g
        end
    end
    c = { advance = d, maxWidth = e }
    aj[b] = c
    return c
end

function ag.new(al, am, b)
    b = b or {}
    local c = setmetatable({
        window = al,
        container = am,
        textSize = b.textSize or 16,
        transparency = b.transparency or 1,
        duration = b.duration or 0.55,
        slots = {},
        length = 0,
    }, ag)
    c.roll = TweenInfo.new(c.duration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    c.zIndex = math.max(am.ZIndex + 1, 6)
    c.height = math.ceil(c.textSize)
    local d = ak(al.theme.Font, c.textSize)
    c.advance = d.advance
    c.maxWidth = d.maxWidth
    al:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = b.alignment or Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 0),
        Parent = am,
    })
    return c
end

function ag._reel(self, am)
    local b = self.slots[am]
    if b.reel then
        return b.reel
    end
    local c = self.window:Create("Frame", {
        Name = "Reel",
        Size = UDim2.fromOffset(self.maxWidth, self.height),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = self.zIndex,
        Parent = self.container,
    })
    local d = self.window:Create("Frame", {
        Size = UDim2.fromOffset(self.maxWidth, self.height),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = self.zIndex,
        Parent = c,
    })
    for e = 0, ah - 1 do
        self.window:Create("TextLabel", {
            Text = tostring(e % 10),
            Position = UDim2.fromOffset(0, e * self.height),
            Size = UDim2.fromOffset(self.maxWidth, self.height),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = self.textSize,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextYAlignment = Enum.TextYAlignment.Center,
            TextTransparency = self.transparency,
            ZIndex = self.zIndex,
            Parent = d,
        }, { TextColor3 = "ContentColor", FontFace = "Font" })
    end
    local e = {
        cell = c,
        strip = d,
        digit = 0,
        target = 0,
        stripTween = nil,
        sizeTween = nil,
    }
    b.reel = e
    return e
end

function ag._static(self, am)
    local b = self.slots[am]
    if b.static then
        return b.static
    end
    local c = self.window:Create("TextLabel", {
        Name = "Static",
        Size = UDim2.fromOffset(0, self.height),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = self.textSize,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        TextTransparency = self.transparency,
        ZIndex = self.zIndex,
        Parent = self.container,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    b.static = c
    return c
end

local function al(am)
    if am.stripTween then
        am.stripTween:Cancel()
        am.stripTween = nil
    end
    if am.sizeTween then
        am.sizeTween:Cancel()
        am.sizeTween = nil
    end
end

function ag._reelSnap(self, b, c)
    al(b)
    b.cell.Size = UDim2.fromOffset(self.advance[c], self.height)
    b.strip.Position = UDim2.new(0.5, 0, 0, -c * self.height)
    b.digit = c
    b.target = c
end

function ag._reelRoll(self, b, c, d)
    if b.stripTween or b.sizeTween then
        self:_reelSnap(b, b.target)
    end
    local e = b.digit
    if e == c then
        return
    end
    local f, g
    if d then
        f = e
        g = e + (c - e) % 10
    else
        f = e + 10
        g = f - (e - c) % 10
    end
    b.strip.Position = UDim2.new(0.5, 0, 0, -f * self.height)
    b.target = c
    local h, i =
        variables.tweenService:Create(
            b.strip,
            self.roll,
            { Position = UDim2.new(0.5, 0, 0, -g * self.height) }
        ),
        variables.tweenService:Create(
            b.cell,
            self.roll,
            { Size = UDim2.fromOffset(self.advance[c], self.height) }
        )
    b.stripTween = h
    b.sizeTween = i
    h.Completed:Connect(function(j)
        if j == Enum.PlaybackState.Completed and b.stripTween == h then
            self:_reelSnap(b, c)
        end
    end)
    h:Play()
    i:Play()
    b.digit = c
end

function ag._putDigit(self, b, c, d, e)
    local f = self:_reel(b)
    local g = not f.cell.Visible
    f.cell.Visible = true
    f.cell.LayoutOrder = -b
    if self.slots[b].static then
        self.slots[b].static.Visible = false
    end
    if e and not g then
        self:_reelRoll(f, c, d)
    else
        self:_reelSnap(f, c)
    end
end

function ag._putStatic(self, b, c)
    local d = self:_static(b)
    if not d.Visible then
        d.TextTransparency = self.transparency
    end
    d.Text = c
    d.Visible = true
    d.LayoutOrder = -b
    if self.slots[b].reel then
        self.slots[b].reel.cell.Visible = false
    end
end

function ag._hide(self, b)
    local c = self.slots[b]
    if not c then
        return
    end
    if c.reel then
        c.reel.cell.Visible = false
    end
    if c.static then
        c.static.Visible = false
    end
end

function ag._render(self, b, c, d)
    b = tostring(b)
    if b == self._lastText then
        return
    end
    self._lastText = b
    local e = {}
    for f, g in utf8.codes(b) do
        table.insert(e, utf8.char(g))
    end
    local f = #e
    for g = 0, math.max(f, self.length) - 1 do
        self.slots[g] = self.slots[g] or {}
        if g < f then
            local h = e[f - g]
            if h:match("%d") then
                self:_putDigit(g, tonumber(h), d, c)
            else
                self:_putStatic(g, h)
            end
        else
            self:_hide(g)
        end
    end
    self.length = f
end

function ag.to(self, b, c)
    self:_render(b, true, c)
end

function ag.snap(self, b)
    self:_render(b, false, true)
end

function ag.reveal(self, b, c, d)
    self.transparency = b
    for e, f in self.slots do
        if f.static and f.static.Visible then
            self.window:_reveal(f.static, { TextTransparency = b }, c, d)
        end
        if f.reel then
            for g, h in f.reel.strip:GetChildren() do
                if h:IsA("TextLabel") then
                    self.window:_reveal(h, { TextTransparency = b }, c, d)
                end
            end
        end
    end
end
return ag
