-- Rayfield/components/divider  (bundle module #9)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Divider = {}
Divider.__index = Divider
Divider.__type = "Divider"
local moveable, locale, i, j, k, l, m, n, o =
    require(script.Parent.Parent.utility.moveable),
    require(script.Parent.Parent.utility.locale),
    1,
    12,
    10,
    14,
    12,
    0.88,
    0.55

function Divider.new(p, q)
    q = if typeof(q) == "table" then q else {}
    local r, s = q.spacing or q.Spacing, q.text or q.Text
    local t = setmetatable({
        tab = assert(p, "Missing argument #1 (Tab expected)"),
        window = p.window,
        text = if s ~= nil then tostring(s) else "",
        spacing = if type(r) == "number" then math.max(r, 0) else j,
        line = q.line ~= false and q.Line ~= false,
    }, Divider)
    t.main = t.window:Create("Frame", {
        Size = UDim2.new(1, -40, 0, 0),
        BorderSizePixel = 0,
        Name = "Divider",
        BackgroundTransparency = 1,
        Parent = t.tab.tabPage,
    })
    t.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, k),
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Parent = t.main,
    })
    if t.line then
        t.left = t:_buildHalf(1)
    end
    if t.text ~= "" then
        t:_buildLabel()
    end
    t:_applyHeight()
    return t
end

function Divider._buildHalf(self, q)
    local r = self.window:Create("Frame", {
        Size = UDim2.new(0, 0, 0, i),
        BorderSizePixel = 0,
        LayoutOrder = q,
        BackgroundTransparency = 1,
        Parent = self.main,
    }, { BackgroundColor3 = "ContentColor" })
    self.window:Create("UIFlexItem", {
        FlexMode = Enum.UIFlexMode.Fill,
        Parent = r,
    })
    return r
end

function Divider._buildLabel(self)
    self.title = self.window:Create("TextLabel", {
        Text = locale.t(self.text),
        Size = UDim2.fromOffset(0, l),
        AutomaticSize = Enum.AutomaticSize.X,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = m,
        TextXAlignment = Enum.TextXAlignment.Center,
        LayoutOrder = 2,
        TextTransparency = 1,
        Parent = self.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    if self.line then
        self.right = self:_buildHalf(3)
    end
end

function Divider._applyHeight(self)
    local q = if self.text ~= "" then l elseif self.line then i else 0
    self.main.Size = UDim2.new(1, -40, 0, self.spacing * 2 + q)
end

function Divider.Set(self, q)
    self.text = if q ~= nil then tostring(q) else ""
    if self.text ~= "" and not self.title then
        self:_buildLabel()
        if not self.window.hidden then
            self:_setShown(true, true)
        end
    end
    if self.title then
        self.window:_bindLocale(self.title, "Text", self.text)
        local r = self.text ~= ""
        self.title.Visible = r
        if self.right then
            self.right.Visible = r
        end
    end
    self:_applyHeight()
end

function Divider._setShown(self, q, r)
    local s, t = self.window, if q then n else 1
    s:_reveal(self.left, { BackgroundTransparency = t }, r)
    s:_reveal(self.right, { BackgroundTransparency = t }, r)
    s:_reveal(self.title, {
        TextTransparency = if q then o else 1,
    }, r)
end
moveable(Divider)
return Divider
