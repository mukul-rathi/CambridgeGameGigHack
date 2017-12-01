require "collision"

function love.load()
	math.randomseed(os.time())

	-- Is game over?
	gameover = false

	-- Cave Height to control bouncing
	cave = {}

	cave.top = 200
	cave.bottom = love.graphics.getHeight() - 200
	cave.left = 50

	-- Ball properties
	ballWidth = 20
	ballHeight = 20
	ballSpeed = 5

	player = {}	
	player.x = 50
	player.y = love.graphics.getHeight()/2
	player.w = 50
	player.h = 50
	player.jump = 10

	balls = {}

	fonts = {}
	fonts.large = love.graphics.newFont("assets/Gamer.ttf",250)

	images = {}
	images.background = love.graphics.newImage("assets/ground.png")
	images.coin = love.graphics.newImage("assets/coin.png")
	images.player = love.graphics.newImage("assets/player_down.png")
	
end

function createBall()
	local ball = {}
	-- Initial Properties
	ball.x = love.graphics.getWidth() - 50
	ball.y = math.random(cave.top, cave.bottom - 50)-- how to get image height to replace the 50?
	ball.sx = 0 - ballSpeed
	ball.sy = ballSpeed

	table.insert(balls, ball)
end

function love.update(dt)

	if gameover == true then
		return
	end

	if math.random() < 0.05 then
		createBall()
	end

	if love.keyboard.isDown("up") then
		if player.y > cave.top then
			player.y = player.y - player.jump
		end
	elseif love.keyboard.isDown("down") then
		if player.y < cave.bottom then
			player.y = player.y + player.jump
		end
	end
	
	-- Iterate through balls
	for i=#balls, 1, -1 do
		local ball = balls[i]

		if AABB(player.x, player.y, player.w, player.h, ball.x , ball.y , ballWidth , ballHeight) then
			-- Player has collided, dead.
			gameover = true
			return
		end

		if ball.x < cave.left then
			-- ball has ended
			table.remove(balls, i)		
		else
			
			-- MODIFY BALL SPEED HERE --
			if ball.y < cave.top or ball.y > cave.bottom then
				-- If collision, change y speed by reversing
				ball.sy = 0 - ball.sy
			end
			-- END MODIFY BALL SPEED HERE

			-- Move ball
			ball.x = ball.x + ball.sx
			ball.y = ball.y + ball.sy
		end
	end

end

function love.draw()

	-- Background
	for x = 0, love.graphics.getWidth(), images.background:getWidth() do
		for y = cave.top, cave.bottom, images.background:getWidth() do
			love.graphics.draw(images.background, x,y)
		end
	end
	
	-- Player
	love.graphics.draw(images.player, player.x,player.y)
	
	-- Balls
	for i=1, #balls, 1 do
		local ball = balls[i]
		love.graphics.draw(images.coin, ball.x, ball.y)
	end
	
	love.graphics.setFont(fonts.large)
	--love.graphics.print(#balls, 20, 10)
	if gameover then
		love.graphics.print("gameover", 10, 200)
	end


end
