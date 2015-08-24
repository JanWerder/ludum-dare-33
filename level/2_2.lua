function level(solids, entities, enemies, lights)

  local height = love.graphics.getHeight()
  local width = love.graphics.getWidth()

  table.insert(solids, Solid(25, 25, 25, height-55)) --left up to bottom
  table.insert(solids, Solid(50, 25, width-100, 25)) -- top left to right
  table.insert(solids, Solid(width-50, 25, 25, height-50)) -- right up to down
  table.insert(solids, Solid(25,height-50, width/2, 20)) --bottom left part
  table.insert(solids, Solid(25+width/2+100,height-45, width/2-width/4+90, 20)) -- bottom right part

  --tempLight = lightWorld.newLight(530, 400, 255, 127, 63, 1300)

  --bedroom kid
  table.insert(solids, Solid(700, 300, 25, 425)) --left wall
  table.insert(solids, Solid(700, 275, 125, 25)) --left door wall
  table.insert(solids, Solid(900, 275, 75, 25)) --right door wall part
  table.insert(solids, Solid(650, 300, 25, 425)) --left outer wall
  table.insert(solids, Solid(650, 275, 50, 25)) --left door wall

  --left room
  table.insert(solids, Solid(400, 300, 25, 350)) --right wall
  table.insert(solids, Solid(50, 275, 125, 25)) --top left wall
  table.insert(solids, Solid(250, 275, 175, 25)) --top right wall

  --upper left room
  table.insert(solids, Solid(450, 50, 25, 150)) -- top sperator wall
  table.insert(solids, Solid(425, 275, 225, 25)) -- bottom hallway wall


  table.insert(enemies, Enemy(260,550,160,{{350,370},{350,600},{150,600},{350,370},{350,700},{500,700},{500,450},{500,700}}))
  table.insert(enemies, Enemy(100,130,130,{{70,70},{200,70},{200,200},{70,200},{400,70}}))

  table.insert(enemies, Enemy(900,130,80,{{900,150},{630,150},{630,150},{900,150}}))
  table.insert(enemies, Enemy(900,130,80,{{900,200},{900,200},{630,200},{630,200}}))

  table.insert(entities, Entity(750, 450, "bett"))

  table.insert(entities, Entity(500, 300, "solid_schrank"))
  table.insert(entities, Entity(800, 50, "solid_schrank"))
  table.insert(entities, Entity(50, 655, "solid_couch180"))


  -- set background
  quadScreen = love.graphics.newQuad(0, 0, love.window.getWidth(), love.window.getHeight(), 32, 24)

  imgFloor = love.graphics.newImage("gfx/floor.png")
  imgFloor:setWrap("repeat", "repeat")

  return solids, entities,enemies, lights
end
