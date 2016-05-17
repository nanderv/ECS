local test_system = {}
test_system.name = "test"
test_system.draw = function()
	for k,v in pairs(test_system.targets) do
		love.graphics.print(k,10,10)
	end
end
test_system.requirements = {targets={"test","AA"}}

return test_system
