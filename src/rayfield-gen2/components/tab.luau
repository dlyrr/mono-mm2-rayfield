-- Rayfield/components/tab  (bundle module #23)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Tab = {}
Tab.__index = Tab
Tab.__type = "Tab"
local utility = script.Parent.Parent.utility
local variables, ordering, HapticEngine, search, tabSelector =
    require(utility.variables),
    require(utility.ordering),
    require(utility.HapticEngine),
    require(script.Parent.search),
    require(script.Parent.tabSelector)

local function al(am, b)
    for c, d in b do
        if d.__type == "Group" then
            al(am, d.elements)
        else
            am:_unregisterControl(d)
        end
        if d.connections then
            for e, f in d.connections do
                am:Disconnect(f)
            end
            d.connections = nil
        end
        if d._dragConnection then
            d._dragConnection:Disconnect()
            d._dragConnection = nil
        end
        if am._recordingKeybind == d then
            am._recordingKeybind = nil
        end
        if d._outsideClickConn then
            am:Disconnect(d._outsideClickConn)
            d._outsideClickConn = nil
        end
    end
end
local am, b =
    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

function Tab.new(c, d)
    d = if typeof(d) == "table" then d else {}
    local e = setmetatable({
        window = assert(c, "Missing argument #1 (Window expected)"),
        name = d.name or d.Name,
        icon = d.icon or d.Icon,
        neglectSelector = d.neglectSelector or d.NeglectSelector or false,
        customOrder = d.customOrder or d.CustomOrder or 0,
        forgetState = d.forgetState or d.ForgetState or false,
        elements = {},
        connections = {},
    }, Tab)
    assert(e.name or e.icon, "A tab needs a name or an icon.")
    if not e.neglectSelector then
        tabSelector.build(e, e.window.layout)
    end
    e.tabPage = e.window:Create("ScrollingFrame", {
        Name = e.name,
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0.5, 0, 0, 68),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BorderSizePixel = 0,
        BackgroundTransparency = 1,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 0,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        LayoutOrder = e.customOrder or 0,
        Parent = e.window.elements,
    })
    e.tabPageLayout = e.window:Create("UIListLayout", {
        Padding = UDim.new(0, 7),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = e.tabPage,
    })
    e.window:Create(
        "UIPadding",
        { PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 33), Parent = e.tabPage }
    )
    if not e.neglectSelector then
        table.insert(
            e.connections,
            e.window:Connect(e.topbarItemInteract.MouseButton1Click, function()
                HapticEngine.click()
                e:Select()
            end)
        )
        table.insert(
            e.connections,
            e.window:Connect(e.topbarItemInteract.MouseEnter, function()
                if not e.window:_interactive() then
                    return
                end
                if e.window.selectedTab ~= e then
                    e:_applyVisual("hover", b)
                    e:_spinGradients()
                end
            end)
        )
        table.insert(
            e.connections,
            e.window:Connect(e.topbarItemInteract.MouseLeave, function()
                if e.window.selectedTab ~= e then
                    e:_applyVisual("unselected", b)
                end
            end)
        )
    end
    return e
end

function Tab._applyVisual(self, d, e)
    if self.neglectSelector or not self.topbarItem then
        return
    end
    local f = tabSelector.states[self.window.layout.mode][d]
    if not f then
        return
    end
    tabSelector.applyVisual(self, f, e)
end

function Tab._spinGradients(self)
    if self.neglectSelector then
        return
    end
    local d = TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    for e, f in { self.topbarItemGradient, self.topbarItemStrokeGradient } do
        f.Rotation = -270
        variables.tweenService:Create(f, d, { Rotation = 90 }):Play()
    end
end

function Tab.Select(self, d)
    if self.window._searching then
        search.close(self.window, { showTabs = true, jumpTo = false })
    end
    self.window.selectedTab = self
    self.window:_jumpTo(self.tabPage)
    local e = d or not self.window:_interactive()
    if not self.neglectSelector and not e then
        self:_applyVisual("selected", am)
    end
    for f, g in self.window.tabs do
        if g ~= self.window.selectedTab then
            g:Deselect(e)
        end
    end
    if self ~= self.window.rfSettings and self.window.settingsAction and not e then
        variables.tweenService
            :Create(
                self.window.settingsAction.iconLabel,
                TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { ImageTransparency = 0.6 }
            )
            :Play()
    end
end

function Tab.Deselect(self, d)
    if not self.neglectSelector and not d then
        self:_applyVisual("unselected", am)
    end
end

function Tab._register(self, d)
    table.insert(self.elements, d)
    ordering(d, #self.elements * 10)
    self.window:_restoreLate(d)
    if not self.window.hidden then
        d:_setShown(true, true)
    end
    return d
end

function Tab.CreateButton(self, d)
    return self:_register(require(script.Parent.button).new(self, d))
end

function Tab.CreateToggle(self, d)
    return self:_register(require(script.Parent.toggle).new(self, d))
end

function Tab.CreateSwitch(self, d)
    return self:CreateToggle(d)
end

function Tab.CreateSection(self, d)
    return self:_register(require(script.Parent.section).new(self, d))
end

function Tab.CreateText(self, d)
    return self:_register(require(script.Parent.text).new(self, d))
end

function Tab.CreateDivider(self, d)
    return self:_register(require(script.Parent.divider).new(self, d))
end

function Tab.CreateProgress(self, d)
    return self:_register(require(script.Parent.progress).new(self, d))
end

function Tab.CreateConsole(self, d)
    return self:_register(require(script.Parent.console).new(self, d))
end

function Tab.CreateStat(self, d)
    return self:_register(require(script.Parent.stat).new(self, d))
end

function Tab.CreateSlider(self, d)
    return self:_register(require(script.Parent.slider).new(self, d))
end

function Tab.CreateDropdown(self, d)
    return self:_register(require(script.Parent.dropdown).new(self, d))
end

function Tab.CreateInput(self, d)
    return self:_register(require(script.Parent.input).new(self, d))
end

function Tab.CreateKeybind(self, d)
    return self:_register(require(script.Parent.keybind).new(self, d))
end

function Tab.CreateColorPicker(self, d)
    return self:_register(require(script.Parent.colorpicker).new(self, d))
end

function Tab.CreateGroup(self, d)
    return self:_register(require(script.Parent.group).new(self, d))
end

function Tab._moveElement(self, d, e)
    local f = table.find(self.elements, d)
    if not f then
        return
    end
    table.remove(self.elements, f)
    e = math.clamp(e, 1, #self.elements + 1)
    table.insert(self.elements, e, d)
    for g, h in self.elements do
        ordering(h, g * 10)
    end
end

function Tab.Remove(self)
    local d = self.window
    if d._searching then
        search.close(d, { showTabs = true, jumpTo = d.selectedTab and d.selectedTab.tabPage })
    end
    local e = table.find(d.tabs, self)
    if e then
        table.remove(d.tabs, e)
    end
    if d.selectedTab == self then
        d.selectedTab = nil
        for f, g in ipairs(d.tabs) do
            if not g.neglectSelector then
                g:Select()
                break
            end
        end
    end
    al(d, self.elements)
    for f, g in self.connections do
        d:Disconnect(g)
    end
    self.connections = {}
    if self.topbarItem then
        d:DestroySubtree(self.topbarItem)
    end
    if self.tabPage then
        d:DestroySubtree(self.tabPage)
    end
    self.topbarItem = nil
    self.tabPage = nil
    self.elements = {}
end
return Tab
