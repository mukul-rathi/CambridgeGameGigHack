function createBall()
	local ball = {}
	-- Initial Properties
	ball.x = love.graphics.getWidth() - 50
	ball.y = math.random(cave.top, cave.bottom - images.ball:getHeight())
	ball.sx = 0 - init_ball.speed
	ball.sy = init_ball.speed

	table.insert(balls, ball)
end