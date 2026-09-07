-- Rayfield/utility/path  (bundle module #60)
-- deobfuscated from Rayfield Gen2 v1.2.0

local path = {}

function path.join(af: string, ag: string?): string
    if not ag or ag == "" then
        return af
    end
    return af .. "/" .. ag
end

local function af(ag: string): string
    local ah
    repeat
        ah = ag
        ag = ag:gsub("%.%.", "")
    until ag == ah
    return ag
end

function path.sanitizeFolder(ag: unknown): string
    local ah = tostring(ag):gsub("\\", "/"):gsub('[:<>"|?*%c]', "")
    ah = af(ah):gsub("/+", "/")
    return (ah:gsub("^/+", ""))
end

function path.sanitizeFile(ag: unknown): string
    local ah = tostring(ag):gsub("[/\\]", ""):gsub('[:<>"|?*%c]', "")
    return af(ah)
end

function path.basename(ag: unknown): string
    return tostring(ag):match("[^/\\]+$") or tostring(ag)
end

function path.stripExtension(ag: unknown, ah: string?): string
    if ah and ah ~= "" then
        local ai = tostring(ag)
        if ai:sub(-#ah) == ah then
            return ai:sub(1, -#ah - 1)
        end
        return ai
    end
    local ai = tostring(ag):match("^(.+)%.%w+$")
    return ai or tostring(ag)
end
return path
