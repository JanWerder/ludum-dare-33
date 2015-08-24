function level(solids, entities, enemies, lights)

  local height = love.graphics.getHeight()
  local width = love.graphics.getWidth()

  table.insert(solids, Solid(25, 25, 25, height-55)) --left up to bottom
  table.insert(solids, Solid(50, 25, width-100, 25)) -- top left to right
  table.insert(solids, Solid(width-50, 25, 25, height-50)) -- right up to down
  table.insert(solids, Solid(25,height-50, width/2, 20)) --bottom left part
  table.insert(solids, Solid(25+width/2+100,height-45, width/2-width/4+90, 20)) -- bottom right part

  -- Flur
  table.insert(solids, Solid(740, 350, 20, 280))
  table.insert(solids, Solid(370, 510, 370, 18))

  -- DiscoRaum
  table.insert(solids, Solid(500, 50, 20, 30))
  table.insert(solids, Solid(500, 180, 20, 170))
  table.insert(solids, Solid(520, 332, 346, 18))
  table.insert(solids, Solid(930, 332, 50, 18))
  table.insert(solids, Solid(740, 240, 20, 100)) -- Innenwand

  table.insert(solids, Solid(250, 332, 270, 18))
  table.insert(solids, Solid(250, 332, 20, 180))

  -- Treppenhaus
  table.insert(solids, Solid(350, 510, 20, 210))
  table.insert(solids, Solid(50, 592, 172, 18))
  table.insert(solids, Solid(50, 510, 60, 18))
  table.insert(solids, Solid(174, 510, 176, 18))

  --tempLight = lightWorld.newLight(530, 400, 255, 127, 63, 1300)

  table.insert(entities, Entity(50, 50, "solid_tv"))
  table.insert(entities, Entity(178, 50, "solid_schrank"))

  tempLight = LightMan(100,100,63,31,16,400,"light",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(960,70,255,255,255,100,"disco",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(960,290,255,255,255,100,"disco",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(800,290,255,255,255,100,"disco",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(540,290,255,255,255,100,"disco",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(710,290,255,255,255,100,"disco",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(540,70,255,255,255,100,"disco",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(710,70,255,255,255,100,"disco",0)
  table.insert(lights, tempLight)

  table.insert(enemies, Enemy(700,550,130,{{450,550},{700,550}})) -- Start

  table.insert(enemies, Enemy(570,260,200,{{660,260},{660,280},{570,200},{570,260}})) -- Disco
  table.insert(enemies, Enemy(945,80,130,{{945,200},{945,80}})) -- Disco
  table.insert(enemies, Enemy(600,80,160,{{850,280},{800,280},{800,200},{600,200},{600,80}})) -- Disco
  table.insert(enemies, Enemy(700,80,4,{{720,80},{700,80}})) -- Disco

  table.insert(enemies, Enemy(450,260,60,{{175,260},{175,400},{125,400},{125,110},{450,110},{450,260},{175,260}}))


  table.insert(enemies, Enemy(780,365,0,{{780,470}})) -- Türsteher
  table.insert(enemies, Enemy(950,710,0,{{945,470}})) -- Türsteher unten
  table.insert(entities, Entity(50, 612, "treppe270"))

  -- set background
  quadScreen = love.graphics.newQuad(0, 0, love.window.getWidth(), love.window.getHeight(), 32, 24)

  imgFloor = love.graphics.newImage("gfx/floor.png")
  imgFloor:setWrap("repeat", "repeat")

  return solids, entities,enemies, lights
end
