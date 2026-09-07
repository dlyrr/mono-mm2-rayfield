-- Rayfield/components/search  (bundle module #18)
-- deobfuscated from Rayfield Gen2 v1.2.0

local utility = script.Parent.Parent.utility
local variables, constants, locale, action, aj, ak, al, am =
    require(utility.variables),
    require(utility.constants),
    require(utility.locale),
    require(script.Parent.action),
    {},
    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    0.6,
    0.2

local function b(c)
    if c.__type == "Group" then
        local d = {}
        local function e(f)
            for g, h in f.elements do
                if h.__type == "Group" then
                    e(h)
                elseif h.name then
                    table.insert(d, h.name)
                end
            end
        end
        e(c)
        return table.concat(d, "\n")
    end
    return c.name or ""
end

local function c(d)
    local e = {}
    for f, g in d.tabs do
        if g.neglectSelector then
            continue
        end
        for h, i in g.elements do
            if i.__type ~= "Section" then
                table.insert(e, i)
            end
        end
    end
    return e
end

local function d(e, f, g)
    variables.tweenService:Create(e.searchPill, g, { BackgroundTransparency = if f then 0.9 else 1 }):Play()
    variables.tweenService:Create(e.searchStroke, g, { Transparency = if f then 0.85 else 1 }):Play()
    variables.tweenService:Create(e.searchShadow, g, { Transparency = if f then 0.92 else 1 }):Play()
    variables.tweenService:Create(e.searchIcon, g, { ImageTransparency = if f then 0.65 else 1 }):Play()
    variables.tweenService:Create(e.searchInput, g, { TextTransparency = if f then 0.2 else 1 }):Play()
end

local function e(f, g, h)
    if f.layout.mode == "sidebar" then
        return
    end
    for i, j in f.tabs do
        if not j.neglectSelector and j.topbarItem then
            j:_applyVisual(
                if g then (if f.selectedTab == j then "selected" else "unselected") else "hidden",
                h
            )
        end
    end
end

local function f(g, h)
    h = string.lower(h or "")
    local i = false
    for j, k in g._searchUnits do
        local l = h == "" or string.find(k.text, h, 1, true) ~= nil
        k.unit.main.Visible = l
        if k.unit.descriptor then
            k.unit.descriptor.main.Visible = l
        end
        i = i or l
    end
    g.searchEmpty.Visible = not i and h ~= ""
end

local function g(h)
    h._searchUnits = {}
    local i = 0
    for j, k in c(h) do
        i += 1
        local l = k.main
        table.insert(h._searchUnits, {
            unit = k,
            text = string.lower(b(k)),
            homeParent = l.Parent,
            homeOrder = l.LayoutOrder,
            descOrder = k.descriptor and k.descriptor.main.LayoutOrder,
        })
        l.LayoutOrder = i * 10
        l.Parent = h.searchPage
        l.Visible = true
        if k.descriptor then
            k.descriptor.main.LayoutOrder = i * 10 + 1
            k.descriptor.main.Parent = h.searchPage
            k.descriptor.main.Visible = true
        end
    end
end

local function h(i)
    for j, k in i._searchUnits do
        local l = k.unit
        if l.main and l.main.Parent then
            l.main.LayoutOrder = k.homeOrder
            l.main.Parent = k.homeParent
            l.main.Visible = true
        end
        if l.descriptor and l.descriptor.main and l.descriptor.main.Parent then
            l.descriptor.main.LayoutOrder = k.descOrder
            l.descriptor.main.Parent = k.homeParent
            l.descriptor.main.Visible = true
        end
    end
    i._searchUnits = {}
end

function aj.open(self)
    if self._searching or self.minimised or not self:_interactive() then
        return
    end
    self._searching = true
    g(self)
    f(self, "")
    self:_jumpTo(self.searchPage)
    e(self, false, ak)
    task.delay(ak.Time, function()
        if self._searching and self.layout.mode ~= "sidebar" then
            self.tabList.Visible = false
        end
    end)
    self.searchPill.Visible = true
    d(self, true, ak)
    self.searchInput:CaptureFocus()
    variables.tweenService
        :Create(self.searchAction.iconLabel, ak, {
            ImageTransparency = am,
        })
        :Play()
end

function aj.close(self, j)
    if not self._searching then
        return
    end
    j = j or {}
    self._searching = false
    self.searchInput.Text = ""
    self.searchInput:ReleaseFocus()
    self.searchEmpty.Visible = false
    h(self)
    local k = if j.jumpTo == nil then self.selectedTab and self.selectedTab.tabPage else j.jumpTo
    if k then
        self:_jumpTo(k)
    end
    d(self, false, ak)
    task.delay(ak.Time, function()
        if not self._searching then
            self.searchPill.Visible = false
        end
    end)
    if j.showTabs then
        self.tabList.Visible = true
        e(self, true, ak)
    end
    variables.tweenService:Create(self.searchAction.iconLabel, ak, { ImageTransparency = al }):Play()
end

function aj.toggle(self)
    if self._searching then
        aj.close(self, { showTabs = true })
    else
        aj.open(self)
    end
end

function aj.railWidth(self, j)
    if self.searchPill then
        self.searchPill.Size = UDim2.new(1, -(j + 30), 0, 35)
    end
end

function aj.build(self)
    self._searching = false
    self.searchPage = self:Create("ScrollingFrame", {
        Name = "Search",
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0.5, 0, 0, 68),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        LayoutOrder = 2000,
        Parent = self.elements,
    })
    self:Create("UIListLayout", {
        Padding = UDim.new(0, 7),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.searchPage,
    })
    self:Create("UIPadding", {
        PaddingTop = UDim.new(0, if self.layout.mode == "sidebar" then 53 else 10),
        PaddingBottom = UDim.new(0, 33),
        Parent = self.searchPage,
    })
    self.searchEmpty = self:Create("TextLabel", {
        Name = "NoResults",
        Text = locale.t("No results"),
        FontFace = variables.brandFont(Enum.FontWeight.Medium),
        TextSize = 15,
        TextTransparency = 0.6,
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.55, 0),
        Size = UDim2.fromOffset(200, 20),
        Visible = false,
        ZIndex = 3,
        Parent = self.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    local j = self.layout.mode == "sidebar"
    local k = if j then self.layout.chromeHeight + 8 else self.layout.tabStripTop + 1
    self.searchPill = self:Create("Frame", {
        Name = "SearchBar",
        AnchorPoint = Vector2.new(if j then 1 else 0.5, 0),
        Position = UDim2.new(if j then 1 else 0.5, if j then -15 else 0, 0, k),
        Size = UDim2.new(1, if j then -(self.layout.railWidth + 30) else -35, 0, 35),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 10,
        BackgroundTransparency = 1,
        Visible = false,
        Parent = self.main,
    })
    self:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = self.searchPill,
    })
    self.searchStroke = self:Create(
        "UIStroke",
        { Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Transparency = 1, Parent = self.searchPill }
    )
    self.searchShadow = self:Create("UIShadow", {
        BlurRadius = UDim.new(0, 20),
        Color = Color3.fromRGB(255, 255, 255),
        ZIndex = -1,
        Transparency = 1,
        Parent = self.searchPill,
    })
    self.searchIcon = self:Create("ImageLabel", {
        Image = "rbxassetid://" .. tostring(constants.icons.search),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 15, 0.5, 1),
        Size = UDim2.fromOffset(16, 16),
        BackgroundTransparency = 1,
        ZIndex = 10,
        ImageTransparency = 1,
        Parent = self.searchPill,
    }, { ImageColor3 = "ContentColor" })
    self.searchInput = self:Create("TextBox", {
        Text = "",
        PlaceholderText = locale.t("Search all pages"),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 40, 0.5, 0),
        Size = UDim2.new(1, -110, 0, 18),
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        ClipsDescendants = true,
        ZIndex = 10,
        TextTransparency = 1,
        Parent = self.searchPill,
    }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
    self:Connect(self.searchInput:GetPropertyChangedSignal("Text"), function()
        if self._searching then
            f(self, self.searchInput.Text)
        end
    end)
    self.searchAction = action.new(self, {
        name = "Search",
        icon = constants.icons.search,
        order = 4,
        callback = function()
            aj.toggle(self)
        end,
    })
    self.searchAction.isLit = function()
        return self._searching
    end
end
return aj
