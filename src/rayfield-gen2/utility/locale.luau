-- Rayfield/utility/locale  (bundle module #53)
-- deobfuscated from Rayfield Gen2 v1.2.0

local variables, log, ag = require(script.Parent.variables), require(script.Parent.log), {}
export type LocaleToken = { [any]: string }
export type Translator = (source: string, localeId: string) -> string?
export type TranslationTables = { [string]: { [string]: string } }
ag.strings = {} :: TranslationTables
ag.current = "en"
ag.translator = nil :: Translator?
local ah = {}

local function ai(aj: string): string
    return string.match(aj, "^(%a+)") or aj
end

function ag.t(aj: unknown): unknown
    if type(aj) ~= "string" or aj == "" then
        return aj
    end
    return { [ah] = aj }
end

function ag.isToken(aj: unknown): boolean
    return type(aj) == "table" and type((aj :: { [any]: unknown })[ah]) == "string"
end

function ag.sourceOf(aj: LocaleToken): string
    return aj[ah]
end

function ag.resolve(aj: unknown): any
    if type(aj) ~= "string" then
        return aj
    end
    if ag.translator then
        local ak, al = pcall(ag.translator, aj, ag.current)
        if ak and type(al) == "string" and al ~= "" then
            return al
        end
    end
    local ak = ag.strings[ag.current]
    if ak and ak[aj] then
        return ak[aj]
    end
    local al = ag.strings[ai(ag.current)]
    if al and al[aj] then
        return al[aj]
    end
    return aj
end

function ag.register(aj: TranslationTables?)
    if type(aj) ~= "table" then
        return
    end
    for ak, al in aj do
        if type(ak) == "string" and type(al) == "table" then
            ak = string.lower(ak)
            local am = ag.strings[ak]
            if not am then
                am = {}
                ag.strings[ak] = am
            end
            for b, c in al do
                if type(b) == "string" and type(c) == "string" then
                    am[b] = c
                else
                    log.warn(`Rayfield: skipping a '{ak}' translation, entries must be string to string.`)
                end
            end
        end
    end
end

function ag.setActive(aj: string?): string
    ag.current = if type(aj) == "string" and aj ~= "" then string.lower(aj) else "en"
    return ag.current
end

function ag.detect(): string
    local aj = variables.localizationService.RobloxLocaleId
    if type(aj) == "string" and aj ~= "" then
        return string.lower(aj)
    end
    return "en"
end
return ag
