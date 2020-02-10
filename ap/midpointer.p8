pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- neo midpointer 🐱

const = {} field={}
	const.pi = 3.141592653589793238
	const.twopi =const.pi*2
	field.radius=10
	field.polysize=45
	field.sides=1
	field.colchange=0

	-- easiest way is to create MetaMetaTables
function _init()
	frame = 0  circles={} points={} 
	polygon(64,64,field.sides)
end

shoot =false  lock1=false
shoot2 =false  lock2=false

function _update60()
local oldsides=field.sides
	foreach(circles,updatecirc)
	foreach(points,upos)
	if btnp(1) and (field.sides+1)<13 
	then field.sides +=1 elseif btnp(0) and 
	(field.sides-1)>1 then field.sides-=1 end	
	if field.sides!=oldsides then _init() end
	
end

function _draw() cls() 
	foreach(circles,circprint) 
	foreach(points,ptprint)
	printoutline()
-- print("CPU:"..stat(2),2,2)
	-- field.colchange-=0.035
end

-->8
-- GFX
function circprint(c)
 circ(c.x,c.y,c.rad,1)
 print(c.ID,c.x-1,c.y-1,c.ID+field.colchange)
end

function ptprint(p)
	pset(p.x,p.y,p.col)
end

-- (i%#cols)+1
function printoutline()
-- local cols={7,12}
	for i= 1,count(points) do 
	if i>1 then
	 	local p,c
	 	p=points[i-1] c=points[i]
	 	line(p.x,p.y,c.x,c.y,7)
	 	end
	 if #points>2 then
	 	line(points[#points].x,points[#points].y,
	 	points[1].x,points[1].y,7)
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
  pt.x = x + (radius * cos(pt.deg))
  pt.y = y + (radius * sin(pt.deg))  
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

function polygon(x,y,npoints)
     obj={}
     for i=1,npoints do
         add(obj,{x=x+sin(i/npoints)*field.polysize,
		 y=y+cos(i/npoints)*field.polysize})
     end
	 foreach(obj,ccircle)
end

function ccircle(obj)
	local c=makecirc(obj.x,obj.y,field.radius)
	c.point.frame=rnd(2)-1
end

function makecirc(x,y,rad)
	local c= {} c.x=x c.y=y
	c.rad=rad 
	c.point= makept(x,y)
	c.ID = #circles+1
	add(circles,c)
	return c
end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
