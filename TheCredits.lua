TheCredits = {}
TheCredits.__index = TheCredits

INSERT = table.insert
FIND = string.find
UPPER = string.upper
GMATCH = string.gmatch


SW = love.graphics.getWidth()
SH = love.graphics.getHeight()


local function createCredits(credits, self)
    creditTextTable = {}
    for i = 1, #credits do
        cred = {}
        if FIND(credits[i], ";") == nil then
            if i == 1 then
                cred_Text = UPPER(credits[i]) .. "\n\n\n"
            else
                cred_Text = "\n" .. UPPER(credits[i]) .. "\n\n"
            end
            INSERT(creditTextTable, cred_Text)
        else
            for word in GMATCH(credits[i], "([^;]+)") do
                INSERT(cred, word)
            end
            if cred[1] == "FM" then
                cred_Text = "\n\n\n\n\n" .. cred[2]
            elseif i == #credits then
                if self.draw_mode == 1 then
                    cred_Text = cred[1] .. "    " .. cred[2]
                else
                    cred_Text = cred[1] .. "\n" .. cred[2]
                end
            else
                if self.draw_mode == 1 then
                    cred_Text = cred[1] .. "    " .. cred[2] .. "\n\n"
                else
                    cred_Text = cred[1] .. "\n" .. cred[2] .. "\n\n"
                end
            end
            INSERT(creditTextTable, cred_Text)
        end
    end

    creditText = ""
    for i = 1, #creditTextTable do
        creditText = creditText .. creditTextTable[i]
    end
    return creditText
end


function TheCredits:New(credits, font, callback, wait_time, speed, draw_mode)
    assert(type(credits) == "table", "parameter 'credits' must be of type 'table'. (Table expected, got " .. type(credits) .. ")")
    assert(type(callback) == "function", "parameter 'callback' must be of type 'function'. (Function expected, got " .. type(credits) .. ")")
    -- assert(type(draw_mode) == "string", "parameter 'draw_mode' must be string and of 'horizontal' or 'vertical' (String expected, got ".. type(draw_mode) ..")")
    -- assert(draw_mode == "horizontal" or draw_mode == "vertical", "parameter 'draw_mode' must be string of 'horizontal' or 'vertical' (horizontal or vertical expected, got "..draw_mode..")")

    local t = {
        credits_text = credits,
        CREDIT_Y = SH,
        timer = 0,
        scroll = false,
        back = false,
        speed = speed or 0.1,
        font = font,
        callback = callback,
        callback_ran = false,
        wait_time = wait_time or 5,
        draw_mode = draw_mode or "horizontal"
    }
    draw_mode_conv = {
        ["horizontal"] = 1,
        ["vertical"] = 2
    }
    t.draw_mode = draw_mode_conv[t.draw_mode]
    t.credits = createCredits(t.credits_text, t)
    setmetatable(t, self)
    return t
end


local function get_line_count(str)
    local lines = 1
    for i = 1, #str do
        local c = str:sub(i, i)
        if c == '\n' then lines = lines + 1 end
    end

    return lines
end

function TheCredits:update()
    self.timer = self.timer + 0.01
    if self.timer >= self.wait_time then
        self.timer = 0
        self.scroll = true
        if self.back and not self.callback_ran then
            self.callback()
            self.callback_ran = true
        end
    end
    if self.scroll then
        self.CREDIT_Y = self.CREDIT_Y - self.speed
        self.timer = 0
    end
    if self.CREDIT_Y <= -self.font:getHeight(self.credits) * get_line_count(self.credits) then
        self.scroll = false
        self.back = true
    end

end

function TheCredits:draw()
    love.graphics.printf(self.credits, 0, self.CREDIT_Y, SW, "center")
end


return TheCredits