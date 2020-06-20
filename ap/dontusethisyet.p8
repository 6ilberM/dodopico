pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- gilberm's vector attempt
function _init()
end

function _update()
end

function _draw()
end
-->8
-- ∧oop

vector2 = class('vector2')

vector2.default_x = 0
vector2.default_y = 0

function vector2:initialize (paramsorx, y)
	if type(paramsorx) == "number" then
		self.x = paramsorx or vector2.default_x
		self.y = y         or vector2.default_y
	else
		local p = paramsorx or {}
		self.x = p.x or vector2.default_x
		self.y = p.y or vector2.default_y
	end
end

function vector2:copy ()
	return vector2:new({x=self.x, y=self.y})
end

function vector2:__tostring ()
	return string.format("<vector2 %f, %f>", self.x, self.y)
end

function vector2:__eq (other)
	return self.x == other.x and self.y == other.y
end

function vector2:__add (other)
	return vector2:new({x=(self.x + other.x), y=(self.y + other.y)})
end

function vector2:__sub (other)
	return vector2:new({x=(self.x - other.x), y=(self.y - other.y)})
end

function vector2:__mul (value)
	return vector2:new({x=(self.x * value), y=(self.y * value)})
end

function vector2:__div (value)
	return vector2:new({x=(self.x / value), y=(self.y / value)})
end

function vector2:zero ()
	self.x = 0
	self.y = 0
end

function vector2:iszero ()
	return self.x == 0 and self.y == 0
end

function vector2:length ()
	return math.sqrt((self.x ^ 2) + (self.y ^ 2))
end

function vector2:lengthsq ()
	return (self.x ^ 2) + (self.y ^ 2)
end

function vector2:normalize ()
	local length = self:length()
	if length > 0 then
		self.x = self.x / length
		self.y = self.y / length
	end
end

function vector2:dot (other)
	return (self.x * other.x) + (self.y * other.y)
end

function vector2:perp ()
	return vector2:new(-self.y, self.x)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
