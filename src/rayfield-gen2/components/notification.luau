-- Rayfield/components/notification  (bundle module #15)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Notification = {}
Notification.__index = Notification
Notification.__type = "Notification"
local utility = script.Parent.Parent.utility
local variables, functions, constants, HapticEngine, c, d, e, f, g, h, i, j, k =
    require(utility.variables),
    require(utility.functions),
    require(utility.constants),
    require(utility.HapticEngine),
    TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.9, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    UDim2.new(0.5, 360, 0.5, 0),
    UDim2.new(0.5, 0, 0.5, 0),
    6,
    8

local function l(m)
    return math.clamp(#m * 0.06 + 3, 3, 9)
end

function Notification.new(m, n)
    n = if typeof(n) == "table" then n else {}
    local o = setmetatable({
        window = assert(m, "Missing argument #1 (Window expected)"),
        title = n.title or n.Title or "Notification",
        content = n.content or n.Content or "",
        icon = n.icon or n.Icon,
        _hovered = false,
        _dismissed = false,
    }, Notification)
    o.duration = n.duration or n.Duration or l(o.content)
    local p = o.icon ~= nil and o.icon ~= 0 and o.icon ~= ""
    o.main = o.window:Create("Frame", {
        Name = "Notification",
        BackgroundTransparency = 1,
        Size = UDim2.new(1, 0, 0, 0),
        BorderSizePixel = 0,
        ZIndex = constants.zIndex.notification,
        Parent = o.window.notifications,
    })
    o.window:Create("UIPadding", { PaddingTop = UDim.new(0, k), Parent = o.main })
    o.body = o.window:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(1, 0, 1, 0),
        Position = h,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Active = true,
        BorderSizePixel = 0,
        ZIndex = constants.zIndex.notification,
        BackgroundTransparency = 1,
        Parent = o.main,
    })
    o.window:Create(
        "UIGradient",
        { Rotation = 270, Offset = Vector2.new(0, -0.1), Parent = o.body },
        { Color = { "WindowColor", functions.toColorSequence } }
    )
    o.window:Create("UICorner", { Parent = o.body }, {
        CornerRadius = "CornerRoundness",
    })
    o.stroke = o.window:Create("UIStroke", { Transparency = 1, Parent = o.body }, { Color = "SurfaceStroke" })
    o.shadow = o.window:CreateGlow(o.body, "ShadowColor", 20, 1)
    o.window:Create(
        "UIPadding",
        { PaddingLeft = UDim.new(0, 20), PaddingRight = UDim.new(0, 20), Parent = o.body }
    )
    o.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 14),
        Parent = o.body,
    })
    if p then
        o.iconLabel = o.window:Create("ImageLabel", {
            Image = o.icon,
            Size = UDim2.fromOffset(24, 24),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            ZIndex = constants.zIndex.notification,
            ImageTransparency = 1,
            Parent = o.body,
        }, { ImageColor3 = "ContentColor" })
    end
    o.container = o.window:Create("Frame", {
        Size = UDim2.fromOffset(p and 222 or 260, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        ZIndex = constants.zIndex.notification,
        Parent = o.body,
    })
    o.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 4),
        Parent = o.container,
    })
    o.titleLabel = o.window:Create("TextLabel", {
        Text = o.title,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        TextSize = 16,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        ZIndex = constants.zIndex.notification,
        TextTransparency = 1,
        Parent = o.container,
    }, { TextColor3 = "ContentColor", FontFace = "TitleFont" })
    if o.content ~= "" then
        o.descriptionLabel = o.window:Create("TextLabel", {
            Text = o.content,
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            TextSize = 15,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            LayoutOrder = 2,
            ZIndex = constants.zIndex.notification,
            TextTransparency = 1,
            Parent = o.container,
        }, { TextColor3 = "ContentColor", FontFace = "Font" })
    end
    o.window._notificationCount = (o.window._notificationCount or 0) + 1
    o.main.LayoutOrder = o.window._notificationCount
    local q = o.window._liveNotifications
    if not q then
        q = {}
        o.window._liveNotifications = q
    end
    table.insert(q, o)
    while #q > j do
        local r = table.remove(q, 1)
        if r and r ~= o then
            task.spawn(r._dismiss, r)
        end
    end
    o._connections = {
        o.window:Connect(o.body.MouseEnter, function()
            o._hovered = true
        end),
        o.window:Connect(o.body.MouseLeave, function()
            o._hovered = false
        end),
        o.window:Connect(o.body.InputBegan, function(r)
            if
                r.UserInputType == Enum.UserInputType.MouseButton1
                or r.UserInputType == Enum.UserInputType.Touch
            then
                o:_dismiss()
            end
        end),
    }
    task.spawn(function()
        o:_show()
    end)
    return o
