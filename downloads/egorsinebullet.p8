pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
local t=0

function pattern1()
 local am=8
 t+=1
 
 if t%3==0 then
	 for i=1,am do
	  bullet(0,0,1/16+i/am+
	   cos(t*0.01)/am*
	   (i%2==0 and -1 or 1),
	   cos(t*0.01)*0.5+1)
	 end
 end
end

function pattern2()
 local am=4
 t+=1
 
 if t%3==0 then
	 for i=1,am do
	  bullet(0,0,1/(am*2)+i/am+
	   cos(t*0.01)/am*
	   (i%2==0 and -1 or 1),
	   1)--cos(t*0.005)*0.5+1)
	 end
 end
end


function pattern3()
 local am=4
 t+=1
 
 if t%3==0 then
	 for i=1,am do
	  bullet(0,0,1/(am*2)+i/am+
	   cos(t*0.01)/am*
	   1,--(i%2==0 and -1 or 1),
	   1)--cos(t*0.005)*0.5+1)
	 end
 end
end



function pattern2()
 local am=4
 t+=1
 
 if t%3==0 then
	 for i=1,am do
	  bullet(0,0,1/(am*2)+i/am+
	   cos(t*0.01)/am*
	   (i%2==0 and -1 or 1),
	   1)--cos(t*0.005)*0.5+1)
	 end
 end
end


function pattern4()
 local am=2
 t+=1
 
 if t%3==0 then
	 for i=1,am do
	  bullet(0,0,1/(am*2)+i/am+
	   cos(t*0.005)/am*
	   1,--(i%2==0 and -1 or 1),
	   cos(t*0.005)*0.5+1)
	 end
 end
end

blts={}

function bullet(x,y,a,sp,s)
 sp=sp or 2
 add(blts,{
  x=x+64,
  y=y+64,
  t=0,
  vx=cos(a)*sp,
  vy=sin(a)*sp,
  s=s or 1
 })
end

function _update60()
 local p=t/360%1
pattern4()
-- if p<0.25 then
--  pattern3()
-- elseif p<0.5 then
--  pattern2()
-- elseif p<0.75 then
--  pattern1()
-- else
--  pattern4() end
 
 for b in all(blts) do
  b.x+=b.vx
  b.y+=b.vy
  b.t+=1
  
  if b.x<-b.s or b.y<-b.s or b.x>128+b.s or b.y>128+b.s then
   del(blt,b)
  end
 end
end

function _draw()
 cls()
 for b in all(blts) do
  circfill(b.x,b.y,b.s,b.t<3 and 7 or 8)
 end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
