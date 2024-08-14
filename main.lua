function love.load()
    love.window.setTitle('tic tac toe')
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
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
end
