-- Rayfield/types  (bundle module #38)
-- deobfuscated from Rayfield Gen2 v1.2.0

export type Theme = string | { [string]: any }
export type Translator = (source: string, localeId: string) -> string?
export type Translations = { [string]: { [string]: string } }
export type WindowConfiguration = {
    autoSave: boolean?,
    autoLoad: boolean?,
    fileName: string?,
    customFolder: string?,
}
export type WindowProps = {
    name: string?,
    subtitle: string?,
    theme: Theme?,
    icon: (string | number)?,
    showName: string?,
    showIcon: (string | number)?,
    showIconOnly: boolean?,
    sidebarLayout: boolean?,
    profile: string?,
    configuration: WindowConfiguration?,
    fallbackFont: (Font | Enum.Font)?,
    locale: string?,
    translations: Translations?,
    translator: Translator?,
}
export type TabProps = {
    name: string?,
    icon: (string | number)?,
}
export type TagProps = {
    text: string?,
    title: string?,
    icon: (string | number)?,
    color: Color3?,
    order: number?,
}
export type SectionProps = { name: string?, icon: (string | number)? }
export type TextProps = { name: string?, text: string?, icon: (string | number)? }
export type DividerProps = { text: string?, spacing: number?, line: boolean? }
export type GroupProps = { direction: string? }
export type ButtonProps = {
    name: string?,
    description: string?,
    icon: (string | number)?,
    callback: (() -> ())?,
}
export type ToggleProps = {
    name: string?,
    description: string?,
    icon: (string | number)?,
    flag: string?,
    value: boolean?,
    forgetState: boolean?,
    callback: ((value: boolean) -> ())?,
}
export type SliderProps = {
    name: string?,
    description: string?,
    icon: (string | number)?,
    flag: string?,
    range: { number }?,
    increment: number?,
    value: number?,
    suffix: string?,
    minimal: boolean?,
    forgetState: boolean?,
    callback: ((value: number, dragging: boolean) -> ())?,
}
export type DropdownProps = {
    name: string?,
    description: string?,
    icon: (string | number)?,
    flag: string?,
    options: { string }?,
    value: (string | { string })?,
    multiSelect: boolean?,
    placeholder: string?,
    forgetState: boolean?,
    callback: ((value: any) -> ())?,
}
export type InputProps = {
    name: string?,
    description: string?,
    icon: (string | number)?,
    flag: string?,
    value: string?,
    placeholder: string?,
    numeric: boolean?,
    clearOnFocus: boolean?,
    forgetState: boolean?,
    callback: ((value: string) -> ())?,
}
export type KeybindProps = {
    name: string?,
    description: string?,
    icon: (string | number)?,
    flag: string?,
    value: (EnumItem | string)?,
    forgetState: boolean?,
    isMenuToggle: boolean?,
    hold: boolean?,
    holdThreshold: number?,
    callback: ((value: EnumItem | boolean) -> ())?,
    onChanged: ((key: EnumItem) -> ())?,
}
export type ColorPickerProps = {
    name: string?,
    description: string?,
    icon: (string | number)?,
    flag: string?,
    color: Color3?,
    alpha: number?,
    forgetState: boolean?,
    callback: ((value: Color3, alpha: number) -> ())?,
}
export type StatProps = {
    name: string?,
    description: string?,
    icon: (string | number)?,
    prefix: string?,
    suffix: string?,
    value: number?,
    display: string?,
    compact: boolean?,
    changeMode: string?,
    changeBaseline: string?,
    numberEasing: boolean?,
}
export type ProgressProps = {
    name: string?,
    description: string?,
    icon: (string | number)?,
    range: { number }?,
    value: number?,
    steps: number?,
    text: string?,
    format: ((value: number, min: number, max: number) -> string)?,
    showValue: boolean?,
    indeterminate: boolean?,
}
export type ConsoleProps = {
    name: string?,
    description: string?,
    text: string?,
    height: number?,
    follow: boolean?,
    maxLines: number?,
}
export type NotifyProps = { title: string?, content: string?, icon: (string | number)?, duration: number? }
export type ToastProps = {
    title: string?,
    subtitle: string?,
    subtitleAbove: boolean?,
    icon: (string | number)?,
    avatar: number?,
    minWidth: number?,
    duration: number?,
    position: "Top" | "Bottom"?,
}
export type PopupBox = { title: string?, description: string?, icon: (string | number)? }
export type PopupOption = { text: string?, style: string?, callback: (() -> ())? }
export type PopupProps = {
    title: string?,
    subtitle: string?,
    icon: (string | number)?,
    content: string?,
    boxes: { PopupBox }?,
    options: { PopupOption }?,
    dismissable: boolean?,
}
export type Moveable = {
    MoveTo: (self: any, index: number) -> (),
    MoveToTop: (self: any) -> (),
    MoveToBottom: (self: any) -> (),
    MoveUp: (self: any) -> (),
    MoveDown: (self: any) -> (),
}
export type Lockable = {
    Lock: (self: any, reason: string?) -> (),
    Unlock: (self: any) -> (),
    IsLocked: (self: any) -> boolean,
}
export type Button = Moveable & Lockable & {}
export type Toggle = Moveable & Lockable & {
    value: boolean,
    Set: (self: Toggle, value: boolean, skipCallback: boolean?) -> (),
}
export type Slider = Moveable & Lockable & {
    value: number,
    Set: (self: Slider, value: number, skipCallback: boolean?) -> (),
}
export type Dropdown = Moveable & Lockable & {
    value: { string },
    Set: (self: Dropdown, value: string | { string }, skipCallback: boolean?) -> (),
    Refresh: (self: Dropdown, options: { string }) -> (),
    Add: (self: Dropdown, option: string) -> (),
    Remove: (self: Dropdown, option: string) -> (),
}
export type Input =
    Moveable
    & Lockable
    & { value: string, Set: (self: Input, value: string, skipCallback: boolean?) -> () }
export type Keybind = Moveable & Lockable & {
    value: EnumItem,
    Set: (self: Keybind, value: EnumItem | string, skipChanged: boolean?) -> (),
}
export type ColorPicker = Moveable & Lockable & {
    value: Color3,
    alpha: number,
    Set: (self: ColorPicker, value: Color3 | string, skipCallback: boolean?) -> (),
    SetAlpha: (self: ColorPicker, alpha: number, skipCallback: boolean?) -> (),
}
export type Stat = Moveable & {
    value: number,
    Set: (self: Stat, value: number) -> (),
    ResetBaseline: (self: Stat, value: number?) -> (),
}
export type Progress = Moveable & {
    value: number,
    Set: (self: Progress, value: number) -> (),
    Get: (self: Progress) -> number,
    GetPercentage: (self: Progress) -> number,
    SetRange: (self: Progress, min: number, max: number) -> (),
    SetText: (self: Progress, text: string?) -> (),
    SetIndeterminate: (self: Progress, state: boolean) -> (),
    Remove: (self: Progress) -> (),
}
export type Console = Moveable & {
    Set: (self: Console, text: string) -> (),
    Append: (self: Console, line: string) -> (),
    Clear: (self: Console) -> (),
    Get: (self: Console) -> string,
    Copy: (self: Console) -> boolean,
    SetHeight: (self: Console, height: number) -> (),
    Remove: (self: Console) -> (),
}
export type Section = Moveable & {}
export type TabSection = { Remove: (self: TabSection) -> () }
export type Text = Moveable & {
    name: string,
    text: string,
    Set: (self: Text, text: string) -> (),
    SetTitle: (self: Text, title: string) -> (),
}
export type Divider = Moveable & { text: string, Set: (self: Divider, text: string?) -> () }
export type Tag = {
    Set: (self: Tag, props: TagProps) -> (),
    SetColor: (self: Tag, color: Color3) -> (),
    SetText: (self: Tag, text: string?) -> (),
    SetIcon: (self: Tag, icon: (string | number)?) -> (),
    Remove: (self: Tag) -> (),
}
export type Popup = { Close: (self: Popup) -> () }
export type Group = Moveable & {
    CreateButton: (self: Group, props: ButtonProps) -> Button,
    CreateToggle: (self: Group, props: ToggleProps) -> Toggle,
    CreateSwitch: (self: Group, props: ToggleProps) -> Toggle,
    CreateStat: (self: Group, props: StatProps) -> Stat,
    CreateSlider: (self: Group, props: SliderProps) -> Slider,
    CreateDropdown: (self: Group, props: DropdownProps) -> Dropdown?,
    CreateSection: (self: Group, props: SectionProps) -> Section?,
    CreateText: (self: Group, props: TextProps) -> Text?,
    CreateDivider: (self: Group, props: DividerProps?) -> Divider?,
    CreateGroup: (self: Group, props: GroupProps?) -> Group,
}
export type Tab = {
    Select: (self: Tab, noAnimation: boolean?) -> (),
    Deselect: (self: Tab, noAnimation: boolean?) -> (),
    Remove: (self: Tab) -> (),
    CreateButton: (self: Tab, props: ButtonProps) -> Button,
    CreateToggle: (self: Tab, props: ToggleProps) -> Toggle,
    CreateSwitch: (self: Tab, props: ToggleProps) -> Toggle,
    CreateSlider: (self: Tab, props: SliderProps) -> Slider,
    CreateDropdown: (self: Tab, props: DropdownProps) -> Dropdown,
    CreateInput: (self: Tab, props: InputProps) -> Input,
    CreateKeybind: (self: Tab, props: KeybindProps) -> Keybind,
    CreateColorPicker: (self: Tab, props: ColorPickerProps) -> ColorPicker,
    CreateStat: (self: Tab, props: StatProps) -> Stat,
    CreateProgress: (self: Tab, props: ProgressProps) -> Progress,
    CreateConsole: (self: Tab, props: ConsoleProps) -> Console,
    CreateSection: (self: Tab, props: SectionProps) -> Section,
    CreateText: (self: Tab, props: TextProps) -> Text,
    CreateDivider: (self: Tab, props: DividerProps?) -> Divider,
    CreateGroup: (self: Tab, props: GroupProps?) -> Group,
}
export type Window = {
    unloaded: boolean,
    Flags: { [string]: any },
    CreateTab: (self: Window, props: TabProps) -> Tab,
    CreateSection: (self: Window, props: SectionProps) -> TabSection,
    CreateTag: (self: Window, props: TagProps) -> Tag,
    Notify: (self: Window, props: NotifyProps) -> (),
    Toast: (self: Window, props: ToastProps) -> (),
    Popup: (self: Window, props: PopupProps) -> Popup?,
    Show: (self: Window) -> (),
    Hide: (self: Window) -> (),
    ToggleHide: (self: Window) -> (),
    ToggleMinimise: (self: Window) -> (),
    Navigate: (self: Window, tab: string | Tab) -> (),
    ChangeTheme: (self: Window, theme: Theme) -> (),
    SetLocale: (self: Window, localeId: string) -> (),
    SetTranslator: (self: Window, translator: Translator?) -> (),
    RegisterTranslations: (self: Window, translations: Translations) -> (),
    Save: (self: Window, name: string?) -> boolean,
    Load: (self: Window, name: string?) -> boolean,
    ListConfigs: (self: Window) -> { string },
    DeleteConfig: (self: Window, name: string) -> boolean,
    GetPath: (self: Window) -> (string, string),
    Get: (self: Window, flag: string) -> any,
    Set: (self: Window, flag: string, value: any) -> boolean,
    Unload: (self: Window) -> (),
}
export type Rayfield = { CreateWindow: (self: Rayfield, props: WindowProps) -> Window }
return {}
