-- Rayfield/components/console  (bundle module #7)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Console = {}
Console.__index = Console
Console.__type = "Console"
local utility = script.Parent.Parent.utility
local moveable, locale, j, k, l, m, n, o, p, q, r =
    require(utility.moveable),
    require(utility.locale),
    120,
    48,
    24,
    17,
    12,
    12,
    1.25,
    200,
    Font.fromEnum(Enum.Font.Code)

function Console.new(s, t)
    t = if typeof(t) == "table" then t else {}
    local u = setmetatable({
        tab = assert(s, "Missing argument #1 (Tab expected)"),
        window = s.window,
        name = t.name or t.Name,
        description = t.description or t.Description,
        height = math.max(tonumber(t.height or t.Height) or j, k),
        follow = t.follow or t.Follow or false,
        maxLines = math.max(tonumber(t.maxLines or t.MaxLines) or q, 1),
        lines = {},
        lineLabels = {},
        head = 1,
        nextOrder = 1,
        textDirty = true,
    }, Console)
    u:_build()
    u:_setLines(t.text or t.Text or "")
    if u.description then
        u.descriptor = require(script.Parent.descriptor).new(u.tab, { description = u.description })
    end
    return u
end

function Console.Get(self): string
    if self.textDirty then
        self.text = table.concat(self.lines, "\n")
        self.textDirty = false
    end
    return self.text
end

function Console._setLines(self, t)
    t = if type(t) == "string" then t else tostring(t)
    table.clear(self.lines)
    if t ~= "" then
        for u in string.gmatch(t .. "\n", "([^\n]*)\n") do
            table.insert(self.lines, u)
        end
    end
    self:_trim()
    self:_flush()
end

function Console._trim(self)
    local t = #self.lines - self.maxLines
    if t <= 0 then
        return
    end
    table.move(self.lines, t + 1, #self.lines, 1)
    for u = #self.lines, #self.lines - t + 1, -1 do
        self.lines[u] = nil
    end
end

function Console._makeLabel(self)
    return self.window:Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        FontFace = r,
        TextSize = o,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        LineHeight = p,
        RichText = false,
        TextTransparency = self._textTransparency or 1,
        Parent = self.scroll,
    }, { TextColor3 = "ContentColor" })
end

local function s(t: string): string
    return if t == "" then " " else t
end

function Console._flush(self)
    self.textDirty = true
    for u, v in self.lines do
        local w = self.lineLabels[u]
        if not w then
            w = self:_makeLabel()
            self.lineLabels[u] = w
        end
        w.LayoutOrder = u
        w.Text = s(v)
        w.Visible = true
    end
    for u = #self.lines + 1, #self.lineLabels do
        self.lineLabels[u].Visible = false
    end
    self.head = 1
    self.nextOrder = #self.lines + 1
    self:_follow()
end

function Console._pushLine(self, u: string)
    self.textDirty = true
    if #self.lines < self.maxLines then
        table.insert(self.lines, u)
        local v = #self.lines
        local w = self.lineLabels[v]
        if not w then
            w = self:_makeLabel()
            self.lineLabels[v] = w
        end
        w.LayoutOrder = self.nextOrder
        w.Text = s(u)
        w.Visible = true
        self.nextOrder += 1
        return
    end
    table.move(self.lines, 2, #self.lines, 1)
    self.lines[#self.lines] = u
    local v = self.lineLabels[self.head]
    v.LayoutOrder = self.nextOrder
    v.Text = s(u)
    v.Visible = true
    self.nextOrder += 1
    self.head = (self.head % #self.lineLabels) + 1
end

function Console._build(self)
    local u = if self.name then l else 0
    self.main = self.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, self.height + u + m * 2),
        BorderSizePixel = 0,
        Name = self.name or "Console",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = self.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })
    self.stroke = self.window:StyleElementBody(self.main)
    if self.name then
        self.container = self.window:Create("Frame", {
            Size = UDim2.new(1, -m * 2, 0, 16),
            Position = UDim2.new(0, m, 0, m),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Parent = self.main,
        })
        self.title = self.window:Create("TextLabel", {
            Text = locale.t(self.name),
            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            TextSize = 16,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = 1,
            Parent = self.container,
        }, { TextColor3 = "ContentColor", FontFace = "Font" })
    end
    self.panel = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 1, -m),
        Size = UDim2.new(1, -m * 2, 0, self.height),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundTransparency = 1,
        Parent = self.main,
    }, {
        BackgroundColor3 = "StatBackground",
    })
    self.window:Create("UICorner", { Parent = self.panel }, { CornerRadius = "ElementCornerRadius" })
    self.panelStroke = self.window:Create(
        "UIStroke",
        { ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Transparency = 1, Parent = self.panel },
        {
            Color = "SurfaceStroke",
        }
    )
    self.scroll = self.window:Create("ScrollingFrame", {
        Size = UDim2.new(1, -n * 2, 1, -n * 2),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        Parent = self.panel,
    })
    self.scrollLayout = self.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.scroll,
    })
    self:_watchCanvas()
end

function Console._pin(self)
    local u = self.scroll
    if not u or not u.Parent then
        return
    end
    u.CanvasPosition = Vector2.new(0, u.AbsoluteCanvasSize.Y)
end

function Console._follow(self)
    if not self.follow then
        return
    end
    self:_pin()
    task.defer(function()
        self:_pin()
    end)
end

function Console._watchCanvas(self)
    self.window:ConnectFor(self, self.scrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        if self.follow then
            self:_pin()
        end
    end)
end

function Console.Set(self, u)
    self:_setLines(u)
end

function Console.Append(self, u)
    u = if type(u) == "string" then u else tostring(u)
    for v in string.gmatch(u .. "\n", "([^\n]*)\n") do
        self:_pushLine(v)
    end
    self:_follow()
end

function Console.Clear(self)
    table.clear(self.lines)
    self:_flush()
end

function Console.Copy(self): boolean
    local u = (getgenv and getgenv().setclipboard) or setclipboard
    if typeof(u) ~= "function" then
        return false
    end
    return (pcall(u, self:Get()))
end

function Console.SetHeight(self, u)
    self.height = math.max(tonumber(u) or j, k)
    local v = if self.name then l else 0
    self.panel.Size = UDim2.new(1, -m * 2, 0, self.height)
    self.main.Size = UDim2.new(1, -20, 0, self.height + v + m * 2)
end

function Console._setShown(self, u, v)
    local w = self.window
    w:_reveal(self.main, { BackgroundTransparency = if u then w.theme.ElementTransparency or 0 else 1 }, v)
    w:_reveal(self.stroke, { Transparency = if u then w.theme.ElementStrokeTransparency else 1 }, v)
    w:_reveal(self.panel, {
        BackgroundTransparency = if u then 0 else 1,
    }, v)
    w:_reveal(self.panelStroke, { Transparency = if u then 0.9 else 1 }, v)
    self._textTransparency = if u then 0.15 else 1
    for x, y in self.lineLabels do
        w:_reveal(y, { TextTransparency = self._textTransparency }, v)
    end
    if self.title then
        w:_reveal(self.title, { TextTransparency = if u then 0 else 1 }, v)
    end
    if self.descriptor then
        w:_reveal(self.descriptor.titleLabel, { TextTransparency = if u then 0.7 else 1 }, v)
    end
end

function Console.Remove(self)
    if self.descriptor then
        self.descriptor:Remove()
    end
    self.main:Destroy()
end
moveable(Console)
return Console
