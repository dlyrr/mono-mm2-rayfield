-- Rayfield/components/group  (bundle module #12)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Group = {}
Group.__index = Group
Group.__type = "Group"
local moveable, log, ordering, ai, b =
    require(script.Parent.Parent.utility.moveable),
    require(script.Parent.Parent.utility.log),
    require(script.Parent.Parent.utility.ordering),
    8,
    { button = true, toggle = true, stat = true, slider = true }

function Group.new(c, d)
    d = if typeof(d) == "table" then d else {}
    local e = string.lower(d.direction or d.Direction or "row")
    local f = e == "column" or e == "vertical"
    local g = not f
    local h = if g then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
    local i, j =
        setmetatable({
            tab = assert(c, "Missing argument #1 (Tab expected)"),
            window = c.window,
            direction = h,
            compact = g,
            forgetState = c.forgetState,
            elements = {},
        }, Group), c.direction == Enum.FillDirection.Horizontal
    i.main = i.window:Create("Frame", {
        Name = "Group",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = if g then UDim2.new(1, -20, 0, 0) else UDim2.new(1, 0, 0, 0),
        Parent = i.tab.tabPage,
    })
    if j then
        i.main.Size = UDim2.new(0, 0, 0, 0)
        i.window:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = i.main })
    end
    i.tabPage = i.main
    i.layout = i.window:Create("UIListLayout", {
        FillDirection = h,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, ai),
        VerticalAlignment = if g then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top,
        HorizontalAlignment = if g then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
        Parent = i.main,
    })
    return i
end

function Group._add(self, d, e)
    if self.compact and not b[d] then
        log.warn(
            `Rayfield: a row only holds compact elements (button/toggle/stat/slider), ignoring '{d}'. Use a column for it.`
        )
        return nil
    end
    local f = require(script.Parent[d]).new(self, e)
    table.insert(self.elements, f)
    ordering(f, #self.elements * 10)
    self.window:_restoreLate(f)
    if self.compact then
        self:_wrapChild(f)
    end
    self:_reflowRow()
    if not self.window.hidden then
        f:_setShown(true, true)
    end
    return f
end

function Group._reflowRow(self)
    if self.direction ~= Enum.FillDirection.Horizontal then
        return
    end
    local d = #self.elements > 0
    for e, f in self.elements do
        if f.__type ~= "Group" then
            d = false
            break
        end
    end
    self.layout.Padding = if d then UDim.new(0, -10) else UDim.new(0, ai)
end

function Group._wrapChild(self, d)
    self.layout.Wraps = true
    self.layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
    d._widthManaged = true
    local e = if d._minWidth then d:_minWidth() else 0
    if e > 0 then
        d.main.AutomaticSize = Enum.AutomaticSize.None
        d.main.Size = UDim2.new(0, e, d.main.Size.Y.Scale, d.main.Size.Y.Offset)
    end
end

function Group.CreateButton(self, d)
    return self:_add("button", d)
end

function Group.CreateToggle(self, d)
    return self:_add("toggle", d)
end

function Group.CreateSwitch(self, d)
    return self:_add("toggle", d)
end

function Group.CreateStat(self, d)
    return self:_add("stat", d)
end

function Group.CreateSlider(self, d)
    return self:_add("slider", d)
end

function Group.CreateDropdown(self, d)
    return self:_add("dropdown", d)
end

function Group.CreateSection(self, d)
    return self:_add("section", d)
end

function Group.CreateText(self, d)
    return self:_add("text", d)
end

function Group.CreateDivider(self, d)
    return self:_add("divider", d)
end

function Group._addGroup(self, d)
    d = if typeof(d) == "table" then table.clone(d) else {}
    if self.direction == Enum.FillDirection.Horizontal then
        self.layout.VerticalAlignment = Enum.VerticalAlignment.Top
        if self.tab.direction ~= Enum.FillDirection.Horizontal then
            self.main.Size = UDim2.new(1, 0, 0, 0)
        end
    end
    local e = Group.new(self, d)
    table.insert(self.elements, e)
    e.main.LayoutOrder = #self.elements * 10
    self:_reflowRow()
    return e
end

function Group.CreateGroup(self, d)
    return self:_addGroup(d)
end

function Group._moveElement(self, d, e)
    local f = table.find(self.elements, d)
    if not f then
        return
    end
    table.remove(self.elements, f)
    e = math.clamp(e, 1, #self.elements + 1)
    table.insert(self.elements, e, d)
    for g, h in self.elements do
        ordering(h, g * 10)
    end
end

function Group._setShown(self, d, e)
    for f, g in self.elements do
        g:_setShown(d, e)
    end
end

function Group._refreshTheme(self)
    for d, e in self.elements do
        if e._refreshTheme then
            e:_refreshTheme()
        end
    end
end
moveable(Group)
return Group
