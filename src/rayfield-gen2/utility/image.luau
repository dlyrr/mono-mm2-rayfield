-- Rayfield/utility/image  (bundle module #50)
-- deobfuscated from Rayfield Gen2 v1.2.0

local imageCache, variables = require(script.Parent.imageCache), require(script.Parent.variables)
type AvatarCallback = imageCache.AvatarCallback
type PreloadCallback = imageCache.PreloadCallback
local image = {}
image.rewrites = imageCache.rewrites
image.onBlock = nil :: ((unknown) -> ())?
type PendingProperties = { [string]: boolean }
image.pending = {} :: { [number]: { [Instance]: PendingProperties } }
local ah, ai: { [string]: boolean } = false, { Image = true, HoverImage = true, PressedImage = true }

local function aj(ak: unknown): number?
    if type(ak) == "number" then
        return ak
    elseif type(ak) == "string" then
        return tonumber(string.match(ak, "^rbxassetid://(%d+)$"))
    end
    return nil
end

local function ak(al: unknown): string
    if image.onBlock then
        image.onBlock(al)
    end
    return ""
end

function image.preload(al: PreloadCallback?): (boolean, number)
    ah = false
    return imageCache.preload(function(am)
        ah = true
        table.clear(image.pending)
        if al then
            al(am)
        end
    end)
end

function image.avatar(al: number, am: AvatarCallback?): string
    if not variables.secureMode then
        return `rbxthumb://type=AvatarHeadShot&id={al}&w=48&h=48`
    end
    return imageCache.avatar(al, am)
end

function image.assign(al: Instance, am: string, b: unknown)
    local c = al :: any
    if not ai[am] then
        c[am] = b
        return
    end
    c[am] = image.resolve(b)
    if variables.secureMode and not ah then
        local d = aj(b)
        if d and not image.rewrites[d] then
            local e = image.pending[d]
            if not e then
                e = setmetatable({}, { __mode = "k" }) :: any
                image.pending[d] = e
            end
            local f = e[al]
            if not f then
                f = {}
                e[al] = f
            end
            f[am] = true
        end
    end
end
imageCache.onCached = function(al: number)
    local am = image.pending[al]
    if not am then
        return
    end
    local b = image.rewrites[al]
    if b then
        for c, d in am do
            if c.Parent then
                local e = c :: any
                for f in d do
                    e[f] = b
                end
            end
        end
    end
    image.pending[al] = nil
end

function image.resolve(al: unknown): string
    if al == nil or al == 0 or al == "" then
        return ""
    end
    if type(al) == "string" then
        if string.sub(al, 1, 11) == "rbxasset://" then
            return al
        end
        if string.sub(al, 1, 11) == "rbxthumb://" then
            return if variables.secureMode then ak(al) else al
        end
    end
    local am: number?
    if type(al) == "number" then
        am = al
    elseif type(al) == "string" then
        am = tonumber(string.match(al, "^rbxassetid://(%d+)$"))
    end
    local b = if am then image.rewrites[am] else nil
    if b then
        return b
    end
    if variables.secureMode then
        return ak(al)
    end
    if type(al) == "number" then
        return "rbxassetid://" .. al
    end
    if type(al) == "string" then
        return al
    end
    return ak(al)
end
return image
