pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--pong 
-- by 6ilberM

--globals
objects = {}
a_limit= 75
constr= 2
maxspeed =13.0
col = 9
dt= 1/1.29
clrcol=1

function makeactor(x,y)
if not(#objects<a_limit) then return nil end
a={}
a.name=" " a.type= "solid"
a.x=x a.y= y
a.dx=0 a.dy=0
a.frames= 0
a.w=0 a.h=4
a.gscale=1 a.spd=1
lt=0
add(objects,a)
return a
end
delay = 0
function _init()
paddle = makeactor(52,122)
paddle.name="player"
paddle.spd= 3 paddle.w=24 paddle.h=10
del(objects,paddle) 
mainball=makeball(64,64,3)
lives=1
end

function _update() 
-- gameloop
if	lives>0 then upos(objects)
_uposp(paddle) mvepaddle(paddle)
 lt+=1
else
if delay>5 then  
--if btnp(❎) then 
_init() delay =0
else delay+=0.033 end
end end

function _draw() cls(clrcol)
if lives>0 then 
foreach(objects,rendr)
rectfill(paddle.x,paddle.y,paddle.x
+paddle.w,paddle.y+paddle.h, col)
for i=1,lives do print("♥",104 +(i*6),10,7 +i)
end else print(flr(abs(5-delay)),2,2,8)
 print("gameover ♥",44,64,8) end
end

function _retdx(v)
v.dx *=-1
end

function _retdy(v)
v.dy *=-1
end

function l_over(a_pos,a_vel,a_sz, val)
return a_pos +a_vel+a_sz> val
end

function l_under(a_pos,a_vel,a_sz, val)
return a_pos +a_vel -a_sz < val
end

function rendr(a)
	if a.name== "ball" then 
	circfill(a.x,a.y,a.rad,col+1)
	else spr(a.spr,a.x,a.y,1,1,a.dx<0)  end
end 

-->8
--helpers
function v_mag( v ) --returns magnitude
  return sqrt( ( v.dx * v.dx ) + ( v.dy * v.dy ) )
end

function v_normalize( v ) --normalizes v into a unit vector
  local len = v_mag( v )
  return { x = v.dx / len, y = v.dy / len }
end

function v_clamper(v)
	local len = v_mag(v)
	local n1= v_normalize(v)
	v.dx = n1.x	* len
	v.dy = n1.y* len
end

function v_setvel(v,s)
	local len = v_mag(v)
	local n1= v_normalize(v)
	len*=s
	v.dx = n1.x	* len
	v.dy = n1.y* len
end

function v_setv(v,speed)
local n1= v_normalize(v)
v.dx= n1.x*speed
v.dy= n1.y*speed
end
-->8
--iterstuff

function upos(_l) 
local b_hasball=false	
	for k,v in pairs(_l)do
	_clamp(v)
	local b_hasfound= false
	
	if (b_hasfound==false) and v.name == "ball" then
	local collided = false
    b_hasball=true
	local rx= l_over (v.x,v.dx,v.rad,128)
	local lx= l_under(v.x,v.dx,v.rad,0)
	local dy= l_over (v.y,v.dy,v.rad,130)
    local uy= l_under(v.y,v.dy,v.rad,0)

	local p_hit = v.dy>0 and 
	v.x+v.rad>= paddle.x and v.x-v.rad<=paddle.x+paddle.w and
	(v.y-v.rad<=paddle.y+paddle.h/2 and v.y+v.rad >=paddle.y)
	if rx or lx then _retdx(v) collided= true end 
	if p_hit then v.dy*=-1 sfx(1) collided= true
	elseif uy then _retdy(v) collided= true
	elseif dy then sfx(2) del(objects,v) end
	if collided then v_setvel(v,1.020001)
	 sfx(0) 
	 else 	 v.frames+=1 end 
	 end
	 pulsateball(v) 
	v.x += v.dx*dt
	v.y += v.dy*dt
	end
	if not b_hasball then lose()end
end

function lose()
lives-=1
mainball= makeball(64,64,3)
end

function _clamp(v)
	 s=v_mag(v)
	 n1= v_normalize(v)
	if s>=maxspeed then 
	 		v.dx=n1.x*maxspeed 
	 		v.dy=n1.y*maxspeed 
	end	
end

function _uposp(pl)
 		pl.dx *=0.845
	if pl.x+pl.dx+pl.w> 131 
	   or pl.x+pl.dx<-3 
	then pl.dx *=-.05 end 
		pl.x += pl.dx*dt
	pl.y += pl.dy*dt
end
-->8
--player stuff
function makeball(x,y,size)
a = makeactor(x,y)
if a== null then return end
del(a,a.w) del(a,a.h)
a.rad =size
a.dx=(rnd(2)-1) a.dy= -.35
a.name= "ball" 
v_setv(a,3)
return a
end

function pulsateball(v)
v.rad= 3+(sin(v.frames/10)*1.25)
end

function mvepaddle(a)
	if  btn(⬅️)then if a.x>0 
	then a.dx= -5 end
	elseif btn(➡️)then if a.x<128 
	then a.dx= 5 end
	end
end
__gfx__
000000008888a8880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000088888a880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100000e3200e3200e3200e32014300053000230013100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010100001c1201b3201732014120100000e0000d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00040000260202103016040137000b7003f6000360000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
