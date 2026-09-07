-- Rayfield/components/dropdown  (bundle module #11)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Dropdown = {}
Dropdown.__index = Dropdown
Dropdown.__type = "Dropdown"
local utility = script.Parent.Parent.utility
local variables, functions, image, constants, locale, HapticEngine, windowSizing, lockable =
    require(utility.variables),
    require(utility.functions),
    require(utility.image),
    require(utility.constants),
    require(utility.locale),
    require(utility.HapticEngine),
    require(utility.windowSizing),
    require(utility.lockable)
local p, q, r, s, t, u, v, w, x, y, z, A, B, C, D =
    constants.icons.chevron,
    constants.icons.check,
    constants.icons.dot,
    constants.icons.search,
    UDim.new(0, 12),
    UDim.new(0, 7),
    30,
    38,
    38,
    5,
    2,
    41,
    6,
    7,
    6
local E, F, G, H, I, J, K =
    C + D,
    4,
    22,
    TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    0.4,
    TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

local function L(M)
    local N, O = {}, {}
    for P, Q in M do
        if typeof(Q) == "string" and not N[Q] then
            N[Q] = true
            table.insert(O, Q)
        end
    end
    return O
end

local function M(N, O)
    if N == nil then
        return {}
    end
    if typeof(N) == "string" then
        return { N }
    end
    if typeof(N) == "table" then
        local P = L(N)
        if not O and #P > 1 then
            return { P[1] }
        end
        return P
    end
    return {}
end

local function N(O, P)
    local Q = {}
    for R, S in O do
        if table.find(P, S) then
            table.insert(Q, S)
        end
    end
    return Q
end

local function O(P, Q)
    if #P ~= #Q then
        return false
    end
    for R, S in P do
        if not table.find(Q, S) then
            return false
        end
    end
    return true
end

function Dropdown.new(P, Q)
    Q = if typeof(Q) == "table" then Q else {}
    local R, S = Q.options or Q.Options or {}, Q.multiSelect or Q.MultiSelect or Q.MultipleOptions or false
    local T = setmetatable({
        tab = assert(P, "Missing argument #1 (Tab expected)"),
        window = P.window,
        name = Q.name or Q.Name or "Dropdown",
        icon = Q.icon or Q.Icon,
        description = Q.description or Q.Description,
        forgetState = Q.forgetState or Q.ForgetState or P.forgetState,
        flag = Q.flag
            or Q.Flag
            or (
                not (Q.forgetState or Q.ForgetState or P.forgetState)
                    and functions.deriveFlagFromName(Q.name or Q.Name or "Dropdown")
                or nil
            ),
        callback = Q.callback or Q.Callback or function() end,
        options = L(R),
        multiSelect = S,
        placeholderText = locale.resolve(Q.placeholder or Q.Placeholder or "None"),
        value = M(Q.value or Q.Value or Q.currentOption or Q.CurrentOption, S),
        _isOpen = false,
        _optionFrames = {},
    }, Dropdown)
    T._desiredValue = T.value
    T.value = N(T.value, T.options)
    T.window:_registerControl(T)
    T.main = T.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 41),
        BorderSizePixel = 0,
        Name = T.name,
        BackgroundTransparency = 1,
        Parent = T.tab.tabPage,
    })
    T.top = T.window:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 41),
        Position = UDim2.fromScale(0, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        ZIndex = 1,
        Parent = T.main,
    }, { BackgroundTransparency = "ElementTransparency" })
    T.stroke = T.window:StyleElementBody(T.top)
    T.hoverOverlay = T.window:CreateHoverOverlay(T.top)
    T.flashTarget = T.top
    T.container = T.window:Create("Frame", {
        BorderSizePixel = 0,
        Parent = T.top,
        Size = UDim2.new(0, 170, 0, 16),
        Position = UDim2.new(0, 20, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        ZIndex = 5,
    })
    T.containerLayout = T.window:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Parent = T.container,
    })
    if T.icon then
        T.iconLabel = T.window:Create("ImageLabel", {
            Image = T.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ImageTransparency = 1,
            ZIndex = 5,
            Parent = T.container,
        }, { ImageColor3 = "ContentColor" })
    end
    T.title = T.window:Create("TextLabel", {
        Text = locale.t(T.name),
        Size = UDim2.fromOffset(150, 16),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 16,
        AutomaticSize = Enum.AutomaticSize.X,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        LayoutOrder = 1,
        TextTransparency = 1,
        ZIndex = 5,
        Parent = T.container,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    T.selectedLabel = T.window:Create("TextLabel", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -41, 0.5, 0),
        Size = UDim2.fromOffset(168, 15),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextWrapped = true,
        TextTransparency = 1,
        ZIndex = 5,
        Parent = T.top,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    T.chevron = T.window:Create("ImageLabel", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -18, 0.5, 0),
        Size = UDim2.fromOffset(16, 16),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Image = "rbxassetid://" .. tostring(p),
        Rotation = 180,
        ImageTransparency = 1,
        ZIndex = 5,
        Parent = T.top,
    }, { ImageColor3 = "ContentColor" })
    T.interact = T.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 41),
        Position = UDim2.fromScale(0, 0),
        BorderSizePixel = 0,
        Text = "",
        TextTransparency = 1,
        ZIndex = 10,
        AutoButtonColor = false,
        Parent = T.main,
    })
    T.panel = T.window:Create("Frame", {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, 0, 1, 0),
        Size = UDim2.new(1, 0, 1, -(A + B)),
        BorderSizePixel = 0,
        ClipsDescendants = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        ZIndex = 1,
        BackgroundTransparency = 1,
        Parent = T.main,
    })
    T.panelStroke = T.window:StyleElementPanel(T.panel)
    T.window:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = T.panel,
    })
    T.window:Create(
        "UIPadding",
        { PaddingTop = UDim.new(0, C), PaddingBottom = UDim.new(0, D), Parent = T.panel }
    )
    T:_buildSearch()
    T:_buildActions()
    T.list = T.window:Create("ScrollingFrame", {
        Active = true,
        Size = UDim2.new(1, 0, 0, 0),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
        ScrollBarImageColor3 = Color3.fromRGB(240, 240, 240),
        ScrollBarThickness = 3,
        ScrollBarImageTransparency = 1,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        LayoutOrder = 3,
        ZIndex = 1,
        Parent = T.panel,
    })
    T.window:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = T.list })
    T.window:ConnectFor(T, T.list:GetPropertyChangedSignal("CanvasPosition"), function()
        T:_syncScrollHint()
    end)
    T.window:ConnectFor(T, T.list:GetPropertyChangedSignal("AbsoluteCanvasSize"), function()
        T:_syncScrollHint()
    end)
    T.window:ConnectFor(T, T.list:GetPropertyChangedSignal("AbsoluteWindowSize"), function()
        T:_syncScrollHint()
    end)
    T.listLayout = T.window:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Parent = T.list,
    })
    T.window:Create(
        "UIPadding",
        { PaddingTop = UDim.new(0, z), PaddingBottom = UDim.new(0, z), Parent = T.list }
    )
    T.emptyLabel = T.window:Create("TextLabel", {
        Name = "Empty",
        Size = UDim2.new(1, -12, 0, x),
        BackgroundTransparency = 1,
        Text = locale.t("No matches"),
        TextSize = 14,
        TextTransparency = 0.55,
        Visible = false,
        LayoutOrder = 1,
        Parent = T.list,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    local function U(V)
        return table.find(T.value, V) ~= nil
    end
    local function V(W, X)
        local Y = U(W.name)
        local Z, _, aa, ab =
            if T._isOpen then (Y and 0.9 or 0.95) else 1,
            if T._isOpen then (Y and 0 or 0.3) else 1,
            if T._isOpen then (Y and 0 or 0.7) else 1,
            if T._isOpen then (Y and 0.85 or 0.93) else 1
        image.assign(W.checkIcon, "Image", if Y then q else r)
        if X then
            local ac = TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
            variables.tweenService:Create(W.frame, ac, { BackgroundTransparency = Z }):Play()
            variables.tweenService:Create(W.title, ac, { TextTransparency = _ }):Play()
            variables.tweenService:Create(W.checkIcon, ac, { ImageTransparency = aa }):Play()
            variables.tweenService
                :Create(W.stroke, ac, {
                    Transparency = ab,
                })
                :Play()
        else
            W.frame.BackgroundTransparency = Z
            W.title.TextTransparency = _
            W.checkIcon.ImageTransparency = aa
            W.stroke.Transparency = ab
        end
    end
    local function aa()
        if T.multiSelect then
            local ab = #T.value
            if ab == 0 then
                T.selectedLabel.Text = T.placeholderText
            elseif ab == 1 then
                T.selectedLabel.Text = T.value[1]
            else
                T.selectedLabel.Text = locale.resolve("Various")
            end
        else
            T.selectedLabel.Text = T.value[1] or T.placeholderText
        end
    end
    T._renderOptionState = V
    T._updateSelectedLabel = aa
    local function ab(ac)
        local W = T.window:Create("Frame", {
            Size = UDim2.new(1, -12, 0, x),
            BorderSizePixel = 0,
            LayoutOrder = #T._optionFrames + 1,
            BackgroundTransparency = 1,
            Parent = T.list,
        }, { BackgroundColor3 = "DropdownHighlight" })
        local X, Y, Z, _ =
            T.window:Create("UICorner", { CornerRadius = u, Parent = W }),
            T.window:Create(
                "UIStroke",
                { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = W }
            ),
            T.window:Create("TextButton", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1),
                Text = "",
                TextTransparency = 1,
                ZIndex = 50,
                Parent = W,
            }),
            T.window:Create("Frame", {
                AnchorPoint = Vector2.new(0, 0.5),
                Position = UDim2.new(0, 14, 0.5, 0),
                Size = UDim2.fromOffset(170, 16),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                ZIndex = 5,
                Parent = W,
            })
        T.window:Create("UIListLayout", {
            Padding = UDim.new(0, 5),
            FillDirection = Enum.FillDirection.Horizontal,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Parent = _,
        })
        local ad, ae =
            T.window:Create("ImageLabel", {
                Image = "rbxassetid://" .. tostring(q),
                Size = UDim2.fromOffset(16, 16),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                ImageTransparency = 1,
                ZIndex = 5,
                Parent = _,
            }, { ImageColor3 = "ContentColor" }), T.window:Create("TextLabel", {
                Text = ac,
                Size = UDim2.fromOffset(170, 16),
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                LayoutOrder = 1,
                TextTransparency = 1,
                ZIndex = 5,
                Parent = _,
            }, { TextColor3 = "ContentColor", FontFace = "Font" })
        local af = {
            name = ac,
            frame = W,
            interact = Z,
            title = ae,
            checkIcon = ad,
            container = _,
            stroke = Y,
            corner = X,
            connections = {},
        }
        table.insert(
            af.connections,
            T.window:ConnectFor(T, W.MouseEnter, function()
                if not T._isOpen or not T.window:_interactive() then
                    return
                end
                if U(af.name) then
                    return
                end
                variables.tweenService
                    :Create(W, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 0.9,
                    })
                    :Play()
                variables.tweenService
                    :Create(
                        ae,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { TextTransparency = 0.15 }
                    )
                    :Play()
            end)
        )
        table.insert(
            af.connections,
            T.window:ConnectFor(T, W.MouseLeave, function()
                if not T._isOpen then
                    return
                end
                if U(af.name) then
                    return
                end
                variables.tweenService
                    :Create(
                        W,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { BackgroundTransparency = 0.95 }
                    )
                    :Play()
                variables.tweenService
                    :Create(
                        ae,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { TextTransparency = 0.3 }
                    )
                    :Play()
            end)
        )
        table.insert(
            af.connections,
            T.window:ConnectFor(T, Z.MouseButton1Click, function()
                if not T._isOpen then
                    return
                end
                HapticEngine.click()
                local ag = U(af.name)
                if not T.multiSelect then
                    if ag then
                        T:_close()
                        return
                    end
                    table.clear(T.value)
                    table.insert(T.value, af.name)
                else
                    if ag then
                        local ah = table.find(T.value, af.name)
                        if ah then
                            table.remove(T.value, ah)
                        end
                    else
                        table.insert(T.value, af.name)
                    end
                end
                T._desiredValue = table.clone(T.value)
                for ah, ai in T._optionFrames do
                    V(ai, true)
                end
                aa()
                T.window:_runGuarded(T, T.callback, T:_callbackValue())
                T.window:_persist(T)
                if not T.multiSelect then
                    task.wait(0.1)
                    T:_close()
                end
            end)
        )
        return af
    end
    T._buildOption = ab
    for ac, ad in T.options do
        local ae = ab(ad)
        table.insert(T._optionFrames, ae)
    end
    aa()
    T:_updateCorners()
    T.window:ConnectFor(T, T.interact.MouseButton1Click, function()
        HapticEngine.click()
        if T._isOpen then
            T:_close()
        else
            T:_open()
        end
    end)
    T.window:ConnectFor(T, T.main.MouseEnter, function()
        if T._isOpen or not T.window:_interactive() then
            return
        end
        variables.tweenService
            :Create(T.title, I, { TextColor3 = T.window.theme.ElementTextHoverColor })
            :Play()
        variables.tweenService:Create(T.hoverOverlay, I, { BackgroundTransparency = 0.97 }):Play()
        variables.tweenService
            :Create(T.stroke, I, {
                Transparency = T.window.theme.ElementStrokeHoverTransparency,
                Color = T.window.theme.ElementStrokeHover,
            })
            :Play()
    end)
    T.window:ConnectFor(T, T.main.MouseLeave, function()
        variables.tweenService:Create(T.title, I, { TextColor3 = T.window.theme.ContentColor }):Play()
        variables.tweenService:Create(T.hoverOverlay, I, { BackgroundTransparency = 1 }):Play()
        variables.tweenService
            :Create(T.stroke, I, {
                Transparency = T.window.theme.ElementStrokeTransparency,
                Color = T.window.theme.ElementStroke,
            })
            :Play()
    end)
    if T.description then
        T.descriptor = require(script.Parent.descriptor).new(T.tab, { description = T.description })
    end
    return T
