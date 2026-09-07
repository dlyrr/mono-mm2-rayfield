-- Rayfield/components/action  (bundle module #3)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Action = {}
Action.__index = Action
Action.__type = "Action"
local utility = script.Parent.Parent.utility
local variables, log, HapticEngine =
    require(utility.variables), require(utility.log), require(utility.HapticEngine)

function Action.new(k, l)
    l = if typeof(l) == "table" then l else {}
    local m = setmetatable({
        window = assert(k, "Missing argument #1 (Window expected)"),
        name = l.name or l.Name or "Action",
        icon = assert(l.icon or l.Icon, "Missing argument (Icon expected)"),
        callback = assert(l.callback or l.Callback, "Missing argument (Function expected)"),
        linkedTab = l.linkedTab or l.LinkedTab,
    }, Action)
    m.action = m.window:Create("Frame", {
        Name = m.name,
        BorderSizePixel = 0,
        LayoutOrder = -(l.order or 0),
        Size = UDim2.fromOffset(24, 24),
        BackgroundTransparency = 1,
        Parent = m.window.actionContainer,
    })
    m.iconLabel = m.window:Create("ImageLabel", {
        Image = m.icon,
        Size = UDim2.fromOffset(20, 20),
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundTransparency = 1,
        ImageTransparency = 1,
        Parent = m.action,
    }, { ImageColor3 = "ActionColor" })
    m.interact = m.window:Create("TextButton", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        BorderSizePixel = 0,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        TextTransparency = 1,
        Parent = m.action,
    })
    local function n()
        if not m.window:_settled() then
            return
        end
        if m.linkedTab and m.window.selectedTab == m.linkedTab then
            return
        end
        if m.isLit and m:isLit() then
            return
        end
        variables.tweenService
            :Create(
                m.iconLabel,
                TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { ImageTransparency = 0.6 }
            )
            :Play()
    end
    m.window:Connect(m.interact.MouseButton1Click, function()
        HapticEngine.click()
        task.spawn(function()
            local o, p = pcall(m.callback)
            if not o then
                log.warn(
                    `Rayfield encountered an error, with the callback for a {m.__type} component named '{m.name}':`
                )
                log.print(p)
            end
            n()
        end)
    end)
    m.window:Connect(m.interact.MouseEnter, function()
        if not m.window:_interactive() then
            return
        end
        variables.tweenService
            :Create(
                m.iconLabel,
                TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { ImageTransparency = 0.2 }
            )
            :Play()
    end)
    m.window:Connect(m.interact.MouseLeave, n)
    return m
end
return Action
