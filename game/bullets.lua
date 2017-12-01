function createNewBullet()
	local bullet = {}
	--initial properties
	bullet.x = player.x + player.w
	bullet.y = player.y + player.h/2
	bullet.xspeed = 10
	bullet.w = images.bullet:getWidth()
	bullet.h = images.bullet:getHeight()
	
	table.insert(bullets,bullet)
end	
