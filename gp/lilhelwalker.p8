pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
actor = {}

function make_actor(x,y)

	a= {}
	--pos & vel
	a.x= x
	a.y= y
	a.dx= 0
	a.dy= 0

	a.t =0 
	--image
	a.spr = 003
	a.frame = 0
	a.frames = 1
	a.moving = true

	a.w = 0.4
	a.h = 0.4
	
	a.gfs= 1
	
	a.speed= 1/1.5
	a.jumpForce=sqrt(a.gfs*gravity*2)
	a.flipped=false

	add(actor,a)
	return a
end
	buttn_x =false;

function _init()
	gravity = 0.327
	pl= make_actor(64,64)
	pl.spr= 001
	pl.frames = 3
	pl.h=7
	pl.w=7

	add(actor, pl)
end

function chk_limit(pos,velocity,size)
return (pos+velocity<128-size and pos+velocity>0+size)
end

function update_actor(a)

	if (not a.moving) then
 return end

	a.dy+= gravity

	a.dx*= .85
	if a.dx<0 then a.flipped=true 
	else
	a.flipped=false
	end

	if chk_limit(a.x,a.dx,a.w) then
	a.x +=a.dx
	else
	a.dx= 0
	end
	if chk_limit(a.y,a.dy,a.h)then
	a.y +=a.dy
	else 
	a.dy= 0
	end

 a.frame += abs(a.dx) * 4
 a.frame %= a.frames
 if abs(a.dx)<0.2 then a.frame=0 end
end

function render_actor(a)
spr(a.spr+ a.frame,a.x,a.y,1,1,a.flipped)
end

function _update()
foreach(actor, update_actor)

	if(btnp(5)and pl.dy==0)then
	buttn_x=true 
	pl.dy-= pl.jumpForce 
	end
	if	(btn(⬅️))then pl.dx-=pl.speed
	elseif(btn(➡️))then pl.dx+= pl.speed
	end
	if	(btn(⬆️))then pl.dy-= pl.speed
	elseif(btn(⬇️))then pl.dy+= pl.speed
	end

end


function render(a)

spr(a.spr+a.frame,a.x,a.y)
end

function _draw()
cls()
foreach(actor, render_actor)

end

__gfx__
00000000000000000000000000000000000cc00000aa900000aa900000aa90006666666600000000000000000000000000000000000000000000000000000000
0000000000850800008508000085080000ccccc000a98a0000a98a0000a98a006555555600000000000000000000000000000000000000000000000000000000
0070070008555550085555500885555000c0c0c00a8889a00a8889a00a8889a06555555600000000000000000000000000000000000000000000000000000000
0007700085505058855050588850505800ccccc00a8080900a8080900a8080906555555600000000000000000000000000000000000000000000000000000000
0007700008855510088555100885551000ccccc00088888000888880008888806555555600000000000000000000000000000000000000000000000000000000
00700700005511100055110000551100000c0c000088880000888800008888806555555600000000000000000000000000000000000000000000000000000000
00000000008008000080088000880800000c0c000080080000880800008008806555555600000000000000000000000000000000000000000000000000000000
0000000000880880008800000000088000cc0cc00080080000880880008008806666666600000000000000000000000000000000000000000000000000000000
