pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- sorting demo
-- by zep

g = {3,5,7,2,9,1,2}

function draw_giraffe(x,y,l)

 -- body
 spr(33,x-8,y-8,2,1)
 
 -- neck for l segments
 for i=1,l do
  spr(18, x,y-8-i*8)
 end
 
 -- put head on top
 spr(2, x,y-16-l*8)
 
end
function _sort(t)
  for i=1,6 do
  
   if (g[i] > g[i+1]) then
    
    -- the left one is taller,
    -- so swap them!
    temp   = g[i]
    g[i]   = g[i+1]
    g[i+1] = temp

    sfx(0)
    
    -- just one swap for now!
    break
   end
  end
 
end

function _draw()
 cls(12)
 rectfill(0,100,127,127,3)
 
 print("press 🅾️ to randomize",
        22, 2, 7)
 print("press ❎ to sort",
        32, 10, 7)
 
 for i=1,7 do
  draw_giraffe(i*16,100,g[i])
 end
 
end

function _update()

 -- ❎ to sort
 
 if (btnp(5)) then
 
  -- look for a pair of
  -- giraffees out of place
 
 local t = true
 while (t)
 
 end
 
 
 -- 🅾️ to randomize
 if (btnp(4)) then
 
  for i=1,7 do
   g[i]=flr(rnd(9))
  end
 
  sfx(1)
  
 end


end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000900900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000a00a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000aa1aaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000aaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000a9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000a9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000aa900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000009aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000009aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000aa9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000aaa999aa9900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000006aaaa99aaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006099aaaaaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000099aaaaa99aa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000009040000900400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000a040000a00400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000a040000a00400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000022050280502f0500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000200001b5501d5501b5501b5501b540165301d5301d520005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500
