require "collision"

rockets = {}
chronos = {}
ammos = {}
stars = {}

function createAmmo(v)
	local ammo = {}
	ammo.width = 50
	ammo.height = 50
    ammo.x = love.graphics.getWidth() - 50
	ammo.y = math.random(cave.top, cave.bottom - 50)
	ammo.sx = -4
	table.insert(ammos, ammo)
end

function createStar(v)
	local star = {}
	star.width = 50
	star.height = 50
    star.x = love.graphics.getWidth() - 50
	star.y = math.random(cave.top, cave.bottom - 50)
	star.sx = -8
	table.insert(stars, star)
end

function ammoMotion()
    for i=#ammos, 1, -1 do
		local ammo = ammos[i]

		if AABB(player.x, player.y, player.w, player.h, ammo.x , ammo.y , ammo.width , ammo.height) then
			-- reset ammo
			bullets_left = 25
			table.remove(ammos, i)		
		end

		if ammo.x < cave.left then
			table.remove(ammos, i)		
		else
			if ammo.y < cave.top or ammo.y > cave.bottom - 50 then
				-- If collision, change y speed by reversing
				ammo.sy = 0 - ammo.sy
			end

			-- Move chrono
			ammo.x = ammo.x + ammo.sx
		end
	end
end

function starMotion()
    for i=#stars, 1, -1 do
		local star = stars[i]

		if AABB(player.x, player.y, player.w, player.h, star.x , star.y , star.width , star.height) then
			score = score + 10
			table.remove(stars, i)		
		end

		if star.x < cave.left then
			table.remove(stars, i)		
		else
			if star.y < cave.top or star.y > cave.bottom - 50 then
				-- If collision, change y speed by reversing
				star.sy = 0 - star.sy
			end

			-- Move chrono
			star.x = star.x + star.sx
		end
	end
end


