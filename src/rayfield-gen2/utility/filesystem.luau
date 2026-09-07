-- Rayfield/utility/filesystem  (bundle module #45)
-- deobfuscated from Rayfield Gen2 v1.2.0

local services, af = require(script.Parent.services), {}
local ag = services.getService("RunService"):IsStudio()
local ah = not ag
    and typeof(writefile) == "function"
    and typeof(readfile) == "function"
    and typeof(isfile) == "function"
    and typeof(isfolder) == "function"
    and typeof(makefolder) == "function"
    and typeof(listfiles) == "function"
    and typeof(delfile) == "function"
    and typeof(delfolder) == "function"
if ah then
    function af.writefile(ai: string, aj: string)
        writefile(ai, aj)
    end
    function af.readfile(ai: string): string
        return readfile(ai)
    end
    if typeof(appendfile) == "function" then
        function af.appendfile(ai: string, aj: string)
            appendfile(ai, aj)
        end
    end
    function af.isfile(ai: string): boolean
        return isfile(ai)
    end
    function af.delfile(ai: string)
        delfile(ai)
    end
    function af.listfiles(ai: string): { string }
        return listfiles(ai)
    end
    function af.makefolder(ai: string)
        makefolder(ai)
    end
    function af.isfolder(ai: string): boolean
        return isfolder(ai)
    end
    function af.delfolder(ai: string)
        delfolder(ai)
    end
elseif ag then
    local ai = Instance.new("Folder")
    ai.Name = "Filesystem"
    ai.Parent = services.getService("ReplicatedStorage")
    local function aj(ak: string): { string }
        local al = {}
        for am in string.gmatch(ak, "[^/]+") do
            table.insert(al, am)
        end
        return al
    end
    local function ak(al: { string }, am: boolean): Instance?
        local b: Instance = ai
        for c = 1, #al - 1 do
            local d = b:FindFirstChild(al[c])
            if not d then
                if not am then
                    return nil
                end
                local e = Instance.new("Folder")
                e.Name = al[c]
                e.Parent = b
                d = e
            end
            b = d :: Instance
        end
        return b
    end
    local function al(am: Instance?): StringValue?
        if am and am:IsA("StringValue") then
            return am
        end
        return nil
    end
    function af.writefile(am: string, b: string)
        local c = aj(am)
        assert(#c > 0, "Invalid path")
        local d = ak(c, true)
        assert(d, "Invalid path")
        local e = c[#c]
        local f = d:FindFirstChild(e)
        local g = al(f)
        if g then
            g.Value = b
        else
            if f then
                f:Destroy()
            end
            local h = Instance.new("StringValue")
            h.Name = e
            h.Value = b
            h.Parent = d
        end
    end
    function af.readfile(am: string): string
        local b = aj(am)
        assert(#b > 0, "Invalid path")
        local c = ak(b, false)
        assert(c, "File not found: " .. am)
        local d = c:FindFirstChild(b[#b])
        local e = al(d)
        assert(e, "File not found: " .. am)
        return e.Value
    end
    function af.isfile(am: string): boolean
        local b = aj(am)
        if #b == 0 then
            return false
        end
        local c = ak(b, false)
        if not c then
            return false
        end
        return al(c:FindFirstChild(b[#b])) ~= nil
    end
    function af.listfiles(am: string): { string }
        local b, c: Instance = aj(am), ai
        for d, e in b do
            local f = c:FindFirstChild(e)
            if not f or not f:IsA("Folder") then
                error("Folder not found: " .. am)
            end
            c = f
        end
        local d: { string } = {}
        for e, f in c:GetChildren() do
            table.insert(d, am .. "/" .. f.Name)
        end
        return d
    end
    function af.delfile(am: string)
        local b = aj(am)
        assert(#b > 0, "Invalid path")
        local c = ak(b, false)
        assert(c, "File not found: " .. am)
        local d = c:FindFirstChild(b[#b])
        local e = al(d)
        assert(e, "File not found: " .. am)
        e:Destroy()
    end
    function af.makefolder(am: string)
        local b = aj(am)
        if #b == 0 then
            return
        end
        local c: Instance = ai
        for d, e in b do
            local f = c:FindFirstChild(e)
            if not f then
                local g = Instance.new("Folder")
                g.Name = e
                g.Parent = c
                f = g
            end
            c = f :: Instance
        end
    end
    function af.isfolder(am: string): boolean
        local b = aj(am)
        if #b == 0 then
            return false
        end
        local c: Instance = ai
        for d, e in b do
            local f = c:FindFirstChild(e)
            if not f or not f:IsA("Folder") then
                return false
            end
            c = f
        end
        return true
    end
    function af.delfolder(am: string)
        local b = aj(am)
        assert(#b > 0, "Invalid path")
        local c = ak(b, false)
        assert(c, "Folder not found: " .. am)
        local d = c:FindFirstChild(b[#b])
        assert(d and d:IsA("Folder"), "Folder not found: " .. am)
        d:Destroy()
    end
end
if af.writefile and not af.appendfile then
    function af.appendfile(ai: string, aj: string)
        local ak = if af.isfile(ai) then af.readfile(ai) else nil
        af.writefile(ai, if ak then ak .. aj else aj)
    end
end

function af.ensureFolder(ai: string)
    if not af.isfolder(ai) then
        af.makefolder(ai)
    end
end

function af.ensureDir(ai: string)
    local aj = ""
    for ak in string.gmatch(ai, "[^/]+") do
        aj = if aj == "" then ak else aj .. "/" .. ak
        if not af.isfolder(aj) then
            af.makefolder(aj)
        end
    end
end
return af
