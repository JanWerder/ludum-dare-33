function level(solids, entities, enemies, lights)

  local height = love.graphics.getHeight()
  local width = love.graphics.getWidth()

  table.insert(solids, Solid(25, 25, 25, height-55)) --left up to bottom
  table.insert(solids, Solid(50, 25, width-100, 25)) -- top left to right
  table.insert(solids, Solid(width-50, 25, 25, height-50)) -- right up to down
  table.insert(solids, Solid(25,height-50, width/2, 20)) --bottom left part
  table.insert(solids, Solid(25+width/2+100,height-45, width/2-width/4+90, 20)) -- bottom right part

  table.insert(solids, Solid(380, 120, 230, 18))

  --Bettraum
  table.insert(solids, Solid(400, 220, 64, 18)) -- top left
  table.insert(solids, Solid(536, 220, 64, 18)) -- top left
  table.insert(solids, Solid(400, 500, 200, 18)) -- bottom
  table.insert(solids, Solid(380, 220, 20, 298)) -- left
  table.insert(solids, Solid(590, 220, 20, 298)) -- right

  -- links
  table.insert(solids, Solid(230, 220, 150, 18))
  table.insert(solids, Solid(115, 340, 200, 18))
  table.insert(solids, Solid(115, 450, 200, 18))

  -- Rechts
  table.insert(solids, Solid(610, 220, 150, 18))
  table.insert(solids, Solid(700, 320, 20, 200)) -- right
  table.insert(solids, Solid(850, 320, 20, 200)) -- right

  --tempLight = lightWorld.newLight(530, 100, 255, 127, 63, 1300)

  table.insert(entities, Entity(150, 50, "solid_schrank"))
  table.insert(entities, Entity(750, 50, "solid_schrank"))
    table.insert(entities, Entity(50, 655, "solid_couch180"))

  tempLight = LightMan(0,0,255,255,255,100,"gewitter",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(1024,768,255,255,255,100,"gewitter",0)
  table.insert(lights, tempLight)


  table.insert(enemies, Enemy(420,260,100,{{570,260},{570,480},{420,480},{420,260}})) -- Bett
  table.insert(enemies, Enemy(420,260,150,{{420,480},{570,480},{570,260},{420,260}})) -- Bett
  table.insert(enemies, Enemy(340,90,150,{{640,90},{640,170},{440,170},{640,170},{340,170},{640,170},{640,90},{640,170},{440,170},{640,170},{340,90}})) -- Vor Bettraum

  table.insert(enemies, Enemy(80,300,120,{{80,400},{340,400},{340,510},{80,510},{80,400},{340,400},{340,300},{80,300}})) -- Links
  table.insert(enemies, Enemy(340,300,150,{{340,400},{80,400},{80,510},{340,510},{340,400},{80,400},{80,300},{340,300}})) -- Links

  table.insert(enemies, Enemy(645,270,120,{{645,560},{775,560},{775,270},{925,270},{925,560},{775,560},{775,270},{645,270}})) -- Rechts
  table.insert(enemies, Enemy(925,270,150,{{775,270},{775,560},{645,560},{645,270},{775,270},{775,560},{925,270},{925,560}})) -- Rechts



  table.insert(entities, Entity(450, 300, "bett"))

  -- set background
  quadScreen = love.graphics.newQuad(0, 0, love.window.getWidth(), love.window.getHeight(), 32, 24)

  imgFloor = love.graphics.newImage("gfx/floor.png")
  imgFloor:setWrap("repeat", "repeat")

  return solids, entities,enemies, lights
end
