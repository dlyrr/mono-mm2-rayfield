-- Rayfield/utility/lockable  (bundle module #54)
-- deobfuscated from Rayfield Gen2 v1.2.0

local function ae<T>(af: T): T
    local ag = af :: any
    function ag.Lock(self, ai: string?)
        self.window:_setElementLocked(self, true, ai)
    end
    function ag.Unlock(self)
        self.window:_setElementLocked(self, false)
    end
    function ag.IsLocked(self): boolean
        return self.locked == true
    end
    return af
end
return ae
