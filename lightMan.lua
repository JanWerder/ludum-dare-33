LightMan = Class{
    init = function(self,x,y,r,g,b,range,type,glow)
      self.x = x
      self.y = y
      self.r = r
      self.g = g
      self.b = b
      self.range = range
      self.glow = glow
      self.type = type
      self.light = lightWorld.newLight(self.x, self.y, self.r, self.g, self.b, self.range)
      self.light.setGlowStrength(self.glow)
    end,
}
function LightMan:update(dt)
  if self.type == 'gewitter' then
    if self.gewitterTimer == nil then
      self.gewitterTimer = 0
    end
    if self.gewitterOnTimer == nil then
      self.gewitterOnTimer = 0
    end
    if self.gewitterTimer <= 0 then
      self.gewitterTimer = math.random(1,5)
      self.gewitterOnTimer = math.random(1,10) / 50
    else
      self.gewitterTimer = self.gewitterTimer - dt
    end
    if self.gewitterOnTimer <= 0 then
      self.range = 0
      self.light.setRange(self.range)
    else
      self.gewitterOnTimer = self.gewitterOnTimer - dt
    end
    if self.gewitterTimer > 0 and self.gewitterOnTimer > 0 then
      self.range = math.random(500,2000)
      self.light.setRange(self.range)
    end
  end
  if self.type == 'disco' then
    if self.discoTimer == nil then
      self.discoTimer = 0
    end
    if self.discoTimer <= 0 then
      self.r = math.random(0,255)
      self.g = math.random(0,255)
      self.b = math.random(0,255)
      self.range = math.random(0,200)
      self.light.setColor(self.r,self.g,self.b)
      self.light.setRange(self.range)
      self.discoTimer = math.random(1,10)/50
    else
      self.discoTimer = self.discoTimer - dt
    end
  end
end
