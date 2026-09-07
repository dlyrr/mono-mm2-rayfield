-- Rayfield/components/colorpicker  (bundle module #6)
-- deobfuscated from Rayfield Gen2 v1.2.0

local ColorPicker = {}
ColorPicker.__index = ColorPicker
ColorPicker.__type = "ColorPicker"
local utility = script.Parent.Parent.utility
local variables, functions, moveable, lockable, constants, locale, HapticEngine, o, p, q, r, s, t, u, v, w, x, y, z =
    require(utility.variables),
    require(utility.functions),
    require(utility.moveable),
    require(utility.lockable),
    require(utility.constants),
    require(utility.locale),
    require(utility.HapticEngine),
    ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
    }),
    41,
    52,
    Vector2.new(150, 120),
    184,
    10,
    214,
    10,
    240,
    62,
    8,
    400
local A, B, C, D, E, F, G, H =
    {
        wide = {
            height = 190,
            previewPos = UDim2.new(1, -20, 0, q + 39),
            previewSize = UDim2.new(1, -(w + 20), 0, 78),
            hexPos = UDim2.new(0, w, 0, q + 90),
            hexSize = UDim2.new(1, -(w + 20 + x + y), 0, 30),
            alphaFieldPos = UDim2.new(1, -(20 + x), 0, q + 90),
            alphaFieldSize = UDim2.new(0, x, 0, 30),
        },
        narrow = {
            height = 296,
            previewPos = UDim2.new(1, -20, 0, q + r.Y + 40),
            previewSize = UDim2.new(1, -40, 0, 56),
            hexPos = UDim2.new(0, 20, 0, q + r.Y + 78),
            hexSize = UDim2.new(1, -(40 + x + y), 0, 30),
            alphaFieldPos = UDim2.new(1, -(20 + x), 0, q + r.Y + 78),
            alphaFieldSize = UDim2.new(0, x, 0, 30),
        },
    }, UDim2.new(1, -16, 0, p / 2), UDim2.fromOffset(40, 22), TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), TweenInfo.new(0.12, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local function I(J)
    return math.clamp(J, 0, 1)
end

local function J(K)
    return math.clamp(math.round(K), 0, 255)
end
local K = {
    black = Color3.fromRGB(0, 0, 0),
    white = Color3.fromRGB(255, 255, 255),
    red = Color3.fromRGB(255, 0, 0),
    green = Color3.fromRGB(0, 255, 0),
    blue = Color3.fromRGB(0, 0, 255),
    yellow = Color3.fromRGB(255, 255, 0),
    cyan = Color3.fromRGB(0, 255, 255),
    magenta = Color3.fromRGB(255, 0, 255),
    orange = Color3.fromRGB(255, 165, 0),
    purple = Color3.fromRGB(128, 0, 128),
    pink = Color3.fromRGB(255, 105, 180),
    brown = Color3.fromRGB(139, 69, 19),
    gray = Color3.fromRGB(128, 128, 128),
    grey = Color3.fromRGB(128, 128, 128),
}

local function L(M, N, O)
    if N <= 0 then
        return Color3.new(O, O, O)
    end
    local function P(Q, R, S)
        S = S % 1
        if S < 0.16666666666666666 then
            return Q + (R - Q) * 6 * S
        elseif S < 0.5 then
            return R
        elseif S < 0.6666666666666666 then
            return Q + (R - Q) * (0.6666666666666666 - S) * 6
        end
        return Q
    end
    local Q = if O < 0.5 then O * (1 + N) else O + N - O * N
    local R = 2 * O - Q
    return Color3.new(P(R, Q, M + 0.3333333333333333), P(R, Q, M), P(R, Q, M - 0.3333333333333333))
end

local function M(N)
    local O = {}
    for P in N:gmatch("[%d%.]+") do
        table.insert(O, tonumber(P))
    end
    return O
end

local function N(O)
    if typeof(O) ~= "string" then
        return nil
    end
    local P = (O:lower():match("^%s*(.-)%s*$")) or ""
    if P == "" then
        return nil
    end
    if K[P] then
        return K[P]
    end
    local Q, R = P:match("^(%a+)"), M(P)
    if (Q == "hsv" or Q == "hsb") and #R >= 3 then
        local S, T, U =
            (R[1] % 360) / 360, if R[2] > 1 then R[2] / 100 else R[2], if R[3] > 1 then R[3] / 100 else R[3]
        return Color3.fromHSV(S, I(T), I(U))
    end
    if Q == "hsl" and #R >= 3 then
        local S, T, U =
            (R[1] % 360) / 360, if R[2] > 1 then R[2] / 100 else R[2], if R[3] > 1 then R[3] / 100 else R[3]
        return L(S, I(T), I(U))
    end
    if (Q == "rgb" or Q == "rgba") and #R >= 3 then
        return Color3.fromRGB(J(R[1]), J(R[2]), J(R[3]))
    end
    local S = P:match("^#?(%x%x%x%x%x%x)$") or P:match("^#?(%x%x%x)$") or P:match("^0x(%x%x%x%x%x%x)$")
    if S then
        local T, U = pcall(Color3.fromHex, S)
        if T then
            return U
        end
    end
    if #R >= 3 and not Q then
        if R[1] <= 1 and R[2] <= 1 and R[3] <= 1 then
            return Color3.new(I(R[1]), I(R[2]), I(R[3]))
        end
        return Color3.fromRGB(J(R[1]), J(R[2]), J(R[3]))
    end
    return nil
end

local function O(P, Q)
    if typeof(P) == "Color3" then
        return P
    end
    if typeof(P) == "string" then
        return N(P) or Q
    end
    return Q
end

function ColorPicker.new(P, Q)
    Q = if typeof(Q) == "table" then Q else {}
    local R = setmetatable({
        tab = assert(P, "Missing argument #1 (Tab expected)"),
        window = P.window,
        name = Q.name or Q.Name or "Color Picker",
        icon = Q.icon or Q.Icon,
        description = Q.description or Q.Description,
        forgetState = Q.forgetState or Q.ForgetState or P.forgetState,
        callback = Q.callback or Q.Callback or function() end,
        _isOpen = false,
    }, ColorPicker)
    R.value = O(Q.color or Q.Color or Q.value or Q.Value or Q.default, Color3.fromRGB(255, 255, 255))
    R.hue, R.sat, R.val = R.value:ToHSV()
    local S = Q.alpha or Q.Alpha
    R.alpha = if type(S) == "number" then I(S) else 1
    R.flag = Q.flag or Q.Flag or (not R.forgetState and functions.deriveFlagFromName(R.name) or nil)
    R.window:_registerControl(R)
    R.main = R.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, p),
        BorderSizePixel = 0,
        Name = R.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = R.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })
    R.stroke = R.window:StyleElementBody(R.main)
    R.hoverOverlay = R.window:CreateHoverOverlay(R.main)
    R:_buildHeader()
    R:_buildPicker()
    R.window:ConnectFor(R, R.interact.MouseButton1Click, function()
        HapticEngine.click()
        if R._isOpen then
            R:_close()
        else
            R:_open()
        end
    end)
    R.window:ConnectFor(R, R.main.MouseEnter, function()
        if R._isOpen or not R.window:_interactive() then
            return
        end
        local T = R.window.theme
        variables.tweenService
            :Create(
                R.stroke,
                E,
                { Transparency = T.ElementStrokeHoverTransparency, Color = T.ElementStrokeHover }
            )
            :Play()
        variables.tweenService:Create(R.title, E, { TextColor3 = T.ElementTextHoverColor }):Play()
        variables.tweenService:Create(R.hoverOverlay, E, { BackgroundTransparency = 0.97 }):Play()
    end)
    R.window:ConnectFor(R, R.main.MouseLeave, function()
        local T = R.window.theme
        variables.tweenService
            :Create(R.stroke, E, { Transparency = T.ElementStrokeTransparency, Color = T.ElementStroke })
            :Play()
        variables.tweenService:Create(R.title, E, { TextColor3 = T.ContentColor }):Play()
        variables.tweenService:Create(R.hoverOverlay, E, { BackgroundTransparency = 1 }):Play()
    end)
    if R.description then
        R.descriptor = require(script.Parent.descriptor).new(R.tab, { description = R.description })
    end
    R:_applyPickerVisibility(false, false)
    R:_setControlsVisible(false)
    R.window:ConnectFor(R, R.main:GetPropertyChangedSignal("AbsoluteSize"), function()
        if R.window.animating or (R.window.hidden and R.window.hasShownOnce) then
            return
        end
        R:_applyLayout()
    end)
    R:_applyLayout()
    R:_render("instant")
    return R
