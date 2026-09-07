-- Rayfield/utility/assetResolver  (bundle module #41)
-- deobfuscated from Rayfield Gen2 v1.2.0

local network, log = require(script.Parent.network), require(script.Parent.log)
export type AssetId = number | string
export type AssetDownloadUrl = string
export type CacheKey = AssetId
export type ResolvedAsset = AssetId
export type AssetRequestPayload = { Url: string, Method: string }
local ag = {
    Enum = {
        AssetDownloadUrl = {
            RobloxDownloadUrl = "https://assetdelivery.roblox.com/v1/asset/?id=%d" :: AssetDownloadUrl,
            RoProxyDownloadUrl = "https://assetdelivery.roproxy.com/v1/asset?id=%d" :: AssetDownloadUrl,
        },
    },
}
ag.__index = ag
ag.__type = "assetResolver"
type AssetResolverState = {
    contentCache: { [CacheKey]: string }?,
    contentCacheOrder: { CacheKey }?,
    contentDownloadUrl: AssetDownloadUrl,
    pendingRequests: { [CacheKey]: { thread } },
}
export type AssetResolver = AssetResolverState & {
    resolve: (self: AssetResolver, value: unknown) -> ResolvedAsset?,
    getAssetContentFromUrl: (
        self: AssetResolver,
        url: string,
        cacheKey: CacheKey?,
        forced: boolean?
    ) -> string?,
    getAssetContentFromId: (self: AssetResolver, id: AssetId, forced: boolean?) -> string?,
}
local ah = 8

function ag.new(ai: boolean?, aj: AssetDownloadUrl?): AssetResolver
    local ak: { [CacheKey]: string }? = if ai then {} else nil
    local al = setmetatable(
        {
            contentCache = ak,
            contentCacheOrder = if ai then {} :: { CacheKey } else nil,
            contentDownloadUrl = aj or ag.Enum.AssetDownloadUrl.RobloxDownloadUrl,
            pendingRequests = {},
        } :: AssetResolverState,
        ag
    ) :: any
    return al
end

function ag.resolve(ai: AssetResolver, aj: unknown): ResolvedAsset?
    if type(aj) == "number" then
        return aj
    end
    if type(aj) ~= "string" then
        return nil
    end
    if string.sub(aj, 1, 11) == "rbxasset://" or string.sub(aj, 1, 11) == "rbxthumb://" then
        return aj
    end
    local ak = tonumber(string.match(aj, "^rbxassetid://(%d+)$"))
    if ak then
        return ak
    end
    return nil
end

local function ai(aj: unknown): boolean
    if type(aj) ~= "table" then
        return false
    end
    local ak = aj :: { Body: unknown, StatusCode: unknown, Success: unknown }
    local al = ak.Body
    if type(al) ~= "string" or #al == 0 then
        return false
    end
    if type(ak.StatusCode) == "number" then
        local am = ak.StatusCode :: number
        return am >= 200 and am < 300
    end
    if type(ak.Success) == "boolean" then
        return ak.Success :: boolean
    end
    return false
end

function ag.getAssetContentFromUrl(aj: AssetResolver, ak: string, al: CacheKey?, am: boolean?): string?
    local b = aj.contentCache
    if al ~= nil and b and not am then
        local c = b[al]
        if c then
            return c
        end
    end
    local c = aj.pendingRequests
    if al ~= nil then
        local d = c[al]
        if d then
            table.insert(d, coroutine.running())
            return coroutine.yield()
        end
        c[al] = {}
    end
    local d, e: string? = (network.getRequestFn())
    if not d then
        log.warn("No request function available to download asset content.")
    else
        local f, g = pcall(d, { Url = ak, Method = "GET" } :: AssetRequestPayload)
        if f and ai(g) then
            local h = (g :: { Body: string }).Body
            e = h
            if al ~= nil and b then
                local i = aj.contentCacheOrder
                if i and b[al] == nil then
                    table.insert(i, al)
                    local j = if #i > ah then table.remove(i, 1) else nil
                    if j ~= nil then
                        b[j] = nil
                    end
                end
                b[al] = h
            end
        elseif not am then
            log.warn("Failed to download asset content for url: " .. tostring(ak))
        end
    end
    if al ~= nil then
        local f = c[al]
        c[al] = nil
        if f then
            for g, h in f do
                coroutine.resume(h, e)
            end
        end
    end
    return e
end

function ag.getAssetContentFromId(aj: AssetResolver, ak: AssetId, al: boolean?): string?
    local am = aj:resolve(ak)
    if not am or type(am) ~= "number" then
        log.warn("Invalid asset id: " .. tostring(am))
        return nil
    end
    local b = string.format(aj.contentDownloadUrl, am)
    return aj:getAssetContentFromUrl(b, am, al)
end
return ag
