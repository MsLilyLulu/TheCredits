local creds = require "TheCredits"

function test()
    print("I'm ran once from a callback function parameter!")
end

function love.load()
    font = love.graphics.getFont()
    creditTable = {
        "TITLE",
        "Caption 1;Credit1",
        "Caption 2;Credit2",
        "Caption 3;Credit3",
        "Caption 4;Credit4",
        "Caption 5;Credit5",
        "Caption 6;Credit6",
        "ANOTHER TITLE",
        "Caption 7;Credit7",
        "Caption 8;Credit8",
        "Caption 9;Credit9",
        "Caption 10;Credit 10",
        "Caption 11;Credit 11",
        "FM;And the final message!"
    }
    --  
    c = creds:New(
        creditTable, -- Credits table (table)
        font, -- Font (Font)
        test, -- Callback Function (function)
        nil, -- Wait Time (number)
        nil, -- Speed (number)
        "vertical" -- draw mode (string ["horizontal" OR "vertical"])
        )
end

function love.update()
    c:update()
end

function love.draw()
    c:draw()
end