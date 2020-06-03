pico-8 cartridge // http://www.pico-8.com
version 21
__lua__
--this new palette shortcut is so good omg
pal({
     8,11,10,140,14,12,7,
 129,8,11,10,140,14,12,7,
},1)

--frame count
n=0

function _draw()
 cls()
 
 --background text
  srand()
  for y=0,127,7 do
    local d=sgn(y%14-7)
    if y==14 then
     for x=0,149,6 do
      local i=1+(x/6)%5
        ?sub("pico8 ",i,i),(x+n*d)%150-11,y,8
      end
    else
      for x=0,143,8 do
       --chr()! kana!
        ?chr(154+rnd(99)+2.5*max(sin(rnd()+t()/3))),(x+n*d)%144-8,y,8
      end
    end
  end
  
  --hologram
  local p={[0]=1,2,4}
  
  --hologram rotation
  local q=t()/12
  local c=cos(q)
  local s=sin(q)
  
  --iterate over background pixels
  for y=0,31.5,.5 do
    for x=0,31.5,.5 do
     --new operator!
     --checking 4th bit is set
      if pget(x,y)&8==8 then
       local u=x-16
        for i=0,2 do
          local z=(i-1)*1.65
          
          --rotate around y
          local a=u*c-z*s
          local b=u*s+z*c
          
          --apply perspective
          local k=.54-b/72
          local u=64+a/k
          local v=64+(y-16)/k
          
          --new operator!
          pset(u,v,pget(u,v)|p[i])
        end
      end
    end
  end
  
  n+=1
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
