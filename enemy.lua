Enemy = Class{
    init = function(self, x, y,speed,path)
        self.x = x
        self.y = y
        self.type = "enemy"
        self.w = 20
        self.h = 20
        self.speed = speed
        self.light = lightWorld.newLight(self.x, self.y, 255, 127, 63)
        self.light.setGlowStrength(0.3)
        self.light.setRange(200)
        self.light.setAngle(3.14/4)
        self.light.setDirection(0)
        self.collider = colliderWorld:addCircle(self.x,self.y,10)
        self.collider.parent = self
        self.path = path
        self.currentPath = 1
        self.currentDirection = math.pi
        self.debug = false
        self.color = 255

        self.img = love.graphics.newImage("images/Human.png")
        self.anim = newAnimation(self.img,64,64,0.1,0)


    end,
}

function Enemy:update(dt)

  self.anim:update(dt)

  --walking
  if not self.debug then
    if isNear(self.x,self.path[self.currentPath][1],5) and isNear(self.y,self.path[self.currentPath][2],5) then -- start pathFinding
      if self.currentPath == #self.path then
        self.currentPath = 1
      else
        self.currentPath = self.currentPath + 1
      end
    else
      local hasDecided = false
      if self.x < self.path[self.currentPath][1]-5 and not hasDecided then
        self.x = self.x + self.speed * dt
        self.direction = math.pi + math.pi/2
        hasDecided = true
      elseif self.x > self.path[self.currentPath][1]+5 and not hasDecided then
        self.x = self.x - self.speed * dt
        self.direction =  math.pi/2
        hasDecided = true
      end
      if self.y < self.path[self.currentPath][2]-5 and not hasDecided then
        self.y = self.y + self.speed * dt
        self.direction = math.pi
        hasDecided = true
      elseif self.y > self.path[self.currentPath][2]+5 and not hasDecided then
        self.y = self.y - self.speed * dt
        self.direction = 0
        hasDecided = true
      end
    end

        end
    --view direction
  if math.rad(math.deg(self.currentDirection)) < self.direction then
     self.currentDirection = self.currentDirection + math.pi * dt
   end
  if math.rad(math.deg(self.currentDirection)) > self.direction then
    self.currentDirection = self.currentDirection -math.pi * dt
  end


  self.light.setPosition(self.x, self.y)
  self.collider:moveTo(self.x, self.y)

    --detecting
    self.detectionVector = Vector(player.x-self.x,player.y-self.y)
    self.nDetectionVector = self.detectionVector:normalized()
    local isHit = false
    self.checkX = self.x
    self.checkY = self.y
    self.detectionPoints = {}

    while(not isHit) do
      local dX, dY = self.nDetectionVector:unpack()
      self.checkX = self.checkX + dX
      self.checkY = self.checkY + dY
      table.insert(self.detectionPoints,{self.checkX,self.checkY})
      if #self.detectionPoints > 180 then
        isHit = true
      end
    end


    self.newPointX = self.x + (self.x * math.sin(self.currentDirection) * -1)
    self.newPointY = self.y + (self.y * math.cos(self.currentDirection) * -1)
    self.viewVector = Vector(self.newPointX-self.x, self.newPointY-self.y)
    self.angle = math.deg(self.viewVector:angleTo(self.detectionVector))

    local rayCastDirect = true
    local solidSeenIndex = 0
    local playerSeenIndex = 0

    for k,point in ipairs(self.detectionPoints) do
      for _,solid in ipairs(levelManager.solids) do
        if player.collider:contains(point[1],point[2]) then
          playerSeenIndex = k
        end
        if solid.colliderBody:contains(point[1],point[2]) then
          if rayCastDirect then --set first point
            solidSeenIndex = k
          end
          rayCastDirect = false
        end
      end
    end

    if playerSeenIndex < solidSeenIndex then --player vor dem block gesehen
        rayCastDirect = true
    end

    --max range
    local lengthVector = Vector(player.x - self.x,player.y - self.y)
    if lengthVector:len() > 180 then
      rayCastDirect = false
    end


    if rayCastDirect and (self.angle > -30 or self.angle < -350) and self.angle < 10 then
          print(rayCastDirect,(self.angle > -30 or self.angle < -350),self.angle < 10)
      print(self.angle)
      self.color = 0
      hasBeenDetected = true
    end

      self.light.setDirection(self.currentDirection)

end

function Enemy:draw()

  self.anim:draw(self.x, self.y,self.direction,1,1,32,32)

  --  for _,point in ipairs(self.detectionPoints) do
    --  love.graphics.setColor(self.color,255,255)
    --  love.graphics.point(point[1],point[2])
  --  end



  --self.collider:draw('fill')
  --love.graphics.rectangle("fill",self.newPointX,self.newPointY,5,5) --debug newAngle Point
  --  love.graphics.setColor(255,255,255)
end
