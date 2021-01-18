pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
// for my birthday
// author: 6ilberm

function _init()

rate= 0
txt = split("i,♥,milagros")

x = 64-20
y = 64

actors= {}

for i=1,3 do
a = {}
 
a.txt = txt[i] 
a.x = x+i*8
a.y = y

add(actors,a)
end
 
end

function _update()

rate+=1/30

for i=1,3 do
actors[i].y= 64 + (10 * sin(i/8+rate))
end

end

function _draw()
cls()

for i=1,3 do
 print(actors[i].txt, actors[i].x, actors[i].y, 8) 
end



end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000