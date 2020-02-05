pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- perspective mat3

function _init()
 -- make some matrix
 -- 7x7x7 cube 
 makemat() 
  cam={ 
  x=0,  y=0 ,
  dx=0,  dy=0} 
end

function _update()
	resolveinput()
end

function _draw()
	cls()	
	camera(cam.x,cam.y)
	
	for p in all(pt)do
		-->camera space
  p.cx,p.cz=rot(p.x,p.z,t()/8)
  p.cy,p.cz=rot(p.y,p.cz,t()/7)
   p.cz+=2.25+ sin(cos(t()/6))/t()
	end
	
	 for pass=1,3 do
 		for i=1,#pt-1 do
  		if pt[i].cz<pt[i+1].cz then
  	 	pt[i],pt[i+1]=
  	 	pt[i+1],pt[i]
  		end
 		end
 	for i=#pt-1,1,-1 do
  	if pt[i].cz<pt[i+1].cz then
  	 pt[i],pt[i+1]=
  	  pt[i+1],pt[i]
 	 end
 	end
	end
	
 rad1 = 5+cos(t()/4)*4
	for p in all(pt)do
		--> screen space 
		sx = 64 + p.cx *64/p.cz
		sy = 64 + p.cy *64/p.cz
		  rad= rad1/p.cz
		   		if p.cz >.1 then 
		circfill(sx,sy,rad,p.col)
		circfill(sx+rad/3,sy-rad/3,
		rad/3,7)
		end
	end
	print("★6ilberm★",64-22,2)
end
	
-->8
-- makers

function makemat()
 pt={}
 for x=-1,1,1/3 do 
 	for y=-1,1,1/3 do 
 		for z=-1,1,1/3 do
		 p ={}
		 p.x, p.y, p.z =x,y,-z
		 p.d= p.z 
		 p.col = 8+(x*2+y*3)%8
		 add(pt,p)
		 end
		end 
 end
end
-->8
-- ☉nput

function resolveinput()
	if btn(0)then cam.dx+=-.5end
	if btn(1)then cam.dx+=.5end
	if btn(3)then cam.dy+=.5end
	if btn(2)then cam.dy+=-.5end
	cam.dx*=.8
	cam.dy*=.8
	cam.x+=cam.dx
	cam.y+=cam.dy
end
-->8
--helpers

function rot(x,y,a)
 local x0=x
 x=cos(a)*x-sin(a)*y
 y=cos(a)*y+sin(a)*x0
 return x,y
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
