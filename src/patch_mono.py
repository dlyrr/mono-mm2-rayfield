# -*- coding: utf-8 -*-
"""ESP changes to the MonoMM2 feature code.

Applied by build.py to the text it reads from mono.lua, so the upstream file is
never edited and a re-download cannot silently drop these. Idempotent.

  1. Box width no longer swells with distance or rotation.
  2. Boxes are rounded rectangles instead of hard corners.
  3. Nametag cards get a frosted backdrop, using a real glass effect where the
     client has one.
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

local function roundedRect(segs,x1,y1,x2,y2)
    local w,h=x2-x1,y2-y1
    local r=math.clamp(math.min(w,h)*0.22,2,10)
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

    # capture the character's world proportions alongside the projection
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
                    boxAspect=math.max(size.X,size.Z)/math.max(size.Y,0.001)''')

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
    # Roblox has no per-element backdrop blur in general. Newer clients ship a
    # glass instance; where one exists use it, otherwise fall back to a frosted
    # card, which is the same look minus the actual refraction.
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
    -- a soft halo reads as depth against a busy map, and UIShadow's BlurRadius
    -- is a genuine blur even where a backdrop one is unavailable
    pcall(function()
        local s=Instance.new("UIShadow")
        s.BlurRadius=UDim.new(0,14)
        s.Color=Color3.fromRGB(0,0,0)
        s.Transparency=0.45
        s.ZIndex=-1
        s.Parent=e.card
    end)''')

    return src
