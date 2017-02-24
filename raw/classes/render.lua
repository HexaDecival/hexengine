--[[
    @2/21/17
    @hexengine
    @render.lua
    @hexadecival
--]]

--@hexadecival
--render class
render = {
	dist = 1000
}
_G.drawlist = {} --plz dont kill me for using _G its only the MAIN DRAWLIST
function render:update()
	function orderz(a,b)
		return a.zindex < b.zindex
	end
	table.sort(_G.drawlist,orderz)
	for index, obj in pairs (_G.drawlist) do
		obj:updatecomponents()
		if ((obj.pos-vec.new(400,300))-cam.pos):mag() < render.dist then
			obj:draw()
		end
	end	
end
love.graphics.setLineStyle('rough') 
love.graphics.setDefaultFilter("nearest","nearest")
return render