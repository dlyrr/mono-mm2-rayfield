-- Rayfield/components/tabSection  (bundle module #24)
-- deobfuscated from Rayfield Gen2 v1.2.0

local TabSection = {}
TabSection.__index = TabSection
TabSection.__type = "TabSection"
local locale, log, ah, ai, aj =
    require(script.Parent.Parent.utility.locale), require(script.Parent.Parent.utility.log), 20, 6, 3

local function ak(al)
    for am, b in al.tabs do
        if not b.neglectSelector then
            return true
        end
    end
    return #al.tabSections > 0
end

function TabSection.new(al, am)
    am = if typeof(am) == "table" then am else {}
    local b = setmetatable({
        window = assert(al, "Missing argument #1 (Window expected)"),
        name = am.name or am.Name or "Section",
        icon = am.icon or am.Icon,
    }, TabSection)
    if al.layout.mode ~= "sidebar" then
        if not al._warnedTabSection then
            al._warnedTabSection = true
            log.warn(
                [[Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.]]
            )
        end
        b.inert = true
        return b
    end
    b.main = al:Create("Frame", {
        Name = b.name,
        Size = UDim2.new(1, -ah * 2, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = false,
        Parent = al.tabList,
    })
    b.padding = al:Create("UIPadding", {
        PaddingTop = UDim.new(0, if ak(al) then ai else 0),
        PaddingBottom = UDim.new(0, aj),
        Parent = b.main,
    })
    al:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 6),
        SortOrder = Enum.SortOrder.LayoutOrder,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Parent = b.main,
    })
    if b.icon then
        b.iconLabel = al:Create("ImageLabel", {
            Image = b.icon,
            Size = UDim2.fromOffset(16, 16),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 0,
            ImageTransparency = 1,
            Parent = b.main,
        }, { ImageColor3 = "ContentColor" })
    end
    b.title = al:Create("TextLabel", {
        Text = locale.t(b.name),
        Size = UDim2.fromOffset(0, 15),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Bottom,
        TextWrapped = true,
        LayoutOrder = 1,
        TextTransparency = 1,
        Parent = b.main,
    }, { TextColor3 = "ContentColor", FontFace = "Font" })
    return b
end

function TabSection._setShown(self, am, b)
    if not self.main then
        return
    end
    local c = self.window
    c:_reveal(self.title, { TextTransparency = if am then 0.6 else 1 }, b)
    if self.iconLabel then
        c:_reveal(self.iconLabel, { ImageTransparency = if am then 0.65 else 1 }, b)
    end
end

function TabSection._setVisible(self, am)
    if self.main then
        self.main.Visible = am
    end
end

function TabSection.Remove(self)
    local am = table.find(self.window.tabSections, self)
    if am then
        table.remove(self.window.tabSections, am)
    end
    self.window:DestroySubtree(self.main)
    self.main = nil
end
return TabSection
