-- Rayfield/utility/log  (bundle module #55)
-- deobfuscated from Rayfield Gen2 v1.2.0

local runtime, af = require(script.Parent.runtime), {}
type SuppressPredicate = () -> boolean

local function ag(): boolean
    return runtime.secureMode
end
local ah: SuppressPredicate, ai: SuppressPredicate? = ag

function af.setSecureModeSource(aj: SuppressPredicate?)
    ah = if type(aj) == "function" then aj else ag
end

function af.setSuppressPredicate(aj: SuppressPredicate?)
    ai = if type(aj) == "function" then aj else nil
end

local function aj(): boolean
    if ai and ai() then
        return true
    end
    return ah()
end

function af.warn(...)
    if aj() then
        return
    end
    warn(...)
end

function af.print(...)
    if aj() then
        return
    end
    print(...)
end
return af
