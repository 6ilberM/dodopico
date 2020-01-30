pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- neo midpointer 🐱

const = {}
	const.pi = 3.141592653589793238
	const.twopi =const.pi*2
	const.radius=17
	const.hexsize=40

function _init()
	frame = 0 points={} circles={}
	-- polygon(30,6)
	make_hexagon(64,64)
end


shoot =false  lock1=false
function _update60()
	foreach(circles,updatecirc)
	foreach(points,upos)
	if btn(4) then	shoot =true
	else shoot=false lock1=false end
	if shoot and not lock1 then
	--Do something here
	lock1=true end
end

function _draw() cls() 
 foreach(circles,circprint) 
 foreach(points,ptprint)
 printoutline()
-- print("CPU:"..stat(2))
end

-->8
-- GFX
function circprint(c)
 circ(c.x,c.y,c.rad,1)
end

function ptprint(p)
	pset(p.x,p.y,p.col)
end

function printoutline()
local cols={7,8,12}
-- local cols={7}
	for i= 1,count(points) do 
	if i>1 then
	 local p,c
	 p=points[i-1] c=points[i]
	 line(p.x,p.y,c.x,c.y,cols[(i%#cols)+1])
	 end
	 if #points>2 then
	 line(points[#points].x,points[#points].y,points[1].x,points[1].y,cols[1+(i%#cols)])
	end
	end
end

-->8
-- iterstuff
function upos(a)
a.frame+=1*a.rate
-- rotate(64,64,20,a)
end

function updatecirc(c)
rotate(c.x,c.y,c.rad,c.point)
end

function rotate(x, y, radius, pt)
  pt.deg -= pt.deg+1*((pt.frame)/10) 
--   pt.deg -= 1 
  --We update star's position by incrementing the degrees and using our formula
  -- x + (radius * cosine(degrees)) = a point on the edge of the circle in the x-axis
  -- y + (radius * sine(degrees)) = a point of the edge of the circle in the y-axis
  pt.x = x + (radius * cos(pt.deg))
  pt.y = y + (radius * sin(pt.deg))  
end

function polygon(radius,npoints)
angle = (const.twopi)/npoints
local i=0
local deltatime=0
while i<(const.twopi) do
	local v={}
	v.x=64+cos(i)*radius
	v.y=64+sin(i)*radius
	i+= angle
	local c=makecirc(v.x,v.y,const.radius)
	c.point.frame=deltatime
	deltatime+=.25
	end
end

function ccircle(obj)
	local c=makecirc(obj.x,obj.y,const.radius)
	c.point.frame=rnd(2)-1
end

-->8
--makers 😐

function makept(x,y)
	local a= {}
	a.x=x a.y=y
	a.col=rnd(2)+7 a.frame= 0
	a.deg=0 a.rate=rnd(1)/10
	add(points,a)
	return a
end

function make_hexagon(x,y)
     obj={}
     for i=0,5 do
         add(obj,{x=x+sin(i/6)*const.hexsize,y=y+cos(i/6)*const.hexsize})
     end
	 foreach(obj,ccircle)
end

function makecirc(x,y,rad)
	local c= {} c.x=x c.y=y
	c.rad=rad 
	c.point= makept(x,y)
	add(circles,c)
	return c
end

-- ToDo: MidPointer to pointer to draw new lines

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
