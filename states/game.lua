
local ctx = GS.new()
function ctx:enter(dt)
    GS.push(core.states.loading)
    love.mouse.setGrabbed(true)
end

function ctx:update(dt)

    for k,v in core.system.orderedPairs(game.update_systems) do

        v.update(dt)
    end
end
function ctx:draw()
    for k,v in core.system.orderedPairs(game.draw_systems) do
        v.draw()
    end
end

function ctx:leave()
    love.mouse.setGrabbed(false)
    print('leaving')
end
return ctx
