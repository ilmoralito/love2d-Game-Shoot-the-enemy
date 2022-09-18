if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

function love.load()
    Object = require('src/classic')
    require 'src/player'
    require 'src/enemy'
    require 'src/bullet'

    player = Player()
    enemy = Enemy()
    listOfBullets = {}
end

function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    for index, value in ipairs(listOfBullets) do
        value:update(dt)
        value:checkCollision(enemy)

        if value.dead then
            table.remove(listOfBullets, index)
        end
    end
end

function love.draw()
    player:draw()
    enemy:draw()

    for index, value in ipairs(listOfBullets) do
        value:draw()
    end
end

function love.keypressed(key)
    player:keyPressed(key)
end
