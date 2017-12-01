function speedUp()
	initFastTimer = os.time
	init_ball.speed = init_ball.speed * 2
end

function slowDown()
	initSlowTimer = os.time
	init_ball.speed = init_ball.speed / 2
end

function normalizeFast()
	init_ball.speed = init_ball.speed / 2
end

function normalizeSlow()
	init_ball.speed = init_ball.speed * 2
end