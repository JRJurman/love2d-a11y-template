function love.load()
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
		count = count + 1
	elseif key == "down" then
		count = count - 1
	end
	if (not started) then
		print("tts: There are "..count.." dots")
		started = true
	else
		print("tts:"..count.." dots")
	end
end
