-- Rayfield/utility/textMetrics  (bundle module #68)
-- deobfuscated from Rayfield Gen2 v1.2.0

local variables = require(script.Parent.variables)
local af, ag, ah: { [string]: number }, ai, aj = variables.textService, {}, {}, 0, 1024

local function ak(al: GetTextBoundsParams): unknown
    local am, b = pcall(function()
        return af:GetTextBoundsAsync(al)
    end)
    return if am then b else nil
end

local function al(am: unknown, b: "X" | "Y"): number?
    if typeof(am) == "Vector2" then
        return if b == "X" then am.X else am.Y
    end
    if type(am) == "table" and type((am :: any)[b]) == "number" then
        return (am :: any)[b]
    end
    return nil
end

function ag.textWidth(am: Font, b: number, c: any): number
    c = tostring(c)
    local d = tostring(am.Family)
        .. "|"
        .. tostring(am.Weight)
        .. "|"
        .. tostring(am.Style)
        .. "|"
        .. tostring(b)
        .. "|"
        .. c
    local e = ah[d]
    if e then
        return e
    end
    local f = Instance.new("GetTextBoundsParams")
    f.Text = c
    f.Font = am
    f.Size = b
    f.Width = math.huge
    local g = al(ak(f), "X")
    if not g then
        local h = utf8.len(c) or #c
        return math.ceil(b * 0.55 * h)
    end
    local h = math.ceil(g)
    if ai >= aj then
        ah = {}
        ai = 0
    end
    ah[d] = h
    ai += 1
    return h
end

function ag.textHeight(am: Font, b: number, c: any, d: number): number
    local e = Instance.new("GetTextBoundsParams")
    e.Text = tostring(c)
    e.Font = am
    e.Size = b
    e.Width = d
    local f = al(ak(e), "Y")
    return if f then math.ceil(f) else b
end
return ag
