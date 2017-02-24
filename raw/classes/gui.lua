--[[
    @2/21/17
    @hexengine
    @gui.lua
    @hexadecival
--]]

--@hexadecival
--gui class
gui = {}
gui.__index = gui 
function gui.new(image,pos,size,zindex,text)
	local class = setmetatable({zindex=zindex,image=image,type=type,pos=pos,size=size,text=(text or ""),components={}},gui) 
	table.insert(_G.drawlist,class)
	return class
end
function gui:draw()
	local center = vec.new(love.graphics.getWidth()/2,love.graphics.getHeight()/2)
	if self.image == "text" then
		love.graphics.print(self.text,self.pos.x+cam.pos.x,self.pos.y+cam.pos.y,0,self.size.x,self.size.y)
	elseif self.image == "box" then
		love.graphics.rectangle("fill",self.pos.x+cam.pos.x,self.pos.y+cam.pos.y,self.size.x,self.size.y)
	else
		love.graphics.draw(self.image,self.pos.x+cam.pos.x,self.pos.y+cam.pos.y,0,self.size.x,self.size.y)
	end
end
--inherited from obj class
function gui:updatecomponents()
	for _, component in pairs (self.components) do
		component:update()
	end
end
return gui