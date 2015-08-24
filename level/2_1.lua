function level(solids, entities, enemies, lights)

  local height = love.graphics.getHeight()
  local width = love.graphics.getWidth()

  table.insert(solids, Solid(25, 25, 25, height-55)) --left up to bottom
  table.insert(solids, Solid(50, 25, width-100, 25)) -- top left to right
  table.insert(solids, Solid(width-50, 25, 25, height-50)) -- right up to down
  table.insert(solids, Solid(25,height-50, width/2, 20)) --bottom left part
  table.insert(solids, Solid(25+width/2+100,height-45, width/2-width/4+90, 20)) -- bottom right part

  table.insert(solids, Solid(155,50, 18, 173)) -- TreppenRaum
  table.insert(solids, Solid(300,50, 18, 30)) -- TreppenRaum
  table.insert(solids, Solid(300,150, 18, 200)) -- TreppenRaum
  table.insert(solids, Solid(50,310, 250, 20)) -- TreppenRaum

  table.insert(solids, Solid(519,560, 18, 170)) -- Flur
  table.insert(solids, Solid(537,560, 330, 20)) -- Flur
  table.insert(solids, Solid(927,560, 50, 20)) -- Flur

  table.insert(solids, Solid(519,50, 18, 430))
  table.insert(solids, Solid(519,540, 18, 20))

  table.insert(solids, Solid(317,440, 280, 20))
  table.insert(solids, Solid(657,440, 100, 20))
  table.insert(solids, Solid(750,380, 18, 180))

  table.insert(solids, Solid(750,170, 18, 140)) -- Kreuz
  table.insert(solids, Solid(750,50, 18, 50)) -- Kreuz
  table.insert(solids, Solid(537,220, 50, 20)) -- Kreuz
  table.insert(solids, Solid(667,220, 190, 20)) -- Kreuz
  table.insert(solids, Solid(917,220, 60, 20)) -- Kreuz

  table.insert(solids, Solid(300,420, 18, 210))
  table.insert(solids, Solid(300,700, 18, 30))


  table.insert(entities, Entity(550, 580, "solid_schrank"))
  table.insert(entities, Entity(800, 50, "solid_tv"))
  table.insert(entities, Entity(50, 667, "solid_couch180"))
  --table.insert(entities, Entity(50, 50, "solid_tv"))
  --table.insert(entities, Entity(178, 50, "solid_schrank"))


  --tempLight = lightWorld.newLight(530, 400, 255, 127, 63, 1300)

  tempLight = LightMan(0,0,255,255,255,100,"gewitter",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(1024,768,255,255,255,100,"gewitter",0)
  table.insert(lights, tempLight)


  table.insert(enemies, Enemy(260,550,50,{{260,420},{260,600}}))
  table.insert(enemies, Enemy(900,130,130,{{630,130},{630,360},{900,360},{900,130}}))
  table.insert(enemies, Enemy(900,130,250,{{900,360},{630,360},{630,130},{900,130}}))
  table.insert(entities, Entity(50, 50, "treppe0"))

  -- set background
  quadScreen = love.graphics.newQuad(0, 0, love.window.getWidth(), love.window.getHeight(), 32, 24)

  imgFloor = love.graphics.newImage("gfx/floor.png")
  imgFloor:setWrap("repeat", "repeat")

  return solids, entities,enemies, lights
end
