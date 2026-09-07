-- Rayfield/components/toast  (bundle module #28)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Toast = {}
Toast.__index = Toast
Toast.__type = "Toast"
local utility = script.Parent.Parent.utility
local variables, functions, constants, image, HapticEngine, al, am, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r =
    require(utility.variables),
    require(utility.functions),
    require(utility.constants),
    require(utility.image),
    require(utility.HapticEngine),
    TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    24,
    32,
    18,
    18,
    10,
    28,
    12,
    8,
    140,
    320,
    6,
    UDim2.new(0.5, 0, 0.5, -180),
    UDim2.new(0.5, 0, 0.5, 180),
    UDim2.new(0.5, 0, 0.5, 0)

local function s(t)
    return math.clamp(#t * 0.06 + 3, 3, 9)
end

local function t(u)
    if type(u) == "number" then
        return "rbxassetid://" .. tostring(u)
    end
    return u
end

function Toast.new(u, v, w)
    v = if typeof(v) == "table" then v else {}
    local x = setmetatable({
        window = assert(u, "Missing argument #1 (Window expected)"),
        title = v.title or v.Title or "",
        subtitle = v.subtitle or v.Subtitle,
        icon = v.icon or v.Icon,
        avatar = v.avatar or v.Avatar,
        minWidth = v.minWidth or v.MinWidth,
        subtitleAbove = v.subtitleAbove or v.SubtitleAbove or false,
        position = v.position or "Top",
        _hovered = false,
        _dismissed = false,
    }, Toast)
    x.duration = v.duration or v.Duration or s(x.title .. (x.subtitle or ""))
    local y = x.avatar ~= nil and x.avatar ~= 0
    local z = y or (x.icon ~= nil and x.icon ~= 0 and x.icon ~= "")
    x._iconImage = if y
        then image.avatar(x.avatar, function(A)
            if x.iconLabel and not x._dismissed and x.main.Parent then
                image.assign(x.iconLabel, "Image", A)
            end
        end)
        elseif z then t(x.icon)
        else nil
    x._iconSize = if y then f else e
    x._leftPad = if y then i else g
    x._rightPad = if y then j else h
    x._minWidth = math.clamp(x.minWidth or 0, m, n)
    local A = x.subtitle ~= nil and x.subtitle ~= ""
    x.main = x.window:Create("Frame", {
        Name = "Toast",
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 0, 0, 0),
        BorderSizePixel = 0,
        ZIndex = constants.zIndex.toast,
        Parent = w or x.window.toasts,
    })
    x.window:Create("UIPadding", {
        PaddingTop = UDim.new(0, l),
        Parent = x.main,
    })
    x.body = x.window:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(1, 0, 1, 0),
        Position = if x.position == "Bottom" then q else p,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Active = true,
        BorderSizePixel = 0,
        ZIndex = constants.zIndex.toast,
        BackgroundTransparency = 1,
        Parent = x.main,
    })
    x.window:Create(
        "UIGradient",
        { Rotation = 270, Offset = Vector2.new(0, -0.1), Parent = x.body },
        { Color = { "WindowColor", functions.toColorSequence } }
    )
    x.window:Create("UICorner", {
        CornerRadius = UDim.new(1, 0),
        Parent = x.body,
    })
    x.stroke = x.window:Create("UIStroke", { Transparency = 1, Parent = x.body }, { Color = "SurfaceStroke" })
    x.shadow = x.window:CreateGlow(x.body, "ShadowColor", 20, 1)
    x.window:Create(
        "UIPadding",
        { PaddingLeft = UDim.new(0, x._leftPad), PaddingRight = UDim.new(0, x._rightPad), Parent = x.body }
    )
    x.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, k),
        Parent = x.body,
    })
    if z then
        x.iconLabel = x.window:Create("ImageLabel", {
            Image = x._iconImage,
            Size = UDim2.fromOffset(x._iconSize, x._iconSize),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderSizePixel = 0,
            LayoutOrder = 1,
            ZIndex = constants.zIndex.toastContent,
            BackgroundTransparency = 1,
            ImageTransparency = 1,
            Parent = x.body,
        }, if y then nil else { ImageColor3 = "ContentColor" })
        x.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = x.iconLabel })
    end
    x.container = x.window:Create("Frame", {
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, A and 32 or 16),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        ZIndex = constants.zIndex.toastContent,
        Parent = x.body,
    })
    x.window:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 1),
        Parent = x.container,
    })
    x.titleLabel = x.window:Create("TextLabel", {
        Text = x.title,
        AutomaticSize = Enum.AutomaticSize.X,
        Size = UDim2.fromOffset(0, 16),
        BackgroundTransparency = 1,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = if x.subtitleAbove then 2 else 1,
        ZIndex = constants.zIndex.toastContent,
        TextTransparency = 1,
        Parent = x.container,
    }, { TextColor3 = "ContentColor", FontFace = "TitleFont" })
    if A then
        x.subtitleLabel = x.window:Create("TextLabel", {
            Text = x.subtitle,
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromOffset(0, 14),
            BackgroundTransparency = 1,
            TextSize = 14,
            TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = if x.subtitleAbove then 1 else 2,
            ZIndex = constants.zIndex.toastContent,
            TextTransparency = 1,
            Parent = x.container,
        }, { TextColor3 = "ContentColor", FontFace = "Font" })
    end
    x.window._toastCount = (x.window._toastCount or 0) + 1
    x.main.LayoutOrder = -x.window._toastCount
    local B = x.window._liveToasts
    if not B then
        B = {}
        x.window._liveToasts = B
    end
    local C = B[x.main.Parent]
    if not C then
        C = {}
        B[x.main.Parent] = C
    end
    x._live = C
    table.insert(C, x)
    while #C > o do
        local D = table.remove(C, 1)
        if D and D ~= x then
            task.spawn(D._dismiss, D)
        end
    end
    x._connections = {
        x.window:Connect(x.body.MouseEnter, function()
            x._hovered = true
        end),
        x.window:Connect(x.body.MouseLeave, function()
            x._hovered = false
        end),
        x.window:Connect(x.body.InputBegan, function(D)
            if
                D.UserInputType == Enum.UserInputType.MouseButton1
                or D.UserInputType == Enum.UserInputType.Touch
            then
                x:_dismiss()
            end
        end),
    }
    task.spawn(function()
        x:_show()
    end)
    return x
