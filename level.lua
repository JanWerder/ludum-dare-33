Level = Class{
    init = function(self)
        self.lightTimer = 0
        self.coolDown = 1
        self.number = '1_1'
        self.solids = {}
        self.entities = {}
        self.enemies = {}
        self.lights = {}
          self.timeTaken = 0
        require ('level.'..self.number)
        self.solids, self.entities, self.enemies, self.lights = level(self.solids, self.entities, self.enemies, self.lights)
    end,
}
function Level:increase(dt, type)

  if self.coolDown <= 0 or type == 'level' then

    self.coolDown = 1
    local parts = explode("_", self.number)
    if type == 'level' then
      parts[1] = parts[1] + 1
      parts[2] = 1
      self.levelone = 0
      self.timeTaken = 0
    elseif type == 'bett' then
      Gamestate.switch(gameBed)
    elseif type == 'aim' then
      self.levelone = 0 + self.timeTaken
      self.timeTaken = 0
      parts[2] = parts[2] + 1
    end
    if tonumber(parts[1]) > 3 then
      print('won!')
      Gamestate.switch(gameWon)
    else

      self.number = parts[1] .. "_" .. parts[2]

      colliderWorld:clear()
      self.solids = {}
      self.entities = {}
      self.enemies = {}
      self.lights = {}

      lightWorld.clearBodys()
      lightWorld.clearLights()
      player = Player(590,730)

      require ('level.'..self.number)
      self.solids, self.entities, self.enemies, self.lights = level(self.solids, self.entities, self.enemies, self.lights)

    end
  else
    self.coolDown = self.coolDown - dt
  end
end

function Level:reload()
  self.timeTaken = 0
  colliderWorld:clear()
  self.solids = {}
  self.entities = {}
  self.enemies = {}
  self.lights = {}

  lightWorld.clearBodys()
  lightWorld.clearLights()
  player = Player(590,730)

  require ('level.'..self.number)
  self.solids, self.entities, self.enemies, self.lights = level(self.solids, self.entities, self.enemies, self.lights)
end

function Level:update(dt)
  self.timeTaken = self.timeTaken + dt
  for _,v in ipairs(self.solids) do
    v:update(dt)
  end
  for _,v in ipairs(self.entities) do
    v:update(dt)
  end
  for _,v in ipairs(self.enemies) do
    v:update(dt)
  end
  if self.lights ~= nil then
    for _,v in ipairs(self.lights) do
      v:update(dt)
    end
  end
end

function Level:draw()
  for _,v in ipairs(self.solids) do
    v:draw()
  end
  for _,v in ipairs(self.entities) do
    v:draw()
  end
  for _,v in ipairs(self.enemies) do
    v:draw()
  end

end
