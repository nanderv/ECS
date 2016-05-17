core.entity = {}
next_id = function ()
	local id = 0
	return function()
		id = id+1
		return id
	end
end
next_id = next_id()
function core.entity.add(entity)
	entity.id = next_id()
	entity.systems = {}

	for k,v in pairs(entity) do
		if k ~= "id"  and k ~= "systems" then
			core.component.add_existing(entity,k)
		end	
	end
	local  b = { __mode = "v" }
	setmetatable(entity.systems, b) 
	game.entities[entity.id] = entity
	return entity
end
function core.entity.remove(entity)
	game.entities[entity.id] = nil
	for k,v in pairs(entity.systems) do
		v[1][v[2][entity.id] = nil
		if v[1].unregister then
			v[1].unregister(entity,v[2])
		end
	end
end