end

function Toast._measure(self)
    local v, w =
        functions.textWidth(self.window.theme.TitleFont, 16, self.title),
        if self.subtitleLabel then functions.textWidth(self.window.theme.Font, 14, self.subtitle) else 0
    local x, y = math.max(v, w), if self.iconLabel then self._leftPad + self._iconSize + k else self._leftPad
    local z = math.clamp(y + x + self._rightPad, self._minWidth, n)
    if y + x + self._rightPad > n then
        local A = n - y - self._rightPad
        for B, C in { self.titleLabel, self.subtitleLabel } do
            if C then
                C.AutomaticSize = Enum.AutomaticSize.None
                C.TextTruncate = Enum.TextTruncate.AtEnd
                C.Size = UDim2.fromOffset(A, C.Size.Y.Offset)
            end
        end
    end
    local A = if self.subtitleLabel then 31 else 16
    local B = math.max(A, if self.iconLabel then self._iconSize else 0) + 18
    return z, B
end

function Toast._show(self)
    if not self.main.Parent then
        return
    end
    HapticEngine.notify()
    local v, w = self:_measure()
    if self._dismissed or not self.main.Parent then
        return
    end
    self.main.Size = UDim2.new(0, v, 0, 0)
    variables.tweenService:Create(self.main, am, { Size = UDim2.new(0, v, 0, w + l) }):Play()
    variables.tweenService:Create(self.body, al, { Position = r }):Play()
    variables.tweenService:Create(self.body, b, { BackgroundTransparency = 0 }):Play()
    variables.tweenService:Create(self.stroke, b, { Transparency = 0.9 }):Play()
    variables.tweenService:Create(self.shadow, c, { Transparency = 0.6 }):Play()
    variables.tweenService
        :Create(self.titleLabel, c, {
            TextTransparency = 0,
        })
        :Play()
    task.wait(0.05)
    if self._dismissed or not self.main.Parent then
        return
    end
    if self.iconLabel then
        variables.tweenService:Create(self.iconLabel, c, { BackgroundTransparency = 0.95 }):Play()
        variables.tweenService
            :Create(self.iconLabel, c, {
                ImageTransparency = 0,
            })
            :Play()
    end
    task.wait(0.05)
    if self._dismissed or not self.main.Parent then
        return
    end
    if self.subtitleLabel then
        variables.tweenService:Create(self.subtitleLabel, c, { TextTransparency = 0.5 }):Play()
    end
    local x = 0
    while x < self.duration and not self._dismissed and self.main.Parent do
        local y = task.wait()
        if not self._hovered then
            x += y
        end
    end
    self:_dismiss()
end

function Toast._dismiss(self)
    if self._dismissed then
        return
    end
    self._dismissed = true
    local v = self._live
    local w = v and table.find(v, self)
    if v and w then
        table.remove(v, w)
    end
    if not self.main.Parent then
        return
    end
    variables.tweenService:Create(self.body, b, { BackgroundTransparency = 1 }):Play()
    variables.tweenService:Create(self.stroke, b, { Transparency = 1 }):Play()
    variables.tweenService:Create(self.shadow, c, { Transparency = 1 }):Play()
    variables.tweenService:Create(self.titleLabel, c, { TextTransparency = 1 }):Play()
    if self.subtitleLabel then
        variables.tweenService:Create(self.subtitleLabel, c, { TextTransparency = 1 }):Play()
    end
    if self.iconLabel then
        variables.tweenService
            :Create(self.iconLabel, c, {
                ImageTransparency = 1,
                BackgroundTransparency = 1,
            })
            :Play()
    end
    variables.tweenService:Create(self.body, d, { Size = UDim2.new(1, -60, 1, 0) }):Play()
    local x =
        variables.tweenService:Create(self.main, d, { Size = UDim2.new(0, self.main.Size.X.Offset, 0, 0) })
    x:Play()
    x.Completed:Wait()
    if not self.main.Parent then
        return
    end
    for y, z in self._connections do
        self.window:Disconnect(z)
    end
    self.window:DestroySubtree(self.main)
end
return Toast