end

function ColorPicker._buildHeader(self)
    self.container = self.window:Create("Frame", {
        Size = UDim2.new(0, 170, 0, 16),
        Position = UDim2.new(0, 20, 0, p / 2),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = self.main,
    })
    self.window:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.container,
    })
    if self.icon then
        self.iconLabel = self.window:Create("ImageLabel", {
            Image = self.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ZIndex = 5,
            ImageTransparency = 1,
            Parent = self.container,
        }, { ImageColor3 = "ContentColor" })
    end
    self.title = self.window:Create("TextLabel", {
        Text = locale.t(self.name),
        Size = UDim2.fromOffset(150, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        ZIndex = 5,
        TextTransparency = 1,
        Parent = self.container,
    }, {
        TextColor3 = "ContentColor",
        FontFace = "Font",
    })
    self.preview = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = B,
        Size = C,
        BackgroundColor3 = self.value,
        BorderSizePixel = 0,
        ZIndex = 3,
        BackgroundTransparency = 1,
        Parent = self.main,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.preview })
    self.previewShadow = self.window:CreateGlow(self.preview, self.value, 20, 1)
    self.invisibleGroup = self.window:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = self.preview,
    })
    self.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = self.invisibleGroup,
    })
    self.invisibleIcon = self.window:Create("ImageLabel", {
        Image = constants.icons.colorpicker,
        Size = UDim2.fromOffset(16, 16),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        ImageTransparency = 1,
        Parent = self.invisibleGroup,
    }, { ImageColor3 = "ContentColor" })
    self.invisibleText = self.window:Create("TextLabel", {
        Text = locale.t("Invisible"),
        Size = UDim2.fromOffset(0, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 15,
        LayoutOrder = 1,
        ZIndex = 5,
        TextTransparency = 1,
        Parent = self.invisibleGroup,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    self.interact = self.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, p),
        Position = UDim2.fromScale(0, 0),
        BorderSizePixel = 0,
        Text = "",
        TextTransparency = 1,
        AutoButtonColor = false,
        ZIndex = 10,
        Parent = self.main,
    })
