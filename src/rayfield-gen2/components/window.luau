-- Rayfield/components/window  (bundle module #30)
-- deobfuscated from Rayfield Gen2 v1.2.0

local utility = script.Parent.Parent.utility
local image, functions, persistence, constants, locale, log, HapticEngine, windowSizing, layouts, chrome, search, sidebar, variables, themes, h =
    require(utility.image),
    require(utility.functions),
    require(utility.persistence),
    require(utility.constants),
    require(utility.locale),
    require(utility.log),
    require(utility.HapticEngine),
    require(utility.windowSizing),
    require(utility.layouts),
    require(script.Parent.chrome),
    require(script.Parent.search),
    require(script.Parent.sidebar),
    require(utility.variables),
    script.Parent.Parent.themes,
    {}
h.__index = h
local i, j, k, l, m =
    TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    UDim2.fromOffset(185, 50),
    UDim2.fromOffset(50, 50),
    UDim2.new(0.5, 0, 0, 20),
    UDim2.new(0.5, 0, 0, 12)
local n, o, p, q, r, s, t, u, v =
    UDim2.new(0.5, 0, 0, l.Y.Offset + j.Y.Offset + 12),
    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    320,
    41,
    0.55,
    0.55,
    0.04,
    8,
    2

local function w(x): UDim2
    local y = variables.workspace.CurrentCamera
    return windowSizing.fit(y and y.ViewportSize, x)
end
local x, y =
    { "TopLeftRadius", "TopRightRadius", "BottomLeftRadius", "BottomRightRadius" }, (function()
        return (pcall(function()
            local x = Instance.new("UICorner")
            x.TopLeftRadius = UDim.new(0, 1)
            x:Destroy()
        end))
    end)()

local function z(A)
    return if A then layouts.sidebar else layouts.top
end
local A = {
    WindowColor = true,
    ElementGradient = true,
    ElementStrokeGradient = true,
    TabBackground = true,
    TabStroke = true,
    SliderProgress = true,
}

local function B(C, D)
    if A[C] and typeof(D) == "Color3" then
        return ColorSequence.new(D)
    end
    return D
end

local function C(D)
    return if typeof(D) == "ColorSequence" then D.Keypoints[1].Value else D
end

local function D(E, F)
    local G = E._toastsTop
    if not G then
        return
    end
    local H = if E._collapsedShown then n else m
    if not F or G.Position == H then
        G.Position = H
        return
    end
    variables.tweenService:Create(G, o, { Position = H }):Play()
end

local function E(F, G)
    local H = 0.299 * F.R + 0.587 * F.G + 0.114 * F.B
    local I = if H > 0.5 then Color3.new(0, 0, 0) else Color3.new(1, 1, 1)
    return F:Lerp(I, G)
end

local function F(G, H)
    if H.ElementGradient then
        local I = C(G.ElementGradient)
        if H.ElementStroke == nil then
            G.ElementStroke = E(I, 0.28)
        end
        if H.ElementStrokeGradient == nil then
            G.ElementStrokeGradient = ColorSequence.new(E(I, 0.4))
        end
        if H.ElementStrokeHover == nil then
            G.ElementStrokeHover = E(I, 0.52)
        end
    end
    if H.TabBackground and H.TabStroke == nil then
        G.TabStroke = ColorSequence.new(E(C(G.TabBackground), 0.4))
    end
end

local function G(H)
    if typeof(H) == "table" then
        return H
    elseif typeof(H) == "string" then
        local I = themes:FindFirstChild(string.lower(H))
        if I then
            return require(I)
        end
        log.warn("Rayfield: unknown theme '" .. H .. "', using default")
    elseif H ~= nil then
        log.warn([[Rayfield: invalid theme (expected a built-in name or a theme table), using default]])
    end
    return require(themes.default)
end

local function H(I)
    local default, K = table.clone(require(themes.default)), G(I)
    for L, M in K do
        default[L] = B(L, M)
    end
    if typeof(I) == "table" then
        F(default, K)
    end
    local L = if typeof(I) == "table" then I else nil
    if not (L and (L.Font or L.font)) then
        default.Font = variables.brandFont(Enum.FontWeight.Medium)
    end
    if not (L and (L.TitleFont or L.titleFont)) then
        default.TitleFont = variables.brandFont(Enum.FontWeight.SemiBold)
    end
    return default
end

function h.new(I)
    I = if typeof(I) == "table" then I else {}
    if I.translations or I.Translations then
        locale.register(I.translations or I.Translations)
    end
    if I.translator or I.Translator then
        locale.translator = I.translator or I.Translator
    end
    locale.setActive(I.locale or I.Locale or locale.detect())
    local default = I.fallbackFont or I.FallbackFont
    if default then
        variables.setFallbackFont(default)
    end
    local K = z(I.sidebarLayout or I.SidebarLayout)
    local L = setmetatable({
        name = I.name or I.Name or "Rayfield Window",
        subheading = I.subtitle or I.Subtitle,
        layout = K,
        size = w(K.mode),
        instances = {},
        connections = {},
        icon = I.icon or I.Icon,
        showName = I.showName or I.ShowName or "Rayfield",
        showIcon = I.showIcon or I.ShowIcon or constants.icons.rayfield,
        showIconOnly = I.showIconOnly or I.ShowIconOnly or false,
        profileText = I.profile or I.Profile,
        themeProperties = {},
        localeProperties = {},
        tabs = {},
        tabSections = {},
        tags = {},
        selectedTab = nil,
        theme = H(I.theme or I.Theme),
        controls = {},
        configuration = (function()
            local L = I.configuration or I.Configuration
            if not L then
                return {}
            end
            return {
                autoSave = L.autoSave or L.AutoSave,
                autoLoad = L.autoLoad or L.AutoLoad,
                fileName = L.fileName or L.FileName,
                customFolder = L.customFolder or L.CustomFolder,
            }
        end)(),
    }, h)
    L.Flags = setmetatable({}, {
        __index = function(M, N)
            local O = L.controls[N]
            return O and O.value
        end,
        __newindex = function(M, N, O)
            local P = L.controls[N]
            if not P then
                log.warn("Rayfield: no flag '" .. tostring(N) .. "' to set")
                return
            end
            P:Set(O)
        end,
        __iter = function()
            local M
            return function()
                local N
                M, N = next(L.controls, M)
                if M then
                    return M, N.value
                end
                return nil
            end
        end,
    })
    L.settings = {
        toggleKeybind = Enum.KeyCode.K,
        mouseOverride = true,
        keepOnScreen = true,
        welcomeToast = true,
        haptics = true,
        showProfile = true,
    }
    L.screenGui = L:Create("ScreenGui", {
        Name = variables.httpService:GenerateGUID(false),
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        Enabled = true,
        DisplayOrder = constants.displayOrder.window,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Parent = variables.guiContainer,
    })
    L.main = L:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Name = L.name,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.fromOffset((L.size.X.Offset - 50), 0),
        BackgroundTransparency = 1,
        Visible = false,
        Parent = L.screenGui,
    })
    L.drag = require(script.Parent.drag).new(L)
    L.windowCorner = L:Create("UICorner", { Parent = L.main }, { CornerRadius = "CornerRoundness" })
    L.windowStroke = L:Create("UIStroke", { Transparency = 1, Parent = L.main }, { Color = "SurfaceStroke" })
    L.windowGradient = L:Create(
        "UIGradient",
        { Rotation = 270, Offset = Vector2.new(0, -0.1), Parent = L.main },
        { Color = { "WindowColor", functions.toColorSequence } }
    )
    L.bottomFade = L:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.fromScale(1, 1),
        Size = L.layout.fadeSize,
        ZIndex = constants.zIndex.bottomFade,
        BackgroundTransparency = 1,
        Parent = L.main,
    })
    L.bottomFadeCorner = L:_roundCorners(L.bottomFade, L.layout.fadeCorners)
    L.bottomFadeGradient = L:Create("UIGradient", {
        Rotation = 270,
        Offset = Vector2.new(0, 0.2),
        Transparency = L.layout.fadeTransparency,
        Parent = L.bottomFade,
    }, {
        Color = {
            "WindowColor",
            function(M)
                return ColorSequence.new(functions.toColorSequence(M).Keypoints[1].Value)
            end,
        },
    })
    L.topbar = L:Create("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, L.layout.topbarHeight),
        Active = true,
        Parent = L.main,
    })
    L.topContainer = L:Create("Frame", {
        Size = UDim2.new(0, 300, 0, 24),
        Position = UDim2.new(0, 25, 0.5, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        Parent = L.topbar,
    })
    L.topContainerLayout = L:Create("UIListLayout", {
        Padding = UDim.new(0, 8),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = L.topContainer,
    })
    L.titleContainer = L:Create("Frame", {
        Size = UDim2.fromOffset(50, 24),
        Position = UDim2.new(0, 25, 0.5, 0),
        AutomaticSize = Enum.AutomaticSize.XY,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        Parent = L.topContainer,
    })
    L.titleContainerLayout = L:Create("UIListLayout", {
        Padding = UDim.new(0, 3),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = L.titleContainer,
    })
    if L.name then
        L.title = L:Create("TextLabel", {
            Text = locale.t(L.name),
            FontFace = variables.brandFont(Enum.FontWeight.Medium),
            Size = UDim2.fromOffset(50, 20),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 1,
            TextSize = 20,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            TextTransparency = 1,
            Parent = L.titleContainer,
        }, { FontFace = "Font", TextColor3 = "TitlingColor" })
    end
    if L.icon then
        L.topbarIcon = L:Create("ImageLabel", {
            Image = L.icon,
            BackgroundTransparency = 1,
            Size = UDim2.fromOffset(32, 32),
            ImageTransparency = 1,
            Parent = L.topContainer,
        }, { ImageColor3 = "TitlingColor" })
    end
    if L.subheading then
        L.subtitle = L:Create("TextLabel", {
            Text = locale.t(L.subheading),
            Size = UDim2.fromOffset(50, 12),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundTransparency = 1,
            TextSize = 12,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            TextTransparency = 1,
            Parent = L.titleContainer,
        }, { TextColor3 = "TitlingColor", FontFace = "Font" })
    end
    L.tagContainer = L:Create("Frame", {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 25, 0.5, 0),
        Size = UDim2.fromOffset(50, 24),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Visible = false,
        Parent = L.topContainer,
    })
    L.tagContainerLayout = L:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = L.tagContainer,
    })
    L.windowShadow = L:CreateGlow(L.main, "ShadowColor", 20, 1)
    L.elements = L:Create("Frame", {
        Size = UDim2.new(1, 0, 1, -L.layout.chromeHeight),
        Position = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(1, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent = L.main,
    })
    if L.layout.mode == "sidebar" then
        L.elementsCorner = L:_roundCorners(L.elements, L.layout.cardCorners)
        L.elementsStroke = L:Create(
            "UIStroke",
            { ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Transparency = 1, Parent = L.elements },
            { Color = "SurfaceStroke" }
        )
        L:Create("UIGradient", {
            Rotation = L.layout.cardStrokeRotation,
            Transparency = L.layout.cardStrokeTransparency,
            Parent = L.elementsStroke,
        })
    end
    L.elementsLayout = L:Create("UIPageLayout", {
        Padding = UDim.new(0, 0),
        FillDirection = L.layout.pageDirection,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        ScrollWheelInputEnabled = false,
        GamepadInputEnabled = false,
        TouchInputEnabled = false,
        EasingStyle = Enum.EasingStyle.Exponential,
        TweenTime = 0.4,
        Parent = L.elements,
    })
    if L.layout.mode == "sidebar" then
        sidebar.build(L, L.layout)
        sidebar.applyWidth(L, layouts.railWidthFor(L.layout, L.size.X.Offset))
    else
        L.tabList = L:Create("ScrollingFrame", {
            Name = "Tabs",
            Active = true,
            Size = UDim2.new(1, 0, 0, L.layout.tabStripHeight),
            Position = UDim2.new(0.5, 0, 0, L.layout.tabStripTop),
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundTransparency = 1,
            AutomaticCanvasSize = Enum.AutomaticSize.X,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            ScrollBarThickness = 0,
            ScrollBarImageTransparency = 1,
            ScrollingDirection = Enum.ScrollingDirection.X,
            Parent = L.main,
        })
        L.tabListLayout = L:Create("UIListLayout", {
            Padding = UDim.new(0, 7),
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = L.tabList,
        })
        L:Create(
            "UIPadding",
            { PaddingLeft = UDim.new(0, 22), PaddingRight = UDim.new(0, 10), Parent = L.tabList }
        )
    end
    L.actionContainer = L:Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, 24),
        Position = UDim2.new(1, -20, 0.5, 0),
        BackgroundTransparency = 1,
        Parent = L.topbar,
    })
    L.actionsListLayout = L:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = L.actionContainer,
    })
    L.rfSettings = L:CreateTab({
        name = "Rayfield Settings",
        customOrder = 1000,
        neglectSelector = true,
        forgetState = true,
    })
    require(script.Parent.action).new(L, {
        name = "Close",
        icon = constants.icons.close,
        order = 1,
        callback = function()
            L:ToggleHide()
        end,
    })
    L.minimiseAction = require(script.Parent.action).new(L, {
        name = "Minimise",
        icon = constants.icons.minimise,
        order = 2,
        callback = function()
            L:ToggleMinimise()
        end,
    })
    L.settingsAction = require(script.Parent.action).new(L, {
        name = "Settings",
        icon = constants.icons.settings,
        order = 3,
        linkedTab = L.rfSettings,
        callback = function()
            L.rfSettings:Select()
        end,
    })
    search.build(L)
    L:_applyRailWidth()
    L.unloaded = false
    L.minimised = false
    L.hidden = true
    L.animating = false
    L._revealing = false
    L.hasShownOnce = false
    L._collapsedShown = false
    L:LoadSettings()
    if L.layout.mode == "sidebar" then
        sidebar.reflowProfile(L)
        sidebar.setSubtitle(L, L.profileText)
    end
    HapticEngine.setContainer(L.screenGui)
    HapticEngine.setEnabled(L.settings.haptics)
    chrome.buildCollapsedFace(L)
    L:_bindKeybind()
    L:_bindMouseOverride()
    L:_bindTopbarDrag()
    L:_watchViewport()
    L:_buildSettingsUI()
    L:_syncLiveAnimation()
    return L
