local debug = false

local player = nil

local grid = {
    { 'empty', 'empty', 'empty' },
    { 'empty', 'empty', 'empty' },
    { 'empty', 'empty', 'empty' },
}
setmetatable(grid, grid)
function grid:__tostring()
    local g = '[\n'
    for i = 1, #self do
        g = g .. '['
        for j = 1, #self[i] do
            g = g .. self[i][j] .. ','
        end
        g = g .. ']\n'
    end
    g = g .. ']'
    return g
end

local curr = 'x'

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
    if debug then
        print(tostring(grid))
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

    -- this could be on love.update, but I left here
    -- since we're dealing with screen size anyway
    if player then
        local j, i = math.floor(player.x / thirdWidth), math.floor(player.y / thirdHeight)
        grid[i + 1][j + 1] = curr
        curr = curr == 'x' and 'o' or 'x'
        player = nil
    end

    for i = 1, #grid do
        for j = 1, #grid[i] do
            if grid[i][j] == 'o' then
                local radius = thirdWidth / 2 - offset * 2
                love.graphics.circle('line', (j - 1) * thirdWidth + thirdWidth / 2, (i - 1) * thirdHeight + thirdHeight / 2, radius)
            elseif grid[i][j] == 'x' then
                -- \
                love.graphics.line(
                    (j - 1) * thirdWidth + thirdWidth / 4, (i - 1) * thirdHeight + thirdHeight / 4,
                    (j - 1) * thirdWidth + thirdWidth / 4 * 3, (i - 1) * thirdHeight + thirdHeight / 4 * 3
                )
                -- /
                love.graphics.line(
                    (j - 1) * thirdWidth + thirdWidth / 4 * 3, (i - 1) * thirdHeight + thirdHeight / 4,
                    (j - 1) * thirdWidth + thirdWidth / 4, (i - 1) * thirdHeight + thirdHeight / 4 * 3
                )
            end
        end
    end
end
