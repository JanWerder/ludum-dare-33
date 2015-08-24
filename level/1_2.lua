function level(solids,entities,enemies,lights)

  local height = love.graphics.getHeight()
  local width = love.graphics.getWidth()

  table.insert(solids, Solid(25, 25, 25, height-55)) --left up to bottom
  table.insert(solids, Solid(25, 25, width-50, 25)) -- top left to right
  table.insert(solids, Solid(width-50, 25, 25, height-50)) -- right up to down
  table.insert(solids, Solid(25,height-50, width/2, 20)) --bottom left part
  table.insert(solids, Solid(25+width/2+100,height-45, width/2-width/4+90, 20)) -- bottom right part

  --bedroom kid
  table.insert(solids, Solid(350, 325, 25, 400)) --right wall
  table.insert(solids, Solid(50, 325, 125, 25)) --top wall
  table.insert(solids, Solid(250, 325, 125, 25)) --top wall

  -- Raum über Bettraum
  table.insert(solids, Solid(350, 50, 25, 70))
  table.insert(solids, Solid(350, 190, 25, 150))

  table.insert(solids, Solid(250, 325, 600, 25))
  table.insert(solids, Solid(600, 470, 400, 25))



  --tempLight = lightWorld.newLight(530, 400, 255, 127, 63, 1300)

  tempLight = LightMan(140,400,63,31,16,400,"light",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(650,200,63,31,16,400,"light",0)
  table.insert(lights, tempLight)
  tempLight = LightMan(400,475,63,31,16,400,"light",0)
  table.insert(lights, tempLight)

  table.insert(entities, Entity(50, 570, "bett"))

  table.insert(entities, Entity(830, 50, "solid_tv"))
  table.insert(entities, Entity(150, 667, "solid_schrank180"))
  table.insert(entities, Entity(550, 50, "solid_schrank"))

  table.insert(enemies, Enemy(140,400,50,{{240,400},{140,400}})) -- Bettraum
  table.insert(enemies, Enemy(100,100,150,{{300,100},{300,260},{100,260},{100,100},})) -- Raum über Bettraum
  table.insert(enemies, Enemy(500,100,150,{{500,300},{500,100}})) -- hoch runter, links
  table.insert(enemies, Enemy(800,100,200,{{800,300},{800,100}})) -- hoch runter, rechts
  table.insert(enemies, Enemy(430,400,200,{{800,400},{430,400}})) -- Eingang oben
  table.insert(enemies, Enemy(430,550,50,{{650,550},{430,550}})) -- Eingang unten

  -- set background
  quadScreen = love.graphics.newQuad(0, 0, love.window.getWidth(), love.window.getHeight(), 32, 24)

  imgFloor = love.graphics.newImage("gfx/floor.png")
  imgFloor:setWrap("repeat", "repeat")

  return solids, entities,enemies,lights
end