end

function h._syncLiveAnimation(self)
    if not self.theme.LiveAnimation then
        self._liveAnimating = false
        return
    end
    if self._liveAnimating then
        return
    end
    self._liveAnimating = true
    self._liveGeneration = (self._liveGeneration or 0) + 1
    local default = self._liveGeneration
    task.spawn(function()
        local K, L = true, TweenInfo.new(10, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        while self._liveGeneration == default and self._liveAnimating and not self.unloaded do
            local M = variables.tweenService:Create(
                self.windowGradient,
                L,
                { Offset = Vector2.new(if K then 0.4 else -0.2, 0), Rotation = (if K then 220 else 280) }
            )
            self._liveTween = M
            M:Play()
            M.Completed:Wait()
            K = not K
        end
        if self._liveGeneration == default then
            self._liveAnimating = false
            self._liveTween = nil
        end
    end)
end

function h.ChangeTheme(self, default)
    local K = if typeof(default) == "table" then default else H(default)
    for L, M in K do
        self.theme[L] = B(L, M)
    end
    if typeof(default) == "table" then
        F(self.theme, K)
    end
    for L, M in self.themeProperties do
        for N, O in M do
            local P = if typeof(O) == "table" then O[2](self.theme[O[1]]) else self.theme[O]
            if typeof(P) == "Color3" or typeof(P) == "number" then
                variables.tweenService
                    :Create(
                        L,
                        TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { [N] = P }
                    )
                    :Play()
            else
                L[N] = P
            end
        end
    end
    if self.hidden then
        self._themeRefreshPending = true
    else
        self:_refreshElementThemes()
    end
    self:_syncLiveAnimation()
end

function h._refreshElementThemes(self)
    for default, K in self.tabs do
        for L, M in K.elements do
            if M._refreshTheme then
                M:_refreshTheme()
            end
        end
    end
end

function h.CreateTab(self, default)
    assert(not self.unloaded, "Cannot create a tab on an unloaded window.")
    local K = require(script.Parent.tab).new(self, default)
    table.insert(self.tabs, K)
    if not K.neglectSelector then
        local L = true
        for M, N in self.tabs do
            if N ~= K and not N.neglectSelector then
                L = false
                break
            end
        end
        if L then
            K:Select(true)
        end
        if not self.hidden and not self.minimised then
            K.topbarItem.Visible = true
            K:_applyVisual(
                if self.selectedTab == K then "selected" else "unselected",
                TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
            )
        end
    end
    return K
end

function h.CreateSection(self, default)
    assert(not self.unloaded, "Cannot create a section on an unloaded window.")
    local K = require(script.Parent.tabSection).new(self, default)
    table.insert(self.tabSections, K)
    if not K.inert and not self.hidden and not self.minimised then
        K:_setVisible(true)
        K:_setShown(true, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out))
    end
    return K
