-- Rayfield/utility/windowSizing  (bundle module #70)
-- deobfuscated from Rayfield Gen2 v1.2.0

local layouts, af = require(script.Parent.layouts), {}
export type Profile = {
    defaultSize: Vector2,
    minSize: Vector2,
    maxOccupancyX: number,
    maxOccupancyY: number?,
    marginFloorX: number,
    marginFloorY: number,
    topbarClearance: number?,
    maxAspectRatio: number,
    minAspectRatio: number?,
    widthCompensation: number?,
    chromeHeight: number,
}
local ag, ah =
    200, {
        top = {
            defaultSize = Vector2.new(475, 500),
            minSize = Vector2.new(300, 285),
            maxOccupancyX = 0.86,
            topbarClearance = 36,
            marginFloorX = 24,
            marginFloorY = 28,
            maxAspectRatio = 2.3,
            widthCompensation = 130,
            chromeHeight = layouts.top.chromeHeight,
        } :: Profile,
        sidebar = {
            defaultSize = Vector2.new(685, 450),
            minSize = Vector2.new(560, 350),
            maxOccupancyX = 0.92,
            maxOccupancyY = 0.8,
            marginFloorX = 24,
            marginFloorY = 28,
            maxAspectRatio = 2.6,
            minAspectRatio = 1.2,
            chromeHeight = layouts.sidebar.chromeHeight,
        } :: Profile,
    }

function af.profile(ai: ae.Mode?): Profile
    if ai == "sidebar" then
        return ah.sidebar
    end
    return ah.top
end

function af.pageHeight(ai: number?, aj: ae.Mode?): number
    local ak = af.profile(aj)
    local al = if ai and ai > 0 then ai else ak.minSize.Y
    return math.max(al - ak.chromeHeight, 0)
end

local function ai(aj: Profile, ak: number): number
    local al = ak - aj.marginFloorY
    if aj.topbarClearance then
        al = math.min(al, ak - aj.topbarClearance * 2)
    end
    if aj.maxOccupancyY then
        al = math.min(al, ak * aj.maxOccupancyY)
    end
    return al
end

local function aj(ak: number, al: number, am: number): number
    return math.clamp((al - ak) / (al - am), 0, 1)
end

local function ak(al: Profile, am: number, b: number): UDim2
    local c = math.floor(math.min(math.clamp(b, al.minSize.Y, al.defaultSize.Y), b))
    local d = aj(c, al.defaultSize.Y, al.minSize.Y)
    local e = math.max(al.defaultSize.X + (al.widthCompensation :: number) * d, al.minSize.X)
    return UDim2.fromOffset(math.floor(math.min(e, am, c * al.maxAspectRatio)), c)
end

local function al(am: Profile, b: number, c: number): UDim2
    local d, e =
        math.min(math.clamp(b, am.minSize.X, am.defaultSize.X), b),
        math.min(math.clamp(c, am.minSize.Y, am.defaultSize.Y), c)
    e = math.floor(math.min(e, d / (am.minAspectRatio :: number)))
    d = math.floor(math.min(d, e * am.maxAspectRatio))
    return UDim2.fromOffset(d, e)
end

function af.fit(am: Vector2?, b: ae.Mode?): UDim2
    local c = af.profile(b)
    if not am or am.X < ag or am.Y < ag then
        return UDim2.fromOffset(c.defaultSize.X, c.defaultSize.Y)
    end
    local d, e = math.min(am.X * c.maxOccupancyX, am.X - c.marginFloorX), ai(c, am.Y)
    if c.minAspectRatio then
        return al(c, d, e)
    end
    return ak(c, d, e)
end
return af
