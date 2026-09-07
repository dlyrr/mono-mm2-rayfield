-- Rayfield/components/keybind  (bundle module #14)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Keybind = {}
Keybind.__index = Keybind
Keybind.__type = "Keybind"
local utility = script.Parent.Parent.utility
local variables, functions, moveable, lockable, locale, constants, HapticEngine, enums, log =
    require(utility.variables),
    require(utility.functions),
    require(utility.moveable),
    require(utility.lockable),
    require(utility.locale),
    require(utility.constants),
    require(utility.HapticEngine),
    require(utility.enums),
    require(utility.log)
local h, i, j =
    constants.pillResizeInfo, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        [Enum.UserInputType.MouseButton1] = "MB1",
        [Enum.UserInputType.MouseButton2] = "MB2",
        [Enum.UserInputType.MouseButton3] = "MB3",
    }

local function k(l)
    if typeof(l) ~= "EnumItem" or l == Enum.KeyCode.Unknown then
        return "None"
    end
    return j[l] or l.Name
end

local function l(m)
    if typeof(m) == "EnumItem" then
        return m
    end
    if type(m) == "string" then
        local n, o = pcall(function()
            return Enum.KeyCode[m]
        end)
        if n and o then
            return o
        end
        local p, q = pcall(function()
            return Enum.UserInputType[m]
        end)
        if p and q and j[q] then
            return q
        end
    end
    return Enum.KeyCode.Unknown
end

