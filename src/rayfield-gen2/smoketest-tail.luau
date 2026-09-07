-- Smoke test tail for the deobfuscated Rayfield Gen2 build.
-- Append to rayfield-gen2-deobf.luau in place of its final `return require(Rayfield)`,
-- or replace that line with `local RF = require(Rayfield)` and paste this after it.

local RF = require(Rayfield)

pcall(function()
    if _G.__DEOBF_WINDOW then _G.__DEOBF_WINDOW:Unload() end
end)

local ok, err = pcall(function()
    local Window = RF:CreateWindow({
        Name = "Deobf Smoke Test",
        Subtitle = "rebuilt single-file",
        SidebarLayout = true,
        Configuration = { AutoSave = false, AutoLoad = false },
    })
    local Tab = Window:CreateTab({ Name = "Main" })
    Tab:CreateSection({ Name = "Elements" })
    Tab:CreateButton({ Name = "Button", Callback = function() end })
    Tab:CreateToggle({ Name = "Toggle", Value = true, Callback = function() end })
    Tab:CreateSlider({ Name = "Slider", Range = { 0, 100 }, Increment = 5, Value = 40, Callback = function() end })
    Tab:CreateDropdown({ Name = "Dropdown", Options = { "A", "B", "C" }, Value = "B", Callback = function() end })
    Tab:CreateInput({ Name = "Input", Placeholder = "type", Callback = function() end })
    Tab:CreateKeybind({ Name = "Keybind", Value = Enum.KeyCode.F, Callback = function() end })
    Tab:CreateColorPicker({ Name = "Color", Color = Color3.fromRGB(255, 120, 0), Callback = function() end })
    Tab:CreateStat({ Name = "Stat", Value = 1200 })
    Tab:CreateProgress({ Name = "Progress", Range = { 0, 100 }, Value = 65 })
    Tab:CreateDivider({ Text = "more" })
    Tab:CreateText({ Name = "Text", Text = "hello from the deobfuscated build" })
    Tab:CreateConsole({ Name = "Console", Text = "line one", Follow = true })
    local Tab2 = Window:CreateTab({ Name = "Second" })
    Tab2:CreateButton({ Name = "Second tab button", Callback = function() end })
    Window:Notify({ Title = "Deobf build", Content = "All element types constructed." })
    _G.__DEOBF_WINDOW = Window
    return Window
end)

_G.__DEOBF_RESULT = ok and "PASS" or ("FAIL: " .. tostring(err))
