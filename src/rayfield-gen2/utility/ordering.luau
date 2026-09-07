-- Rayfield/utility/ordering  (bundle module #59)
-- deobfuscated from Rayfield Gen2 v1.2.0

type OrderedElement = { main: GuiObject, descriptor: { main: GuiObject }? }

local function ae(af: OrderedElement, ag: number)
    af.main.LayoutOrder = ag
    if af.descriptor then
        af.descriptor.main.LayoutOrder = ag + 1
    end
end
return ae
