--[[
    @2/21/17
    @hexengine
    @rigidbody.lua
    @hexadecival
--]]

--@hexadecival
--rigidbody class
rigidbody = {}
rigidbody.__index = rigidbody
function rigidbody.new(obj,velocity,drag,maxvelocity)
	local class = setmetatable({obj=obj,velocity=velocity,drag=drag,maxvelocity=maxvelocity},rigidbody)
	table.insert(obj.components,class)
	return class
end
function coldetect(a,b) --SIMPLISTIC AS HELL METHOD for now LOL
	function bounding_box_check(x1,y1,w1,h1,x2,y2,w2,h2)
		return x1 < x2+w2 and
			   x2 < x1+w1 and
			   y1 < y2+h2 and
			   y2 < y1+h1
	end
	return bounding_box_check(
		a.pos.x,a.pos.y,a.size.x,a.size.y,
		b.pos.x,b.pos.y,b.size.x,b.size.y
	)
end
function rigidbody:update()
	local dx, dy = self.drag.x,self.drag.y
	local vx, vy = self.velocity.x,self.velocity.y
	local mx, my = self.maxvelocity.x,self.maxvelocity.y
	vx = math.max(-mx,math.min(vx,mx))
	vy = math.max(-my,math.min(vy,mx))
	if vx > 0 then
		vx = math.max(0,vx-dx)
	elseif vx < 0 then
		vx = math.min(0,vx+dx)
	end
	if vy > 0 then
		vy = math.max(0,vy-dy)
	elseif vy < 0 then
		vy = math.min(0,vy+dy)
	end
	local colliding = false
	local correction = vec.new(0,0)
	for i, iobj in pairs(drawlist) do
		if iobj ~= self.obj then
			if coldetect(self.obj,iobj) then
				print("col : "..self.obj.name.." : true : "..iobj.name)
				colliding = true
			end
		end
	end
	if colliding then
		vx,vy = -vx,-vy
	else
		vy = vy + 0 --gravity dlc
	end
	self.velocity = vec.new(vx,vy)
	self.obj.pos = self.obj.pos + self.velocity 
end
return rigidbody