function Keybind.new(m, n)
    n = if typeof(n) == "table" then n else {}
    local o = setmetatable({
        tab = assert(m, "Missing argument #1 (Tab expected)"),
        window = m.window,
        name = n.name or n.Name or "Keybind",
        icon = n.icon or n.Icon,
        description = n.description or n.Description,
        forgetState = n.forgetState or n.ForgetState or m.forgetState,
        isMenuToggle = n.isMenuToggle or n.IsMenuToggle or false,
        callback = n.callback or n.Callback or function() end,
        onChanged = n.onChanged or n.OnChanged or function() end,
        hold = n.hold or n.Hold or false,
        holdThreshold = n.holdThreshold or n.HoldThreshold or 0.2,
        recording = false,
    }, Keybind)
    o.value = l(n.value or n.Value or n.default or n.Default)
    o.flag = n.flag or n.Flag or (not o.forgetState and functions.deriveFlagFromName(o.name) or nil)
    o.window:_registerControl(o)
    o.main = o.window:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 41),
        BorderSizePixel = 0,
        Name = o.name,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Parent = o.tab.tabPage,
    }, { BackgroundTransparency = "ElementTransparency" })
    o.stroke = o.window:StyleElementBody(o.main)
    o.hoverOverlay = o.window:CreateHoverOverlay(o.main)
    o.container = o.window:Create("Frame", {
        Size = UDim2.new(0, 170, 0, 16),
        Position = UDim2.new(0, 20, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = o.main,
    })
    o.window:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        Parent = o.container,
    })
    if o.icon then
        o.iconLabel = o.window:Create("ImageLabel", {
            Image = o.icon,
            Size = UDim2.fromOffset(16, 16),
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            ZIndex = 5,
            ImageTransparency = 1,
            Parent = o.container,
        }, { ImageColor3 = "ContentColor" })
    end
    o.title = o.window:Create("TextLabel", {
        Text = locale.t(o.name),
        Size = UDim2.fromOffset(150, 16),
        AutomaticSize = Enum.AutomaticSize.X,
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        ZIndex = 5,
        TextTransparency = 1,
        Parent = o.container,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    o.box = o.window:Create("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -7, 0, 20),
        Size = UDim2.fromOffset(40, 30),
        AutoButtonColor = false,
        Text = "",
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        Parent = o.main,
    }, { BackgroundColor3 = "FieldBackground" })
    o.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = o.box })
    o.boxStroke = o.window:Create(
        "UIStroke",
        { Transparency = 1, Parent = o.box },
        { Color = "SurfaceStroke" }
    )
    o.glow = o.window:CreateGlow(o.box, "FieldGlow", 20, 1)
    o._glowIdle = 0.9
    o.keyLabel = o.window:Create("TextLabel", {
        Text = k(o.value),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Center,
        ZIndex = 2,
        TextTransparency = 1,
        Parent = o.box,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    o.window:ConnectFor(o, o.box.MouseButton1Click, function()
        HapticEngine.click()
        if o.recording then
            o:_stopRecording()
        else
            o:_startRecording()
        end
    end)
    o.window:ConnectFor(o, variables.userInputService.InputBegan, function(p, q)
        if q then
            return
        end
        if o.recording then
            o:_capture(p)
            return
        end
        if o.window._recordingKeybind then
            return
        end
        if o:_matches(p) then
            if o.hold then
                o:_beginHold(p)
            else
                o.window:_runGuarded(o, o.callback, o.value)
            end
        end
    end)
    o.window:_wireElementHover(o)
    if o.description then
        o.descriptor = require(script.Parent.descriptor).new(o.tab, { description = o.description })
    end
    o:_sizeBox(false)
    return o
end

function Keybind._sizeBox(self, n)
    local o = math.clamp(functions.textWidth(self.window.theme.Font, 15, self.keyLabel.Text) + 28, 40, 200)
    if n then
        variables.tweenService:Create(self.box, h, { Size = UDim2.fromOffset(o, 30) }):Play()
    else
        self.box.Size = UDim2.fromOffset(o, 30)
    end
end

function Keybind._startRecording(self)
    local n = self.window._recordingKeybind
    if n and n ~= self then
        n:_stopRecording()
    end
    self.recording = true
    self.window._recordingKeybind = self
    self.keyLabel.Text = locale.resolve("Recording")
    self:_sizeBox(true)
    variables.tweenService
        :Create(self.glow, i, {
            Transparency = 0.7,
        })
        :Play()
    variables.tweenService:Create(self.keyLabel, i, { TextTransparency = 0 }):Play()
end

function Keybind._stopRecording(self)
    self.recording = false
    if self.window._recordingKeybind == self then
        local n = self.window
        task.defer(function()
            if n._recordingKeybind == self then
                n._recordingKeybind = nil
            end
        end)
    end
    self.keyLabel.Text = k(self.value)
    self:_sizeBox(true)
    variables.tweenService
        :Create(self.glow, i, {
            Transparency = 0.9,
        })
        :Play()
    variables.tweenService:Create(self.keyLabel, i, { TextTransparency = 0.6 }):Play()
end

function Keybind._capture(self, n)
    local o
    if n.UserInputType == Enum.UserInputType.Keyboard then
        if n.KeyCode == Enum.KeyCode.Escape then
            self:_stopRecording()
            return
        end
        if n.KeyCode == Enum.KeyCode.Backspace then
            self:_bind(Enum.KeyCode.Unknown)
            return
        end
        o = n.KeyCode
    elseif
        n.UserInputType == Enum.UserInputType.MouseButton2
        or n.UserInputType == Enum.UserInputType.MouseButton3
    then
        o = n.UserInputType
    end
    if not o then
        return
    end
    if self.isMenuToggle then
        local p = self.window:_keybindUsing(o, self)
        if p then
            self.window:Notify({
                title = locale.resolve("Keybind unavailable"),
                content = string.format(
                    locale.resolve("%s is bound to %s. Kept %s."),
                    k(o),
                    p.name,
                    k(self.value)
                ),
            })
            self:_stopRecording()
            self.window:_flashResult(self, false)
            return
        end
    elseif o == self.window.settings.toggleKeybind then
        self.window:Notify({
            title = locale.resolve("Keybind unavailable"),
            content = string.format(
                locale.resolve("%s is the menu toggle key. Kept %s."),
                k(o),
                k(self.value)
            ),
        })
        self:_stopRecording()
        self.window:_flashResult(self, false)
        return
    end
    self:_bind(o)
end

function Keybind._bind(self, n)
    self.value = n
    self:_stopRecording()
    self.window:_runGuarded(self, self.onChanged, n)
    self.window:_persist(self)
    self.window:_flashResult(self, true)
end

function Keybind._matches(self, n)
    local o = self.value
    if typeof(o) ~= "EnumItem" or o == Enum.KeyCode.Unknown then
        return false
    end
    if o.EnumType == Enum.KeyCode then
        return n.KeyCode == o
    elseif o.EnumType == Enum.UserInputType then
        return n.UserInputType == o
    end
    return false
end

function Keybind._beginHold(self, n)
    if self._holding or self._holdPress then
        return
    end
    local o = {}
    self._holdPress = o
    local p, q = n.KeyCode, n.UserInputType
    task.delay(self.holdThreshold, function()
        if self._holdPress ~= o then
            return
        end
        self._holding = true
        self.window:_runGuarded(self, self.callback, true)
    end)
    local r
    r = self.window:ConnectFor(self, variables.userInputService.InputEnded, function(s)
        local t = if p ~= Enum.KeyCode.Unknown then s.KeyCode == p else s.UserInputType == q
        if not t then
            return
        end
        if self.connections then
            local u = table.find(self.connections, r)
            if u then
                table.remove(self.connections, u)
            end
        end
        self.window:Disconnect(r)
        if self._holdPress == o then
            self._holdPress = nil
        end
        if self._holding then
            self._holding = false
            self.window:_runGuarded(self, self.callback, false)
        end
    end)
end

function Keybind.Set(self, n, o)
    local p = l(n)
    if p ~= Enum.KeyCode.Unknown then
        if self.isMenuToggle then
            local q = self.window:_keybindUsing(p, self)
            if q then
                log.warn(
                    "Rayfield: "
                        .. k(p)
                        .. " is bound to '"
                        .. tostring(q.name)
                        .. "'; kept "
                        .. k(self.value)
                )
                return
            end
        elseif p == self.window.settings.toggleKeybind then
            log.warn("Rayfield: " .. k(p) .. " is the menu toggle key; kept " .. k(self.value))
            return
        end
    end
    self.value = p
    if self.recording then
        self:_stopRecording()
    else
        self.keyLabel.Text = k(self.value)
        self:_sizeBox(true)
    end
    if not o then
        self.window:_runGuarded(self, self.onChanged, self.value)
        self.window:_persist(self)
    end
end

function Keybind._serialize(self)
    return { tostring(self.value.EnumType), self.value.Value }
end

function Keybind._deserialize(self, n)
    local o = tostring(n[1]):gsub("^Enum%.", "")
    local p, q = pcall(function()
        return Enum[o]
    end)
    if not p or not q then
        return
    end
    local r = enums.itemFromValue(q, n[2])
    if r then
        self:Set(r)
    end
end

function Keybind._setShown(self, n, o)
    local p = self.window
    if n then
        p:_revealCommon(self, o)
        p:_reveal(self.box, { BackgroundTransparency = p.theme.FieldTransparency }, o)
        p:_reveal(self.boxStroke, { Transparency = 0.85 }, o)
        p:_reveal(self.keyLabel, { TextTransparency = 0.6 }, o)
        p:_reveal(self.glow, { Transparency = 0.9 }, o)
    else
        p:_hideCommon(self, o)
        p:_reveal(self.box, { BackgroundTransparency = 1 }, o)
        p:_reveal(self.boxStroke, { Transparency = 1 }, o)
        p:_reveal(self.keyLabel, { TextTransparency = 1 }, o)
        p:_reveal(self.glow, { Transparency = 1 }, o)
    end
end

function Keybind._refreshTheme(self)
    variables.tweenService
        :Create(
            self.box,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { BackgroundTransparency = self.window.theme.FieldTransparency }
        )
        :Play()
end
moveable(Keybind)
lockable(Keybind)
return Keybind
