pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- neo midpointer 🐱

	const = {} field={}
	const.pi = 3.141592653589793238
	const.twopi =const.pi*2
	field.radius=12	field.polysize=50
	field.sides=1 field.colchange=0

	-- easiest way is to create metametatables
		
function _init()
	frame = 0  circles={} points={} 
	polygon(64,64,field.sides)
	local pts={}
	for i=1,count(circles) do 
	add(pts,circles[i].point)
	add(points,pts)
	end
end

shoot =false  lock1=false
shoot2 =false  lock2=false

function _update60()
	foreach(circles,updatecirc)
	foreach(points,upos)
	input()
end

function _draw() cls() 
	foreach(circles,circprint) 
	foreach(points,ptprint)
	printoutline(points[1])
	-- print("CPU:"..stat(2),2,2)
	-- field.colchange-=0.035
	-- ratedebug()
end

-->8
-- GFX
function circprint(c)
	circ(c.x,c.y,c.rad,1)
	print(c.ID,c.x-1,c.y-1,c.ID+field.colchange)
end

function ptprint(p)
	for k,v in pairs(p) do 
		pset(v.x,v.y,v.col)
	end
end

-- (i%#cols)+1
function printoutline(pl)
-- local cols={7,12}
	for i= 1,count(pl) do 
	if i>1 then
	 	local p,c
	 	p=pl[i-1] c=pl[i]
	 	line(p.x,p.y,c.x,c.y,7)
	 	end
	 if #pl>2 then
	 	line(pl[#pl].x,pl[#pl].y,
	 	pl[1].x,pl[1].y,7)
		end
	end
end

-->8
-- iterstuff
function upos(a)
	for k,v in pairs(a) do 
		v.frame+=1*v.rate
	end
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
	a.deg=0 a.rate=rnd(1)/field.sides/3.5
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
	local ci =makecirc(obj.x,obj.y,field.radius)
end

function makecirc(x,y,rad)
	local c= {} c.x=x c.y=y
	c.rad=rad 
	c.point= makept(x,y)
	c.point.frame= (rnd(12)-6) 
	c.ID = #circles+1
	add(circles,c)
	return c
end

-->8
-- Utils
function input()
	local oldsides=field.sides
	if btnp(1) and (field.sides+1)<13 
	then field.sides +=1 elseif btnp(0) and 
	(field.sides-1)>1 then field.sides-=1 end	
	if field.sides!=oldsides then _init() end
	if btnp(4) then  end
	if btnp(5) then  end
end

function ratedebug()
	local averagespd=0
	for k,v in pairs(points[1]) do
		averagespd+=v.rate
	end
	if #points[1]<0 then return end
	averagespd/=#points[1]
	print(#points[1].." average speed "..averagespd,2,2)
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
