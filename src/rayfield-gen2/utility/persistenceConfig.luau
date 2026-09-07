-- Rayfield/utility/persistenceConfig  (bundle module #62)
-- deobfuscated from Rayfield Gen2 v1.2.0

local variables, filesystem, log, path, persistencePaths, persistenceWrite, ak =
    require(script.Parent.variables),
    require(script.Parent.filesystem),
    require(script.Parent.log),
    require(script.Parent.path),
    require(script.Parent.persistencePaths),
    require(script.Parent.persistenceWrite),
    {}
type PersistedControl = {
    value: unknown,
    flag: string?,
    _canBeNil: boolean?,
    _serialize: ((PersistedControl) -> unknown)?,
    _deserialize: ((PersistedControl, unknown) -> ())?,
    Set: (PersistedControl, unknown) -> (),
}
type ConfigWindow = {
    controls: { [string]: PersistedControl },
    configuration: { fileName: string?, customFolder: string? },
    name: string,
    _loading: boolean?,
    _loadedConfig: { [string]: unknown }?,
    _loadedConfigPath: string?,
}

function ak.getPath(al: ConfigWindow, am: unknown?): (string?, string?)
    return persistencePaths.getConfigPath(al, am)
end

function ak.save(al: ConfigWindow, am: unknown?): boolean
    local b, c = ak.getPath(al, am)
    if not b or not c then
        log.warn("Rayfield: configuration name '" .. tostring(am) .. "' has no usable characters")
        return false
    end
    if typeof(filesystem.writefile) ~= "function" then
        return false
    end
    local d: { [string]: unknown } = {}
    for e, f in al.controls do
        local g, h = pcall(function()
            local g = f._serialize
            if g then
                return g(f)
            end
            return f.value
        end)
        if g then
            d[e] = h
        else
            log.warn("Rayfield: Failed to serialize flag '" .. tostring(e) .. "' - " .. tostring(h))
        end
    end
    local e = al._loadedConfig
    if e and al._loadedConfigPath == c then
        for f, g in e do
            if al.controls[f] == nil then
                d[f] = g
            end
        end
    end
    local f, g = pcall(variables.httpService.JSONEncode, variables.httpService, d)
    if not f then
        log.warn("Rayfield: Failed to encode configuration - " .. tostring(g))
        return false
    end
    local h, i = pcall(function()
        persistenceWrite.write(b, c, g)
    end)
    if not h then
        log.warn("Rayfield: Failed to save configuration - " .. tostring(i))
        return false
    end
    if al._loadedConfigPath == nil or al._loadedConfigPath == c then
        al._loadedConfig = d
        al._loadedConfigPath = c
    end
    return true
end

local function al(am: string): ({ [string]: unknown }?, string?)
    if not filesystem.isfile(am) then
        return nil, nil
    end
    local b, c = pcall(filesystem.readfile, am)
    if not b or type(c) ~= "string" then
        log.warn("Rayfield: Failed to read configuration file")
        return nil, nil
    end
    local d, e = pcall(variables.httpService.JSONDecode, variables.httpService, c)
    if not d or type(e) ~= "table" then
        return nil, c
    end
    return e :: { [string]: unknown }, c
end

local function am(b: string): string
    local c = path.stripExtension(b, ".rfld")
    local d, e = c .. " (Incorrect Format).rfld", 2
    while e <= 100 and filesystem.isfile(d) do
        d = c .. " (Incorrect Format " .. e .. ").rfld"
        e += 1
    end
    return d
end

function ak.load(b: ConfigWindow, c: unknown?): boolean
    local d, e = ak.getPath(b, c)
    if not d or not e then
        log.warn("Rayfield: configuration name '" .. tostring(c) .. "' has no usable characters")
        return false
    end
    if typeof(filesystem.isfile) ~= "function" then
        return false
    end
    local f, g = al(e)
    if not f and filesystem.isfile(e) then
        local h, i = al(persistenceWrite.tempPathFor(e))
        if h and i then
            f = h
            pcall(persistenceWrite.write, d, e, i)
        end
    end
    if not f then
        if g then
            log.warn([[Rayfield: Configuration file has an invalid format, backing up and resetting]])
            local h = am(e)
            pcall(function()
                filesystem.ensureDir(d)
                filesystem.writefile(h, g)
                filesystem.delfile(e)
            end)
        end
        return false
    end
    local h, i = f :: { [string]: unknown }, b._loading
    b._loading = true
    local j, k = pcall(function()
        for j, k in b.controls do
            ak.applyTo(k, h[j])
        end
    end)
    b._loading = i
    if not j then
        log.warn("Rayfield: Failed to apply configuration - " .. tostring(k))
    end
    b._loadedConfig = h
    b._loadedConfigPath = e
    return true
end

function ak.applyTo(b: PersistedControl, c: unknown)
    if c == nil and not b._canBeNil then
        return
    end
    local d, e = pcall(function()
        local d = b._deserialize
        if d then
            d(b, c)
        else
            b:Set(c)
        end
    end)
    if not d then
        log.warn("Rayfield: Failed to restore flag '" .. tostring(b.flag) .. "' - " .. tostring(e))
    end
end

function ak.list(b: ConfigWindow): { string }
    local c, d: { string } = ak.getPath(b), {}
    if not c then
        return d
    end
    local e, f = pcall(filesystem.listfiles, c)
    if not e or type(f) ~= "table" then
        return d
    end
    for g, h in f do
        local i = path.basename(h)
        if i:sub(-5) == ".rfld" then
            local j = path.stripExtension(i, ".rfld")
            if j and j ~= "" and not j:find(" %(Incorrect Format[^%)]*%)$") then
                table.insert(d, j)
            end
        end
    end
    table.sort(d)
    return d
end

function ak.delete(b: ConfigWindow, c: unknown): boolean
    if type(c) ~= "string" or c == "" then
        return false
    end
    local d, e = ak.getPath(b, c)
    if not e then
        return false
    end
    if typeof(filesystem.isfile) ~= "function" or not filesystem.isfile(e) then
        return false
    end
    pcall(filesystem.delfile, persistenceWrite.tempPathFor(e))
    return (pcall(filesystem.delfile, e))
end
return ak
