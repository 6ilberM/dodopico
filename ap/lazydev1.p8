pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--6il's take on lazydev pong

function _init()
x,y = 64,64
dx,dy=5.55,6.65
clearstate=true
colors={7,8,9,10}
num=1
cnt=0
end

function _update()
inputlisten()
if x+dx >127 or x+dx<0 
then dx*=-1 end
if y+dy >127 or y+dy<0 
then dy*=-1 end
x+=dx
y+=dy
cnt+=1.5

num= (flr(cnt)%#colors) +1

end

function inputlisten()
if (0)and btn(1)then 
elseif btn(0)  then dx-=.25
elseif btn(1)  then dx+=.25
end
if btn(2) and btn(3)then 
elseif btn(2)  then dy-=.25 
elseif btn(3)  then dy+=.25 
end

if btnp(5)then clearstate=not clearstate end
end

function _draw()
if clearstate then
cls()
end
print("♥",x,y,colors[num])
--print(1,x+2,y+2,colors[num])
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
