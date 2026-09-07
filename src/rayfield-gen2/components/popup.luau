-- Rayfield/components/popup  (bundle module #16)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Popup = {}
Popup.__index = Popup
Popup.__type = "Popup"
local utility = script.Parent.Parent.utility
local variables, functions, constants, locale, log, HapticEngine, e, f, g, h, i, j, k, l, m =
    require(utility.variables),
    require(utility.functions),
    require(utility.constants),
    require(utility.locale),
    require(utility.log),
    require(utility.HapticEngine),
    TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    400,
    22,
    24,
    22,
    16
local n, o, p, q, r, s, t, u = i - j * 2, 18, 14, 15, 16, 12, 300, 4
local v, w, x, y, z, A, B, C, D, E, F, G, H, I, J, K =
    n - u * 2, 16, 13, 20, 10, 15, 14, 8, 10, 40, 8, UDim.new(1, 0), 16, 0.5, {}

local function L()
    for M = #J, 1, -1 do
        local N = J[M]
        if N._closed or not N.screenGui.Parent then
            table.remove(J, M)
        end
    end
end

local function M(N)
    L()
    return J[#J] == N
end

function Popup.new(N, O)
    O = if typeof(O) == "table" then O else {}
    local P = setmetatable({
        window = assert(N, "Missing argument #1 (Window expected)"),
        title = O.title or O.Title or "Popup",
        subtitle = O.subtitle or O.Subtitle,
        content = O.content or O.Content,
        icon = O.icon or O.Icon,
        boxes = O.boxes or O.Boxes,
        options = O.options or O.Options,
        dismissable = if O.dismissable ~= nil
            then O.dismissable
            elseif O.Dismissable ~= nil then O.Dismissable
            else true,
        _reveal = {},
        _connections = {},
        _closed = false,
    }, Popup)
    if not P.options or #P.options == 0 then
        P.options = { { text = "Okay" } }
    end
    P:_build()
    L()
    table.insert(J, P)
    task.spawn(function()
        P:_show()
    end)
    return P
end

function Popup._fade(self, O, P, Q)
    table.insert(self._reveal, { instance = O, prop = P, to = Q })
    return O
end

function Popup._build(self)
    local O, P = self.window, self.icon ~= nil and self.icon ~= 0 and self.icon ~= ""
    self.screenGui = O:Create("ScreenGui", {
        Name = variables.httpService:GenerateGUID(false),
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        Enabled = true,
        DisplayOrder = constants.displayOrder.popup,
        ZIndexBehavior = Enum.ZIndexBehavior.Global,
        Parent = variables.guiContainer,
    })
    self.backdrop = O:Create("Frame", {
        Name = "Backdrop",
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        Size = UDim2.fromScale(1, 1),
        Active = true,
        BackgroundTransparency = 1,
        Parent = self.screenGui,
    })
    self:_fade(self.backdrop, "BackgroundTransparency", I)
    self.card = O:Create("Frame", {
        Name = "Card",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 14),
        Size = UDim2.fromOffset(i, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Active = true,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Parent = self.screenGui,
    })
    self:_fade(self.card, "BackgroundTransparency", 0)
    O:Create(
        "UIGradient",
        { Rotation = 270, Offset = Vector2.new(0, -0.1), Parent = self.card },
        { Color = { "WindowColor", functions.toColorSequence } }
    )
    O:Create("UICorner", { Parent = self.card }, { CornerRadius = "CornerRoundness" })
    self.cardStroke = O:Create(
        "UIStroke",
        { Transparency = 1, Parent = self.card },
        { Color = "SurfaceStroke" }
    )
    self:_fade(self.cardStroke, "Transparency", 0.95)
    self.cardShadow = O:CreateGlow(self.card, "ShadowColor", 26, 1)
    self:_fade(self.cardShadow, "Transparency", 0.55)
    O:Create("UIPadding", {
        PaddingLeft = UDim.new(0, j),
        PaddingRight = UDim.new(0, j),
        PaddingTop = UDim.new(0, k),
        PaddingBottom = UDim.new(0, l),
        Parent = self.card,
    })
    O:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, m),
        Parent = self.card,
    })
    local Q = self:_measureHeader(P)
    self:_buildHeader(P, Q)
    local R = self:_buildContent()
    self:_buildFooter()
    local S = 2 + (R > 0 and 1 or 0)
    local T = k + Q + R + E + l + m * (S - 1)
    self.card.Size = UDim2.fromOffset(i, T)
    self.card.AutomaticSize = Enum.AutomaticSize.None
    if self.dismissable then
        table.insert(
            self._connections,
            O:Connect(self.backdrop.InputBegan, function(U)
                if
                    U.UserInputType == Enum.UserInputType.MouseButton1
                    or U.UserInputType == Enum.UserInputType.Touch
                then
                    self:Close()
                end
            end)
        )
        table.insert(
            self._connections,
            O:Connect(variables.userInputService.InputBegan, function(U, V)
                if not V and U.KeyCode == Enum.KeyCode.Escape and M(self) then
                    if U == K then
                        return
                    end
                    K = U
                    self:Close()
                end
            end)
        )
    end
