function createBall()
	local ball = {}
	-- Initial Properties
	ball.x = love.graphics.getWidth() - 50
	ball.y = math.random(cave.top, cave.bottom - images.ball:getHeight())
	ball.sx = 0 - init_ball.speed
	ball.sy = init_ball.speed

	table.insert(balls, ball)
end

function ballMotion()
	-- Iterate through balls
	for i=#balls, 1, -1 do
		local ball = balls[i]

		if AABB(player.x, player.y, player.w, player.h, ball.x , ball.y , init_ball.width , init_ball.height) then
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
			if ball.y < cave.top or ball.y > cave.bottom - images.ball:getHeight() then
				-- If collision, change y speed by reversing
				ball.sy = 0 - ball.sy

				init_ball.speed = init_ball.speed + difficultyIncrease
			end
			-- END MODIFY BALL SPEED HERE

			-- Move ball
			ball.x = ball.x + ball.sx
			ball.y = ball.y + ball.sy
		end
	end
end