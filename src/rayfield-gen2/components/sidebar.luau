-- Rayfield/components/sidebar  (bundle module #20)
-- deobfuscated from Rayfield Gen2 v1.2.0

local utility = script.Parent.Parent.utility
local variables, image, locale, tabSelector, search, ak, al, am, b, c =
    require(utility.variables),
    require(utility.image),
    require(utility.locale),
    require(script.Parent.tabSelector),
    require(script.Parent.search),
    {},
    0,
    0.7,
    0.95,
    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local function d(e)
    return e.layout.mode == "sidebar"
        and e.profile ~= nil
        and e.settings.showProfile
        and variables.localPlayer ~= nil
end

local function e(f, g)
    local h = variables.localPlayer
    if not h then
        return
    end
    f.profile = f:Create("Frame", {
        Name = "Profile",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        Size = UDim2.new(1, 0, 0, g.footerHeight),
        BackgroundTransparency = 1,
        Parent = f.sidebar,
    })
    f.profileContainer = f:Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, g.rowInset, 0.5, 0),
        Size = UDim2.new(1, -g.rowInset, 1, 0),
        BackgroundTransparency = 1,
        Parent = f.profile,
    })
    f.profileLayout = f:Create("UIListLayout", {
        Padding = UDim.new(0, 10),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = f.profileContainer,
    })
    f.profileAvatar = f:Create("ImageLabel", {
        Name = "Avatar",
        Image = image.avatar(h.UserId, function(i)
            if f.profileAvatar and not f.unloaded then
                image.assign(f.profileAvatar, "Image", i)
            end
        end),
        Size = UDim2.fromOffset(g.avatarSize, g.avatarSize),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ImageTransparency = 1,
        Parent = f.profileContainer,
    })
    f:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = f.profileAvatar })
    f.profileLabels = f:Create("Frame", {
        Size = UDim2.fromOffset(50, g.avatarSize),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Parent = f.profileContainer,
    })
    f:Create("UIListLayout", {
        Padding = UDim.new(0, 2),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = f.profileLabels,
    })
    f.profileName = f:Create("TextLabel", {
        Text = h.DisplayName,
        Size = UDim2.fromOffset(50, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTransparency = 1,
        Parent = f.profileLabels,
    }, { TextColor3 = "TitlingColor", FontFace = "Font" })
    f.profileSubtitle = f:Create("TextLabel", {
        Text = "",
        Size = UDim2.fromOffset(50, 14),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        Visible = false,
        TextTransparency = 1,
        Parent = f.profileLabels,
    }, { TextColor3 = "TitlingColor", FontFace = "Font" })
end

function ak.build(self, g)
    self.sidebar = self:Create("Frame", {
        Name = "Sidebar",
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(0, g.railWidth, 1, -g.chromeHeight),
        BackgroundTransparency = 1,
        Visible = false,
        Parent = self.main,
    })
    self.tabList = self:Create("ScrollingFrame", {
        Name = "Tabs",
        Active = true,
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        ScrollBarImageTransparency = 1,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ClipsDescendants = true,
        Parent = self.sidebar,
    })
    self:Create(
        "UIPadding",
        {
            PaddingTop = UDim.new(0, g.railPadding),
            PaddingBottom = UDim.new(0, g.railPadding),
            Parent = self.tabList,
        }
    )
    self.tabListLayout = self:Create("UIListLayout", {
        Padding = UDim.new(0, g.rowSpacing),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.tabList,
    })
    e(self, g)
    ak.reflowProfile(self)
end

function ak.reflowProfile(self)
    local g, h = self.layout, d(self)
    if self.profile then
        self.profile.Visible = h
    end
    self.tabList.Size = UDim2.new(1, 0, 1, if h then -g.footerHeight else 0)
end

function ak.applyWidth(self, g)
    local h = self.layout
    self.sidebar.Size = UDim2.new(0, g, 1, -h.chromeHeight)
    self.elements.Size = UDim2.new(1, -g, 1, -h.chromeHeight)
    self.bottomFade.Size = UDim2.new(1, -g, h.fadeSize.Y.Scale, h.fadeSize.Y.Offset)
    search.railWidth(self, g)
    local i = g < (h.railWidth :: number)
    for j, k in self.tabs do
        if not k.neglectSelector then
            tabSelector.setRowCollapsed(k, i, h)
        end
    end
    if self.profileContainer then
        self.profileContainer.Position = UDim2.new(0, if i then 0 else h.rowInset, 0.5, 0)
        self.profileContainer.Size = UDim2.new(1, if i then 0 else -h.rowInset, 1, 0)
        self.profileLayout.HorizontalAlignment = if i
            then Enum.HorizontalAlignment.Center
            else Enum.HorizontalAlignment.Left
        self.profileLabels.Visible = not i
    end
end

function ak.setProfileShown(self, g, h)
    if not self.profile or not self.profile.Visible then
        return
    end
    local i = {
        [self.profileAvatar] = {
            ImageTransparency = if g then 0 else 1,
            BackgroundTransparency = if g then b else 1,
        },
        [self.profileName] = { TextTransparency = if g then al else 1 },
        [self.profileSubtitle] = { TextTransparency = if g then am else 1 },
    }
    for j, k in i do
        if h then
            variables.tweenService:Create(j, h, k):Play()
        else
            for l, m in k do
                j[l] = m
            end
        end
    end
end

function ak.setProfileEnabled(self, g)
    if not self.profile then
        self.settings.showProfile = g
        return
    end
    if g then
        self.settings.showProfile = true
        ak.reflowProfile(self)
        ak.setProfileShown(self, true, c)
        return
    end
    ak.setProfileShown(self, false, c)
    task.delay(c.Time, function()
        if self.unloaded or self.settings.showProfile then
            return
        end
        ak.reflowProfile(self)
    end)
    self.settings.showProfile = false
end

function ak.setSubtitle(self, g)
    if not self.profileSubtitle then
        return
    end
    local h = if type(g) == "string" and g ~= "" then locale.resolve(g) else nil
    self.profileSubtitle.Text = h or ""
    self.profileSubtitle.Visible = h ~= nil
end
return ak