end

function Dropdown._callbackValue(self)
    if self.multiSelect then
        return table.clone(self.value)
    end
    return self.value[1]
end

function Dropdown._buildSearch(self)
    self._searchOpen = false
    self.searchbar = self.window:Create("Frame", {
        Name = "Search",
        Size = UDim2.new(1, -12, 0, v),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        ClipsDescendants = false,
        ZIndex = 1,
        Parent = self.panel,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(0, 12), Parent = self.searchbar })
    self.searchStroke = self.window:Create(
        "UIStroke",
        { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = self.searchbar }
    )
    self.searchShadow = self.window:CreateGlow(self.searchbar, Color3.fromRGB(255, 255, 255), 20, 1)
    self.searchToggle = self.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextTransparency = 1,
        ZIndex = 51,
        Parent = self.searchbar,
    })
    self.searchInput = self.window:Create("TextBox", {
        Text = "",
        PlaceholderText = locale.t("Search..."),
        Size = UDim2.new(1, -58, 0, 16),
        Position = UDim2.new(0, 44, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        TextEditable = false,
        Interactable = false,
        ZIndex = 52,
        TextTransparency = 1,
        Parent = self.searchbar,
    }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
    self.searchIcon = self.window:Create("ImageButton", {
        Image = "rbxassetid://" .. tostring(s),
        Size = UDim2.fromOffset(20, 20),
        Position = UDim2.new(0, 24, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        ScaleType = Enum.ScaleType.Fit,
        AutoButtonColor = false,
        ZIndex = 53,
        ImageTransparency = 1,
        Parent = self.searchbar,
    }, { ImageColor3 = "ContentColor" })
    self.window:ConnectFor(self, self.searchToggle.MouseButton1Click, function()
        if not self._searchOpen then
            self:_expandSearch()
        end
    end)
    self.window:ConnectFor(self, self.searchIcon.MouseButton1Click, function()
        if self._searchOpen then
            self:_collapseSearch()
        else
            self:_expandSearch()
        end
    end)
    self.window:ConnectFor(self, self.searchInput:GetPropertyChangedSignal("Text"), function()
        self:_applyFilter(self.searchInput.Text)
    end)
    self.window:ConnectFor(self, self.searchInput.FocusLost, function()
        if self.searchInput.Text == "" then
            self:_collapseSearch()
        end
    end)
end

function Dropdown._expandSearch(self)
    if self._searchOpen then
        return
    end
    self._searchOpen = true
    self.searchInput.TextEditable = true
    self.searchInput.Interactable = true
    variables.tweenService
        :Create(self.searchbar, K, { Size = UDim2.new(1, -12, 0, w), BackgroundTransparency = 0.92 })
        :Play()
    variables.tweenService:Create(self.searchStroke, K, { Transparency = 0.86 }):Play()
    variables.tweenService:Create(self.searchShadow, K, { Transparency = 0.92 }):Play()
    variables.tweenService
        :Create(self.searchInput, K, {
            TextTransparency = 0.3,
        })
        :Play()
    self:_resizeToOptions()
    self.searchInput:CaptureFocus()
end

function Dropdown._collapseSearch(self)
    if not self._searchOpen then
        return
    end
    self._searchOpen = false
    self.searchInput.TextEditable = false
    self.searchInput.Interactable = false
    self.searchInput:ReleaseFocus()
    self.searchInput.Text = ""
    variables.tweenService
        :Create(self.searchbar, K, { Size = UDim2.new(1, -12, 0, v), BackgroundTransparency = 1 })
        :Play()
    variables.tweenService:Create(self.searchStroke, K, { Transparency = 1 }):Play()
    variables.tweenService:Create(self.searchShadow, K, { Transparency = 1 }):Play()
    variables.tweenService:Create(self.searchInput, K, { TextTransparency = 1 }):Play()
    self:_resizeToOptions()
end

function Dropdown._applyFilter(self, ab)
    ab = string.lower(ab or "")
    local ac = 0
    for ad, ae in self._optionFrames do
        local af = ab == "" or string.find(string.lower(ae.name), ab, 1, true) ~= nil
        ae.frame.Visible = af
        if af then
            ac += 1
        end
    end
    self.emptyLabel.Visible = ac == 0 and ab ~= ""
    self:_updateCorners()
    self:_resizeToOptions()
    self:_syncScrollHint()
end

function Dropdown._syncScrollHint(self)
    local ab, ac, ad = self.list.AbsoluteCanvasSize, self.list.AbsoluteWindowSize, self.list.CanvasPosition
    if not ab or not ac or not ad then
        return
    end
    local ae = self._isOpen and ac.Y > 0 and ab.Y - (ad.Y + ac.Y) > 1
    variables.tweenService:Create(self.list, H, { ScrollBarImageTransparency = if ae then J else 1 }):Play()
end

function Dropdown._visibleOptions(self): { string }
    local ab = {}
    for ac, ad in self._optionFrames do
        if ad.frame.Visible then
            table.insert(ab, ad.name)
        end
    end
    return ab
end

function Dropdown._buildActions(self)
    if not self.multiSelect then
        return
    end
    self.actions = self.window:Create("Frame", {
        Name = "Actions",
        Size = UDim2.new(1, -12, 0, G),
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        Parent = self.panel,
    })
    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 12),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.actions,
    })
    local function ab(ac: string, ad: number, ae: () -> ())
        local af = self.window:Create("TextButton", {
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(0, G),
            BackgroundTransparency = 1,
            Text = locale.t(ac),
            TextSize = 13,
            TextTransparency = 0.45,
            LayoutOrder = ad,
            Parent = self.actions,
        }, { TextColor3 = "ContentColor", FontFace = "Font" })
        self.window:ConnectFor(self, af.MouseEnter, function()
            variables.tweenService:Create(af, H, { TextTransparency = 0.15 }):Play()
        end)
        self.window:ConnectFor(self, af.MouseLeave, function()
            variables.tweenService:Create(af, H, { TextTransparency = 0.45 }):Play()
        end)
        self.window:ConnectFor(self, af.MouseButton1Click, function()
            ae()
            self:_afterBulkChange()
        end)
        return af
    end
    ab("Select all", 1, function()
        local ac = self:_visibleOptions()
        for ad, ae in ac do
            if not table.find(self.value, ae) then
                table.insert(self.value, ae)
            end
        end
    end)
    ab("Clear", 2, function()
        local ac = self:_visibleOptions()
        for ad = #self.value, 1, -1 do
            if table.find(ac, self.value[ad]) then
                table.remove(self.value, ad)
            end
        end
    end)
