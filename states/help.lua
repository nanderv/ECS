local help = GS.new()
help.lines = {
    'This is a help-scren'
}
function help:enter(from)
    self.from = from
end

function help:draw()
    W, H = love.graphics.getWidth(), love.graphics.getHeight()
    self.from:draw(true)
    love.graphics.printf('HELP', 0, H/2-80, W, 'center')
    
    for i, line in pairs(self.lines) do
        love.graphics.printf(line, W/4 - 10, H/2 -60 + i*20, W/2 + 20, 'left')
    end
end

function help:keypressed(key)
    if key == "return" or key == "escape" then
        GS.pop()
    end
end

return help