end

function h._setTabSectionsShown(self, default, K)
    for L, M in self.tabSections do
        M:_setShown(default, K)
    end
end

function h._setTabSectionsVisible(self, default)
    for K, L in self.tabSections do
        L:_setVisible(default)
    end
end

function h.CreateTag(self, default)
    assert(not self.unloaded, "Cannot create a tag on an unloaded window.")
    local K = require(script.Parent.tag).new(self, default)
    table.insert(self.tags, K)
    return K
end

function h._registerControl(self, default)
    if not default.flag or default.flag == "" or default.forgetState then
        return
    end
    local K = default.flag
    if self.controls[K] then
        local L = 2
        while self.controls[K .. L] do
            L += 1
        end
        K = K .. L
        log.warn(
            "Rayfield: duplicate config flag '"
                .. default.flag
                .. "', saving this one as '"
                .. K
                .. "'. Set a unique flag to keep it stable across sessions."
        )
    end
    default.flag = K
    self.controls[K] = default
    return K
end

function h._restoreLate(self, default)
    if not self._loadedConfig or not default.flag or default.forgetState then
        return
    end
    local K = self._loading
    self._loading = true
    persistence.applyTo(default, self._loadedConfig[default.flag])
    self._loading = K
end

function h._persist(self, default)
    if default.flag and not default.forgetState and self.configuration.autoSave and not self._loading then
        task.spawn(self.Save, self)
    end
end

function h._unregisterControl(self, default)
    if default.flag and self.controls[default.flag] == default then
        self.controls[default.flag] = nil
    end
end

function h._keybindUsing(self, default, K)
    if typeof(default) ~= "EnumItem" or default == Enum.KeyCode.Unknown then
        return nil
    end
    for L, M in self.tabs do
        for N, O in M.elements do
            if O ~= K and O.__type == "Keybind" and O.value == default then
                return O
            end
        end
    end
    return nil
end

function h.Notify(self, default)
    if self.unloaded then
        return
    end
    if not self.notifications then
        self.notifications = self:Create("Frame", {
            Name = "Notifications",
            Size = UDim2.new(0, 300, 0, 800),
            Position = UDim2.new(1, -20, 1, -20),
            AnchorPoint = Vector2.new(1, 1),
            BackgroundTransparency = 1,
            Parent = self.screenGui,
        })
        self:Create("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0),
            Parent = self.notifications,
        })
    end
    return require(script.Parent.notification).new(self, default)
end

function h.Toast(self, default)
    if self.unloaded then
        return
    end
    default = if typeof(default) == "table" then default else {}
    local K = default.position or default.Position or "Top"
    local L = typeof(K) ~= "string" or K:lower() ~= "bottom"
    default.position = if L then "Top" else "Bottom"
    local M = if L then "_toastsTop" else "_toastsBottom"
    local N = self[M]
    if not N then
        N = self:Create("Frame", {
            Name = "Toasts",
            Size = UDim2.new(0, p, 1, -24),
            Position = if L then m else UDim2.new(0.5, 0, 1, -12),
            AnchorPoint = if L then Vector2.new(0.5, 0) else Vector2.new(0.5, 1),
            BackgroundTransparency = 1,
            ZIndex = constants.zIndex.toast,
            Parent = self.screenGui,
        })
        self:Create("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            VerticalAlignment = if L then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 0),
            Parent = N,
        })
        self[M] = N
        if L then
            D(self, false)
        end
    end
    return require(script.Parent.toast).new(self, default, N)
end

function h.Popup(self, default)
    if self.unloaded then
        return
    end
    return require(script.Parent.popup).new(self, default)
end

function h.Hide(self)
    if self.animating or self.hidden then
        return
    end
    if self._searching then
        search.close(self, { showTabs = false, jumpTo = self.selectedTab and self.selectedTab.tabPage })
    end
    if self._recordingKeybind then
        self._recordingKeybind:_stopRecording()
    end
    self.animating = true
    self._revealing = true
    self.hidden = true
    self.collapsedInteract.Visible = false
    if self.minimised then
        self.minimised = false
        image.assign(self.minimiseAction.iconLabel, "Image", constants.icons.minimise)
    end
    self._restorePosition = self.main.Position
    local default, K = self:_collapsedRect()
    local L, M, N, O =
        TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
        TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
        TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    variables.tweenService
        :Create(self.drag.dragCosmetic, L, { Size = UDim2.fromOffset(0, 4), BackgroundTransparency = 1 })
        :Play()
    task.delay(0.18, function()
        if not self.hidden then
            return
        end
        self.drag.drag.Visible = false
    end)
    self:_fadeSurfaces(false, L)
    if self.title then
        variables.tweenService:Create(self.title, L, { TextTransparency = 1 }):Play()
    end
    if self.subtitle then
        variables.tweenService:Create(self.subtitle, L, { TextTransparency = 1 }):Play()
    end
    if self.topbarIcon then
        variables.tweenService:Create(self.topbarIcon, L, { ImageTransparency = 1 }):Play()
    end
    for P, Q in ipairs(self.actionContainer:GetChildren()) do
        if Q:IsA("Frame") then
            variables.tweenService:Create(Q.ImageLabel, L, { ImageTransparency = 1 }):Play()
        end
    end
    for P, Q in self.tags do
        Q:_setShown(false, L)
    end
    for P, Q in pairs(self.tabs) do
        if not Q.neglectSelector and Q.topbarItem then
            Q:_applyVisual("hidden", L)
        end
    end
    self:_setTabSectionsShown(false, L)
    self:_fadeSelectedElementsOut()
    local P = variables.tweenService:Create(self.main, M, { Size = K, Position = default })
    P.Completed:Connect(function()
        if self.unloaded or not self.hidden then
            return
        end
        self._collapsedShown = true
        D(self, true)
        self.collapsedInteract.Visible = true
        self.animating = false
        self._revealing = false
    end)
    P:Play()
    variables.tweenService:Create(self.windowCorner, N, { CornerRadius = UDim.new(1, 0) }):Play()
    task.delay(0.18, function()
        if not self.hidden then
            return
        end
        self.topbar.Visible = false
        self:_setContentVisible(false)
        chrome.setCollapsedShown(self, true, O)
    end)