end

function Dropdown._afterBulkChange(self)
    self._desiredValue = table.clone(self.value)
    for ab, ac in self._optionFrames do
        self._renderOptionState(ac, true)
    end
    self:_updateSelectedLabel()
    self:_updateCorners()
    self.window:_runGuarded(self, self.callback, self:_callbackValue())
    self.window:_persist(self)
    HapticEngine.click()
end

function Dropdown._resizeToOptions(self)
    if not self._isOpen then
        return
    end
    variables.tweenService:Create(self.main, K, { Size = UDim2.new(1, -20, 0, self:_openHeight()) }):Play()
end

function Dropdown._updateCorners(self)
    local ab = {}
    for ac, ad in self._optionFrames do
        if ad.frame.Visible then
            table.insert(ab, ad)
        end
    end
    for ac, ad in ab do
        local ae, af = if ac == 1 then t else u, if ac == #ab then t else u
        ad.corner.TopLeftRadius = ae
        ad.corner.TopRightRadius = ae
        ad.corner.BottomLeftRadius = af
        ad.corner.BottomRightRadius = af
    end
end

local function aa(ab: number): number
    return ab * x + math.max(0, ab - 1) * y + z * 2
end

local function ab(ac: number): number
    return math.max(math.floor((ac - z * 2 + y) / (x + y)), 1)
