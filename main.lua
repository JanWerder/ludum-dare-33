-- Example: Short Example
require "lib.postshader"
require "lib.light"
Class = require "lib.class"
require "solid"
require "entity"
require "util"
require "level"
require "player"
require "enemy"
require("lib.AnAL")
require "lightMan"
require "timejudge"
HC = require 'lib.hardoncollider'
Vector = require "lib.vector"

Gamestate = require "lib.gamestate"

local menu = {}
gameLevel = {}
gameBed = {}
gameWon = {}

function love.load()
lovebird = require("lib.lovebird")
	mainFont = love.graphics.newFont("font/FEASFBRG.ttf", 40);
	love.graphics.setFont(mainFont);

	instanceGame()

	Gamestate.registerEvents()
  Gamestate.switch(menu)
end

function menu:enter()
	self.bg = love.graphics.newImage("images/main_background.png")
	self.imgArrowUp = love.graphics.newImage("images/key_up.png")
	self.imgArrowDown = love.graphics.newImage("images/key_down.png")
	self.imgArrowLeft = love.graphics.newImage("images/key_left.png")
	self.imgArrowRight = love.graphics.newImage("images/key_right.png")
	self.imgW = love.graphics.newImage("images/key_w.png")
	self.imgA = love.graphics.newImage("images/key_a.png")
	self.imgS = love.graphics.newImage("images/key_s.png")
	self.imgD = love.graphics.newImage("images/key_d.png")
	self.imgMouse = love.graphics.newImage("images/mouse.png")
	self.mainFont40 = love.graphics.newFont("font/FEASFBRG.ttf", 40);
	self.mainFont30 = love.graphics.newFont("font/FEASFBRG.ttf", 30);
end

function menu:draw()

	love.graphics.setBackgroundColor(255,255,255)
	love.graphics.draw(self.bg,0,0)
	love.graphics.setFont(self.mainFont40);


	love.graphics.setColor(0,0,0,155)
	love.graphics.rectangle("fill",0,love.graphics.getHeight()-100,love.graphics.getWidth(),100)
	love.graphics.rectangle("fill",love.graphics.getWidth()-350,0,love.graphics.getWidth()-350,love.graphics.getHeight()-100)

	love.graphics.setColor(255,255,255,255)
	love.graphics.print("Controls:", 700, 100)
	love.graphics.print("Press Enter to Start the Game.", 300, 700)
	love.graphics.setFont(self.mainFont30);
	love.graphics.print("Up:", 700, 160)
		love.graphics.draw(self.imgW,815,160)
		love.graphics.print("/", 865, 165)
		love.graphics.draw(self.imgArrowUp,885,160)
	love.graphics.print("Down:", 700, 200)
		love.graphics.draw(self.imgS,815,200)
		love.graphics.print("/", 865, 205)
		love.graphics.draw(self.imgArrowDown,885,200)
	love.graphics.print("Left:", 700, 240)
		love.graphics.draw(self.imgA,815,240)
		love.graphics.print("/", 865, 245)
		love.graphics.draw(self.imgArrowLeft,885,240)
	love.graphics.print("Right:", 700, 280)
		love.graphics.draw(self.imgD,815,280)
		love.graphics.print("/", 865, 285)
		love.graphics.draw(self.imgArrowRight,885,280)
	love.graphics.print("look:", 700, 385)
		love.graphics.draw(self.imgMouse,830,360)
	love.graphics.setColor(255,255,255)
end

function menu:keyreleased(key, code)
    if key == 'return' or key == 'kpenter' then
        Gamestate.switch(gameLevel)
    end
end

function gameWon:enter()
	self.mainFont40 = love.graphics.newFont("font/FEASFBRG.ttf", 40);
end

function gameWon:update(dt)

end

function gameWon:draw()
	love.graphics.setBackgroundColor(0,0,0)
	love.graphics.setColor(255,255,255)
	love.graphics.setFont(self.mainFont40);
	love.graphics.print("Thank you for playing our Ludum Dare 33 entry.", 150, 400)
end

function gameLevel:enter()
		-- load images
		image = love.graphics.newImage("gfx/machine2.png")
		image_normal = love.graphics.newImage("gfx/cone_normal.png")
		normal = love.graphics.newImage("gfx/refraction_normal.png")
		glow = love.graphics.newImage("gfx/machine2_glow.png")


		-- create Player
		if player == nil then
			player = Player(590,730)
		end
		debug = false
end

function gameLevel:update(dt)
	require("lib.lovebird").update()

	if not hasBeenDetected then
		--[[
		if love.keyboard.isDown("f1") then
			if self.timer == nil or self.timer <= 0 then
				levelManager:increase(dt, "level")
				self.timer = 1
			else
				self.timer = self.timer - dt
			end
		elseif love.keyboard.isDown("f2") then
			levelManager:increase(dt, "aim")
		end
		if love.keyboard.isDown("l") then
			levelManager.levelone = 0
			Gamestate.switch(gameWon)
		end]]
		player:update(dt)
		colliderWorld:update(dt)
		levelManager:update(dt)
	end
end

