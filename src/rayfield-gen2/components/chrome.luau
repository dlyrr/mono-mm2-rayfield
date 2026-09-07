-- Rayfield/components/chrome  (bundle module #5)
-- deobfuscated from Rayfield Gen2 v1.2.0

local utility = script.Parent.Parent.utility
local variables, filesystem, constants, locale, HapticEngine, l, m =
    require(utility.variables),
    require(utility.filesystem),
    require(utility.constants),
    require(utility.locale),
    require(utility.HapticEngine),
    {},
    5

function l.buildCollapsedFace(self)
    local o = self.showIconOnly
    self.collapsedIcon = self:Create("ImageLabel", {
        Name = "CollapsedIcon",
        AnchorPoint = if o then Vector2.new(0.5, 0.5) else Vector2.new(0, 0.5),
        Position = if o then UDim2.fromScale(0.5, 0.5) else UDim2.new(0, 16, 0.5, 0),
        Size = UDim2.fromOffset(24, 24),
        BackgroundTransparency = 1,
        Image = self.showIcon,
        ZIndex = constants.zIndex.restoreContent,
        ImageTransparency = 1,
        Parent = self.main,
    }, { ImageColor3 = "TitlingColor" })
    self:Create("UICorner", { Parent = self.collapsedIcon }, { CornerRadius = "PillCornerRadius" })
    local p = self:Create("Frame", {
        Name = "CollapsedText",
        Visible = not o,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 50, 0.5, 0),
        Size = UDim2.new(1, -60, 0, 32),
        BackgroundTransparency = 1,
        ZIndex = constants.zIndex.restoreContent,
        Parent = self.main,
    })
    self:Create("UIListLayout", {
        Padding = UDim.new(0, 1),
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = p,
    })
    self.collapsedTitle = self:Create("TextLabel", {
        Name = "Title",
        Text = self.showName,
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        FontFace = variables.brandFont(Enum.FontWeight.Medium),
        RichText = true,
        TextSize = 16,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 1,
        ZIndex = constants.zIndex.restoreContent,
        TextTransparency = 1,
        Parent = p,
    }, { TextColor3 = "TitlingColor" })
    self.collapsedSubtitle = self:Create("TextLabel", {
        Name = "Subtitle",
        Text = locale.t("Tap to show"),
        Size = UDim2.new(1, 0, 0, 14),
        BackgroundTransparency = 1,
        FontFace = variables.brandFont(Enum.FontWeight.Medium),
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Left,
        LayoutOrder = 2,
        ZIndex = constants.zIndex.restoreContent,
        TextTransparency = 1,
        Parent = p,
    }, { TextColor3 = "TitlingColor" })
    self.collapsedInteract = self:Create("TextButton", {
        Name = "CollapsedInteract",
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Text = "",
        TextTransparency = 1,
        Visible = false,
        ZIndex = constants.zIndex.restoreInteract,
        Parent = self.main,
    })
    l.bindCollapsedDrag(self)
end

function l.bindCollapsedDrag(self)
    local o, p, q, r, s = variables.userInputService, false, false, Vector2.zero, Vector2.zero
    local function t()
        if self.screenGui and self.screenGui.IgnoreGuiInset then
            return variables.guiService:GetGuiInset()
        end
        return Vector2.zero
    end
    self:Connect(self.collapsedInteract.InputBegan, function(u, v)
        if v or not self.hidden or self.animating then
            return
        end
        local w = u.UserInputType.Name
        if w ~= "MouseButton1" and w ~= "Touch" then
            return
        end
        p, q = true, false
        s = o:GetMouseLocation()
        r = self.main.AbsolutePosition + self.main.AbsoluteSize * self.main.AnchorPoint - s
    end)
    self:Connect(o.InputEnded, function(u)
        local v = u.UserInputType.Name
        if v ~= "MouseButton1" and v ~= "Touch" then
            return
        end
        if not p then
            return
        end
        p = false
        if q then
            self._collapsedPosition = self.main.Position
            return
        end
        HapticEngine.click()
        self:ToggleHide()
    end)
    self:Connect(o.WindowFocusReleased, function()
        p = false
    end)
    self:Connect(variables.runService.RenderStepped, function()
        if not p then
            return
        end
        if not self.hidden or self.animating then
            p = false
            return
        end
        local u = o:GetMouseLocation()
        if not q and (u - s).Magnitude < m then
            return
        end
        q = true
        local v = u + r + t()
        self.main.Position = UDim2.fromOffset(v.X, v.Y)
    end)
end

function l.isNewUser()
    local n = variables.localPlayer
    if not n then
        return false
    end
    if typeof(filesystem.isfile) ~= "function" or typeof(filesystem.writefile) ~= "function" then
        return true
    end
    local o, p, q = variables.fileSystemManager:getPath("lastuser.txt"), tostring(n.UserId), true
    pcall(function()
        if filesystem.isfile(o) then
            q = filesystem.readfile(o) ~= p
        end
    end)
    pcall(function()
        filesystem.writefile(o, p)
    end)
    return q
end

function l.setCollapsedShown(self, o, p)
    local q = { [self.collapsedIcon] = { ImageTransparency = if o then 0 else 1 } }
    if not self.showIconOnly then
        q[self.collapsedTitle] = {
            TextTransparency = if o then 0 else 1,
        }
        q[self.collapsedSubtitle] = { TextTransparency = if o then 0.5 else 1 }
    end
    for r, s in q do
        if p then
            variables.tweenService:Create(r, p, s):Play()
        else
            for t, u in s do
                r[t] = u
            end
        end
    end
end
return l
