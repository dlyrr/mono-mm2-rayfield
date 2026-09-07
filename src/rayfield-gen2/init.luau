-- Rayfield/init  (bundle module #1)
-- deobfuscated from Rayfield Gen2 v1.2.0

local variables, image, locale, constants, types =
    require(script.utility.variables),
    require(script.utility.image),
    require(script.utility.locale),
    require(script.utility.constants),
    require(script.types)
export type Theme = types.Theme
export type Translator = types.Translator
export type Translations = types.Translations
export type WindowConfiguration = types.WindowConfiguration
export type WindowProps = types.WindowProps
export type TabProps = types.TabProps
export type TagProps = types.TagProps
export type SectionProps = types.SectionProps
export type GroupProps = types.GroupProps
export type ButtonProps = types.ButtonProps
export type ToggleProps = types.ToggleProps
export type SliderProps = types.SliderProps
export type DropdownProps = types.DropdownProps
export type InputProps = types.InputProps
export type KeybindProps = types.KeybindProps
export type ColorPickerProps = types.ColorPickerProps
export type StatProps = types.StatProps
export type ProgressProps = types.ProgressProps
export type ConsoleProps = types.ConsoleProps
export type TextProps = types.TextProps
export type DividerProps = types.DividerProps
export type NotifyProps = types.NotifyProps
export type ToastProps = types.ToastProps
export type PopupBox = types.PopupBox
export type PopupOption = types.PopupOption
export type PopupProps = types.PopupProps
export type Moveable = types.Moveable
export type Lockable = types.Lockable
export type Window = types.Window
export type Tab = types.Tab
export type Group = types.Group
export type Button = types.Button
export type Toggle = types.Toggle
export type Slider = types.Slider
export type Dropdown = types.Dropdown
export type Input = types.Input
export type Keybind = types.Keybind
export type ColorPicker = types.ColorPicker
export type Stat = types.Stat
export type Progress = types.Progress
export type Console = types.Console
export type Section = types.Section
export type TabSection = types.TabSection
export type Text = types.Text
export type Divider = types.Divider
export type Tag = types.Tag
export type Popup = types.Popup
export type Rayfield = types.Rayfield
type WindowModule = { new: (types.WindowProps) -> types.Window }
local k = {} :: Rayfield

local function l()
    local m = Instance.new("ScreenGui")
    m.Name = variables.httpService:GenerateGUID(false)
    m.ClipToDeviceSafeArea = false
    m.DisplayOrder = constants.displayOrder.banner
    m.IgnoreGuiInset = true
    m.ResetOnSpawn = false
    m.Enabled = true
    m.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
    m.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    m.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    m.Parent = variables.guiContainer
    local n = Instance.new("ImageLabel")
    n.Name = "Banner"
    n.AnchorPoint = Vector2.new(0.5, 0.5)
    n.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    n.BackgroundTransparency = 1
    n.BorderColor3 = Color3.fromRGB(0, 0, 0)
    n.BorderSizePixel = 0
    n.Image = image.resolve(constants.icons.banner)
    n.Position = UDim2.fromScale(0.5, 0.5)
    n.Size = UDim2.fromOffset(262, 60)
    n.Parent = m
    return m
end

function k.CreateWindow(m, n: j.WindowProps): j.Window
    local o, p: j.Window?, q: (() -> ())? = (l())
    if variables.secureMode then
        image.preload(function(r)
            if r <= 0 then
                return
            end
            local function s()
                if not p or p.unloaded then
                    return
                end
                p:Notify({
                    title = locale.resolve("Secure mode"),
                    content = if r == 1
                        then locale.resolve("An asset couldn't be cached and won't appear.")
                        else locale.resolve("Some assets couldn't be cached and won't appear."),
                })
            end
            if p then
                s()
            else
                q = s
            end
        end)
    end
    local r, s = pcall(function()
        return (require(script.components.window) :: WindowModule).new(n)
    end)
    if not r then
        o:Destroy()
        error(s, 0)
    end
    local t = s :: j.Window
    p = t
    if q then
        task.spawn(q)
        q = nil
    end
    if variables.secureMode then
        task.spawn(function()
            local u, v =
                variables.fontManager:loadFont(constants.fontAsset, Enum.FontWeight.Medium),
                variables.fontManager:loadFont(constants.fontAsset, Enum.FontWeight.SemiBold)
            if not t.unloaded and u and v and u ~= variables.fallbackFont and v ~= variables.fallbackFont then
                t:ChangeTheme({ Font = u, TitleFont = v })
            end
        end)
    end
    task.spawn(function()
        task.wait(0.5)
        o:Destroy()
        task.wait(0.5)
        if not t.unloaded then
            t:Show()
        end
    end)
    return t
end
return k
