-- Rayfield/utility/HapticEngine  (bundle module #40)
-- deobfuscated from Rayfield Gen2 v1.2.0

local variables, af = require(script.Parent.variables), {}
af.enabled = false
type HapticTypes = { click: Enum.HapticEffectType?, notify: Enum.HapticEffectType? }
local ag: HapticTypes, ah, ai =
    {}, pcall(function()
        Instance.new("HapticEffect"):Destroy()
        return { click = Enum.HapticEffectType.UIHover, notify = Enum.HapticEffectType.UIClick }
    end)
if ah then
    ag = ai
end
local aj: { [Enum.HapticEffectType]: Instance }, ak: Instance? = {}

function af.setContainer(al: Instance?)
    ak = al
end

function af.releaseContainer(al: Instance?)
    if al == nil or ak == al then
        ak = nil
    end
end

local function al(): Instance
    if ak and ak.Parent then
        return ak
    end
    return variables.guiContainer
end

local function am(b: Enum.HapticEffectType): Instance?
    local c = aj[b]
    if c and c.Parent then
        return c
    end
    local d, e = pcall(Instance.new, "HapticEffect")
    if not d then
        return nil
    end
    local f = e :: any
    f.Type = b
    local g = pcall(function()
        e.Parent = al()
    end)
    if not g then
        e:Destroy()
        return nil
    end
    aj[b] = e
    return e
end

local function b(c: Enum.HapticEffectType?)
    if not c or not af.enabled then
        return
    end
    local d = am(c)
    if d then
        local e = d :: any
        pcall(e.Play, d)
    end
end

function af.click()
    b(ag.click)
end

function af.notify()
    b(ag.notify)
end

function af.setEnabled(c: boolean?)
    af.enabled = c and true or false
    if not af.enabled then
        af.teardown()
    end
end

function af.teardown()
    for c, d in aj do
        pcall(d.Destroy, d)
        aj[c] = nil
    end
end
return af
