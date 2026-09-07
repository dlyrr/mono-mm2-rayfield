-- Rayfield/utility/constants  (bundle module #43)
-- deobfuscated from Rayfield Gen2 v1.2.0

local constants = {}
constants.fontAsset = "rbxassetid://12187365364"
constants.pillResizeInfo = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
constants.icons = {
    close = 83277910885129,
    minimise = 108115485663409,
    maximise = 88738500661569,
    settings = 129180860773723,
    search = 100604009889706,
    chevron = 88479147175134,
    check = 125626312718314,
    dot = 91452555903853,
    colorpicker = 91452555903853,
    banner = 111263549366178,
    config = 125823673784681,
    rayfield = 80387863064905,
}
constants.accent = { on = Color3.fromRGB(23, 153, 110), onStroke = Color3.fromRGB(32, 201, 144) }
constants.statAccents = {
    positive = {
        fill = ColorSequence.new(Color3.fromRGB(0, 170, 127), Color3.fromRGB(0, 134, 98)),
        stroke = ColorSequence.new(Color3.fromRGB(0, 213, 156), Color3.fromRGB(0, 189, 135)),
    },
    negative = {
        fill = ColorSequence.new(Color3.fromRGB(172, 47, 47), Color3.fromRGB(135, 37, 37)),
        stroke = ColorSequence.new(Color3.fromRGB(255, 75, 75), Color3.fromRGB(244, 67, 67)),
    },
    neutral = {
        fill = ColorSequence.new(Color3.fromRGB(0, 170, 127), Color3.fromRGB(0, 134, 98)),
        stroke = ColorSequence.new(Color3.fromRGB(0, 213, 156), Color3.fromRGB(0, 189, 135)),
    },
}
constants.zIndex = {
    elementLock = 60,
    elementLockContent = 65,
    bottomFade = 100,
    notification = 1500,
    drag = 1000,
    toast = 2000,
    toastContent = 2001,
    restoreContent = 100001,
    restoreInteract = 100002,
}
constants.displayOrder = { window = 99999, banner = 100000, popup = 100001 }
return constants