end

function h.ToggleHide(self)
    if self.animating then
        return
    end
    if self.hidden then
        self:Show()
    else
        self:Hide()
    end
end

function h.ToggleMinimise(self)
    if self.animating or self.hidden then
        return
    end
    if self._searching then
        search.close(self, { showTabs = true })
    end
    self.animating = true
    local default, K =
        TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
        TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
    if self.minimised then
        self.minimised = false
        image.assign(self.minimiseAction.iconLabel, "Image", constants.icons.minimise)
        variables.tweenService:Create(self.main, default, { Size = self.size }):Play()
        self:_fadeSurfaces(true, K)
        variables.tweenService
            :Create(self.drag.drag, default, {
                Position = UDim2.new(
                    self.main.Position.X.Scale,
                    self.main.Position.X.Offset,
                    self.main.Position.Y.Scale,
                    self.main.Position.Y.Offset + self.size.Y.Offset / 2 + 15
                ),
            })
            :Play()
        task.delay(0.2, function()
            if self.minimised or self.hidden then
                return
            end
            self:_setContentVisible(true)
            for L, M in pairs(self.tabs) do
                if not M.neglectSelector and M.topbarItem then
                    M.topbarItem.Visible = true
                    M:_applyVisual(if self.selectedTab == M then "selected" else "unselected", K)
                end
            end
            self:_setTabSectionsVisible(true)
            self:_setTabSectionsShown(true, K)
            self:_revealElements(0.035, 0.4)
        end)
        task.delay(0.5, function()
            self.animating = false
        end)
    else
        self.minimised = true
        image.assign(self.minimiseAction.iconLabel, "Image", constants.icons.maximise)
        self:_fadeSelectedElementsOut()
        for L, M in pairs(self.tabs) do
            if not M.neglectSelector and M.topbarItem then
                M:_applyVisual("hidden", K)
            end
        end
        self:_setTabSectionsShown(false, K)
        task.delay(0.3, function()
            if not self.minimised then
                return
            end
            self:_setContentVisible(false)
            for L, M in pairs(self.tabs) do
                if not M.neglectSelector and M.topbarItem then
                    M.topbarItem.Visible = false
                end
            end
            self:_setTabSectionsVisible(false)
        end)
        self:_fadeSurfaces(false, K)
        variables.tweenService
            :Create(
                self.main,
                default,
                { Size = UDim2.fromOffset(self.size.X.Offset, self.layout.topbarHeight) }
            )
            :Play()
        variables.tweenService
            :Create(self.drag.drag, default, {
                Position = UDim2.new(
                    self.main.Position.X.Scale,
                    self.main.Position.X.Offset,
                    self.main.Position.Y.Scale,
                    self.main.Position.Y.Offset + self.layout.topbarHeight / 2 + 15
                ),
            })
            :Play()
        task.delay(0.5, function()
            self.animating = false
        end)
    end
end

function h._syncDragBar(self)
    local default = self.drag and self.drag.drag
    if not default then
        return
    end
    local K, L = self.main.Position, self.size.Y.Offset / 2 + 15
    default.Position = UDim2.new(K.X.Scale, K.X.Offset, K.Y.Scale, K.Y.Offset + L)
end

function h._clampedPosition(self, default: UDim2): UDim2
    if not self.settings or not self.settings.keepOnScreen then
        return default
    end
    if default.X.Scale ~= 0 or default.Y.Scale ~= 0 then
        return default
    end
    local K, L, M, N = self.screenGui.AbsoluteSize, self.size.X.Offset / 2, self.size.Y.Offset / 2, 8
    local O, P =
        math.clamp(default.X.Offset, L + N, math.max(L + N, K.X - L - N)),
        math.clamp(default.Y.Offset, M + N, math.max(M + N, K.Y - M - N))
    if O == default.X.Offset and P == default.Y.Offset then
        return default
    end
    return UDim2.fromOffset(O, P)
end

function h._clampToScreen(self)
    self.main.Position = self:_clampedPosition(self.main.Position)
end

function h._applyWindowSize(self)
    if self.unloaded then
        return
    end
    local default = w(self.layout.mode)
    local K = default ~= self.size
    self.size = default
    self:_applyRailWidth()
    if self.hidden or self.minimised or self.animating or self._revealing then
        self._pendingResize = self._pendingResize or K
        return
    end
    if not K and not self._pendingResize then
        return
    end
    self._pendingResize = false
    self.main.Size = default
    self:_clampToScreen()
    self:_syncDragBar()
end

function h._applyRailWidth(self)
    if self.layout.mode ~= "sidebar" then
        return
    end
    sidebar.applyWidth(self, layouts.railWidthFor(self.layout, self.size.X.Offset))
end

function h._watchViewport(self)
    local default, K: RBXScriptConnection? = false
    local function L()
        if default then
            return
        end
        default = true
        task.defer(function()
            default = false
            self:_applyWindowSize()
        end)
    end
    local function M()
        if K then
            self:Disconnect(K)
            K = nil
        end
        local N = variables.workspace.CurrentCamera
        if N then
            K = self:Connect(N:GetPropertyChangedSignal("ViewportSize"), L)
        end
        L()
    end
    self:Connect(variables.workspace:GetPropertyChangedSignal("CurrentCamera"), M)
    M()
    local N = 0
    self:Connect(variables.runService.Heartbeat, function(O: number)
        N += O
        if N < v then
            return
        end
        N = 0
        self:_applyWindowSize()
    end)
end

function h._bindKeybind(self)
    self:Connect(variables.userInputService.InputBegan, function(default, K)
        if K or self._recordingKeybind then
            return
        end
        if
            default.KeyCode == self.settings.toggleKeybind
            or default.UserInputType == self.settings.toggleKeybind
        then
            self:ToggleHide()
        end
    end)
end

function h._bindMouseOverride(self)
    local default = variables.userInputService
    local function K()
        return self.settings.mouseOverride and not self.hidden and not self.minimised
    end
    local function L()
        if not K() then
            return
        end
        if default:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            return
        end
        if default.MouseBehavior ~= Enum.MouseBehavior.Default then
            default.MouseBehavior = Enum.MouseBehavior.Default
        end
        if not default.MouseIconEnabled then
            default.MouseIconEnabled = true
        end
    end
    self:Connect(default:GetPropertyChangedSignal("MouseBehavior"), L)
    self:Connect(default:GetPropertyChangedSignal("MouseIconEnabled"), L)
    self:Connect(default.InputEnded, function(M)
        if M.UserInputType == Enum.UserInputType.MouseButton2 then
            L()
        end
    end)
    self._freeMouse = L
end

