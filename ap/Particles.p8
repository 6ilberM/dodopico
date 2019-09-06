pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

--particles

a_limit = 50
friction = 0.999999
maxspeed= 2

function makeactor(x,y)
if not(#actor+1<a_limit)then return nil end
a={}
a.name=" "
a.x= x
a.y= y
a.dx= 0	
a.dy= 0
a.spr= 0
a.frames= 0
a.gscale=1
a.speed=1
a.layer= "player"

add(actor,a)

return a
end

actor = {}
timer = 0

function _init()
p1=makeactor(34,34)
p1.name="yaboy"
p1.spr=1
p1.gscale=0.0
end

function _update60() updatepos(actor)
playerinput(p1)
spawn()

if btn(❎) then end
  timer+=0.016666666666666666
end
function _draw()
cls(0)
foreach(actor,rendr)
end
-->8
-- player & helpers
function rendr(a)
spr(a.spr,a.x,a.y,1,1,a.dx<0)
end 

function clamppos(a)
if a.name=="yaboy"then
local passed= false
	if a.x<-2 	then a.x=129 passed=true end
	if a.y<-2 	then a.y=129 passed=true  end
	if a.x>130 then a.x=-1	passed=true end
	if a.y>130	then a.y=-1	passed=true end
	if passed then sfx(0) end	 	
elseif a.dx >=.25 then
	if a.x<-2 	then a.x=129 end
	if a.y<-2 	then a.y=129 end
	if a.x>130  then a.x=-1	 end
	if a.y>130	then a.y=-1	 end
else
	if  a.x<-2 or a.x>130 
		or a.y<-2 or a.y>130 then 
		a.x=64 a.y=64 
		rndspd(a)
 end end end 

grav =0.1635
function updatepos(_l) 
	for k,v in pairs(_l)do
	v.dy += v.gscale* grav
 	v.x += v.dx
 	v.y += v.dy
 	s=v_mag(v)
	 n1= v_normalize(v)
 	if s>=maxspeed then v.dx=n1.x*maxspeed v.dy=n1.y*maxspeed  end	 
 	clamppos(v)
	end 
end

function playerinput(_plyr)
	xs= 0
	ys= 0
	if	btn(0) and btn(1)then return
		elseif btn(0)	then xs=-1
		elseif btn(1) then xs= 1
	end
	if	btn(2) and btn(3)then return
		elseif btn(2) then ys=-1
		elseif btn(3) then ys= 1
	end

_plyr.dx += xs* p1.speed*.33
_plyr.dy += ys* p1.speed*.33
end

-->8
--others

function rndspd(a)
	a.dx= (rnd(2)-1)*a.speed
	a.dy= (rnd(2)-1)*a.speed
end

function spawn()
	if timer>=(1) then 
	local p2= p1
	ins= makeactor(64,64)
		if ins == nil then return end
	ins.spr =flr(rnd(5))+2
	ins.speed=3
	ins.gscale=0.3
	rndspd(ins)
	timer=0
	end 
end

-->8
--helpers

--returns magnitude
function v_mag( v )
  return sqrt( ( v.dx * v.dx ) + ( v.dy * v.dy ) )
end
-- normalizes v into a unit vector
function v_normalize( v )
  local len = v_mag( v )
  return { x = v.dx / len, y = v.dy / len }
end

function v_clamper(v)
	local len = v_mag(v)
	local n1= v_normalize(v)
	v.dx = n1.x	* len
	v.dy = n1.y* len
end
__gfx__
00000000888888a80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008888a80000110000006600000088000000ee000000dd000000000000000000000000000000000000000000000000000000000000000000000000000
007007000404044000111100006666000088880000eeee0000dddd00000000000000000000000000000000000000000000000000000000000000000000000000
00077000040404040111111006666660088888800ee66ee00dd55dd0000000000000000000000000000000000000000000000000000000000000000000000000
000770000444044400111100006666000088880000eeee0000dddd00000000000000000000000000000000000000000000000000000000000000000000000000
0070070000000000000110000006600000088000000ee000000dd000000000000000000000000000000000000000000000000000000000000000000000000000
00000000004400440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000aa9222aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
18018000aa9222aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111000888888aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
c11c1000222222220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111000222222220000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01110000888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
02220000aaa229aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
22022000aaa229aa0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888eeeeee888eeeeee888777777888eeeeee888888888888888888888888888888888888888888888ff8ff8888228822888222822888888822888888228888
8888ee888ee88ee88eee88778887788ee888ee88888888888888888888888888888888888888888888ff888ff888222222888222822888882282888888222888
888eee8e8ee8eeee8eee8777778778eeeee8ee88888e88888888888888888888888888888888888888ff888ff888282282888222888888228882888888288888
888eee8e8ee8eeee8eee8777888778eeee88ee8888eee8888888888888888888888888888888888888ff888ff888222222888888222888228882888822288888
888eee8e8ee8eeee8eee8777877778eeeee8ee88888e88888888888888888888888888888888888888ff888ff888822228888228222888882282888222288888
888eee888ee8eee888ee8777888778eee888ee888888888888888888888888888888888888888888888ff8ff8888828828888228222888888822888222888888
888eeeeeeee8eeeeeeee8777777778eeeeeeee888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111dd1ddd1d1d1ddd1ddd11dd111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111d1d11d11d1d1d111d1d1d11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ddd1ddd1d1d11d11ddd1dd11dd11ddd111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111d1d11d11d1d1d111d1d111d111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111dd111d11d1d1ddd1d1d1dd1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1e1e1ee111ee1eee1eee11ee1ee1111116661661166111661666166111711666117111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e111116161616161616111616161617111616111711111111111111111111111111111111111111111111111111111111
1ee11e1e1e1e1e1111e111e11e1e1e1e111116611616161616661666161617111666111711111111111111111111111111111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e111116161616161611161611161617111616111711111111111111111111111111111111111111111111111111111111
1e1111ee1e1e11ee11e11eee1ee11e1e111116161616166616611611166611711616117111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111666166111661111166116161111111111711bbb1bb11bb111711c11117111111ccc11711717166611111166166616661666166111111111111111111111
11111161161616111111161616161777111117111b1b1b1b1b1b17111c1111171111111c11171171161611111611161616111611161611111111111111111111
11111161161616661111161611611111111117111bb11b1b1b1b17111ccc1117177711cc11171777166611111666166616611661161611111111111111111111
11111161161611161111161616161777111117111b1b1b1b1b1b17111c1c11171111111c11171171161611111116161116111611161611111111111111111111
11111666161616611171166616161111111111711b1b1b1b1bbb11711ccc117111111ccc11711717161611711661161116661666166611111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111666166111661111166116161111111111711bbb1bb11bb111711c11117111111ccc11711717166611111166166616661666166111111111111111111111
11111161161616111111161616161777111117111b1b1b1b1b1b17111c1111171111111c11171171161611111611161616111611161611111111111111111111
11111161161616661111161616661111111117111bb11b1b1b1b17111ccc1117177711cc11171777166611111666166616611661161611111111111111111111
11111161161611161111161611161777111117111b1b1b1b1b1b17111c1c11171111111c11171171161611111116161116111611161611111111111111111111
11111666161616611171166616661111111111711b1b1b1b1bbb11711ccc117111111ccc11711717161611711661161116661666166611111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1ee11ee111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ee11e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1e1e1eee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111111111111111111111111111111aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa111111111111111111111111111111111111111
1eee1e1e1ee111ee1eee1eee11ee1ee11111aaaaaa66a666a666a6a6a66aa6a6a666a66aa66aa6aaa666a666a171117111111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e1111aaaaa6aaa6a6a6a6a6a6a6a1a6a6a6a6a6a6a6a6a6aaa6aaa6a6a711111711111111111111111111111111111111
1ee11e1e1e1e1e1111e111e11e1e1e1e1111aaaaa666a666a666a6a6a6171666a666a6a6a6a6a6aaa66aa66aa711111711111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e1111aaaaaaa6a6aaa6a6a666a61771a6a6a6a6a6a6a6a6aaa6aaa6a6a711111711111111111111111111111111111111
1e1111ee1e1e11ee11e11eee1ee11e1e1111a666a66aa6aaa6a6a666a6177716a6a6a6a6a666a666a666a6a6a171117111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111777711111111111111111111111111111111111111111111111111111111111111111
11111eee1eee1111166616661666166616661711111111711cc111711117711e1e1e1eee1ee11111111111111111111111111111111111111111111111111111
111111e11e1111111161116116661611161611711777171111c11117111117111e1e1e111e1e1111111111111111111111111111111111111111111111111111
111111e11ee111111161116116161661166111171111171111c11117111111e11eee1ee11e1e1111111111111111111111111111111111111111111111111111
111111e11e1111111161116116161611161611711777171111c11117111111e11e1e1e111e1e1111111111111111111111111111111111111111111111111111
11111eee1e111111116116661616166616161711111111711ccc1171111111e11e1e1eee1e1e1111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111e1111ee11ee1eee1e1111111666166611111111166616611111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e111e1e1e1111111616111617771111161611611111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e111eee1e1111111666166611111111166611611111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e111e1e1e1111111611161117771111161111611111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1ee111ee1e1e1eee11111611166611111111161116661111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111666166111661111111116661666161616661666116616661166166611711bbb1bb11bb11171166616661111161611711111111111111111111111111111
11111161161616111777111116661616161616111616161111611616161617111b1b1b1b1b1b1711161611161111161611171111111111111111111111111111
11111161161616661111111116161666166116611666161111611616166117111bb11b1b1b1b1711166616661111116111171111111111111111111111111111
11111161161611161777111116161616161616111616161111611616161617111b1b1b1b1b1b1711161116111111161611171111111111111111111111111111
11111666161616611111111116161616161616661616116611611661161611711b1b1b1b1bbb1171161116661171161611711111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111171166616661111161611111cc11ccc1ccc117111111bbb1bb11bb11171166616661111161611711111111111111111111111111111111111111111
1111117117111616111611111616117111c1111c1c1c111711111b1b1b1b1b1b1711161611161111161611171111111111111111111111111111111111111111
1111177717111666166611111161177711c11ccc1ccc111711111bb11b1b1b1b1711166616661111166611171111111111111111111111111111111111111111
1111117117111611161111111616117111c11c111c1c111711711b1b1b1b1b1b1711161116111111111611171111111111111111111111111111111111111111
111111111171161116661171161611111ccc1ccc1ccc117117111b1b1b1b1bbb1171161116661171166611711111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111711111166616661111161611111cc11ccc1ccc11711171111111111111111111111111111111111111111111111111111111111111111111111111
11111171171111111616111611111616117111c1111c1c1c11171117111111111111111111111111111111111111111111111111111111111111111111111111
11111777171117771666166611111666177711c11ccc1ccc11171117111111111111111111111111111111111111111111111111111111111111111111111111
11111171171111111611161111111116117111c11c111c1c11171117111111111111111111111111111111111111111111111111111111111111111111111111
1111111111711111161116661171166611111ccc1ccc1ccc11711171111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1eee111116661661116611111111111111111cc11ccc1c1111111eee1e1e1eee1ee111111eee1eee1eee1e1e1eee1ee111111eee1ee11ee11111
1111111111e11e11111111611616161111111777177711111c1c11c11c11111111e11e1e1e111e1e11111e1e1e1111e11e1e1e1e1e1e11111e111e1e1e1e1111
1111111111e11ee1111111611616166611111111111111111c1c11c11c11111111e11eee1ee11e1e11111ee11ee111e11e1e1ee11e1e11111ee11e1e1e1e1111
1111111111e11e11111111611616111611111777177711111c1c11c11c11111111e11e1e1e111e1e11111e1e1e1111e11e1e1e1e1e1e11111e111e1e1e1e1111
111111111eee1e11111116661616166111111111111111111c1c1ccc1ccc111111e11e1e1eee1e1e11111e1e1eee11e111ee1e1e1e1e11111eee1e1e1eee1111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111666166111661111116616661666111111111ccc111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111116116161611111116111616161611111777111c111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111161161616661111166616661661111111111ccc111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111161161611161111111616111616111117771c11111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111666161616611171166116111616111111111ccc111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111116661661116611111166166616661666166111111ccc11111ccc111111111111111111111111111111111111111111111111111111111111111111111111
111111611616161111111611161616111611161617771c1c11111c11111111111111111111111111111111111111111111111111111111111111111111111111
111111611616166611111666166616611661161611111c1c11111ccc111111111111111111111111111111111111111111111111111111111111111111111111
111111611616111611111116161116111611161617771c1c1111111c111111111111111111111111111111111111111111111111111111111111111111111111
111116661616166111711661161116661666166611111ccc11c11ccc111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111666166116611166166616611171166616611166117111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111616161616161611161616161711116116161611111711111111111111111111111111111111111111111111111111111111111111111111111111111111
11111661161616161666166616161711116116161666111711111111111111111111111111111111111111111111111111111111111111111111111111111111
11111616161616161116161116161711116116161116111711111111111111111111111111111111111111111111111111111111111111111111111111111111
11111616161616661661161116661171166616161661117111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111666166616661666166611111ccc111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111161116116661611161617771c1c111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111161116116161661166111111c1c111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
82888222822882228888822288828222822288888888888888888888888888888888888888888888888888888282822282228882822282288222822288866688
82888828828282888888828288288882888288888888888888888888888888888888888888888888888888888282888288828828828288288282888288888888
82888828828282288888822288288222882288888888888888888888888888888888888888888888888888888222888282228828822288288222822288822288
82888828828282888888828288288288888288888888888888888888888888888888888888888888888888888882888282888828828288288882828888888888
82228222828282228888822282888222822288888888888888888888888888888888888888888888888888888882888282228288822282228882822288822288
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__sfx__
0006000000000200501f0501905016050150502f0502d050290502805000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
