Player = Class{
    init = function(self, x, y)
        self.x = x
        self.y = y
        self.type = "player"
        self.speed = 250
        self.w = 64
        self.h = 64
        self.light = lightWorld.newLight(self.x, self.y, 255, 127, 63)
        self.light.setGlowStrength(15)
        self.light.setRange(210)
        self.light.setAngle(3.14/4)
        self.light.setDirection(0)
        self.lightGlow = lightWorld.newLight(self.x, self.y, 255, 0, 0, 50)
        --self.light.setGlowSize(4)
        self.collider = colliderWorld:addCircle(self.x,self.y,32)
        self.collider.parent = self

        self.img = love.graphics.newImage("images/eyeball.png")
        self.anim = newAnimation(self.img,64,64,0.1,0)
    end,
}

function Player:update(dt)

  self.lightGlow.setX(self.x)
  self.lightGlow.setY(self.y)

  if self.y > love.window.getHeight() then
    self.y = self.y - 15
  end

  self.movement = false
  -- Movement mit Pfeiltasten oder WASD
  if not self.isColliding then
    if love.keyboard.isDown("up") or love.keyboard.isDown("w") and self.y >= 0 then
      self.y = self.y - ( self.speed * dt )
      self.movement = true
    end
    if love.keyboard.isDown("down") or love.keyboard.isDown("s") and self.y <= 1024 then
      self.y = self.y + ( self.speed * dt )
      self.movement = true
    end
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") and self.x >= 0 then
      self.x = self.x - ( self.speed * dt )
      self.movement = true
    end
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") and self.x <= 1024 then
      self.x = self.x + ( self.speed * dt )
      self.movement = true
    end
  end
  if self.movement == true then
    self.anim:update(dt)
  else
    self.anim:reset()
  end
  self.light.setPosition(self.x, self.y)
  self.collider:moveTo(self.x, self.y)

  -- Drehen der Sicht mit Maus
  self.mouseX = love.mouse.getX( )
  self.mouseY = love.mouse.getY( )

  self.gegenkathete = self.x - self.mouseX
  self.ankathete = self.y - self.mouseY
  self.hypotenuse = math.sqrt(math.pow(self.gegenkathete,2) + math.pow(self.ankathete,2))

  self.winkelAlpha  = math.deg(math.asin(self.gegenkathete/self.hypotenuse))

  if self.y < self.mouseY then
    self.newAngle = 3.14 / 180 * self.winkelAlpha * (-1) + 3.14
  else
    self.newAngle = 3.14 / 180 * self.winkelAlpha
  end

  self.light.setDirection(self.newAngle)
end

function Player:draw()
  if self.newAngle then
    self.anim:draw(self.x, self.y,self.newAngle*-1,1,1,32,32)
  end
  --self.collider:draw('fill')
end
