require "main"
require "ball"
require "Powerup"
require "bullets"
require "getTime"

function speedUp()
	initFastTimer = getTime()
	timeChanged = true
	init_ball.speed = init_ball.speed * 2
	
	for i = #balls, 1, -1 do
		local ball = balls[i]
		ball.sx = ball.sx * 2
	end
	
	for k = #bullets, 1, -1 do
		local bullet = bullets[i]
		bullet.sx = bullet.sx * 2
	end
	
	for m = #rockets, 1, -1 do
		local rocket = rockets[i]
		rocket.sx = rocket.sx * 2
	end
	
	for n = #chronos, 1, -1 do
		local chrono = chronos[i]
		chrono.sx = chrono.sx * 2
	end
	
	for o = #ammos, 1, -1 do
		local ammo = ammos[i]
		ammo.sx = ammo.sx * 2
	end
	
	for o = #stars, 1, -1 do
		local star = stars[i]
		star.sx = star.sx * 2
	end
end

function slowDown()
	initFastTimer = getTime()
	timeChanged = true
	init_ball.speed = init_ball.speed / 2
	
	for i = #balls, 1, -1 do
		local ball = balls[i]
		ball.sx = ball.sx / 2
	end
	
	for k = #bullets, 1, -1 do
		local bullet = bullets[i]
		bullet.sx = bullet.sx / 2
	end
	
	for m = #rockets, 1, -1 do
		local rocket = rockets[i]
		rocket.sx = rocket.sx / 2
	end
	
	for n = #chronos, 1, -1 do
		local chrono = chronos[i]
		chrono.sx = chrono.sx / 2
	end
	
	for o = #ammos, 1, -1 do
		local ammo = ammos[i]
		ammo.sx = ammo.sx / 2
	end
	
	for o = #stars, 1, -1 do
		local star = stars[i]
		star.sx = star.sx / 2
	end
end

function normalizeFast()
	timeChanged = false
	init_ball.speed = init_ball.speed / 2
	
	for i = #balls, 1, -1 do
		local ball = balls[i]
		ball.sx = ball.sx / 2
	end
	
	for k = #bullets, 1, -1 do
		local bullet = bullets[i]
		bullet.sx = bullet.sx / 2
	end
	
	for m = #rockets, 1, -1 do
		local rocket = rockets[i]
		rocket.sx = rocket.sx / 2
	end
	
	for n = #chronos, 1, -1 do
		local chrono = chronos[i]
		chrono.sx = chrono.sx / 2
	end
	
	for o = #ammos, 1, -1 do
		local ammo = ammos[i]
		ammo.sx = ammo.sx / 2
	end
	
	for o = #stars, 1, -1 do
		local star = stars[i]
		star.sx = star.sx / 2
	end
end

function normalizeSlow()
	timeChanged = false
	init_ball.speed = init_ball.speed * 2
	
	for i = #balls, 1, -1 do
		local ball = balls[i]
		ball.sx = ball.sx * 2
	end
	
	for k = #bullets, 1, -1 do
		local bullet = bullets[i]
		bullet.sx = bullet.sx * 2
	end
	
	for m = #rockets, 1, -1 do
		local rocket = rockets[i]
		rocket.sx = rocket.sx * 2
	end
	
	for n = #chronos, 1, -1 do
		local chrono = chronos[i]
		chrono.sx = chrono.sx * 2
	end
	
	for o = #ammos, 1, -1 do
		local ammo = ammos[i]
		ammo.sx = ammo.sx * 2
	end
	
	for o = #stars, 1, -1 do
		local star = stars[i]
		star.sx = star.sx * 2
	end
end