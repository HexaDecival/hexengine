--[[
    @2/21/17
    @hexengine
    @raytrace.lua
    @hexadecival
--]]

--@hexadecival
--raytrace class
ray = {}
ray.__index = ray 
function ray.new(from,to)
	return setmetatable({from=from,to=to},ray)
end
function ray:findobject()
	for _, v in pairs (_G.drawlist) do
		if (obj.pos):mag() < (self.from+self.to):mag() then
			
		end		
	end
end
return ray