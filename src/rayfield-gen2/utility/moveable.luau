-- Rayfield/utility/moveable  (bundle module #56)
-- deobfuscated from Rayfield Gen2 v1.2.0

local function ae<T>(af: T): T
    local ag = af :: any
    function ag.MoveTo(self, ai: number)
        self.tab:_moveElement(self, ai)
    end
    function ag.MoveToTop(self)
        self.tab:_moveElement(self, 1)
    end
    function ag.MoveToBottom(self)
        self.tab:_moveElement(self, #self.tab.elements)
    end
    function ag.MoveUp(self)
        local ai = table.find(self.tab.elements, self)
        if ai then
            self.tab:_moveElement(self, ai - 1)
        end
    end
    function ag.MoveDown(self)
        local ai = table.find(self.tab.elements, self)
        if ai then
            self.tab:_moveElement(self, ai + 1)
        end
    end
    return af
end
return ae
