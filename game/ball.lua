function createBall()
	local ball = {}
	-- Initial Properties
	ball.x = love.graphics.getWidth() - 50
	ball.y = math.random(cave.top, cave.bottom - 50)-- how to get image height to replace the 50?
	ball.sx = 0 - ball.speed
	ball.sy = ball.speed

	table.insert(balls, ball)
end