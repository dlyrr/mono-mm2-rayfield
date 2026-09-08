# -*- coding: utf-8 -*-
"""ESP changes to the MonoMM2 feature code.

Applied by build.py to the text it reads from mono.lua, so the upstream file is
never edited and a re-download cannot silently drop these. Idempotent.

  1. Box width no longer swells with distance or rotation.
  2. Boxes are rounded rectangles instead of hard corners.
  3. Nametag cards get a frosted backdrop.
  4. Bounding Box: translucent rounded fill with accent corner arcs.
  5. Health Bar: vertical beside the box, or inline when Target Info is on.
  6. Target Info: a card under the box, mutually exclusive with Nametag ESP.
  7. Per-role colour pickers plus a fill colour.
"""

MARK = '-- [mono-rayfield]'


def apply(src):
    if MARK in src:
        return src

    def sub(old, new):
        assert old in src, 'anchor not found:\n' + old[:160]
        return src.replace(old, new, 1)

    # ---------------------------------------------------------------- 1 + 2
    # The box was the screen-space AABB of all 8 projected corners of the
    # character's oriented bounding box. That includes the box's DEPTH: the near
    # face projects wider than the far one, and by a margin that changes with
    # distance and with how the character is turned. So the box breathed wider
    # and narrower as you moved, which is the reported bug.
    #
    # Height is unaffected by that (a character is upright, so top and bottom
    # stay put), so height is trustworthy. Derive the width from it using the
    # character's real world proportions, and the box tracks size exactly.
    src = sub(
        '''local function ensureBox(plr)
    local b=boxStore[plr]
    if b then return b end
    b={}
    for i=1,4 do
        b[i]=Mono.newLine(1)
    end
    boxStore[plr]=b; return b
end''',
        '''-- [mono-rayfield] rounded box: 4 straight edges + 4 corner arcs
local BOX_ARC_SEGS=3
local BOX_SEG_COUNT=4+4*BOX_ARC_SEGS
local HALF_PI=math.pi*0.5

-- Screen space has Y running downward, so these angles sweep clockwise on
-- screen even though they read counter-clockwise as maths.
local function arcInto(segs,n,cx,cy,r,a0)
    local step=HALF_PI/BOX_ARC_SEGS
    local px,py=cx+math.cos(a0)*r,cy+math.sin(a0)*r
    for i=1,BOX_ARC_SEGS do
        local a=a0+step*i
        local nx,ny=cx+math.cos(a)*r,cy+math.sin(a)*r
        n=n+1; segs[n]={Vector2.new(px,py),Vector2.new(nx,ny)}
        px,py=nx,ny
    end
    return n
end

local function boxRadius(w,h) return math.clamp(math.min(w,h)*0.28,3,26) end

-- just the four corner arcs, for the bounding box look
local function cornerArcs(segs,x1,y1,x2,y2,r)
    local n=0
    n=arcInto(segs,n,x1+r,y1+r,r,math.pi)
    n=arcInto(segs,n,x2-r,y1+r,r,math.pi*1.5)
    n=arcInto(segs,n,x2-r,y2-r,r,0)
    n=arcInto(segs,n,x1+r,y2-r,r,HALF_PI)
    return n
end

local function roundedRect(segs,x1,y1,x2,y2)
    local w,h=x2-x1,y2-y1
    local r=boxRadius(w,h)
    local n=0
    n=n+1; segs[n]={Vector2.new(x1+r,y1),Vector2.new(x2-r,y1)}
    n=n+1; segs[n]={Vector2.new(x2,y1+r),Vector2.new(x2,y2-r)}
    n=n+1; segs[n]={Vector2.new(x2-r,y2),Vector2.new(x1+r,y2)}
    n=n+1; segs[n]={Vector2.new(x1,y2-r),Vector2.new(x1,y1+r)}
    n=arcInto(segs,n,x1+r,y1+r,r,math.pi)
    n=arcInto(segs,n,x2-r,y1+r,r,math.pi*1.5)
    n=arcInto(segs,n,x2-r,y2-r,r,0)
    n=arcInto(segs,n,x1+r,y2-r,r,HALF_PI)
    return n
end

local function ensureBox(plr)
    local b=boxStore[plr]
    if b then return b end
    b={}
    for i=1,BOX_SEG_COUNT do
        b[i]=Mono.newLine(1)
    end
    boxStore[plr]=b; return b
end''')

    src = sub(
        '''            local pts,okPts
            local bx1,by1,bx2,by2
            local allAhead=false''',
        '''            local pts,okPts
            local bx1,by1,bx2,by2
            local boxAspect=0.5 -- [mono-rayfield] width:height of this character
            local allAhead=false''')

    src = sub(
        '''                    local half=size*0.5
                    local hx,hy,hz=half.X,half.Y,half.Z''',
        '''                    local half=size*0.5
                    local hx,hy,hz=half.X,half.Y,half.Z
                    -- The silhouette width of an oriented box is its extent
                    -- projected onto the camera's right axis. max(X,Z) would be
                    -- the worst case over all rotations, which is too wide
                    -- whenever the player is not turned that way.
                    local cr=camCF.RightVector
                    local wEff=math.abs(size.X*cf.RightVector:Dot(cr))
                        +math.abs(size.Z*cf.LookVector:Dot(cr))
                    boxAspect=wEff/math.max(size.Y,0.001)''')

    src = sub(
        '''                if okPts and not blocked then
                    local tl,tr=Vector2.new(bx1,by1),Vector2.new(bx2,by1)
                    local bl,br=Vector2.new(bx1,by2),Vector2.new(bx2,by2)
                    local segs={{tl,tr},{tr,br},{br,bl},{bl,tl}}
                    for i=1,4 do
                        local seg,l=segs[i],b[i]
                        l.From,l.To,l.Color,l.Visible=seg[1],seg[2],col,true
                    end
                else
                    for _,l in ipairs(b) do l.Visible=false end
                end''',
        '''                if okPts and not blocked then
                    -- [mono-rayfield] width follows height, so depth and turn
                    -- cannot widen the box
                    local cx=(bx1+bx2)*0.5
                    local hgt=by2-by1
                    local wid=hgt*boxAspect
                    local segs={}
                    local n=roundedRect(segs,cx-wid*0.5,by1,cx+wid*0.5,by2)
                    for i=1,n do
                        local seg,l=segs[i],b[i]
                        if l then l.From,l.To,l.Color,l.Visible=seg[1],seg[2],col,true end
                    end
                    for i=n+1,#b do b[i].Visible=false end
                else
                    for _,l in ipairs(b) do l.Visible=false end
                end''')

    # ---------------------------------------------------------------- 3
    src = sub(
        '''local function ensureEsp(plr) if espStore[plr] then return espStore[plr] end''',
        '''-- [mono-rayfield] real backdrop blur where the client has it
local GLASS_CLASS
for _,cls in ipairs({"UIGlassEffect","UIBlur","UIBlurEffect"}) do
    local ok=pcall(function() Instance.new(cls):Destroy() end)
    if ok then GLASS_CLASS=cls break end
end

local function frost(card)
    if GLASS_CLASS then
        pcall(function()
            local g=Instance.new(GLASS_CLASS)
            g.Parent=card
        end)
    end
end

local function ensureEsp(plr) if espStore[plr] then return espStore[plr] end''')

    src = sub(
        '''        Size=UDim2.fromOffset(198,32),BackgroundColor3=Color3.fromRGB(16,16,18),BackgroundTransparency=0.2,
        BorderSizePixel=0,Parent=e.bb},
        {create("UICorner",{CornerRadius=UDim.new(0,10)}),
         create("UIGradient",{Rotation=90,
             Transparency=NumberSequence.new({
                 NumberSequenceKeypoint.new(0,0.04),
                 NumberSequenceKeypoint.new(1,0.28)})})})''',
        '''        Size=UDim2.fromOffset(198,32),BackgroundColor3=Color3.fromRGB(16,16,18),BackgroundTransparency=0.42,
        BorderSizePixel=0,Parent=e.bb},
        {create("UICorner",{CornerRadius=UDim.new(0,10)}),
         create("UIGradient",{Rotation=90,
             Transparency=NumberSequence.new({
                 NumberSequenceKeypoint.new(0,0.30),
                 NumberSequenceKeypoint.new(1,0.55)})})})
    frost(e.card) -- [mono-rayfield]''')

    src = sub(
        '''    e.edge=create("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=0.75,
        ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Parent=e.card})''',
        '''    e.edge=create("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=0.55,
        ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Parent=e.card})
    pcall(function()
        local s=Instance.new("UIShadow")
        s.BlurRadius=UDim.new(0,14); s.Color=Color3.fromRGB(0,0,0)
        s.Transparency=0.45; s.ZIndex=-1; s.Parent=e.card
    end)''')

    # ---------------------------------------------------------------- 7
    # Per-role colours, replacing the hardcoded red/blue/green.
    src = sub(
        '''local function espColor(role) if not flags.espRoleTags then return Color3.fromRGB(214,214,220) end
    if role=="Murderer" then return Color3.fromRGB(255,80,80) elseif isGunRole(role) then return Color3.fromRGB(90,150,255) else return Color3.fromRGB(95,225,125) end end''',
        '''-- [mono-rayfield] user-settable, was hardcoded
Mono.espCols={
    Murderer=Color3.fromRGB(255,80,80),
    Sheriff=Color3.fromRGB(90,150,255),
    Innocent=Color3.fromRGB(95,225,125),
    Fill=Color3.fromRGB(214,218,228),
    Neutral=Color3.fromRGB(214,214,220),
}
local function espColor(role) if not flags.espRoleTags then return Mono.espCols.Neutral end
    if role=="Murderer" then return Mono.espCols.Murderer elseif isGunRole(role) then return Mono.espCols.Sheriff else return Mono.espCols.Innocent end end''')

    src = sub(
        '''    espBox=false,espChams=false,''',
        '''    espBound=false,espTarget=false,espHealth=false,
    espBox=false,espChams=false,''')

    # ---------------------------------------------------------------- 4 + 5 + 6
    src = sub(
        '''local tracerStore={}''',
        '''-- [mono-rayfield] bounding box, health bar and target info card.
-- The fill is a GUI Frame so it can have a rounded translucent interior, which
-- the Drawing library cannot do; the accent corners stay Drawing arcs so they
-- render above everything, as the rest of the ESP does.
local boundStore={}

local function clearBound(plr)
    local u=boundStore[plr]
    if not u then return end
    for _,l in ipairs(u.arcs) do Mono.dropDraw(l) end
    pcall(function() u.fill:Destroy() end)
    pcall(function() u.hp:Destroy() end)
    pcall(function() u.card:Destroy() end)
    boundStore[plr]=nil
end

local function ensureBound(plr)
    local u=boundStore[plr]
    if u then return u end
    u={arcs={}}
    for i=1,4*BOX_ARC_SEGS do u.arcs[i]=Mono.newLine(3) end

    u.fill=create("Frame",{Name=rnd(),BackgroundColor3=Mono.espCols.Fill,BackgroundTransparency=0.88,
        BorderSizePixel=0,Visible=false,ZIndex=2,Parent=EspGui})
    u.fillCorner=create("UICorner",{CornerRadius=UDim.new(0,10),Parent=u.fill})
    create("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=0.86,Parent=u.fill})

    -- vertical health bar, sitting just outside the left edge
    u.hp=create("Frame",{Name=rnd(),BackgroundColor3=Color3.fromRGB(220,70,70),BackgroundTransparency=0.1,
        BorderSizePixel=0,Visible=false,ZIndex=3,Parent=EspGui},
        {create("UICorner",{CornerRadius=UDim.new(1,0)})})
    u.hpFill=create("Frame",{Name=rnd(),AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),
        Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(85,220,110),BorderSizePixel=0,
        ZIndex=4,Parent=u.hp},
        {create("UICorner",{CornerRadius=UDim.new(1,0)})})

    -- target info card
    u.card=create("Frame",{Name=rnd(),BackgroundColor3=Color3.fromRGB(22,22,26),BackgroundTransparency=0.12,
        BorderSizePixel=0,Visible=false,ZIndex=5,Parent=EspGui},
        {create("UICorner",{CornerRadius=UDim.new(0,10)})})
    create("UIStroke",{Color=Color3.fromRGB(255,255,255),Thickness=1,Transparency=0.8,Parent=u.card})
    frost(u.card)
    pcall(function()
        local s=Instance.new("UIShadow")
        s.BlurRadius=UDim.new(0,16); s.Color=Color3.fromRGB(0,0,0)
        s.Transparency=0.4; s.ZIndex=-1; s.Parent=u.card
    end)

    local function label(size,colour,xalign,font)
        return create("TextLabel",{Name=rnd(),BackgroundTransparency=1,Text="",TextSize=size,
            TextColor3=colour,Font=font,TextXAlignment=xalign,TextTruncate=Enum.TextTruncate.AtEnd,
            ZIndex=6,Parent=u.card})
    end
    u.nameLbl=label(14,Color3.fromRGB(245,245,250),Enum.TextXAlignment.Left,Enum.Font.GothamBold)
    u.userLbl=label(11,Color3.fromRGB(160,160,172),Enum.TextXAlignment.Left,Enum.Font.Gotham)
    u.weapLbl=label(12,Color3.fromRGB(225,225,235),Enum.TextXAlignment.Right,Enum.Font.Gotham)
    u.distLbl=label(12,Color3.fromRGB(225,225,235),Enum.TextXAlignment.Right,Enum.Font.Gotham)

    u.cardHp=create("Frame",{Name=rnd(),BackgroundColor3=Color3.fromRGB(220,70,70),BackgroundTransparency=0.1,
        BorderSizePixel=0,ZIndex=6,Parent=u.card},
        {create("UICorner",{CornerRadius=UDim.new(1,0)})})
    u.cardHpFill=create("Frame",{Name=rnd(),Size=UDim2.fromScale(1,1),
        BackgroundColor3=Color3.fromRGB(85,220,110),BorderSizePixel=0,ZIndex=7,Parent=u.cardHp},
        {create("UICorner",{CornerRadius=UDim.new(1,0)})})

    boundStore[plr]=u; return u
end

local function healthOf(ch)
    local hum=ch and ch:FindFirstChildOfClass("Humanoid")
    if not hum or hum.MaxHealth<=0 then return nil end
    return math.clamp(hum.Health/hum.MaxHealth,0,1)
end

local function heldTool(ch)
    local t=ch and ch:FindFirstChildOfClass("Tool")
    return t and t.Name or "None"
end

local tracerStore={}''')

    # ---- wire the three new flags into the per-frame ESP pass ----
    src = sub(
        '''    local doBox,doSkel,doTracer,doBox3=flags.espBox,flags.espSkeleton,flags.espTracers,flags.espBox3D''',
        '''    local doBox,doSkel,doTracer,doBox3=flags.espBox,flags.espSkeleton,flags.espTracers,flags.espBox3D
    -- [mono-rayfield]
    local doBound,doTarget,doHealth=flags.espBound,flags.espTarget,flags.espHealth
    local doAny2=doBound or doTarget or doHealth
    if not doAny2 and next(boundStore) then for p in pairs(boundStore) do clearBound(p) end end''')

    src = sub(
        '''    if not (doBox or doSkel or doTracer or doBox3) then return end''',
        '''    if not (doBox or doSkel or doTracer or doBox3 or doAny2) then return end''')

    src = sub(
        '''    local needCorners=doBox or doBox3''',
        '''    local needCorners=doBox or doBox3 or doAny2''')

    # hidden when the player is behind the camera
    src = sub(
        '''                local hs=skelStore[plr]
                if hs then
                    for i=1,#hs.lines do local l=hs.lines[i]; if l then l.Visible=false end end
                end
                continue''',
        '''                local hs=skelStore[plr]
                if hs then
                    for i=1,#hs.lines do local l=hs.lines[i]; if l then l.Visible=false end end
                end
                local hu=boundStore[plr] -- [mono-rayfield]
                if hu then
                    for i=1,#hu.arcs do hu.arcs[i].Visible=false end
                    hu.fill.Visible=false; hu.hp.Visible=false; hu.card.Visible=false
                end
                continue''')

    src = sub(
        '''            if doBox3 then''',
        '''            if doAny2 then -- [mono-rayfield]
                local u=ensureBound(plr)
                local cx=(bx1 or 0)+(bx2 or 0)
                cx=cx*0.5
                local hgt=(by2 or 0)-(by1 or 0)
                local wid=hgt*boxAspect
                -- A player straddling the camera plane projects to a rect
                -- thousands of pixels across. Lines could shrug that off; a
                -- filled box paints the screen, so require every corner in
                -- front and a rect that could plausibly be a person.
                local vp=Camera.ViewportSize
                local sane=okPts and allAhead and not blocked
                    and hgt>6 and hgt<vp.Y*1.6
                    and wid>3 and wid<vp.X*0.9
                    and cx>-vp.X and cx<vp.X*2
                    and by1>-vp.Y and by2<vp.Y*2
                if sane then
                    local x1,x2=cx-wid*0.5,cx+wid*0.5
                    local r=boxRadius(wid,hgt)

                    if doBound then
                        u.fill.Position=UDim2.fromOffset(x1,by1)
                        u.fill.Size=UDim2.fromOffset(wid,hgt)
                        u.fill.BackgroundColor3=Mono.espCols.Fill
                        u.fillCorner.CornerRadius=UDim.new(0,r)
                        u.fill.Visible=true
                        local segs={}
                        local n=cornerArcs(segs,x1,by1,x2,by2,r)
                        for i=1,n do
                            local l=u.arcs[i]
                            if l then l.From,l.To,l.Color,l.Visible=segs[i][1],segs[i][2],col,true end
                        end
                        for i=n+1,#u.arcs do u.arcs[i].Visible=false end
                    else
                        u.fill.Visible=false
                        for i=1,#u.arcs do u.arcs[i].Visible=false end
                    end

                    local frac=healthOf(ch)

                    -- with the card up the bar lives inside it, so the vertical
                    -- one beside the box would be a duplicate
                    if doHealth and frac and not doTarget then
                        u.hp.Position=UDim2.fromOffset(x1-9,by1)
                        u.hp.Size=UDim2.fromOffset(4,hgt)
                        u.hpFill.Size=UDim2.fromScale(1,frac)
                        u.hp.Visible=true
                    else
                        u.hp.Visible=false
                    end

                    if doTarget then
                        local showHp=doHealth and frac~=nil
                        local cw=math.max(wid,168)
                        local chh=showHp and 58 or 44
                        local cardX=cx-cw*0.5
                        local cardY=by2-8
                        u.card.Position=UDim2.fromOffset(cardX,cardY)
                        u.card.Size=UDim2.fromOffset(cw,chh)
                        u.nameLbl.Position=UDim2.fromOffset(12,8)
                        u.nameLbl.Size=UDim2.fromOffset(cw*0.55,15)
                        u.userLbl.Position=UDim2.fromOffset(12,23)
                        u.userLbl.Size=UDim2.fromOffset(cw*0.55,13)
                        u.weapLbl.Position=UDim2.fromOffset(cw*0.45-12,9)
                        u.weapLbl.Size=UDim2.fromOffset(cw*0.55,13)
                        u.distLbl.Position=UDim2.fromOffset(cw*0.45-12,24)
                        u.distLbl.Size=UDim2.fromOffset(cw*0.55,13)

                        local dsp=plr.DisplayName
                        u.nameLbl.Text=dsp
                        u.nameLbl.TextColor3=col
                        u.userLbl.Text="@"..plr.Name
                        u.weapLbl.Text=heldTool(ch)
                        local ref=cullRoot or (ch and ch:FindFirstChild("HumanoidRootPart"))
                        u.distLbl.Text=ref and (math.floor((ref.Position-camPos).Magnitude+0.5).."m") or "-"

                        if showHp then
                            u.cardHp.Position=UDim2.fromOffset(12,chh-14)
                            u.cardHp.Size=UDim2.fromOffset(cw-24,6)
                            u.cardHpFill.Size=UDim2.fromScale(frac,1)
                            u.cardHp.Visible=true
                        else
                            u.cardHp.Visible=false
                        end
                        u.card.Visible=true
                    else
                        u.card.Visible=false
                    end
                else
                    u.fill.Visible=false; u.hp.Visible=false; u.card.Visible=false
                    for i=1,#u.arcs do u.arcs[i].Visible=false end
                end
            end
            if doBox3 then''')

    # ---------------------------------------------------------------- modules
    src = sub(
        '''    local m = Visuals:Module({ Name = "Nametag ESP", Desc = "Name, distance and round coins above each player", Callback = function(v) flags.espNames=v; if not v then pcall(Mono.setRobloxNames,false) end end, Info = "Name, distance and round coins above each player." })
end''',
        '''    local m = Visuals:Module({ Name = "Nametag ESP", Desc = "Name, distance and round coins above each player", Callback = function(v) flags.espNames=v; if not v then pcall(Mono.setRobloxNames,false) end end, Info = "Name, distance and round coins above each player." })
    Mono.mNametag=m -- [mono-rayfield] paired with Target Info below
end
do -- [mono-rayfield]
    local m = Visuals:Module({ Name = "Bounding Box", Desc = "Rounded box with accent corners and a translucent fill",
        Callback = function(v) flags.espBound=v end,
        Info = "A rounded box around each player: a faint translucent fill with the corners picked out in the role colour. Independent of Box ESP, which draws plain lines." })
    m:Setting{ Type = "Colorpicker", Title = "Murderer", Default = Color3.fromRGB(255,80,80),
        Callback = function(c) Mono.espCols.Murderer=c end }
    m:Setting{ Type = "Colorpicker", Title = "Sheriff", Default = Color3.fromRGB(90,150,255),
        Callback = function(c) Mono.espCols.Sheriff=c end }
    m:Setting{ Type = "Colorpicker", Title = "Innocent", Default = Color3.fromRGB(95,225,125),
        Callback = function(c) Mono.espCols.Innocent=c end }
    m:Setting{ Type = "Colorpicker", Title = "Box fill", Default = Color3.fromRGB(214,218,228),
        Callback = function(c) Mono.espCols.Fill=c end }
    m:Setting{ Type = "Label", Wrap = true, Text = "These colours drive every visual that is coloured by role, not just this box." }
end
do -- [mono-rayfield]
    local m = Visuals:Module({ Name = "Health Bar", Desc = "Health beside the box, or inside the target card",
        Callback = function(v) flags.espHealth=v end,
        Info = "A bar showing how much health a player has left. On its own it sits just outside the left edge of the box. With Target Info on it moves into the card instead, so you never get two of them." })
end
do -- [mono-rayfield]
    local m = Visuals:Module({ Name = "Target Info", Desc = "Card under each player with name, weapon and distance",
        Callback = function(v)
            flags.espTarget=v
            if v and Mono.mNametag and Mono.mNametag:Get() then Mono.mNametag:Toggle(false) end
        end,
        Info = "A card beneath each player showing their display name, username, held weapon and distance. Turning it on turns Nametag ESP off: the two show the same thing in different places and would overlap." })
    Mono.mTarget=m
end''')

    # the pairing has to hold from the other side too
    src = sub(
        '''Callback = function(v) flags.espNames=v; if not v then pcall(Mono.setRobloxNames,false) end end''',
        '''Callback = function(v) flags.espNames=v; if not v then pcall(Mono.setRobloxNames,false) end
            if v and Mono.mTarget and Mono.mTarget:Get() then Mono.mTarget:Toggle(false) end end''')

    return src