function gameLevel:draw()
	lightWorld.update()

	love.postshader.setBuffer("render")

	-- draw background
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
	--love.graphics.draw(imgFloor, quadScreen, 0, 0)

	-- draw lightmap shadows
	lightWorld.drawShadow()
	 levelManager:draw()

	-- draw lightmap shine
	lightWorld.drawShine()

	-- draw pixel shadow
	lightWorld.drawPixelShadow()

	-- draw glow
	lightWorld.drawGlow()

	-- draw refraction
	lightWorld.drawRefraction()

	-- draw reflection
	lightWorld.drawReflection()

	player:draw()

	love.postshader.draw()


	if hasBeenDetected then
		love.graphics.setColor(0,0,0,155)
		love.graphics.rectangle("fill",love.graphics.getWidth()/2-200,love.graphics.getHeight()/2-75,450,100)

		love.graphics.setColor(math.random(1, 255),math.random(1, 255),math.random(1, 255))
		love.graphics.print("You have been seen!",love.graphics.getWidth()/2-150,love.graphics.getHeight()/2-50)
		if love.keyboard.isDown("return") or love.keyboard.isDown("kpenter") then
			restartGame()
		end
	end
end

function gameBed:enter()
	lovebird = require("lib.lovebird")

	self.blanket = 100
	self.addBlanketTimer = 0
	self.kid = love.graphics.newImage("images/kid.png")
	self.bedStatusBarBackground = love.graphics.newImage("images/bedStatusBar.png")
	self.bgeyeball = love.graphics.newImage("images/background.png")
	self.eyeball = love.graphics.newImage("images/eyeball_large.png")
	self.blanketIMG = love.graphics.newImage("images/blanket.png")
	self.bedFont40 = love.graphics.newFont("font/FEASFBRG.ttf", 40);
	self.bedFont50 = love.graphics.newFont("font/FEASFBRG.ttf", 50);
end

function gameBed:update(dt)
	if love.keyboard.isDown(" ") then
		if self.keyDownNew then
			if self.blanket > 0 then
				self.blanket = self.blanket - 2.5
			else
				self.blanket = 0
			end
			if self.blanket < 0 then
				self.blanket = 0
			end
			self.movement = true
			self.keyDownNew = false
		end
	else
		self.keyDownNew = true
	end
	if self.blanket < 100 and self.blanket > 0 then
		if self.addBlanketTimer > 1 then
			self.blanket = self.blanket + math.random(0,10)
			if self.blanket > 100 then
				self.blanket = 100
			end
			self.addBlanketTimer = 0
		else
			self.addBlanketTimer = self.addBlanketTimer + dt
		end
	end
	if self.blanket <= 0 then
		if love.keyboard.isDown("return") or love.keyboard.isDown("kpenter") then
			if levelManager.number == "3_2" then
				levelManager.number = "4_1"
			end
			levelManager:increase(dt, "level")
			if not string.find(levelManager.number, '4')  then
	      Gamestate.switch(gameLevel)
			end
		end
	end
end

function gameBed:draw()
	love.graphics.setBackgroundColor(255,255,255)
	if self.blanket <= 0 then

		love.graphics.setFont(self.bedFont40);

		love.graphics.draw(self.bgeyeball,0,0)
		love.graphics.draw(self.eyeball,120+768/2,30+768/2, math.random(-10,10)/100, 1, 1 , 768/2, 768/2)

		love.graphics.setColor(0,0,0,155)
		love.graphics.rectangle("fill",love.graphics.getWidth()-250,35,250,125)

		love.graphics.setColor(255,255,255,255)
		love.graphics.print("Time:" ..round(tonumber(levelManager.timeTaken)+tonumber(levelManager.levelone),2),love.graphics.getWidth()-210,50)
		love.graphics.print(checkTime(tonumber(levelManager.timeTaken)+tonumber(levelManager.levelone),levelManager.number),love.graphics.getWidth()-210,100)

		love.graphics.setColor(0,0,0,155)
		love.graphics.rectangle("fill",love.graphics.getWidth()/2-300,love.graphics.getHeight()/2+200,575,150)

		love.graphics.setColor(255,255,255,255)
		love.graphics.print("Good Job. You scared the child",love.graphics.getWidth()/2-240,600)
		love.graphics.print("Press Enter to go to the next Home",love.graphics.getWidth()/2-240,660)
		love.graphics.setColor(255,255,255)
	else

		love.graphics.setFont(self.bedFont50);

		love.graphics.draw(self.kid,0,0)
		love.graphics.draw(self.blanketIMG,0,430 - self.blanket * 4)
		love.graphics.setColor(255,0,0)
		love.graphics.rectangle('fill', 210, 640, 5.8 * self.blanket, 31)

		love.graphics.setColor(0,0,0,155)
		love.graphics.rectangle("fill",love.graphics.getWidth()/2-300,love.graphics.getHeight()/2+290,575,100)
		love.graphics.draw(self.bedStatusBarBackground,200,630)

		love.graphics.setColor(math.random(1, 255),math.random(1, 255),math.random(1, 255))
		love.graphics.print("Press Space to pull blanket!",love.graphics.getWidth()/2-275,love.graphics.getHeight()-70)

		love.graphics.setColor(255,255,255)
	end
end
