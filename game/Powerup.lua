require "collision"
require "timechange"
require "getTime"

function Powerupinit()
    rockets = {}
	chronos = {}
	ammos = {}
	stars = {}
end

function createAmmos(v)
	local ammo = {}
	ammo.width = 50
	ammo.height = 50
    ammo.x = love.graphics.getWidth() - 50
	ammo.y = math.random(cave.top, cave.bottom - 50)
	ammo.sx = -math.random(1,v)
	ammo.sy = math.random(1,v)
	table.insert(ammos, ammo)
end

function createStar(v)
	local star = {}
	star.width = 50
	star.height = 50
    star.x = love.graphics.getWidth() - 50
	star.y = math.random(cave.top, cave.bottom - 50)
	star.sx = -math.random(1,v)
	star.sy = math.random(1,v)
	table.insert(stars, star)
end

function createRocket(v)
	local rocket = {}
	rocket.width = 50
	rocket.height = 50
    rocket.x = love.graphics.getWidth() - 50
	rocket.y = math.random(cave.top, cave.bottom - 50)
	rocket.sx = -math.random(1,v)
	rocket.sy = math.random(1,v)
	table.insert(rockets, rocket)
end

function createChrono(v)
    local chrono = {}
	chrono.width = 50
	chrono.height = 50
	chrono.x = love.graphics.getWidth() - 50
	chrono.y = math.random(cave.top, cave.bottom - 50)
	chrono.sx = -math.random(1,v)
	chrono.sy = math.random(1,v)
	table.insert(chronos, chrono)
end

function Rocketmotion()
    for i=#rockets, 1, -1 do
		local rocket = rockets[i]

		if AABB(player.x, player.y, player.w, player.h, rocket.x , rocket.y , rocket.width , rocket.height) then
			-- speed up everything!
			table.remove(rockets, i)
			local currenttime = getTime()
			speedUp();
			if currenttime>initFastTimer+5 and timeChanged then
			    normalizeFast() 
			end
		end

		if rocket.x < cave.left then
			table.remove(rockets, i)		
		else
			if rocket.y < cave.top or rocket.y > cave.bottom then
				-- If collision, change y speed by reversing
				rocket.sy = 0 - rocket.sy
			end

			-- Move rocket
			rocket.x = rocket.x + rocket.sx
			rocket.y = rocket.y + rocket.sy
		end
	end
end

function Chronomotion()
    for i=#chronos, 1, -1 do
		local chrono = chronos[i]

		if AABB(player.x, player.y, player.w, player.h, chrono.x , chrono.y , chrono.width , chrono.height) then
			-- slow everything down
			table.remove(chronos, i)
            local currenttime = getTime()
			slowDown();
			if currenttime>initSlowTimer+5 then
			    normalizeSlow() 
			end			
		end

		if chrono.x < cave.left then
			table.remove(chronos, i)		
		else
			if chrono.y < cave.top or chrono.y > cave.bottom then
				-- If collision, change y speed by reversing
				chrono.sy = 0 - chrono.sy
			end

			-- Move chrono
			chrono.x = chrono.x + chrono.sx
			chrono.y = chrono.y + chrono.sy
		end
	end
end

function Ammomotion()
    for i=#ammos, 1, -1 do
		local ammo = ammos[i]

		if AABB(player.x, player.y, player.w, player.h, ammo.x , ammo.y , ammo.width , ammo.height) then
			table.remove(ammos, i)
            bullets_left = bullets_left + 10
		end

		if ammo.x < cave.left then
			table.remove(ammos, i)		
		else
			if ammo.y < cave.top or ammo.y > cave.bottom then
				-- If collision, change y speed by reversing
				ammo.sy = 0 - ammo.sy
			end

			-- Move chrono
			ammo.x = ammo.x + ammo.sx
			ammo.y = ammo.y + ammo.sy
		end
	end
end

function Starmotion()
    for i=#stars, 1, -1 do
		local star = stars[i]

		if AABB(player.x, player.y, player.w, player.h, star.x , star.y , star.width , star.height) then
			table.remove(stars, i)		
			--invicible = invicible + 1
			score = score + 10
			
		end

		if star.x < cave.left then
			table.remove(stars, i)		
		else
			if star.y < cave.top or star.y > cave.bottom then
				-- If collision, change y speed by reversing
				star.sy = 0 - star.sy
			end

			-- Move chrono
			star.x = star.x + star.sx
			star.y = star.y + star.sy
		end
	end
end


