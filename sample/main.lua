function love.load()
	count = 0
	print("tts:Accessibility Example using a11y love JS template. Press up to increment counter, or down to decrement.")
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
	started = true
	if key == "up" then
		count = count + 1
	elseif key == "down" then
		count = count - 1
	end
	print("tts:Count "..count)
end