end

function Dropdown._pageHeight(self): number
    local ad = self.window.size
    return windowSizing.pageHeight(ad and ad.Y.Offset, self.window.layout.mode)
end

function Dropdown._openHeight(self)
    local ad = 0
    for ae, af in self._optionFrames do
        if af.frame.Visible then
            ad += 1
        end
    end
    local ae = if self._searchOpen then w else v
    local af, ag = A + B + E + ae + y + (if self.actions then G + y else 0), self:_pageHeight()
    local ah = math.min(math.max(ad, 1), F, ab(ag - af))
    return math.min(af + aa(ah), ag)
end

function Dropdown._open(self)
    if self._isOpen then
        return
    end
    self._isOpen = true
    if self._outsideClickConn then
        self.window:Disconnect(self._outsideClickConn)
    end
    self._outsideClickConn = self.window:Connect(variables.userInputService.InputBegan, function(ad)
        if
            ad.UserInputType ~= Enum.UserInputType.MouseButton1
            and ad.UserInputType ~= Enum.UserInputType.Touch
        then
            return
        end
        local ae, af, ag = ad.Position, self.main.AbsolutePosition, self.main.AbsoluteSize
        if ae.X < af.X or ae.X > af.X + ag.X or ae.Y < af.Y or ae.Y > af.Y + ag.Y then
            self:_close()
        end
    end)
    variables.tweenService
        :Create(
            self.main,
            TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            { Size = UDim2.new(1, -20, 0, self:_openHeight()) }
        )
        :Play()
    variables.tweenService
        :Create(
            self.chevron,
            TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            { Rotation = 0 }
        )
        :Play()
    variables.tweenService
        :Create(
            self.panel,
            TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { BackgroundTransparency = self.window.theme.ElementTransparency or 0 }
        )
        :Play()
    variables.tweenService
        :Create(
            self.panelStroke,
            TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { Transparency = self.window.theme.ElementStrokeTransparency }
        )
        :Play()
    variables.tweenService
        :Create(
            self.searchIcon,
            TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { ImageTransparency = 0.5 }
        )
        :Play()
    for ad, ae in self._optionFrames do
        self._renderOptionState(ae, true)
    end
    self:_syncScrollHint()
    self:_bringIntoView()
