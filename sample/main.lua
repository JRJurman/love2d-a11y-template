function love.load()
	count = 0
	print("tts:Accessibility Example using a11y love JS template. Press up to increment counter, or down to decrement.")
end

function love.draw()
	love.graphics.print(count, 50, 50)
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