function h._bindTopbarDrag(self)
    local default, K, L, M = variables.userInputService, false, Vector2.zero, Vector2.zero
    if self.screenGui and self.screenGui.IgnoreGuiInset then
        M = variables.guiService:GetGuiInset()
    end
    local function N()
        local O = default:GetMouseLocation() + L + M
        local P, Q = O.X, O.Y
        if self.settings and self.settings.keepOnScreen then
            local R, S, T = self.main.AbsoluteSize, self.screenGui.AbsoluteSize, 8
            local U, V = R.X / 2, R.Y / 2
            P = math.clamp(P, U + T, math.max(U + T, S.X - U - T))
            Q = math.clamp(Q, V + T, math.max(V + T, S.Y - V - T))
        end
        return UDim2.fromOffset(P, Q)
    end
    local function O(P, Q)
        for R, S in { self.tabList, self.actionContainer } do
            local T, U = S.AbsolutePosition, S.AbsoluteSize
            if P >= T.X and P <= T.X + U.X and Q >= T.Y and Q <= T.Y + U.Y then
                return true
            end
        end
        return false
    end
    self:Connect(self.topbar.InputBegan, function(P, Q)
        if Q then
            return
        end
        local R = P.UserInputType.Name
        if R ~= "MouseButton1" and R ~= "Touch" then
            return
        end
        if O(P.Position.X, P.Position.Y) then
            return
        end
        if not self:_interactive() then
            return
        end
        K = true
        if self.screenGui and self.screenGui.IgnoreGuiInset then
            M = variables.guiService:GetGuiInset()
        end
        L = self.main.AbsolutePosition
            + self.main.AbsoluteSize * self.main.AnchorPoint
            - default:GetMouseLocation()
    end)
    self:Connect(default.InputEnded, function(P)
        local Q = P.UserInputType.Name
        if Q == "MouseButton1" or Q == "Touch" then
            K = false
        end
    end)
    self:Connect(default.WindowFocusReleased, function()
        K = false
    end)
    self:Connect(variables.runService.RenderStepped, function()
        if not K then
            return
        end
        if not self:_interactive() then
            K = false
            return
        end
        self.main.Position = N()
        if self.drag and self.drag.drag then
            local P = self.main.Position
            self.drag.drag.Position =
                UDim2.new(P.X.Scale, P.X.Offset, P.Y.Scale, P.Y.Offset + (self.main.Size.Y.Offset / 2 + 15))
        end
    end)
end

