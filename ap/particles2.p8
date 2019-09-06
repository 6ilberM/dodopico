pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--sand★sym
particle = {}
c = 8
function sandspawn(x,y)
local a = {}
a.x=x
a.y=y
a.gr=1
a.col=8
a.t=0
a.et=(rnd(10)+5)*60

add(particle,a)
return a
end


function _init()
pl={}
pl.x=64
pl.y=64
pl.dx=0
pl.dy=0
pl.col=2
end

dt2 = 0

function _update()
moveplayer(pl)
_uplyr()
foreach(particle,u_pxy)
dt2+=1
end


function moveplayer(a)
if btn(⬅️)then a.dx-=.5 end
if btn(➡️)then a.dx+=.5 end
if btn(⬇️)then a.dy+=.5 end
if btn(⬆️)then a.dy-=.5 end
 
 
if btn(❎) and dt2%2.5==0 then
p=sandspawn(a.x,a.y)
c = c+.1/4
if c>15 then c=7 end
p.col= c 
end
end

function _uplyr()
if pl.x+pl.dx>128 or 
			pl.x+pl.dx<0 
then pl.dx*=-1 end

if pl.y+pl.dy>128 or 
			pl.y+pl.dy<0 
then pl.dy*=-1 end

pl.x+=pl.dx
pl.y+=pl.dy
pl.dx*=0.95
pl.dy*=0.95
end

function dr_pl()
rectfill(0+pl.x,0+pl.y,
1+pl.x,1+pl.y,pl.col)
end

function dr_pixel(a)
rectfill(0+a.x,0+a.y,
1+a.x,1+a.y,a.col)
end

function u_pxy(a)
--fall
local cantmove= false
if a.y+1>127 then a.t+=0
	elseif pget(a.x,a.y+2)==1 
	then a.y+=1
	elseif pget(a.x+2,a.y+2)==1 then
	a.y+=1 a.x+=1
	elseif pget(a.x-2,a.y+2)==1 then
	a.y+=1 a.x-=1	
	else	
add(inactive,a) del(particle,a)
end

if a.t>a.et then del(particle,a) 
end end

inactive={}
function _draw()
cls(1)
dr_pl()
foreach(particle,dr_pixel)
foreach(inactive,dr_pixel)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
