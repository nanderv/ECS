
require "lib.light.livsh"
local light = {}
light.name= "light"
light.importance = -2

light.objects = {}
function light.register(entity)
	if not light.world then
		light.world = love.light.newWorld()
		light.world:setAmbientColor(15, 15, 31)
	end
	 if entity.light.type =="source" then
	 	print(entity.id)
	 	light.objects[entity.id] = light.world:newLight(0, 0, entity.light_source.red, entity.light_source.green, entity.light_source.blue, entity.light_source.range)
	 end

end
function light.unregister(entity)

end
function light.update(dt)
		for k,v in pairs(light.objects) do

			v:setPosition(game.entities[k].position.x,game.entities[k].position.y)
		end
	    light.world:update()	
end
function light.draw()
	    light.world:drawShadow()
        light.world:drawShine()
end


light.requirements = {light=true,position=true}

return light