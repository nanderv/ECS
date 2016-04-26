global = {}
global.g = 2
require 'core.main'
core.reset_game()
core.system.add( require 'systems.velocity_from_acceleration', "update")
core.system.add( require 'systems.position_from_velocity', "update")
core.system.add( require 'systems.acceleration_from_mass', "update")
core.system.add( require 'systems.draw_from_mass_and_position', "draw")
require 'entities.planet'
entity = core.entity.add(get_new_planet(300,300,333))
entity.color={red=255,green=255,blue=255}
--entity.mass.counts_as_infinite=true
entity = core.entity.add(get_new_planet(200,300,1))
entity.velocity.y = 300

entity = core.entity.add(get_new_planet(400,300,1))
entity.velocity.y = -300
entity.velocity.x = -10

entity = core.entity.add(get_new_planet(300,100,1))
entity.velocity.x = 10


entity = core.entity.add(get_new_planet(500,300,1))
entity.velocity.y = -300
entity.velocity.x = -10

entity = core.entity.add(get_new_planet(600,300,1))
entity.velocity.y = -300
entity.velocity.x = -10

entity = core.entity.add(get_new_planet(700,300,1))
entity.velocity.y = 300
entity.velocity.x = 10

entity = core.entity.add(get_new_planet(700,300,1))
entity.velocity.y = 300
entity.velocity.x = 10



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