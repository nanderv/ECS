core.system = {}
core.system = {}
core.requirements_to_systems = {}
local  b = { __mode = "v" }
setmetatable(core.requirements_to_systems, b) 
function core.system.add(system,typ) 


	-- update requirements_to_systems array
		for k,v in pairs(system.requirements) do
			if core.requirements_to_systems[k] == nil then
				core.requirements_to_systems[k] = {}
			end
			core.requirements_to_systems[k][#core.requirements_to_systems[k]+1] = system
		end
	--

	system.targets = {}
	local  b = { __mode = "v" }
	setmetatable(system.targets, b) 
	-- Add entity targets
	for k,v in pairs( game.entities ) do
		possible = true
		for requirement, _ in pairs(system.requirements) do
			if v[requirement] == nil then
				possible=  false
			end
		end
		if possible then
			system.targets[entity.id] = v
			entity.systems[system.name] = system
		end
	end

	-- Store reference to system
	game.systems[system.name] = system
	system.id = #game.systems
	if typ == "draw" then 
		game.draw_systems[system.name] = system
		return
	elseif  typ == "update" then
		game.update_systems[system.name] = system
		return
	else
		error("Incorrect type ".. typ)
	end
end


function core.system.remove(system)
	-- remove system from possible results from requirement
	for k,v in pairs(system.requirements)  do
		for l,w in pairs(core.requirements_to_systems[k]) do
			if w == system then
				core.requirements_to_systems[k][l] = nil
			end
		end
	end

	game.systems[system.name] = nil
	game.draw_systems[system.name] = nil
	game.update_systems[system.name] = nil
end