function h._buildSettingsUI(self)
    self.rfSettings:CreateSection({ name = "General" })
    self.rfSettings:CreateKeybind({
        name = "Toggle Keybind",
        icon = constants.icons.search,
        value = self.settings.toggleKeybind,
        isMenuToggle = true,
        onChanged = function(default)
            self.settings.toggleKeybind = default
            self:SaveSettings()
        end,
    })
    self.rfSettings:CreateToggle({
        name = "Unlock cursor while open",
        description = [[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],
        value = self.settings.mouseOverride,
        callback = function(default)
            self.settings.mouseOverride = default
            self:SaveSettings()
        end,
    })
    self.rfSettings:CreateToggle({
        name = "Welcome toast",
        description = [[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],
        value = self.settings.welcomeToast,
        callback = function(default)
            self.settings.welcomeToast = default
            self:SaveSettings()
        end,
    })
    self.rfSettings:CreateToggle({
        name = "Haptics",
        description = [[A subtle tap as you interact, on devices that support haptics.]],
        value = self.settings.haptics,
        callback = function(default)
            self.settings.haptics = default
            HapticEngine.setEnabled(default)
            self:SaveSettings()
        end,
    })
    self.rfSettings:CreateSection({ name = "Window" })
    if self.layout.mode == "sidebar" and self.profile then
        self.rfSettings:CreateToggle({
            name = "Show profile",
            description = [[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
            value = self.settings.showProfile,
            callback = function(default)
                sidebar.setProfileEnabled(self, default)
                self:SaveSettings()
            end,
        })
    end
    self.rfSettings:CreateToggle({
        name = "Keep window on screen",
        description = [[Stops the window being dragged off the edge of the screen and lost.]],
        value = self.settings.keepOnScreen,
        callback = function(default)
            self.settings.keepOnScreen = default
            self:SaveSettings()
        end,
    })
    self.rfSettings:CreateButton({
        name = "Reset Window Position",
        callback = function()
            variables.tweenService
                :Create(
                    self.main,
                    TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    { Position = UDim2.new(0.5, 0, 0.5, 0) }
                )
                :Play()
            variables.tweenService
                :Create(
                    self.drag.drag,
                    TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    { Position = UDim2.new(0.5, 0, 0.5, self.size.Y.Offset / 2 + 15) }
                )
                :Play()
        end,
    })
    if next(self.configuration) ~= nil then
        self.rfSettings:CreateSection({ name = "Configurations" })
        local default, K, L, autoPin = self:ListConfigs()[1]
        local function M()
            local N = self:ListConfigs()
            K:Refresh(N)
            if default and not table.find(N, default) then
                default = N[1]
            end
            if default then
                K:Set(default, true)
            end
        end
        K = self.rfSettings:CreateDropdown({
            name = "Saved Configurations",
            icon = constants.icons.config,
            options = self:ListConfigs(),
            value = default,
            placeholder = "No saved configurations",
            callback = function(N)
                default = N
                if autoPin then
                    autoPin:Set(self.settings.autoloadConfig == N, true)
                end
            end,
        })
        autoPin = self.rfSettings:CreateToggle({
            name = "Load this configuration on start",
            description = [[Applies the selected configuration every time the script runs,]]
                .. [[ instead of restoring whatever was last in use.]],
            value = self.settings.autoloadConfig ~= nil and self.settings.autoloadConfig == default,
            forgetState = true,
            callback = function(on)
                if on and default and default ~= "" then
                    self.settings.autoloadConfig = default
                else
                    self.settings.autoloadConfig = nil
                end
                self:SaveSettings()
            end,
        })
        L = self.rfSettings:CreateInput({
            name = "Configuration Name",
            description = [[Name a new configuration, or leave blank to overwrite the selected one.]],
            placeholder = "e.g. PvP Loadout",
            clearOnFocus = false,
        })
        local N = self.rfSettings:CreateGroup()
        N:CreateButton({
            name = "Save",
            icon = constants.icons.config,
            callback = function()
                local O = L.value
                if O == "" then
                    O = default
                end
                if not O or O == "" then
                    self:Toast({ title = locale.resolve("Name your configuration first") })
                    return
                end
                if self:Save(O) then
                    L:Set("")
                    default = O
                    M()
                    self:Toast({
                        title = locale.resolve("Saved configuration"),
                        subtitle = O,
                        icon = constants.icons.config,
                    })
                else
                    self:Toast({
                        title = locale.resolve("Couldn't save configuration"),
                        subtitle = O,
                    })
                end
            end,
        })
        N:CreateButton({
            name = "Load",
            callback = function()
                if not default or default == "" then
                    self:Toast({ title = locale.resolve("Pick a configuration to load") })
                    return
                end
                if self:_applyNamedConfig(default) then
                    self:Toast({
                        title = locale.resolve("Loaded configuration"),
                        subtitle = default,
                    })
                else
                    self:Toast({ title = locale.resolve("Couldn't load configuration"), subtitle = default })
                end
            end,
        })
        N:CreateButton({
            name = "Delete",
            callback = function()
                local O = default
                if not O or O == "" then
                    self:Toast({ title = locale.resolve("Pick a configuration to delete") })
                    return
                end
                if self:DeleteConfig(O) then
                    if self.settings.autoloadConfig == O then
                        self.settings.autoloadConfig = nil
                        self:SaveSettings()
                    end
                    M()
                    self:Toast({ title = locale.resolve("Deleted configuration"), subtitle = O })
                else
                    self:Toast({ title = locale.resolve("Couldn't delete configuration"), subtitle = O })
                end
            end,
        })
    end
end

function h.SetProfile(self, default)
    self.profileText = default
    sidebar.setSubtitle(self, default)
end

function h.SaveSettings(I)
    return persistence.saveSettings(I)
end

function h.LoadSettings(I)
    return persistence.loadSettings(I)
end

function h._roundCorners(self, default, K)
    if not K or not y then
        return self:Create("UICorner", { Parent = default }, { CornerRadius = "CornerRoundness" })
    end
    local L, M = { Parent = default }, {}
    for N, O in x do
        L[O] = UDim.new(0, 0)
    end
    for N, O in K do
        L[O] = nil
        M[O] = "CornerRoundness"
    end
    return self:Create("UICorner", L, M)
end

function h._setElementLocked(self, default, K, L)
    K = K == true
    local M = default.locked == true
    if M == K and not (K and L) then
        return
    end
    default.locked = K
    if not default.lockScrim then
        self:_buildLockScrim(default)
    end
    local N = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    if K then
        default.lockScrim.Visible = true
    end
    variables.tweenService
        :Create(default.lockScrim, N, { BackgroundTransparency = if K then r else 1 })
        :Play()
    if not K then
        task.delay(N.Time, function()
            if not default.locked and default.lockScrim then
                default.lockScrim.Visible = false
            end
        end)
    end
    local O = default.descriptor
    if not O then
        return
    end
    if K then
        default._descriptionBefore = default._descriptionBefore or O.titleLabel.Text
        O.titleLabel.Text = locale.resolve(L or "This element is locked.")
    elseif default._descriptionBefore then
        O.titleLabel.Text = default._descriptionBefore
        default._descriptionBefore = nil
    end
    variables.tweenService:Create(O.titleLabel, N, { TextTransparency = if K then s else 0.7 }):Play()
end

function h._buildLockScrim(self, default)
    default.lockScrim = self:Create("TextButton", {
        Name = "ElementLock",
        Active = true,
        AutoButtonColor = false,
        Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
        Text = "",
        TextTransparency = 1,
        ZIndex = constants.zIndex.elementLock,
        Visible = false,
        BackgroundTransparency = 1,
        Parent = default.main,
    }, { BackgroundColor3 = { "WindowColor", C } })
    self:Create("UICorner", { Parent = default.lockScrim }, { CornerRadius = "ElementCornerRadius" })
end

function h._setContentVisible(self, default)
    self.elements.Visible = default
    self.tabList.Visible = default
    if self.sidebar then
        self.sidebar.Visible = default
    end
end

function h._fadeSurfaces(self, default, K)
    local L = {
        [self.windowShadow] = { Transparency = if default then 0.6 else 1 },
        [self.windowStroke] = { Transparency = if default then 0.95 else 1 },
        [self.bottomFade] = {
            BackgroundTransparency = if default then 0 else 1,
        },
    }
    if self.elementsStroke then
        L[self.elements] = { BackgroundTransparency = if default then self.layout.cardTransparency else 1 }
        L[self.elementsStroke] = { Transparency = if default then 0 else 1 }
    end
    for M, N in L do
        if K then
            variables.tweenService:Create(M, K, N):Play()
        else
            for O, P in N do
                M[O] = P
            end
        end
    end
    sidebar.setProfileShown(self, default, K)
end

function h._fadeSelectedElementsOut(self)
    if self.selectedTab then
        for default, K in ipairs(self.selectedTab.elements) do
            K:_setShown(false, true)
        end
    end
end

function h._revealElements(self, default, K)
    for L, M in pairs(self.tabs) do
        if M ~= self.selectedTab then
            for N, O in ipairs(M.elements) do
                O:_setShown(true, false)
            end
        end
    end
    local L = self.selectedTab
    if not L then
        return
    end
    local M = L.tabPage
    local N = M.AbsolutePosition.Y
    local O, P, Q = N + M.AbsoluteWindowSize.Y, math.floor(K / default), 0
    for R, S in ipairs(L.elements) do
        local T = S.main.AbsolutePosition.Y
        local U = (T + S.main.AbsoluteSize.Y) > N and T < O
        if U then
            S:_setShown(true, true)
            Q += 1
            if Q <= P then
                task.wait(default)
            end
        else
            S:_setShown(true, false)
        end
    end
end

function h.Show(self)
    if self.animating or not self.hidden then
        return
    end
    self.animating = true
    self._revealing = true
    if self.configuration.autoLoad and not self._autoLoaded then
        self._autoLoaded = true
        -- A pinned configuration wins over the default file. If it has been
        -- deleted since, fall back rather than starting with nothing applied.
        local pinned = self.settings.autoloadConfig
        if pinned and not table.find(self:ListConfigs(), pinned) then
            pinned = nil
            self.settings.autoloadConfig = nil
            self:SaveSettings()
        end
        local default, K = pcall(self.Load, self, pinned)
        if not default then
            log.warn("Rayfield: Failed to load configuration - " .. tostring(K))
        end
    end
    self.hidden = false
    self.minimised = false
    if self._themeRefreshPending then
        self._themeRefreshPending = false
        self:_refreshElementThemes()
    end
    self.collapsedInteract.Visible = false
    if self._freeMouse then
        self._freeMouse()
    end
    if self.hasShownOnce then
        self:_quickRestore()
    else
        self.hasShownOnce = true
        self:_firstShow()
    end
end

function h._quickRestore(self)
    local default = self:_clampedPosition(self._restorePosition or UDim2.new(0.5, 0, 0.5, 0))
    self._restorePosition = default
    local K, L, M =
        TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
        TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
        TweenInfo.new(0.28, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
    chrome.setCollapsedShown(
        self,
        false,
        TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    )
    local N = variables.tweenService:Create(self.main, K, { Size = self.size, Position = default })
    N.Completed:Connect(function()
        if self.hidden or self.unloaded then
            return
        end
        self._collapsedShown = false
        D(self, true)
    end)
    N:Play()
    variables.tweenService:Create(self.windowCorner, L, { CornerRadius = self.theme.CornerRoundness }):Play()
    task.delay(0.22, function()
        self.topbar.Visible = true
        self:_setContentVisible(true)
        self:_fadeSurfaces(true, M)
        if self.topbarIcon then
            variables.tweenService
                :Create(self.topbarIcon, M, {
                    ImageTransparency = 0,
                })
                :Play()
        end
        if self.title then
            variables.tweenService:Create(self.title, M, { TextTransparency = 0 }):Play()
        end
        if self.subtitle then
            variables.tweenService:Create(self.subtitle, M, { TextTransparency = 0.7 }):Play()
        end
        for O, P in ipairs(self.actionContainer:GetChildren()) do
            if P:IsA("Frame") then
                variables.tweenService:Create(P.ImageLabel, M, { ImageTransparency = 0.6 }):Play()
            end
        end
        if self.settingsAction and self.selectedTab == self.rfSettings then
            variables.tweenService
                :Create(self.settingsAction.iconLabel, M, {
                    ImageTransparency = 0.2,
                })
                :Play()
        end
        for O, P in self.tags do
            P:_setShown(true, M)
        end
        for O, P in pairs(self.tabs) do
            if not P.neglectSelector and P.topbarItem then
                P.topbarItem.Visible = true
                P:_applyVisual(if self.selectedTab == P then "selected" else "unselected", M)
            end
        end
        self:_setTabSectionsVisible(true)
        self:_setTabSectionsShown(true, M)
        self:_revealElements(0.035, 0.4)
    end)
    task.delay(0.22, function()
        self.drag.drag.Position = UDim2.new(
            default.X.Scale,
            default.X.Offset,
            default.Y.Scale,
            default.Y.Offset + self.size.Y.Offset / 2 + 15
        )
        self.drag.dragCosmetic.Size = UDim2.fromOffset(0, 4)
        self.drag.dragCosmetic.BackgroundTransparency = 1
        self.drag.drag.Visible = true
        variables.tweenService
            :Create(
                self.drag.dragCosmetic,
                K,
                { Size = UDim2.fromOffset(100, 4), BackgroundTransparency = 0.7 }
            )
            :Play()
    end)
    task.delay(0.6, function()
        self.animating = false
        self._revealing = false
    end)
end

function h._firstShow(self)
    self:_setContentVisible(true)
    self.drag.drag.Visible = false
    self.main.Visible = true
    variables.tweenService
        :Create(
            self.main,
            TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
            { BackgroundTransparency = 0, Size = self.size }
        )
        :Play()
    task.wait(0.85)
    self:_fadeSurfaces(true, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))
    task.wait(0.3)
    if self.icon then
        variables.tweenService
            :Create(
                self.topbarIcon,
                TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                { ImageTransparency = 0 }
            )
            :Play()
    end
    if self.title then
        variables.tweenService
            :Create(self.title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                TextTransparency = 0,
            })
            :Play()
    end
    task.wait(0.1)
    if self.subtitle then
        variables.tweenService
            :Create(
                self.subtitle,
                TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                { TextTransparency = 0.7 }
            )
            :Play()
    end
    for default, K in ipairs(self.actionContainer:GetChildren()) do
        if K:IsA("Frame") then
            task.wait(0.02)
            variables.tweenService
                :Create(
                    K.ImageLabel,
                    TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    { ImageTransparency = 0.6 }
                )
                :Play()
        end
    end
    for default, K in self.tags do
        K:_setShown(true, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out))
    end
    task.wait(0.2)
    task.spawn(function()
        local default = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        self:_setTabSectionsVisible(true)
        self:_setTabSectionsShown(true, default)
        local K = 0
        for L, M in pairs(self.tabs) do
            if not M.neglectSelector then
                M.topbarItem.Visible = true
                M:_applyVisual(if self.selectedTab == M then "selected" else "unselected", default)
                M:_spinGradients()
                K += 1
                if K <= u then
                    task.wait(t)
                end
            end
        end
    end)
    self:_revealElements(0.03, 2)
    task.wait(1)
    self:_syncDragBar()
    self.drag.drag.Visible = true
    variables.tweenService
        :Create(
            self.drag.dragCosmetic,
            TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            { BackgroundTransparency = 0.7 }
        )
        :Play()
    variables.tweenService
        :Create(
            self.drag.dragCosmetic,
            TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {
                Size = UDim2.fromOffset(100, 4),
            }
        )
        :Play()
    self.animating = false
    self._revealing = false
    local default = variables.localPlayer
    if default and self.settings.welcomeToast and chrome.isNewUser() then
        self:Toast({
            title = default.DisplayName,
            subtitle = locale.resolve("Signed in as"),
            subtitleAbove = true,
            avatar = default.UserId,
            minWidth = 220,
        })
    end
end

function h.GetPath(I)
    return persistence.getPath(I)
end

function h.Save(I, default)
    if default ~= nil and (type(default) ~= "string" or default == "") then
        return false
    end
    return persistence.save(I, default)
end

function h.Load(I, default)
    if default ~= nil and (type(default) ~= "string" or default == "") then
        return false
    end
    return persistence.load(I, default)
end

function h._applyNamedConfig(self, default)
    if not self:Load(default) then
        return false
    end
    local K, L = persistence.getPath(self)
    self._loadedConfigPath = L
    self:Save()
    return true
end

function h.ListConfigs(I)
    return persistence.list(I)
end

function h.DeleteConfig(I, default)
    return persistence.delete(I, default)
end

function h.Get(self, default)
    local K = self.controls[default]
    return K and K.value
end

function h.Set(self, default, K)
    local L = self.controls[default]
    if not L then
        return false
    end
    L:Set(K)
    return true
end

function h._jumpTo(self, default)
    if default then
        self.elementsLayout:JumpTo(default)
    end
end

function h.Navigate(self, default)
    if default == nil then
        return
    end
    local K
    for L, M in self.tabs do
        if M == default or M.name == default or M.tabPage == default then
            K = M
            break
        end
    end
    if not K then
        return
    end
    K:Select()
end

function h.Create(self, default, K, L)
    assert(typeof(default) == "string", "Invalid argument #1 (string expected)")
    local M = Instance.new(default)
    if L and self.theme then
        for N, O in L do
            M[N] = (if typeof(O) == "table" then O[2](self.theme[O[1]]) else self.theme[O])
        end
        self.themeProperties[M] = L
    end
    if K then
        for N, O in K do
            if locale.isToken(O) then
                self:_bindLocale(M, N, locale.sourceOf(O))
            else
                image.assign(M, N, O)
            end
        end
    end
    table.insert(self.instances, M)
    return M
end

function h._bindLocale(self, default, K, L)
    default[K] = locale.resolve(L)
    local M = self.localeProperties[default]
    if not M then
        M = {}
        self.localeProperties[default] = M
    end
    M[K] = L
end

function h.SetLocale(self, default)
    locale.setActive(default)
    for K, L in self.localeProperties do
        for M, N in L do
            K[M] = locale.resolve(N)
        end
    end
end

function h.SetTranslator(I, default)
    locale.translator = default
end

function h.RegisterTranslations(self, default)
    locale.register(default)
    self:SetLocale(locale.current)
end

function h.CreateGlow(self, default, K, L, M)
    local N = { BlurRadius = UDim.new(0, L), Transparency = M, ZIndex = -1, Parent = default }
    if typeof(K) == "string" then
        return self:Create("UIShadow", N, {
            Color = {
                K,
                function(O)
                    return if typeof(O) == "ColorSequence" then O.Keypoints[1].Value else O
                end,
            },
        })
    end
    N.Color = K
    return self:Create("UIShadow", N)
end

function h._flashResult(self, default, K)
    local L = default.box
    if not L then
        return
    end
    local M, N, O, P, Q, R =
        default.glow,
        default.boxStroke,
        K and constants.accent.on or self.theme.ErrorColor,
        K and constants.accent.onStroke or self.theme.ErrorStrokeColor,
        TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
        TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    variables.tweenService:Create(L, Q, { BackgroundColor3 = O }):Play()
    if N then
        variables.tweenService:Create(N, Q, { Color = P, Transparency = 0.4 }):Play()
    end
    if M then
        variables.tweenService:Create(M, Q, { Color = P, Transparency = 0.6 }):Play()
    end
    default._flashToken = (default._flashToken or 0) + 1
    local S = default._flashToken
    task.delay(0.22, function()
        if default._flashToken ~= S then
            return
        end
        variables.tweenService
            :Create(L, R, {
                BackgroundColor3 = self.theme.FieldBackground,
            })
            :Play()
        if N then
            variables.tweenService
                :Create(N, R, { Color = self.theme.SurfaceStroke, Transparency = 0.85 })
                :Play()
        end
        if M then
            variables.tweenService
                :Create(M, R, { Color = self.theme.FieldGlow, Transparency = default._glowIdle or 1 })
                :Play()
        end
    end)
end

function h.CreateHoverOverlay(self, default)
    local K = self:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
        ZIndex = 1,
        Parent = default,
    })
    self:Create("UICorner", {
        Parent = K,
    }, { CornerRadius = "ElementCornerRadius" })
    return K
