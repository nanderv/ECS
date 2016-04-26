local system = {}

system.name = "draw_from_mass_and_position"

system.draw = function()
	for k,v in pairs(system.targets) do
		love.graphics.circle("fill",v.position.x,v.position.y,v.mass.mass)
	end
end

system.requirements = {mass=true,position=true}

return system