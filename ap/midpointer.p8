pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- neo midpointer 🐱
function _ma(x,y)
	local a= {}
	a.x=x a.y=y
	a.dx=0 a.dy=0
	a.col=7 a.frame=0
	a.deg=0
	add(points,a)
	return a
end

function _init()
	frame = 0
	points={}
end

shoot =false 
lock1=false
function _update()
	foreach(points,upos)
	if btn(❎) then	shoot =true
	else shoot=false lock1=false
	end
	if shoot and not lock1 then
	makepixel() lock1=true
end
end

function makepixel()
	local pt = _ma(64,64)
	pt.dx= rnd(2)-1
	pt.dy= rnd(2)-1
end

function _draw()
 cls()
 circ(64,64,10,1)
	foreach(points,ptprint)
end
-->8
-- GFX
function ptprint(p)
	pset(p.x,p.y,p.col)
end

-->8
-- iterstuff
function upos(a)
rotate(64,64,10,a)
end
degrees =0
function rotate(x, y, radius, pt)
  pt.deg -= pt.frame/10
  --We update star's position by incrementing the degrees and using our formula
  -- x + (radius * cosine(degrees)) = a point on the edge of the circle in the x-axis
  -- y + (radius * sine(degrees)) = a point of the edge of the circle in the y-axis
  pt.x = x + (radius * cos(pt.deg ))
  pt.y = y + (radius * sin(pt.deg ))  
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
