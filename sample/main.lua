function love.load()
	love.window.setTitle('A11y Sample')
	count = 5
	started = false
	print("tts:There are 5 white dots on a black background. Press up to increase the number, or down to decrease the number.")
end

function love.draw()
	local spacing = 50
	local size = 20
	local cols = 10
	local xStart = 50
	local yStart = 50

	for i = 0, count - 1 do
		local x = xStart + (i % cols) * spacing
		local y = yStart + math.floor(i / cols) * spacing
		love.graphics.circle("fill", x, y, size)
	end
end

function love.keypressed(key)
	if key == "up" then
		count = math.min(count + 1, 99)
	elseif key == "down" then
		count = math.max(count - 1, 0)
	end
	if (not started) then
		print("tts: There are "..count.." dots, press up to add more, and down to remove them")
		started = true
	else
		print("tts:"..count.." dots")
	end
end
