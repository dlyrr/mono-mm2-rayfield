-- Rayfield/components/input  (bundle module #13)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Input = {}
Input.__index = Input
Input.__type = "Input"
local utility = script.Parent.Parent.utility
local variables, functions, moveable, lockable, locale, constants, HapticEngine =
    require(utility.variables),
    require(utility.functions),
    require(utility.moveable),
    require(utility.lockable),
    require(utility.locale),
    require(utility.constants),
    require(utility.HapticEngine)
local f, g = constants.pillResizeInfo, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local function h(i)
    local j, k = i:match("^([%d%.%-]+)%^([%d%.%-]+)$")
    if j and k then
        local l, m = tonumber(j), tonumber(k)
        if l and m then
            return l ^ m
        end
    end
    return tonumber(i)
end

function Input.new(i, j)
    j = if typeof(j) == "table" then j else {}
    local k = setmetatable({
        tab = assert(i, "Missing argument #1 (Tab expected)"),
        window = i.window,
        name = j.name or j.Name or "Input",
        icon = j.icon or j.Icon,
        description = j.description or j.Description,
        forgetState = j.forgetState or j.ForgetState or i.forgetState,
        placeholder = j.placeholder or j.Placeholder or "",
        numeric = j.numeric or j.Numeric or false,
        clearOnFocus = j.clearOnFocus or j.ClearOnFocus or false,
        callback = j.callback or j.Callback or function() end,
    }, Input)
    k.value = tostring(j.value or j.Value or j.currentValue or j.CurrentValue or "")
    k.flag = j.flag or j.Flag or (not k.forgetState and functions.deriveFlagFromName(k.name) or nil)
    k.window:_registerControl(k)
    k.main = k.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 41),
        BorderSizePixel = 0,
        Name = k.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = k.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })
    k.stroke = k.window:StyleElementBody(k.main)
    k.hoverOverlay = k.window:CreateHoverOverlay(k.main)
    k.container = k.window:Create("Frame", {
        Size = UDim2.new(0, 170, 0, 16),
        Position = UDim2.new(0, 20, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = k.main,
    })
    k.window:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = k.container,
    })
    if k.icon then
        k.iconLabel = k.window:Create("ImageLabel", {
            Image = k.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ZIndex = 5,
            ImageTransparency = 1,
            Parent = k.container,
        }, { ImageColor3 = "ContentColor" })
    end
    k.title = k.window:Create("TextLabel", {
        Text = locale.t(k.name),
        Size = UDim2.fromOffset(150, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        ZIndex = 5,
        TextTransparency = 1,
        Parent = k.container,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    k.box = k.window:Create("Frame", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -7, 0, 20),
        Size = UDim2.fromOffset(85, 30),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Parent = k.main,
    }, { BackgroundColor3 = "FieldBackground" })
    k.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = k.box })
    k.boxStroke = k.window:Create(
        "UIStroke",
        { Transparency = 1, Parent = k.box },
        { Color = "SurfaceStroke" }
    )
    k.glow = k.window:CreateGlow(k.box, "FieldGlow", 20, 1)
    k._glowIdle = 1
    k.input = k.window:Create("TextBox", {
        Text = k.value,
        PlaceholderText = locale.t(k.placeholder),
        Size = UDim2.new(1, -15, 0, 15),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ClearTextOnFocus = k.clearOnFocus,
        TextTransparency = 1,
        Parent = k.box,
    }, { TextColor3 = "ContentColor", FontFace = "Font", PlaceholderColor3 = "PlaceholderColor" })
    k.window:ConnectFor(k, k.input:GetPropertyChangedSignal("Text"), function()
        if k.numeric then
            local l = (k.input.Text:gsub("[^%d%.%-eE%^]", ""))
            if l ~= k.input.Text then
                k.input.Text = l
                return
            end
        end
        k:_sizeBox(true)
    end)
    k.window:ConnectFor(k, k.input.Focused, function()
        variables.tweenService:Create(k.input, g, { TextTransparency = 0 }):Play()
    end)
    k.window:ConnectFor(k, k.input.FocusLost, function()
        variables.tweenService:Create(k.input, g, { TextTransparency = 0.6 }):Play()
        if k.clearOnFocus and k.input.Text == "" and k.value ~= "" then
            k.input.Text = k.value
            return
        end
        if k.input.Text == k.value then
            return
        end
        k:_commit(k.input.Text)
    end)
    k.window:_wireElementHover(k)
    if k.description then
        k.descriptor = require(script.Parent.descriptor).new(k.tab, { description = k.description })
    end
    k:_sizeBox(false)
    return k
end

function Input._sizeBox(self, j)
    local k = self.input.Text ~= "" and self.input.Text or self.placeholder
    local l = math.clamp(functions.textWidth(self.window.theme.Font, 15, k) + 30, 70, 220)
    if j then
        variables.tweenService:Create(self.box, f, { Size = UDim2.fromOffset(l, 30) }):Play()
    else
        self.box.Size = UDim2.fromOffset(l, 30)
    end
end

function Input._commit(self, j, k)
    j = tostring(j)
    if self.numeric then
        local l = h(j)
        if not l or l ~= l or l == math.huge or l == -math.huge then
            if self.input.Text ~= self.value then
                self.input.Text = self.value
            end
            return
        end
        j = tostring(l)
    end
    local l = j ~= self.value
    self.value = j
    if self.input.Text ~= j then
        self.input.Text = j
    end
    if not k then
        self.window:_runGuarded(self, self.callback, j)
        self.window:_persist(self)
        if l and not self.window._loading then
            HapticEngine.click()
            self.window:_flashResult(self, true)
        end
    end
end

function Input.Set(self, j, k)
    self:_commit(j, k)
end

function Input._setShown(self, j, k)
    local l = self.window
    if j then
        l:_revealCommon(self, k)
        l:_reveal(self.box, { BackgroundTransparency = l.theme.FieldTransparency }, k)
        l:_reveal(self.boxStroke, {
            Transparency = 0.85,
        }, k)
        l:_reveal(self.input, { TextTransparency = 0.6 }, k)
    else
        l:_hideCommon(self, k)
        l:_reveal(self.box, {
            BackgroundTransparency = 1,
        }, k)
        l:_reveal(self.boxStroke, { Transparency = 1 }, k)
        l:_reveal(self.input, { TextTransparency = 1 }, k)
    end
end

function Input._refreshTheme(self)
    variables.tweenService
        :Create(
            self.box,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { BackgroundTransparency = self.window.theme.FieldTransparency }
        )
        :Play()
end
moveable(Input)
lockable(Input)
return Input
