local player = nil

function love.load()
    love.window.setTitle('tic tac toe')

    love.window.setMode(666, 666, {
        resizable = false,
        fullscreen = false,
        vsync = true,
    })
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.mousepressed(x, y, button, _, _)
    if button ~= 1 then
        return
    end

    player = { x = x, y = y }
end

function love.draw()
    local wwidth, wheight = love.graphics.getDimensions()
    local thirdWidth, thirdHeight = wwidth / 3, wheight / 3
    local offset = 15

    -- grid

    -- horizontal lines
    love.graphics.line(thirdWidth, offset, thirdWidth, wheight - offset)
    love.graphics.line(thirdWidth * 2, offset, thirdWidth * 2, wheight - offset)

    -- vertical lines
    love.graphics.line(offset, thirdHeight, wwidth - offset, thirdHeight)
    love.graphics.line(offset, thirdHeight * 2, wwidth - offset, thirdHeight * 2)

    if player then
        local x, y = math.floor(player.x / thirdWidth), math.floor(player.y / thirdHeight)
        local radius = thirdWidth / 2 - offset * 2
        love.graphics.circle('line', x * thirdWidth + thirdWidth / 2, y * thirdHeight + thirdHeight / 2, radius)
    end
end