end

function Dropdown._bringIntoView(self)
    local ad = self.tab and self.tab.tabPage
    if not ad then
        return
    end
    local ae, af, ag, ah =
        ad.AbsoluteWindowSize, ad.CanvasPosition, ad.AbsolutePosition, self.main.AbsolutePosition
    if not ae or not af or not ag or not ah or ae.Y <= 0 then
        return
    end
    local ai = ah.Y - ag.Y + af.Y
    local P = ai + self:_openHeight()
    local Q = P - (af.Y + ae.Y)
    if Q <= 0 then
        return
    end
    local R = math.min(af.Y + Q + 8, ai)
    variables.tweenService
        :Create(
            ad,
            TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { CanvasPosition = Vector2.new(af.X, R) }
        )
        :Play()
end

function Dropdown._close(self)
    if not self._isOpen then
        return
    end
    self._isOpen = false
    if self._outsideClickConn then
        self.window:Disconnect(self._outsideClickConn)
        self._outsideClickConn = nil
    end
    self:_collapseSearch()
    self:_syncScrollHint()
    variables.tweenService
        :Create(
            self.chevron,
            TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            { Rotation = 180 }
        )
        :Play()
    variables.tweenService
        :Create(
            self.panel,
            TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { BackgroundTransparency = 1 }
        )
        :Play()
    variables.tweenService
        :Create(
            self.panelStroke,
            TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { Transparency = 1 }
        )
        :Play()
    variables.tweenService
        :Create(
            self.searchIcon,
            TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { ImageTransparency = 1 }
        )
        :Play()
    for ad, ae in self._optionFrames do
        self._renderOptionState(ae, true)
    end
    variables.tweenService
        :Create(
            self.main,
            TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            { Size = UDim2.new(1, -20, 0, 41) }
        )
        :Play()