end

function ColorPicker._buildMap(self)
    self.map = self.window:Create("Frame", {
        Position = UDim2.fromOffset(20, q),
        Size = UDim2.fromOffset(r.X, r.Y),
        BackgroundColor3 = Color3.fromHSV(self.hue, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundTransparency = 1,
        Parent = self.main,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.map })
    self.mapStroke = self.window:Create(
        "UIStroke",
        { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = self.map }
    )
    self.satOverlay = self.window:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 3,
        BackgroundTransparency = 1,
        Parent = self.map,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.satOverlay })
    self.window:Create("UIGradient", {
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 1),
        }),
        Parent = self.satOverlay,
    })
    self.valOverlay = self.window:Create("Frame", {
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        ZIndex = 4,
        BackgroundTransparency = 1,
        Parent = self.map,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.valOverlay })
    self.window:Create("UIGradient", {
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(1, 0),
        }),
        Parent = self.valOverlay,
    })
end

function ColorPicker._buildPicker(self)
    self:_buildMap()
    self.satCursor = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(12, 12),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 6,
        BackgroundTransparency = 1,
        Parent = self.map,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.satCursor })
    self.satCursorStroke = self.window:Create(
        "UIStroke",
        { Color = Color3.fromRGB(255, 255, 255), Thickness = 2, Transparency = 1, Parent = self.satCursor }
    )
    self.mapInteract = self.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextTransparency = 1,
        AutoButtonColor = false,
        ZIndex = 7,
        Parent = self.map,
    })
    self.hueBar = self.window:Create("Frame", {
        Position = UDim2.fromOffset(s, q),
        Size = UDim2.fromOffset(t, r.Y),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundTransparency = 1,
        Parent = self.main,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.hueBar })
    self.window:Create("UIGradient", {
        Color = o,
        Rotation = 90,
        Parent = self.hueBar,
    })
    self.hueHandle = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0, 0),
        Size = UDim2.fromOffset(t + 8, 8),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 4,
        BackgroundTransparency = 1,
        Parent = self.hueBar,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.hueHandle })
    self.hueHandleStroke = self.window:Create(
        "UIStroke",
        { Color = Color3.fromRGB(255, 255, 255), Thickness = 2, Transparency = 1, Parent = self.hueHandle }
    )
    self.hueInteract = self.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 16, 1, 8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Text = "",
        TextTransparency = 1,
        AutoButtonColor = false,
        ZIndex = 6,
        Parent = self.hueBar,
    })
    self.alphaBar = self.window:Create("Frame", {
        Position = UDim2.fromOffset(u, q),
        Size = UDim2.fromOffset(v, r.Y),
        BackgroundColor3 = self.value,
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundTransparency = 1,
        Parent = self.main,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.alphaBar })
    self.alphaGradient = self.window:Create("UIGradient", {
        Rotation = 90,
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0),
            NumberSequenceKeypoint.new(1, 1),
        }),
        Parent = self.alphaBar,
    })
    self.alphaHandle = self.window:Create("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0, 0),
        Size = UDim2.fromOffset(v + 8, 8),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 4,
        BackgroundTransparency = 1,
        Parent = self.alphaBar,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = self.alphaHandle })
    self.alphaHandleStroke = self.window:Create(
        "UIStroke",
        { Color = Color3.fromRGB(255, 255, 255), Thickness = 2, Transparency = 1, Parent = self.alphaHandle }
    )
    self.alphaInteract = self.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 16, 1, 8),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Text = "",
        TextTransparency = 1,
        AutoButtonColor = false,
        ZIndex = 6,
        Parent = self.alphaBar,
    })
    self.hexBox = self.window:Create("Frame", {
        Position = UDim2.new(0, w, 0, q + 90),
        Size = UDim2.new(1, -(w + 20), 0, 30),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundTransparency = 1,
        Parent = self.main,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.hexBox })
    self.hexBoxStroke = self.window:Create(
        "UIStroke",
        { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = self.hexBox }
    )
    self.hexInput = self.window:Create("TextBox", {
        Text = "#" .. self.value:ToHex():upper(),
        PlaceholderText = locale.t("Smart Input"),
        Size = UDim2.new(1, -14, 1, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Center,
        ClearTextOnFocus = false,
        ZIndex = 3,
        TextTransparency = 1,
        Parent = self.hexBox,
    }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
    self.alphaBox = self.window:Create("Frame", {
        Position = UDim2.new(0, w, 0, q + 90),
        Size = UDim2.fromOffset(x, 30),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 2,
        BackgroundTransparency = 1,
        Parent = self.main,
    })
    self.window:Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = self.alphaBox })
    self.alphaBoxStroke = self.window:Create(
        "UIStroke",
        { Color = Color3.fromRGB(255, 255, 255), Transparency = 1, Parent = self.alphaBox }
    )
    self.alphaInput = self.window:Create("TextBox", {
        Text = tostring(math.round(self.alpha * 100)) .. "%",
        PlaceholderText = "100%",
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Center,
        ClearTextOnFocus = false,
        ZIndex = 3,
        TextTransparency = 1,
        Parent = self.alphaBox,
    }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
    self.window:ConnectFor(self, self.mapInteract.InputBegan, function(Q)
        if
            Q.UserInputType == Enum.UserInputType.MouseButton1
            or Q.UserInputType == Enum.UserInputType.Touch
        then
            self:_beginDrag("sat", Q.UserInputType == Enum.UserInputType.MouseButton1)
        end
    end)
    self.window:ConnectFor(self, self.hueInteract.InputBegan, function(Q)
        if
            Q.UserInputType == Enum.UserInputType.MouseButton1
            or Q.UserInputType == Enum.UserInputType.Touch
        then
            self:_beginDrag("hue", Q.UserInputType == Enum.UserInputType.MouseButton1)
        end
    end)
    self.window:ConnectFor(self, self.alphaInteract.InputBegan, function(Q)
        if
            Q.UserInputType == Enum.UserInputType.MouseButton1
            or Q.UserInputType == Enum.UserInputType.Touch
        then
            self:_beginDrag("alpha", Q.UserInputType == Enum.UserInputType.MouseButton1)
        end
    end)
    self.window:ConnectFor(self, variables.userInputService.InputEnded, function(Q)
        if
            (
                Q.UserInputType == Enum.UserInputType.MouseButton1
                or Q.UserInputType == Enum.UserInputType.Touch
            ) and self._drag
        then
            self:_endDrag()
        end
    end)
    self.window:ConnectFor(self, self.hexInput.FocusLost, function()
        local Q = N(self.hexInput.Text)
        if Q then
            self:Set(Q)
        else
            self.hexInput.Text = "#" .. self.value:ToHex():upper()
        end
    end)
    self.window:ConnectFor(self, self.alphaInput.FocusLost, function()
        local Q = tonumber((self.alphaInput.Text:gsub("[^%d%.]", "")))
        if Q then
            self:SetAlpha(I(Q / 100))
        else
            self.alphaInput.Text = tostring(math.round(self.alpha * 100)) .. "%"
        end
    end)
end

function ColorPicker._beginDrag(self, Q, R)
    if not self._isOpen then
        return
    end
    self._drag = Q
    self._dragIsMouse = R
    self:_setHeld(Q)
    self:_pump()
    if self._dragConnection then
        self._dragConnection:Disconnect()
        self._dragConnection = nil
    end
    self._dragConnection = variables.runService.RenderStepped:Connect(function()
        local S = self._dragIsMouse
            and not variables.userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
        if self.window.unloaded or not self._drag or S then
            if S then
                self:_endDrag()
                return
            end
            if self._dragConnection then
                self._dragConnection:Disconnect()
                self._dragConnection = nil
            end
            return
        end
        self:_pump()
    end)
end

function ColorPicker._endDrag(self)
    self._drag = nil
    self:_setHeld(nil)
    if self._dragConnection then
        self._dragConnection:Disconnect()
        self._dragConnection = nil
    end
    self.window:_persist(self)
end

function ColorPicker._setHeld(self, Q)
    local R, S, T =
        if Q == "sat" then UDim2.fromOffset(16, 16) else UDim2.fromOffset(12, 12),
        if Q == "hue" then UDim2.fromOffset(t + 12, 10) else UDim2.fromOffset(t + 8, 8),
        if Q == "alpha" then UDim2.fromOffset(v + 12, 10) else UDim2.fromOffset(v + 8, 8)
    variables.tweenService:Create(self.satCursor, H, { Size = R }):Play()
    variables.tweenService:Create(self.hueHandle, H, { Size = S }):Play()
    variables.tweenService:Create(self.alphaHandle, H, { Size = T }):Play()
end

function ColorPicker._mouseLocation(self)
    local Q, R = variables.userInputService:GetMouseLocation(), self.window.screenGui
    if R and R.IgnoreGuiInset then
        return Q - variables.guiService:GetGuiInset()
    end
    return Q
end

function ColorPicker._pump(self)
    local Q, R, S, T = self.hue, self.sat, self.val, self.alpha
    if self._drag == "sat" then
        local U = self.map.AbsoluteSize
        if U.X <= 0 or U.Y <= 0 then
            return
        end
        local V = self:_mouseLocation()
        self.sat = I((V.X - self.map.AbsolutePosition.X) / U.X)
        self.val = 1 - I((V.Y - self.map.AbsolutePosition.Y) / U.Y)
    elseif self._drag == "hue" then
        local U = self.hueBar.AbsoluteSize.Y
        if U <= 0 then
            return
        end
        local V = self:_mouseLocation()
        self.hue = I((V.Y - self.hueBar.AbsolutePosition.Y) / U)
    elseif self._drag == "alpha" then
        local U = self.alphaBar.AbsoluteSize.Y
        if U <= 0 then
            return
        end
        local V = self:_mouseLocation()
        self.alpha = 1 - I((V.Y - self.alphaBar.AbsolutePosition.Y) / U)
    else
        return
    end
    if self.hue == Q and self.sat == R and self.val == S and self.alpha == T then
        return
    end
    self.value = Color3.fromHSV(self.hue, self.sat, self.val)
    self:_render("drag")
    self:_fireCallback()
end

function ColorPicker._render(self, Q)
    local R, S, T, U, V, W =
        Color3.fromHSV(self.hue, 1, 1),
        UDim2.new(self.sat, 0, 1 - self.val, 0),
        UDim2.new(0.5, 0, self.hue, 0),
        UDim2.new(0.5, 0, 1 - self.alpha, 0),
        1 - self.alpha,
        1 - 0.4 * self.alpha
    if Q == "instant" then
        self.map.BackgroundColor3 = R
        self.satCursor.Position, self.satCursor.BackgroundColor3 = S, self.value
        self.hueHandle.Position, self.hueHandle.BackgroundColor3 = T, R
        self.alphaBar.BackgroundColor3 = self.value
        self.alphaHandle.Position, self.alphaHandle.BackgroundColor3 = U, self.value
        self.preview.BackgroundColor3 = self.value
        self.previewShadow.Color = self.value
        if not self.window.hidden then
            self.preview.BackgroundTransparency = V
            self.previewShadow.Transparency = W
        end
    else
        local X = if Q == "drag" then G else F
        variables.tweenService:Create(self.map, X, { BackgroundColor3 = R }):Play()
        variables.tweenService
            :Create(self.satCursor, X, { Position = S, BackgroundColor3 = self.value })
            :Play()
        variables.tweenService:Create(self.hueHandle, X, { Position = T, BackgroundColor3 = R }):Play()
        variables.tweenService
            :Create(self.alphaHandle, X, { Position = U, BackgroundColor3 = self.value })
            :Play()
        variables.tweenService
            :Create(self.alphaBar, F, {
                BackgroundColor3 = self.value,
            })
            :Play()
        local Y, Z = { BackgroundColor3 = self.value }, { Color = self.value }
        if not self.window.hidden then
            Y.BackgroundTransparency = V
            Z.Transparency = W
        end
        variables.tweenService:Create(self.preview, F, Y):Play()
        variables.tweenService:Create(self.previewShadow, F, Z):Play()
    end
    if not self.hexInput:IsFocused() then
        self.hexInput.Text = "#" .. self.value:ToHex():upper()
    end
    if not self.alphaInput:IsFocused() then
        self.alphaInput.Text = tostring(math.round(self.alpha * 100)) .. "%"
    end
    self:_renderInvisible(Q ~= "instant")
end

function ColorPicker._renderInvisible(self, Q)
    local R = 0
    if self._isOpen and not self.window.hidden then
        R = I((0.12 - self.alpha) / 0.12)
    end
    local S = 1 - R
    if Q then
        variables.tweenService:Create(self.invisibleIcon, E, { ImageTransparency = S }):Play()
        variables.tweenService:Create(self.invisibleText, E, { TextTransparency = S }):Play()
    else
        self.invisibleIcon.ImageTransparency = S
        self.invisibleText.TextTransparency = S
    end
end

function ColorPicker._fireCallback(self)
    self.window:_runGuarded(self, self.callback, self.value, self.alpha)
end

function ColorPicker._open(self)
    if self._isOpen then
        return
    end
    self._isOpen = true
    self:_setControlsVisible(true)
    if self._outsideClickConn then
        self.window:Disconnect(self._outsideClickConn)
    end
    self._outsideClickConn = self.window:Connect(variables.userInputService.InputBegan, function(Q)
        if
            Q.UserInputType ~= Enum.UserInputType.MouseButton1
            and Q.UserInputType ~= Enum.UserInputType.Touch
        then
            return
        end
        local R, S, T = Q.Position, self.main.AbsolutePosition, self.main.AbsoluteSize
        if R.X < S.X or R.X > S.X + T.X or R.Y < S.Y or R.Y > S.Y + T.Y then
            self:_close()
        end
    end)
    variables.tweenService:Create(self.main, D, { Size = UDim2.new(1, -20, 0, self._openHeight) }):Play()
    variables.tweenService
        :Create(self.preview, D, { Position = self._previewOpenPos, Size = self._previewOpenSize })
        :Play()
    self:_applyPickerVisibility(true, true)
    self:_renderInvisible(true)
end

function ColorPicker._close(self)
    if not self._isOpen then
        return
    end
    self._isOpen = false
    if self._outsideClickConn then
        self.window:Disconnect(self._outsideClickConn)
        self._outsideClickConn = nil
    end
    if self._drag then
        self:_endDrag()
    end
    if self.hexInput:IsFocused() then
        self.hexInput:ReleaseFocus()
    end
    if self.alphaInput:IsFocused() then
        self.alphaInput:ReleaseFocus()
    end
    self:_applyPickerVisibility(false, true)
    self:_renderInvisible(true)
    variables.tweenService:Create(self.preview, D, { Position = B, Size = C }):Play()
    variables.tweenService:Create(self.main, D, { Size = UDim2.new(1, -20, 0, p) }):Play()
    task.delay(E.Time, function()
        if not self._isOpen then
            self:_setControlsVisible(false)
        end
    end)
end

function ColorPicker._applyPickerVisibility(self, Q, R)
    local S = {
        [self.map] = { BackgroundTransparency = if Q then 0 else 1 },
        [self.satOverlay] = {
            BackgroundTransparency = if Q then 0 else 1,
        },
        [self.valOverlay] = { BackgroundTransparency = if Q then 0 else 1 },
        [self.mapStroke] = {
            Transparency = if Q then 0.9 else 1,
        },
        [self.satCursor] = { BackgroundTransparency = if Q then 0 else 1 },
        [self.satCursorStroke] = {
            Transparency = if Q then 0 else 1,
        },
        [self.hueBar] = { BackgroundTransparency = if Q then 0 else 1 },
        [self.hueHandle] = {
            BackgroundTransparency = if Q then 0 else 1,
        },
        [self.hueHandleStroke] = { Transparency = if Q then 0 else 1 },
        [self.alphaBar] = {
            BackgroundTransparency = if Q then 0 else 1,
        },
        [self.alphaHandle] = { BackgroundTransparency = if Q then 0 else 1 },
        [self.alphaHandleStroke] = { Transparency = if Q then 0 else 1 },
        [self.hexBox] = { BackgroundTransparency = if Q then 0.9 else 1 },
        [self.hexBoxStroke] = { Transparency = if Q then 0.85 else 1 },
        [self.hexInput] = { TextTransparency = if Q then 0.4 else 1 },
        [self.alphaBox] = {
            BackgroundTransparency = if Q then 0.9 else 1,
        },
        [self.alphaBoxStroke] = { Transparency = if Q then 0.85 else 1 },
        [self.alphaInput] = {
            TextTransparency = if Q then 0.4 else 1,
        },
    }
    for T, U in S do
        if R then
            variables.tweenService:Create(T, E, U):Play()
        else
            for V, W in U do
                T[V] = W
            end
        end
    end
end

function ColorPicker._setControlsVisible(self, Q)
    for R, S in { self.map, self.hueBar, self.alphaBar, self.hexBox, self.alphaBox } do
        S.Visible = Q
    end
end

function ColorPicker._applyLayout(self)
    local Q = self.main.AbsoluteSize.X
    local R = if Q > 0 and Q < z then "narrow" else "wide"
    if R == self._layoutMode then
        return
    end
    self._layoutMode = R
    local S = A[R]
    self._openHeight = S.height
    self._previewOpenPos = S.previewPos
    self._previewOpenSize = S.previewSize
    self.hexBox.Position = S.hexPos
    self.hexBox.Size = S.hexSize
    self.alphaBox.Position = S.alphaFieldPos
    self.alphaBox.Size = S.alphaFieldSize
    if self._isOpen then
        variables.tweenService:Create(self.main, D, { Size = UDim2.new(1, -20, 0, self._openHeight) }):Play()
        variables.tweenService
            :Create(self.preview, D, { Position = self._previewOpenPos, Size = self._previewOpenSize })
            :Play()
    end
end

function ColorPicker.Set(self, Q, R)
    self.value = O(Q, self.value)
    self.hue, self.sat, self.val = self.value:ToHSV()
    self:_render(if self._isOpen then "animate" else "instant")
    if not R then
        self:_fireCallback()
        self.window:_persist(self)
    end
end

function ColorPicker.SetAlpha(self, Q, R)
    self.alpha = I(if type(Q) == "number" then Q else self.alpha)
    self:_render(if self._isOpen then "animate" else "instant")
    if not R then
        self:_fireCallback()
        self.window:_persist(self)
    end
end

function ColorPicker._serialize(self)
    return self.value:ToHex()
        .. string.format("%02x", math.clamp(math.round((self.alpha or 1) * 255), 0, 255))
end

function ColorPicker._deserialize(self, Q)
    local R, S = (tostring(Q))
    if #R >= 8 then
        S = (tonumber(R:sub(7, 8), 16) or 255) / 255
        R = R:sub(1, 6)
    end
    local T, U = pcall(Color3.fromHex, R)
    if not T then
        return
    end
    if S then
        self:SetAlpha(S, true)
    end
    self:Set(U)
end

function ColorPicker._setShown(self, Q, R)
    local S = self.window
    if Q then
        S:_revealCommon(self, R)
        S:_reveal(self.preview, { BackgroundTransparency = 1 - self.alpha }, R)
        S:_reveal(self.previewShadow, { Transparency = 1 - 0.4 * self.alpha }, R)
    else
        S:_hideCommon(self, R)
        S:_reveal(self.preview, {
            BackgroundTransparency = 1,
        }, R)
        S:_reveal(self.previewShadow, { Transparency = 1 }, R)
        if self._isOpen then
            self:_close()
        end
    end
end
moveable(ColorPicker)
lockable(ColorPicker)
return ColorPicker
