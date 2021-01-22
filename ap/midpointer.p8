pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- neo midpointer 🐱

	const = {} field={}
	const.pi = 3.141592653589793238
	const.twopi =const.pi*2
	field.radius=12	field.polysize=50
	field.sides=1 field.colchange=0

	-- easiest way is to create metametatables
		
function _init()
	frame = 0 
	depth = 0 
	dt= 0
	midpointtable= {}
	 circles={} points={} 
	polygon(64,64,field.sides)
	local pts={}
	for i=1,count(circles) do 
	add(pts,circles[i].point)
	add(points,pts)
	end
end

shoot =false  lock1=false
shoot2 =false  lock2=false

function _update()
midpointtable={}
	dt= 1/30
	input()
	foreach(circles,updatecirc)
	foreach(points,upos)
	add(midpointtable,getmidpoints(circles))

	if depth>1 then
		for i = 2, depth,1 do
			if i==2 then
		 		add(midpointtable,getmidpoints2(midpointtable[1])) 
			else
				add(midpointtable,getmidpoints2(midpointtable[i-1]))
			end
		end
	end
end

function _draw() 
cls() 
	foreach(circles,circprint) 
	foreach(points,ptprint)
	printoutline(points[1],7)
	if depth>=1 then
	for i =1, depth , 1 do
	printoutline(midpointtable[i],7+i)
	end
end
	-- print("CPU:"..stat(2),2,2)
	-- print(midpoints[]],2,2)
	-- field.colchange-=0.035
	-- ratedebug()
end

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
function printoutline(pl,color)
-- local cols={7,12}
	for i= 1,count(pl) do 
	if i>1 then
	 	local p,c
	 	p=pl[i-1] c=pl[i]
	 	line(p.x,p.y,c.x,c.y,color)
	 elseif i==1 then
	 	line(pl[#pl].x,pl[#pl].y,
	 	pl[1].x,pl[1].y,color)
		end
	end
end

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
  pt.deg = pt.frame * dt
  if pt.deg>1 then pt.frame=0 end
  pt.x = x + (radius * cos(pt.deg))
  pt.y = y + (radius * sin(pt.deg))  
end

function makept(x,y)
	local a= {}
	a.x=x a.y=y
	a.col=rnd(2)+7 a.frame= 0
	a.deg=0 a.rate=1/10
	return a
end

function getmidpoints(container)
	local midpoints = {}
	for i=1, count(container) do
		if i == 1  then 
		 add(midpoints,midpoint(container[i].point,container[count(container)].point))
		else
		add(midpoints,midpoint(container[i-1].point,container[i].point))
		end
	 end

	 return midpoints
end

function getmidpoints2(container)
	local midpoints = {}
	for i=1, count(container) do
		if i == 1  then 
		 add(midpoints,midpoint(container[i],container[count(container)]))
		else
		add(midpoints,midpoint(container[i-1],container[i]))
		end
	 end

	 return midpoints
end

function midpoint(pt1,pt2)
	local pt={}
	pt.x= (pt1.x+pt2.x)/2
	pt.y= (pt1.y+pt2.y)/2
	return pt
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

function input()
	local oldsides=field.sides
	if btnp(1) and (field.sides+1)<13 
	then field.sides +=1 elseif btnp(0) and 
	(field.sides-1)>1 then field.sides-=1 end	
	if field.sides!=oldsides then _init() end
	if btnp(4) then
	 depth+=1 

	 end
	if btnp(5) then
	 if depth-1>=0
	 then 
	 depth-=1 
	 end

	end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
