function createNewBullet()

	if bullets_left > 0 then

		bullets_left = bullets_left - 1

		local bullet = {}
		--initial properties
		bullet.x = player.x + player.w
		bullet.y = player.y + player.h/2
		bullet.xspeed = 10
		bullet.w = images.bullet:getWidth()
		bullet.h = images.bullet:getHeight()
		
		table.insert(bullets,bullet)

	end
end	
function checkBulletHit()
	for i = #bullets, 1, -1 do
		local bullet = bullets[i]
		bullet.x = bullet.x + bullet.xspeed
		--gone off screen
		if bullet.x > love.graphics.getWidth() then
			table.remove(bullets,i)
		else
			for j=#balls, 1, -1 do
				local ball = balls[j]
				--check if bullet hits ball
				if AABB(bullet.x, bullet.y, bullet.w, bullet.h, ball.x , ball.y , init_ball.width , init_ball.height) then
				table.remove(bullets,i)
				table.remove(balls,j)
				score = score + 1 
			end
		end
	end
	end
end