end

function h._wireElementHover(self, default)
    local K, L = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), self.theme
    self:ConnectFor(default, default.main.MouseEnter, function()
        if not self:_interactive() then
            return
        end
        variables.tweenService
            :Create(
                default.stroke,
                K,
                { Transparency = L.ElementStrokeHoverTransparency, Color = L.ElementStrokeHover }
            )
            :Play()
        variables.tweenService:Create(default.title, K, { TextColor3 = L.ElementTextHoverColor }):Play()
        if default.hoverOverlay then
            variables.tweenService:Create(default.hoverOverlay, K, { BackgroundTransparency = 0.97 }):Play()
        end
    end)
    self:ConnectFor(default, default.main.MouseLeave, function()
        variables.tweenService
            :Create(
                default.stroke,
                K,
                { Transparency = L.ElementStrokeTransparency, Color = L.ElementStroke }
            )
            :Play()
        variables.tweenService:Create(default.title, K, { TextColor3 = L.ContentColor }):Play()
        if default.hoverOverlay then
            variables.tweenService:Create(default.hoverOverlay, K, { BackgroundTransparency = 1 }):Play()
        end
    end)
end

function h._runGuarded(self, default, K, ...)
    if default.locked then
        return
    end
    local L = table.pack(...)
    task.spawn(function()
        local M, N = pcall(function()
            return K(table.unpack(L, 1, L.n))
        end)
        if M or default._errored then
            return
        end
        default._errored = true
        local O, P =
            default.flashTarget or default.main,
            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
        variables.tweenService:Create(O, P, { BackgroundColor3 = self.theme.ErrorColor }):Play()
        variables.tweenService:Create(default.stroke, P, { Color = self.theme.ErrorStrokeColor }):Play()
        if default.title then
            default.title.Text = locale.resolve("Error, log recorded in console.")
        end
        log.warn(
            `Rayfield encountered an error, with the callback for a {default.__type} component named '{J.name}':`
        )
        log.print(N)
        task.wait(1)
        if default.title then
            default.title.Text = locale.resolve(default.name)
        end
        variables.tweenService
            :Create(
                O,
                TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }
            )
            :Play()
        variables.tweenService
            :Create(
                default.stroke,
                TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { Color = self.theme.ElementStroke }
            )
            :Play()
        default._errored = false
    end)