end

function Dropdown._destroyOption(self, ad)
    if ad.connections then
        for ae, af in ad.connections do
            local ag = table.find(self.connections, af)
            if ag then
                table.remove(self.connections, ag)
            end
            self.window:Disconnect(af)
        end
        ad.connections = nil
    end
    self.window:DestroySubtree(ad.frame)
end

function Dropdown._deriveSelection(self)
    local ad = self.value
    self.value = N(self._desiredValue or self.value, self.options)
    return not O(self.value, ad)
end

function Dropdown._reindexOptions(self)
    for ad, ae in self._optionFrames do
        ae.frame.LayoutOrder = ad
    end
end

function Dropdown._rebindOption(ac, ad, ae, af)
    ad.name = ae
    ad.title.Text = ae
    ad.frame.LayoutOrder = af
end

function Dropdown._destroyOptionsFrom(self, ad)
    local ae, af = {}, {}
    for ag = #self._optionFrames, ad, -1 do
        local ah = self._optionFrames[ag]
        table.insert(ae, ah.frame)
        if ah.connections then
            table.move(ah.connections, 1, #ah.connections, #af + 1, af)
            ah.connections = nil
        end
        self._optionFrames[ag] = nil
    end
    self.window:DisconnectMany(self, af)
    self.window:DestroySubtrees(ae)
end

function Dropdown.Refresh(self, ad)
    self.options = L(ad or {})
    local ae, af, ag = self:_deriveSelection(), #self._optionFrames, #self.options
    for ah = 1, math.min(af, ag) do
        self:_rebindOption(self._optionFrames[ah], self.options[ah], ah)
    end
    for ah = af + 1, ag do
        local ai = self._buildOption(self.options[ah])
        ai.frame.LayoutOrder = ah
        table.insert(self._optionFrames, ai)
    end
    if ag < af then
        self:_destroyOptionsFrom(ag + 1)
    end
    for ah, ai in self._optionFrames do
        self._renderOptionState(ai, false)
    end
    self._updateSelectedLabel()
    self:_applyFilter(if self._searchOpen then self.searchInput.Text else "")
    if ae then
        self.window:_runGuarded(self, self.callback, self:_callbackValue())
        self.window:_persist(self)
    end
end

function Dropdown.Add(self, ad)
    if typeof(ad) ~= "string" or ad == "" then
        return
    end
    if table.find(self.options, ad) then
        return
    end
    table.insert(self.options, ad)
    local ae = self._buildOption(ad)
    table.insert(self._optionFrames, ae)
    local af = self:_deriveSelection()
    if self._isOpen then
        self._renderOptionState(ae, true)
    end
    self:_applyFilter(if self._searchOpen then self.searchInput.Text else "")
    if af then
        self._updateSelectedLabel()
        self.window:_runGuarded(self, self.callback, self:_callbackValue())
        self.window:_persist(self)
    end
end

function Dropdown.Remove(self, ad)
    local ae = table.find(self.options, ad)
    if not ae then
        return
    end
    table.remove(self.options, ae)
    for af, ag in self._optionFrames do
        if ag.name == ad then
            self:_destroyOption(ag)
            table.remove(self._optionFrames, af)
            self:_reindexOptions()
            break
        end
    end
    if self._desiredValue then
        local af = table.find(self._desiredValue, ad)
        if af then
            table.remove(self._desiredValue, af)
        end
    end
    local af = table.find(self.value, ad)
    if af then
        table.remove(self.value, af)
        self._updateSelectedLabel()
        self.window:_runGuarded(self, self.callback, self:_callbackValue())
        self.window:_persist(self)
    end
    self:_applyFilter(if self._searchOpen then self.searchInput.Text else "")
end

function Dropdown.Set(self, ad, ae)
    local af = M(ad, self.multiSelect)
    self._desiredValue = af
    self.value = N(af, self.options)
    for ag, ah in self._optionFrames do
        self._renderOptionState(ah, true)
    end
    self._updateSelectedLabel()
    if not ae then
        self.window:_runGuarded(self, self.callback, self:_callbackValue())
        self.window:_persist(self)
    end
end

function Dropdown._setShown(self, ad, ae)
    local af = self.window
    af:_reveal(self.stroke, { Transparency = if ad then af.theme.ElementStrokeTransparency else 1 }, ae)
    af:_reveal(self.title, { TextTransparency = if ad then 0 else 1 }, ae)
    af:_reveal(
        self.top,
        { BackgroundTransparency = if ad then (af.theme.ElementTransparency or 0) else 1 },
        ae
    )
    if self.iconLabel then
        af:_reveal(self.iconLabel, { ImageTransparency = if ad then 0 else 1 }, ae)
    end
    if self.descriptor then
        af:_reveal(self.descriptor.titleLabel, { TextTransparency = if ad then 0.7 else 1 }, ae)
    end
    af:_reveal(self.selectedLabel, {
        TextTransparency = if ad then 0.5 else 1,
    }, ae)
    af:_reveal(self.chevron, { ImageTransparency = if ad then 0.5 else 1 }, ae)
    if not ad and self._isOpen then
        self:_close()
    end
end

function Dropdown.MoveTo(self, ad)
    self.tab:_moveElement(self, ad)
end

function Dropdown.MoveToTop(self)
    self.tab:_moveElement(self, 1)
end

function Dropdown.MoveToBottom(self)
    self.tab:_moveElement(self, #self.tab.elements)
end

function Dropdown.MoveUp(self)
    local ad = table.find(self.tab.elements, self)
    if ad then
        self.tab:_moveElement(self, ad - 1)
    end
end

function Dropdown.MoveDown(self)
    local ad = table.find(self.tab.elements, self)
    if ad then
        self.tab:_moveElement(self, ad + 1)
    end
end
lockable(Dropdown)
return Dropdown
