local system = {}

system.name = "a_from_w"

system.update = function(dt)
	for k,v in pairs(system.targets) do
		local dx = 0
		local dy = 0
		for l,w in pairs(system.targets) do
			if w ~= v then
				print(v,w)
			local xd = v.position.x - w.position.x
			local yd = v.position.y - w.position.y
			local hyp = math.sqrt(xd*xd+yd*yd)
			local gmmr = global.g * v.mass.mass*w.mass.mass / hyp*hyp
			dx = dx - xd/hyp * gmmr
			dy = dy - yd/hyp * gmmr
			end
		end
		v.acceleration.x = dx
		v.acceleration.y = dy
	end
end

system.requirements = {position=true,acceleration=true, mass=true}

return system