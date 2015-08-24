function level(solids,entities,enemies)

  local height = love.graphics.getHeight()
  local width = love.graphics.getWidth()

  table.insert(solids, Solid(25, 25, 25, height-55)) --left up to bottom
  table.insert(solids, Solid(50, 25, width-100, 25)) -- top left to right
  table.insert(solids, Solid(width-50, 25, 25, height-50)) -- right up to down
  table.insert(solids, Solid(25,height-50, width/2, 20)) --bottom left part
  table.insert(solids, Solid(25+width/2+100,height-45, width/2-width/4+90, 20)) -- bottom right part

  table.insert(solids, Solid(350, 300, 25, 200))
  table.insert(solids, Solid(350, height-150-50, 25, 150))

  table.insert(solids, Solid(650, 300, 25, 200))
  table.insert(solids, Solid(650, height-150-50, 25, 75))
  table.insert(solids, Solid(650,height-150-50+75, width/2-width/4+90, 20))

  table.insert(solids, Solid(350,300, 300, 20))
  table.insert(solids, Solid(25,300, 150, 20))
  table.insert(solids, Solid(25+175+50,300, 100, 20))

  table.insert(solids, Solid(600,50, 25, 160))
  table.insert(solids, Solid(625,150, 171, 20))
  table.insert(solids, Solid(650,300, 325, 25))

  --tempLight = lightWorld.newLight(100, 400, 255, 127, 63, 300)
  --tempLight.setGlowStrength(0.1)

  tempLight = lightWorld.newLight(870, 70, 125, 63, 31, 300)
  tempLight = lightWorld.newLight(400, 350, 125, 63, 31, 300)
  tempLight = lightWorld.newLight(70, 350, 125, 63, 31, 300)
  tempLight = lightWorld.newLight(70, 700, 125, 63, 31, 300)


  table.insert(entities, Entity(440, 320, "solid_schrank"))
  table.insert(entities, Entity(720, 320, "solid_tv"))
  table.insert(entities, Entity(150, 667, "solid_schrank180"))
  table.insert(entities, Entity(625, 50, "treppe270"))
  table.insert(entities, Entity(50, 50, "solid_tv"))
  table.insert(entities, Entity(178, 50, "solid_schrank"))

  -- set background
  quadScreen = love.graphics.newQuad(0, 0, love.window.getWidth(), love.window.getHeight(), 32, 24)

  imgFloor = love.graphics.newImage("gfx/floor.png")
  imgFloor:setWrap("repeat", "repeat")

  table.insert(enemies, Enemy(90,100,130,{{100,100},{100,200},{350,200},{350,100}}))

  return solids, entities,enemies
end
