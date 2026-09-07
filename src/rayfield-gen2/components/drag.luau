-- Rayfield/components/drag  (bundle module #10)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Drag = {}
Drag.__index = Drag
Drag.__type = "Drag"
local utility = script.Parent.Parent.utility
local variables, constants = require(utility.variables), require(utility.constants)

function Drag.new(j, k)
    k = if typeof(k) == "table" then k else {}
    local l = setmetatable({ window = assert(j, "Missing argument #1 (Window expected)") }, Drag)
    l.drag = l.window:Create("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(150, 20),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, l.window.size.Y.Offset / 2 + 15),
        ZIndex = constants.zIndex.drag,
        Visible = false,
        Parent = l.window.screenGui,
    })
    l.dragCosmetic = l.window:Create("Frame", {
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.3),
        ZIndex = constants.zIndex.drag,
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(0, 4),
        Parent = l.drag,
    })
    l.window:Create("UICorner", { CornerRadius = UDim.new(0, 20), Parent = l.dragCosmetic })
    l.window:CreateGlow(l.dragCosmetic, Color3.fromRGB(255, 255, 255), 10, 0.5)
    l.dragInteract = l.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        TextTransparency = 1,
        ZIndex = constants.zIndex.drag,
        Parent = l.drag,
    })
    local m, n, o, p = false, Vector2.zero, l.window.screenGui
    if o and o.IgnoreGuiInset then
        n = variables.guiService:GetGuiInset()
    end
    local function q()
        local r, s, t =
            variables.userInputService and variables.userInputService:GetMouseLocation() or Vector2.new(0, 0),
            p or Vector2.new(0, 0),
            n or Vector2.new(0, 0)
        return r + s + t
    end
    local function r()
        local s = q()
        local t, u = s.X, s.Y
        if l.window.settings and l.window.settings.keepOnScreen then
            local v, w, x = l.window.main.AbsoluteSize, l.window.screenGui.AbsoluteSize, 8
            local y, z = v.X / 2, v.Y / 2
            t = math.clamp(t, y + x, math.max(y + x, w.X - y - x))
            u = math.clamp(u, z + x, math.max(z + x, w.Y - z - x))
        end
        local v, w = UDim2.fromOffset(t, u), UDim2.fromOffset(t, u + (l.window.main.Size.Y.Offset / 2 + 15))
        return v, w
    end
    l.window:Connect(l.drag.MouseEnter, function()
        if not m and not l.window.hidden then
            variables.tweenService
                :Create(
                    l.dragCosmetic,
                    TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 0.5, Size = UDim2.new(0, 120, 0, 4) }
                )
                :Play()
        end
    end)
    l.window:Connect(l.drag.MouseLeave, function()
        if not m and not l.window.hidden then
            variables.tweenService
                :Create(
                    l.dragCosmetic,
                    TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 0.7, Size = UDim2.new(0, 100, 0, 4) }
                )
                :Play()
        end
    end)
    local function s()
        if not m then
            return
        end
        m = false
        if not l.window:_interactive() then
            return
        end
        variables.tweenService
            :Create(
                l.dragCosmetic,
                TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                { Size = UDim2.new(0, 100, 0, 4), BackgroundTransparency = 0.7 }
            )
            :Play()
        local t, u, v = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), r()
        variables.tweenService:Create(l.window.main, t, { Position = u }):Play()
        variables.tweenService:Create(l.drag, t, { Position = v }):Play()
    end
    l.window:Connect(l.dragInteract.InputBegan, function(t, u)
        if u then
            return
        end
        local v = t.UserInputType.Name
        if v == "MouseButton1" or v == "Touch" then
            if not l.window:_interactive() then
                return
            end
            m = true
            if o and o.IgnoreGuiInset then
                n = variables.guiService:GetGuiInset()
            end
            p = l.window.main.AbsolutePosition
                + l.window.main.AbsoluteSize * l.window.main.AnchorPoint
                - variables.userInputService:GetMouseLocation()
            if not l.window.hidden then
                variables.tweenService
                    :Create(
                        l.dragCosmetic,
                        TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                        { Size = UDim2.new(0, 110, 0, 4), BackgroundTransparency = 0 }
                    )
                    :Play()
            end
        end
    end)
    l.window:Connect(variables.userInputService.InputEnded, function(t)
        local u = t.UserInputType.Name
        if u == "MouseButton1" or u == "Touch" then
            s()
        end
    end)
    l.window:Connect(variables.userInputService.WindowFocusReleased, s)
    local t, u = 1e-7, 1e-60
    l.window:Connect(variables.runService.RenderStepped, function(v)
        if not m then
            return
        end
        if not l.window:_interactive() then
            s()
            return
        end
        local w, x = r()
        l.window.main.Position = l.window.main.Position:Lerp(w, 1 - t ^ v)
        l.drag.Position = l.drag.Position:Lerp(x, 1 - u ^ v)
    end)
    return l
end
return Drag
