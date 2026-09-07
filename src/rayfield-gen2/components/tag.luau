-- Rayfield/components/tag  (bundle module #26)
-- deobfuscated from Rayfield Gen2 v1.2.0

local Tag = {}
Tag.__index = Tag
Tag.__type = "Tag"
local utility = script.Parent.Parent.utility
local variables, functions, image, aj, ak =
    require(utility.variables),
    require(utility.functions),
    require(utility.image),
    Color3.fromRGB(255, 175, 15),
    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

function Tag.new(al, am)
    am = if typeof(am) == "table" then am else {}
    local b = setmetatable({
        window = assert(al, "Missing argument #1 (Window expected)"),
        text = am.text or am.Text or am.title or am.Title,
        icon = am.icon or am.Icon,
        color = am.color or am.Color or aj,
    }, Tag)
    assert(b.icon or (b.text and b.text ~= ""), "A Tag requires an icon, text, or both.")
    b.main = b.window:Create("Frame", {
        Name = "Tag",
        Size = UDim2.fromOffset(10, 24),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundColor3 = b.color,
        BorderSizePixel = 0,
        LayoutOrder = am.order or am.Order or 0,
        BackgroundTransparency = 1,
        Parent = b.window.tagContainer,
    })
    b.window:Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = b.main })
    b.window:Create(
        "UIPadding",
        { PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10), Parent = b.main }
    )
    b.window:Create("UIListLayout", {
        Padding = UDim.new(0, 5),
        FillDirection = Enum.FillDirection.Horizontal,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = b.main,
    })
    local c = functions.contrastColor(b.color)
    b.iconLabel = b.window:Create("ImageLabel", {
        Name = "Icon",
        Image = b.icon or "",
        ImageColor3 = c,
        Size = UDim2.fromOffset(16, 16),
        BackgroundTransparency = 1,
        Visible = b.icon ~= nil,
        ZIndex = 5,
        ImageTransparency = 1,
        Parent = b.main,
    })
    b.title = b.window:Create("TextLabel", {
        Name = "Title",
        AnchorPoint = Vector2.new(0, 0.5),
        Size = UDim2.fromOffset(10, 15),
        AutomaticSize = Enum.AutomaticSize.X,
        BackgroundTransparency = 1,
        Text = b.text or "",
        TextColor3 = c,
        TextSize = 15,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        RichText = true,
        Visible = b.text ~= nil and b.text ~= "",
        LayoutOrder = 1,
        ZIndex = 5,
        TextTransparency = 1,
        Parent = b.main,
    }, { FontFace = "Font" })
    b.window.tagContainer.Visible = true
    if not b.window.hidden then
        b:_setShown(true, ak)
    end
    return b
end

function Tag._setShown(self, am, b)
    local c, d = if am then 0 else 1, if typeof(b) == "TweenInfo" then b elseif b then ak else nil
    if d then
        variables.tweenService:Create(self.main, d, { BackgroundTransparency = c }):Play()
        variables.tweenService:Create(self.iconLabel, d, { ImageTransparency = c }):Play()
        variables.tweenService:Create(self.title, d, { TextTransparency = c }):Play()
    else
        self.main.BackgroundTransparency = c
        self.iconLabel.ImageTransparency = c
        self.title.TextTransparency = c
    end
end

function Tag.SetColor(self, am)
    self.color = am
    local b = functions.contrastColor(am)
    variables.tweenService:Create(self.main, ak, { BackgroundColor3 = am }):Play()
    variables.tweenService
        :Create(self.iconLabel, ak, {
            ImageColor3 = b,
        })
        :Play()
    variables.tweenService:Create(self.title, ak, { TextColor3 = b }):Play()
end

function Tag.SetText(self, am)
    self.text = am
    self.title.Text = am or ""
    self.title.Visible = am ~= nil and am ~= ""
end

function Tag.SetIcon(self, am)
    self.icon = am
    image.assign(self.iconLabel, "Image", am)
    self.iconLabel.Visible = am ~= nil
end

function Tag.Set(self, am)
    if am.color or am.Color then
        self:SetColor(am.color or am.Color)
    end
    if am.text or am.Text or am.title or am.Title then
        self:SetText(am.text or am.Text or am.title or am.Title)
    end
    if am.icon ~= nil or am.Icon ~= nil then
        self:SetIcon(am.icon or am.Icon)
    end
end

function Tag.Remove(self)
    self.window:DestroySubtree(self.main)
    local am = table.find(self.window.tags, self)
    if am then
        table.remove(self.window.tags, am)
    end
    if #self.window.tags == 0 then
        self.window.tagContainer.Visible = false
    end
end
return Tag
