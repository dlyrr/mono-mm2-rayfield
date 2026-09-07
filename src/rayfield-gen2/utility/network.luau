-- Rayfield/utility/network  (bundle module #57)
-- deobfuscated from Rayfield Gen2 v1.2.0

local network = {}
network.__index = network
export type RequestFn = (...any) -> any

function network.getRequestFn(af: any?): RequestFn?
    af = af or getfenv()
    return af.request
        or af.http_request
        or (af.http and af.http.request)
        or (af.syn and af.syn.request)
        or (af.fluxus and af.fluxus.request)
end
return network
