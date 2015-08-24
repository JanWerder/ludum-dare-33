Entity = Class{
    init = function(self, x, y, type)
        self.x = x
        self.y = y
        self.type = type

        if type == "treppe0" then
          self.img = love.graphics.newImage("images/treppe0.png")
        end
        if type == "treppe270" then
          self.img = love.graphics.newImage("images/treppe270.png")
        end
        if type == "bett" then
          self.img = love.graphics.newImage("images/bett.png")
        end
        if string.find(type, 'solid') then
          local parts = explode("_", type)
          self.img = love.graphics.newImage("images/"..parts[2]..".png")
          
          self.type = "solid"
          self.colliderBody = colliderWorld:addRectangle(self.x,self.y,self.img:getWidth(),self.img:getHeight())
          self.colliderBody.parent = self
          colliderWorld:setPassive(self.colliderBody)
        end
        self.lightBody = lightWorld.newImage( self.img, self.x+(self.img:getWidth()/2), self.y+(self.img:getHeight()/2))
    end,
}

function Entity:update(dt)
  if string.find(self.type, 'treppe') then
    if player.x > self.x and player.x < ( self.x + self.img:getWidth()) and player.y > self.y and player.y < ( self.y + self.img:getHeight())then
      levelManager:increase(dt, "aim")
    end
  end
  if self.type == 'bett' then
    if player.x > self.x and player.x < ( self.x + self.img:getWidth()) and player.y > self.y and player.y < ( self.y + self.img:getHeight())then
      levelManager:increase(dt, "bett")
    end
  end
end

function Entity:draw()
  --self.colliderBody:draw("line")
  love.graphics.setColor(255,255,255,200)
  love.graphics.draw(self.img, self.x, self.y)
end