end

function Popup._buildHeader(self, O, P)
    local Q = self.window
    local R = Q:Create("Frame", {
        Name = "Header",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, P),
        LayoutOrder = 1,
        Parent = self.card,
    })
    Q:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, s),
        Parent = R,
    })
    if O then
        self:_fade(
            Q:Create("ImageLabel", {
                Image = self.icon,
                Size = UDim2.fromOffset(r, r),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                ImageTransparency = 1,
                Parent = R,
            }, { ImageColor3 = "TitlingColor" }),
            "ImageTransparency",
            0
        )
    end
    local S = Q:Create("Frame", {
        Name = "Text",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, O and -(r + s) or 0, 0, self._columnH),
        LayoutOrder = 2,
        Parent = R,
    })
    Q:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 3),
        Parent = S,
    })
    self:_fade(
        Q:Create("TextLabel", {
            Text = locale.t(self.title),
            Size = UDim2.new(1, 0, 0, self._titleH),
            BackgroundTransparency = 1,
            TextSize = o,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            LayoutOrder = 1,
            TextTransparency = 1,
            Parent = S,
        }, {
            TextColor3 = "TitlingColor",
            FontFace = "Font",
        }),
        "TextTransparency",
        0
    )
    if self.subtitle and self.subtitle ~= "" then
        self:_fade(
            Q:Create("TextLabel", {
                Text = locale.t(self.subtitle),
                Size = UDim2.new(1, 0, 0, self._subH),
                BackgroundTransparency = 1,
                TextSize = p,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextWrapped = true,
                LayoutOrder = 2,
                TextTransparency = 1,
                Parent = S,
            }, { TextColor3 = "TitlingColor", FontFace = "Font" }),
            "TextTransparency",
            0.55
        )
    end
end

function Popup._buildContent(self)
    if (not self.content or self.content == "") and (not self.boxes or #self.boxes == 0) then
        return 0
    end
    local O, P =
        self.window, if self.boxes and #self.boxes > 0 then self:_measureBoxes() else self:_measureText()
    local Q = math.min(P, t) + u * 2
    local R = O:Create("ScrollingFrame", {
        Name = "Content",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 0, Q),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        ScrollingDirection = Enum.ScrollingDirection.Y,
        LayoutOrder = 2,
        ScrollBarImageTransparency = 1,
        Parent = self.card,
    })
    self:_fade(R, "ScrollBarImageTransparency", 0.8)
    O:Create("UIPadding", {
        PaddingLeft = UDim.new(0, u),
        PaddingRight = UDim.new(0, u),
        PaddingTop = UDim.new(0, u),
        PaddingBottom = UDim.new(0, u),
        Parent = R,
    })
    if self.boxes and #self.boxes > 0 then
        O:Create("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, C),
            Parent = R,
        })
        for S, T in self.boxes do
            self:_buildBox(R, T, S)
        end
    else
        self:_fade(
            O:Create("TextLabel", {
                Text = locale.t(self.content),
                Size = UDim2.new(1, 0, 0, P),
                BackgroundTransparency = 1,
                TextSize = q,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextWrapped = true,
                TextTransparency = 1,
                Parent = R,
            }, { TextColor3 = "ContentColor", FontFace = "Font" }),
            "TextTransparency",
            0.5
        )
    end
    return Q
