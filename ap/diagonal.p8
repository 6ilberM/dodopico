pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--diagonal movement same speed

rectsize= 50
velocity = 40
coloring = 8 
dt= null

function _init()
particles = {}
	for dx = -1,1,1 do 
	for dy= -1,1,1 do
	if dx!=0 or dy != 0 then 
		createparticle(dx,dy
													,velocity,coloring)  	
	end
		
	end
end
end

function _update()
if dt==null then
 dt = 1 / stat(8)
 end   
 foreach(particles,_uparticle)
end

function _draw()
cls()
	rect(64-rectsize/2, 64-rectsize/2,
	 64+rectsize/2, 64+rectsize/2
	, 6)
	for x = -1,1 do 
	for y= -1,1 do
	line(64,64,64+(x*(rectsize/2))
	 	,64+(y*(rectsize/2))
	 )
	 end
	 end
	 
	 foreach(particles,_dparticle)
end


function createparticle(x,y,speed,col)
	local a ={}
	a.x=64 a.y=64 a.speed= speed
	a.dx =x a.dy =y
	a.col= col
	add(particles,a)
end

function _uparticle(_a)
if 
_a.x+_a.dx*_a.speed*dt < abs(64+(-rectsize*.5))
or 
_a.x+_a.dx*_a.speed*dt > abs(64+(rectsize*.5))
or
_a.y+_a.dy*_a.speed*dt < abs(64+(-rectsize*.5))
or 
_a.y+_a.dy*_a.speed*dt > abs(64+(rectsize*.5))
 then
_a.x=64
_a.y=64
end
	
 _a.x += _a.dx*_a.speed * dt
 _a.y += _a.dy*_a.speed * dt
end

function _dparticle(_p)
 circ(_p.x,_p.y,.7,_p.col)

end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
