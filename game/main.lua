require "collision"
require "ball"
require "bullets"
require "Powerup"

function love.load()
	math.randomseed(os.time())

	-- Is game over?
	gameover = false
	gameStarted = false

	-- Difficulty rating (0 to 1) DIFFICULTY GOES UP EXPONENTIALLY!
	-- Increase means increase in speed
	difficulty = 0.02
	difficultyIncrease = 0.5

	-- Cave Height to control bouncing
	cave = {}

	cave.top = 100
	cave.bottom = love.graphics.getHeight() - 100
	cave.left = 50

	-- Bullets left
	bullets_left = 25

	-- Added new score
	score = 0

	balls = {}

	fonts = {}
	fonts.score = love.graphics.newFont("assets/Gamer.ttf",36)
	fonts.teaser = love.graphics.newFont("assets/Gamer.ttf",50)
	fonts.gameover = love.graphics.newFont("assets/Gamer.ttf", 120)
	fonts.gm = love.graphics.newFont("assets/Gamer.ttf", 250)


	images = {}
	images.background = love.graphics.newImage("assets/ground.png")
	--different sizes
	images.ball_large = love.graphics.newImage("assets/goomba_large.png")
	images.ball_medium = love.graphics.newImage("assets/goomba_medium.png")
	images.ball_small = love.graphics.newImage("assets/goomba.png")
	

	images.player = love.graphics.newImage("assets/retromario.png")
	images.bullet = love.graphics.newImage("assets/retrofireball.png")
	images.flower = love.graphics.newImage("assets/flower.png")
	images.star = love.graphics.newImage("assets/star.png")
	
	player = {}	
	player.x = 50
	player.y = 218
	player.w = images.player:getWidth()
	player.h = images.player:getHeight()
	player.jump = images.player:getHeight()

	

	
	bullets = {}
end

function love.update(dt)

	if gameover == true then
		return
	end
	local rand= math.random()
	if  rand < difficulty/10 then
		createBall("large")
		images.ball = images.ball_large
	elseif rand < difficulty then
		createBall("small")
		images.ball = images.ball_small
	end
	
	if math.random() < 0.001 then
		createAmmo()
	end

	if math.random() < 0.0005 then
		createStar()
	end
	
	ballMotion()
	ammoMotion()
	starMotion()
	checkBulletHit()
	


end
function love.draw()
	
		-- Background
	for x = 0, love.graphics.getWidth(), images.background:getWidth() do
		for y = cave.top, cave.bottom - images.background:getHeight(), images.background:getHeight() do
			love.graphics.draw(images.background, x,y)
		end
	end
if not gameStarted then
	love.graphics.setFont(fonts.gameover)
	love.graphics.print("Press p to play", 60, 150)
	

else 	
	-- Player
	love.graphics.draw(images.player, player.x,player.y)
	
	-- Balls
	for i=1, #balls, 1 do
		local ball = balls[i]
		if ball.size=="small" then
			images.ball = images.ball_small
		elseif ball.size=="medium" then
			images.ball = images.ball_medium
		else 
			images.ball = images.ball_large
		end
		love.graphics.draw(images.ball, ball.x, ball.y)
	end
	-- Bullets
	for i=1, #bullets, 1 do
		local bullet = bullets[i]
		love.graphics.draw(images.bullet, bullet.x, bullet.y)
	end

	for i=1, #ammos, 1 do
		local ammo = ammos[i]
		love.graphics.draw(images.flower, ammo.x, ammo.y)
	end

	for i=1, #stars, 1 do
		local star = stars[i]
		love.graphics.draw(images.flower, star.x, star.y)
	end
	
	love.graphics.setFont(fonts.score)
	love.graphics.print("Score: " .. score, 10, 60)
	love.graphics.print("Bullets: " .. bullets_left, 410, 60)
	love.graphics.print("Move up or down: arrow keys", 10, 515)
	love.graphics.print("Shoot: space", 10, 545)

	love.graphics.setFont(fonts.teaser)
	love.graphics.print("CAN YOU BEAT 40?", 10, 0)
	--love.graphics.print(#balls, 20, 10)
	if gameover then
		love.graphics.setFont(fonts.gm)

		love.graphics.print("GAMEOVER", 10, 100)
		love.graphics.setFont(fonts.gameover)

		love.graphics.print("Press r to replay", 20, 300)

	end
end
end

function love.keypressed(key)
	
	-- Add an 'anti-sticking' measure to prevent players sticking to the top or bottom
	antiStick = 30

	if not gameStarted then 
		if key == "p" then 
			gameStarted = true
	end
	-- if not gameover then move
	else
	  if not gameover then
		if key == "up" then
			if player.y > cave.top + antiStick then
				player.y = player.y - player.jump
			end
		elseif key == "down" then
			if player.y < cave.bottom - images.player:getHeight() - antiStick then
				player.y = player.y + player.jump
			end
		elseif key == "space" then
			createNewBullet()
		end
	end

	-- could use 'else' here, but this is clearer
	if gameover then
		if key == "r" then
			love.load()
		end
	end
end
end
