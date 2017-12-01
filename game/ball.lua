function createBall(size)
	local ball = {}
	-- Initial Properties
	ball.width = images.ball_small:getWidth()
	ball.height = images.ball_small:getHeight()
	ball.speed = 3
	ball.size = "small" --default size

	if size=="large" then
		ball.speed = ball.speed/4;
		ball.size = "large"
		ball.width = images.ball_large:getWidth()
		ball.height = images.ball_large:getWidth()
	elseif size=="medium" then
		ball.speed = ball.speed/2
		ball.size = "medium"
		ball.width = images.ball_medium:getWidth()
		ball.height = images.ball_medium:getWidth()
	end
	ball.x = love.graphics.getWidth() - 50
	ball.y = math.random(cave.top, cave.bottom -ball.height)
	ball.sx = 0 - ball.speed
	ball.sy = ball.speed

	table.insert(balls, ball)
end

function ballMotion()
	-- Iterate through balls
	for i=#balls, 1, -1 do
		local ball = balls[i]

		if AABB(player.x, player.y, player.w, player.h, ball.x , ball.y , ball.width , ball.height) then
			-- Player has collided, dead.
			gameover = true
			return
		end

		if ball.x < cave.left then
			-- ball has ended
			table.remove(balls, i)
			score = score + 1
		else
			
			-- MODIFY BALL SPEED HERE --
			if ball.y < cave.top or ball.y > cave.bottom - ball.height then
				-- If collision, change y speed by reversing
				ball.sy = 0 - ball.sy

				ball.speed = ball.speed + difficultyIncrease
			end
			-- END MODIFY BALL SPEED HERE

			-- Move ball
			ball.x = ball.x + ball.sx
			ball.y = ball.y + ball.sy
		end
	end
end