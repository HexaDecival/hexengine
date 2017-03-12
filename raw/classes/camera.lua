--[[
    @2/21/17
    @hexengine
    @camera.lua
    @hexadecival
--]]

--@hexadecival
--camera class
cam = {
	target = nil,
	pos = vec.new(0,0)
}
function cam:move(pos)
	self.pos = self.pos + pos
end
function cam:setpos(pos)
	self.pos = pos
end
function cam:update()
	local center = vec.new(love.graphics.getWidth()/2,love.graphics.getHeight()/2)
	cam:setpos(self.target.pos-center) 
	love.graphics.translate(-cam.pos.x,-cam.pos.y)
end
return cam