end

function Popup._buildBox(self, O, P, Q)
    local R = self.window
    P = if typeof(P) == "table" then P else { title = tostring(P) }
    local S, T, U, V, W = P.icon ~= nil and P.icon ~= 0 and P.icon ~= "", self:_measureBox(P)
    local X = R:Create("Frame", {
        Name = "Box",
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        Size = UDim2.new(1, -D, 0, T),
        LayoutOrder = Q,
        BackgroundTransparency = 1,
        Parent = O,
    })
    self:_fade(X, "BackgroundTransparency", 0)
    local Y = R:StyleElementPanel(X)
    self:_fade(Y, "Transparency", R.theme.ElementStrokeTransparency)
    R:Create("UIPadding", {
        PaddingLeft = UDim.new(0, w),
        PaddingRight = UDim.new(0, w),
        PaddingTop = UDim.new(0, x),
        PaddingBottom = UDim.new(0, x),
        Parent = X,
    })
    R:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, z),
        Parent = X,
    })
    if S then
        self:_fade(
            R:Create("ImageLabel", {
                Image = P.icon,
                Size = UDim2.fromOffset(y, y),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                ImageTransparency = 1,
                Parent = X,
            }, { ImageColor3 = "ContentColor" }),
            "ImageTransparency",
            0
        )
    end
    local Z = R:Create("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, S and -(y + z) or 0, 0, W),
        LayoutOrder = 2,
        Parent = X,
    })
    R:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 3),
        Parent = Z,
    })
    self:_fade(
        R:Create("TextLabel", {
            Text = locale.t(P.title or P.Title or ""),
            Size = UDim2.new(1, 0, 0, U),
            BackgroundTransparency = 1,
            TextSize = A,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
            LayoutOrder = 1,
            TextTransparency = 1,
            Parent = Z,
        }, { TextColor3 = "ContentColor", FontFace = "TitleFont" }),
        "TextTransparency",
        0
    )
    local _ = P.description or P.Description
    if _ and _ ~= "" then
        self:_fade(
            R:Create("TextLabel", {
                Text = locale.t(_),
                Size = UDim2.new(1, 0, 0, V),
                BackgroundTransparency = 1,
                TextSize = B,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
                TextWrapped = true,
                LayoutOrder = 2,
                TextTransparency = 1,
                Parent = Z,
            }, { TextColor3 = "ContentColor", FontFace = "Font" }),
            "TextTransparency",
            0.65
        )
    end
end

function Popup._buildFooter(self)
    local O = self.window
    local P = O:Create("Frame", {
        Name = "Footer",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, E),
        LayoutOrder = 3,
        Parent = self.card,
    })
    O:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        HorizontalFlex = Enum.UIFlexAlignment.Fill,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, F),
        Parent = P,
    })
    for Q, R in self.options do
        self:_buildButton(P, R, Q)
    end
end

