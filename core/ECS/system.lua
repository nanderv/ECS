core.system = {}
core.system = {}
core.requirements_to_systems = {}


local function importance_func(x1, x2)
	if not x1.importance then
		return false
	elseif not x2.importance then
		return x1 >= 0
	end
	return x1.importance > x2.importance
end
local function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex, importance_func )
    return orderedIndex
end

local function orderedNext(t, state)
    -- Equivalent of the next function, but returns the keys in the alphabetic
    -- order. We use a temporary ordered key table that is stored in the
    -- table being iterated.

    key = nil
    --print("orderedNext: state = "..tostring(state) )
    if state == nil then
        -- the first time, generate the index
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
    else
        -- fetch the next value
        for i = 1,table.getn(t.__orderedIndex) do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i+1]
            end
        end
    end

    if key then
        return key, t[key]
    end

    -- no more value to return, cleanup
    t.__orderedIndex = nil
    return
end

function core.system.orderedPairs(t)
    -- Equivalent of the pairs() function on tables. Allows to iterate
    -- in order
    return orderedNext, t, nil
end
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
			if system.register then
					system.register(entity)
			end
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
	elseif typ == "both" then
		game.draw_systems[system.name] = system
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
	for k,v in pairs(system.targets) do
		if system.register then
			system.unregister(v)
			v.systems[system.name] = nil
		end
	end
	game.systems[system.name] = nil
	game.draw_systems[system.name] = nil
	game.update_systems[system.name] = nil
end