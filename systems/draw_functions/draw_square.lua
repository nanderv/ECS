local test_system = {}
test_system.name = "draw_squre"
test_system.draw = function()
	for k,v in pairs(test_system.targets) do
		love.graphics.rectangle("fill",v.position.x-v.square.width/2,v.position.y-v.square.height/2,v.square.width,v.square.height)
	end
end
test_system.requirements = {targets={"position","square"}}

return test_system