end

function Notification._measure(self)
    local n = self.iconLabel and 222 or 260
    local o = functions.textHeight(self.window.theme.TitleFont, 16, self.title, n)
    if self.descriptionLabel then
        o = o + 4 + functions.textHeight(self.window.theme.Font, 15, self.content, n)
    end
    return math.max(o, self.iconLabel and 24 or 0) + 28
end

function Notification._show(self)
    local n = self:_measure() + k
    if self._dismissed or not self.main.Parent then
        return
    end
    HapticEngine.notify()
    variables.tweenService:Create(self.main, c, { Size = UDim2.new(1, 0, 0, n) }):Play()
    variables.tweenService:Create(self.body, f, { Position = i }):Play()
    variables.tweenService:Create(self.body, d, { BackgroundTransparency = 0 }):Play()
    variables.tweenService:Create(self.titleLabel, e, { TextTransparency = 0 }):Play()
    variables.tweenService:Create(self.stroke, d, { Transparency = 0.95 }):Play()
    variables.tweenService:Create(self.shadow, e, { Transparency = 0.6 }):Play()
    task.wait(0.05)
    if self._dismissed or not self.main.Parent then
        return
    end
    if self.iconLabel then
        variables.tweenService:Create(self.iconLabel, e, { ImageTransparency = 0 }):Play()
    end
    task.wait(0.05)
    if self._dismissed or not self.main.Parent then
        return
    end
    if self.descriptionLabel then
        variables.tweenService
            :Create(self.descriptionLabel, e, {
                TextTransparency = 0.35,
            })
            :Play()
    end
    local o = 0
    while o < self.duration and not self._dismissed and self.main.Parent do
        local p = task.wait()
        if not self._hovered then
            o += p
        end
    end
    self:_dismiss()
end

function Notification._dismiss(self)
    if self._dismissed then
        return
    end
    self._dismissed = true
    local n = self.window._liveNotifications
    local o = n and table.find(n, self)
    if n and o then
        table.remove(n, o)
    end
    if not self.main.Parent then
        return
    end
    variables.tweenService:Create(self.body, d, { BackgroundTransparency = 1 }):Play()
    variables.tweenService:Create(self.stroke, d, { Transparency = 1 }):Play()
    variables.tweenService:Create(self.shadow, e, { Transparency = 1 }):Play()
    variables.tweenService:Create(self.titleLabel, e, { TextTransparency = 1 }):Play()
    if self.descriptionLabel then
        variables.tweenService:Create(self.descriptionLabel, e, { TextTransparency = 1 }):Play()
    end
    if self.iconLabel then
        variables.tweenService:Create(self.iconLabel, e, { ImageTransparency = 1 }):Play()
    end
    variables.tweenService:Create(self.body, g, { Size = UDim2.new(1, -90, 1, 0) }):Play()
    local p = variables.tweenService:Create(self.main, g, { Size = UDim2.new(1, 0, 0, 0) })
    p:Play()
    p.Completed:Wait()
    if not self.main.Parent then
        return
    end
    for q, r in self._connections do
        self.window:Disconnect(r)
    end
    self.window:DestroySubtree(self.main)
end
return Notification
