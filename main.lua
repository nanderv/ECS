global = {}
global.g = 0.1
require 'core.main'
core.reset_game()
core.system.add( require 'systems.velocity_from_acceleration', "update")
core.system.add( require 'systems.position_from_velocity', "update")
core.system.add( require 'systems.acceleration_from_mass', "update")
core.system.add( require 'systems.draw_from_mass_and_position', "draw")
require 'entities.planet'
entity = core.entity.add(get_new_planet(100,100,30))
entity = core.entity.add(get_new_planet(200,200,30))



function love.load()
	for k,v in pairs(game.systems) do
		print("Running system "..v.name)
	end
	end
function love.update(dt)

	for k,v in pairs(game.update_systems) do
		v.update(dt)
	end
end
function love.draw()
	for k,v in pairs(game.draw_systems) do
		v.draw()
	end
end