function Popup._buildButton(self, O, P, Q)
    local R = self.window
    P = if typeof(P) == "table" then P else { text = tostring(P) }
    local S, T, U, V, W, X, Y =
        P.style or P.Style or "neutral",
        P.text or P.Text or P.name or P.Name or "Okay",
        P.callback or P.Callback
    if S == "primary" then
        V, W, X, Y = R.theme.AccentColor, R.theme.AccentStroke, R.theme.AccentStroke, 0.1
    elseif S == "danger" then
        V, W, X, Y = R.theme.ErrorColor, R.theme.ErrorStrokeColor, R.theme.ErrorStrokeColor, 0
    else
        V, W, X, Y = R.theme.NeutralButton, R.theme.NeutralButtonHover, R.theme.NeutralButtonStroke, 0.85
    end
    local Z = R:Create("Frame", {
        Name = "Button",
        BackgroundColor3 = V,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 0, 0, E),
        LayoutOrder = Q,
        BackgroundTransparency = 1,
        Parent = O,
    })
    self:_fade(Z, "BackgroundTransparency", 0)
    R:Create("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill, Parent = Z })
    R:Create("UICorner", { CornerRadius = G, Parent = Z })
    local _ = R:Create("UIStroke", { Color = X, Transparency = 1, Parent = Z })
    self:_fade(_, "Transparency", Y)
    self:_fade(
        R:Create("TextLabel", {
            Text = locale.t(T),
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            TextSize = H,
            TextXAlignment = Enum.TextXAlignment.Center,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextColor3 = functions.contrastText(V),
            TextTransparency = 1,
            Parent = Z,
        }, { FontFace = "Font" }),
        "TextTransparency",
        0
    )
    local aj, ak =
        R:Create("TextButton", {
            Text = "",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            BorderSizePixel = 0,
            ZIndex = 2,
            Parent = Z,
        }), TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    table.insert(
        self._connections,
        R:Connect(aj.MouseEnter, function()
            if self._closed then
                return
            end
            variables.tweenService:Create(Z, ak, { BackgroundColor3 = W }):Play()
        end)
    )
    table.insert(
        self._connections,
        R:Connect(aj.MouseLeave, function()
            variables.tweenService:Create(Z, ak, { BackgroundColor3 = V }):Play()
        end)
    )
    table.insert(
        self._connections,
        R:Connect(aj.MouseButton1Click, function()
            if self._closed then
                return
            end
            HapticEngine.click()
            variables.tweenService:Create(_, ak, { Transparency = 1 }):Play()
            if U then
                task.spawn(function()
                    local al, am = pcall(U)
                    if not al then
                        log.warn("Rayfield: popup button '" .. T .. "' callback errored:")
                        log.print(am)
                    end
                end)
            end
            self:Close()
        end)
    )
end

function Popup._measureHeader(self, ak)
    local al = n - (if ak then r + s else 0)
    self._titleH = functions.textHeight(self.window.theme.Font, o, locale.resolve(self.title), al)
    self._subH = if self.subtitle and self.subtitle ~= ""
        then functions.textHeight(self.window.theme.Font, p, locale.resolve(self.subtitle), al)
        else 0
    self._columnH = self._titleH + (if self._subH > 0 then 3 + self._subH else 0)
    return math.max(self._columnH, if ak then r else 0)
end

function Popup._measureText(self)
    return functions.textHeight(self.window.theme.Font, q, locale.resolve(self.content), v)
end

function Popup._measureBox(self, ak)
    ak = if typeof(ak) == "table" then ak else { title = tostring(ak) }
    local al = ak.icon ~= nil and ak.icon ~= 0 and ak.icon ~= ""
    local am = v - D - w * 2 - (if al then y + z else 0)
    local N, O, P =
        functions.textHeight(self.window.theme.TitleFont, A, locale.resolve(ak.title or ak.Title or ""), am),
        0,
        ak.description or ak.Description
    if P and P ~= "" then
        O = functions.textHeight(self.window.theme.Font, B, locale.resolve(P), am)
    end
    local Q = N + (if O > 0 then 3 + O else 0)
    local R = math.max(Q, if al then y else 0) + x * 2
    return R, N, O, Q
end

function Popup._measureBoxes(self)
    local ak = 0
    for al, am in self.boxes do
        ak += (self:_measureBox(am))
        if al < #self.boxes then
            ak += C
        end
    end
    return ak
end

function Popup._show(self)
    if not self.screenGui.Parent then
        return
    end
    HapticEngine.notify()
    variables.tweenService:Create(self.card, e, { Position = UDim2.new(0.5, 0, 0.5, 0) }):Play()
    for ak, al in self._reveal do
        local am = if al.instance == self.backdrop then h else f
        variables.tweenService:Create(al.instance, am, { [al.prop] = al.to }):Play()
    end
end

function Popup.Close(self)
    if self._closed then
        return
    end
    self._closed = true
    local ak = table.find(J, self)
    if ak then
        table.remove(J, ak)
    end
    for al, am in self._connections do
        self.window:Disconnect(am)
    end
    self._connections = {}
    if not self.screenGui.Parent then
        return
    end
    variables.tweenService:Create(self.card, g, { Position = UDim2.new(0.5, 0, 0.5, 10) }):Play()
    for al, am in self._reveal do
        variables.tweenService:Create(am.instance, g, { [am.prop] = 1 }):Play()
    end
    task.delay(g.Time, function()
        self.window:DestroySubtree(self.screenGui)
    end)
end
return Popup
