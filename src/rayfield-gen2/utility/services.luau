-- Rayfield/utility/services  (bundle module #67)
-- deobfuscated from Rayfield Gen2 v1.2.0

local services = {}

function services.getService(af)
    local ag = game:GetService(af)
    return if cloneref then cloneref(ag) else ag
end
return services