end

function h.StyleElementBody(self, default)
    self:Create("UIGradient", { Rotation = 270, Parent = default }, { Color = "ElementGradient" })
    self:Create("UICorner", { Parent = default }, { CornerRadius = "ElementCornerRadius" })
    return self:Create(
        "UIStroke",
        { Transparency = 1, Parent = default },
        { Color = "ElementStroke", Transparency = "ElementStrokeTransparency" }
    )
end

function h._buildCompactRow(self, default, K, L)
    local M = self:Create("Frame", {
        Name = K,
        Size = UDim2.fromOffset(0, q),
        AutomaticSize = Enum.AutomaticSize.X,
        ClipsDescendants = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Parent = default.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })
    local N = self:StyleElementBody(M)
    self:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = M })
    self:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        Parent = M,
    })
    local O = self:Create("TextButton", {
        Text = "",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, q),
        BorderSizePixel = 0,
        TextTransparency = 1,
        ZIndex = L or 1,
        Parent = M,
    })
    self:Create("UICorner", { Parent = O }, {
        CornerRadius = "ElementCornerRadius",
    })
    return M, N, O
end

function h.StyleElementPanel(self, default)
    self:Create("UIGradient", { Rotation = 270, Parent = default }, { Color = "ElementGradient" })
    self:Create("UICorner", { Parent = default }, { CornerRadius = "ElementCornerRadius" })
    local K =
        self:Create("UIStroke", { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = default })
    self:Create("UIGradient", { Rotation = 270, Parent = K }, { Color = "ElementStrokeGradient" })
    return K
end

function h._reveal(I, default, K, L, M)
    if not default then
        return
    end
    if L then
        variables.tweenService:Create(default, M or i, K):Play()
    else
        for N, O in K do
            default[N] = O
        end
    end
end

function h._revealCommon(self, default, K)
    self:_reveal(default.stroke, { Transparency = self.theme.ElementStrokeTransparency }, K)
    self:_reveal(default.title, { TextTransparency = 0 }, K)
    self:_reveal(default.main, {
        BackgroundTransparency = self.theme.ElementTransparency or 0,
    }, K)
    if default.iconLabel then
        self:_reveal(default.iconLabel, { ImageTransparency = 0 }, K)
    end
    if default.descriptor then
        self:_reveal(default.descriptor.titleLabel, { TextTransparency = 0.7 }, K)
    end
end

function h._hideCommon(self, default, K)
    self:_reveal(default.stroke, { Transparency = 1 }, K)
    self:_reveal(default.title, { TextTransparency = 1 }, K)
    self:_reveal(default.main, {
        BackgroundTransparency = 1,
    }, K)
    if default.iconLabel then
        self:_reveal(default.iconLabel, { ImageTransparency = 1 }, K)
    end
    if default.descriptor then
        self:_reveal(default.descriptor.titleLabel, { TextTransparency = 1 }, K)
    end
end

function h._collapsedRect(self)
    local default = if self.showIconOnly then k else j
    if self._collapsedPosition then
        return self._collapsedPosition, default
    end
    local K = UDim2.new(l.X.Scale, l.X.Offset, l.Y.Scale, l.Y.Offset + default.Y.Offset / 2)
    return K, default
end

function h._interactive(self)
    return not self.animating and not self.hidden
end

function h._settled(self)
    return not self.hidden and not self._revealing
end

function h.Connect(self, default, K)
    local L = default:Connect(K)
    table.insert(self.connections, L)
    return L
end

function h.ConnectFor(self, default, K, L)
    local M = self:Connect(K, L)
    default.connections = default.connections or {}
    table.insert(default.connections, M)
    return M
end

function h.Disconnect(self, default)
    if not default then
        return
    end
    local K = table.find(self.connections, default)
    if K then
        table.remove(self.connections, K)
    end
    default:Disconnect()
end

function h.DestroySubtree(self, default)
    if not default then
        return
    end
    local K = { [default] = true }
    for L, M in default:GetDescendants() do
        K[M] = true
    end
    for L = #self.instances, 1, -1 do
        local M = self.instances[L]
        if K[M] then
            table.remove(self.instances, L)
            self.themeProperties[M] = nil
            self.localeProperties[M] = nil
        end
    end
    default:Destroy()
end

function h.DisconnectMany(self, default, K)
    if not K or #K == 0 then
        return
    end
    local L = {}
    for M, N in K do
        L[N] = true
        N:Disconnect()
    end
    local function M(N)
        if not N then
            return
        end
        local O = 0
        for P = 1, #N do
            local Q = N[P]
            if not L[Q] then
                O += 1
                N[O] = Q
            end
        end
        for P = #N, O + 1, -1 do
            N[P] = nil
        end
    end
    M(self.connections)
    if default and default ~= self then
        M(default.connections)
    end
end

function h.DestroySubtrees(self, default)
    if not default or #default == 0 then
        return
    end
    local K = {}
    for L, M in default do
        K[M] = true
        for N, O in M:GetDescendants() do
            K[O] = true
        end
    end
    local L = 0
    for M = 1, #self.instances do
        local N = self.instances[M]
        if K[N] then
            self.themeProperties[N] = nil
            self.localeProperties[N] = nil
        else
            L += 1
            self.instances[L] = N
        end
    end
    for M = #self.instances, L + 1, -1 do
        self.instances[M] = nil
    end
    for M, N in default do
        N:Destroy()
    end
end

function h.Unload(self)
    self.unloaded = true
    HapticEngine.teardown()
    HapticEngine.releaseContainer(self.screenGui)
    if self._liveTween then
        self._liveTween:Cancel()
        self._liveTween = nil
    end
    for default = #self.connections, 1, -1 do
        self.connections[default]:Disconnect()
    end
    for default = #self.instances, 1, -1 do
        self.instances[default]:Destroy()
    end
    table.clear(self.connections)
    table.clear(self.instances)
    table.clear(self.themeProperties)
    table.clear(self.localeProperties)
    table.clear(self.controls)
    table.clear(self.tabs)
end
return h
