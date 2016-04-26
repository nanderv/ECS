local loading = {}
loading.loaded = 1
-- Loading screen phases, split up loading code among these phases
loading.phases = {
function()

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



    end

}
-- Leave loading screen
function loading:leave(from)
    for k,v in pairs(game.systems) do
        print("Running system "..v.name)
    end
    to_load = false
end
function loading:update()
    if self.loaded <= #self.phases then
        self.phases[self.loaded]()
        self.loaded = self.loaded + 1
    else
        GS:pop()
    end

end
-- Draw loading screen
function loading:draw()
    
end
function loading:keypressed(key)

end
return loading


