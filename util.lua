function explode(d,p)
  local t, ll
  t={}
  ll=0
  if(#p == 1) then return {p} end
    while true do
      l=string.find(p,d,ll,true) -- find the next d in the string
      if l~=nil then -- if "not not" found then..
        table.insert(t, string.sub(p,ll,l-1)) -- Save it in our array.
        ll=l+1 -- save just after where we found it for searching next time.
      else
        table.insert(t, string.sub(p,ll)) -- Save what's left in our array.
        break -- Break at end, as it should be, according to the lua manual.
      end
    end
  return t
end

function isNear(point,range,fuzzing)
  if point < range-fuzzing or point > range+fuzzing then
    return false
  end
  return true
end

function on_collide(dt, shape_a, shape_b,dx,dy)
	if (shape_a.parent.type == "player" and shape_b.parent.type == "solid") or (shape_a.parent.type == "solid" and shape_b.parent.type == "player") then
		player.x = player.x + dx
		player.y = player.y + dy
	end
end
function instanceGame()
  --create Collider world
	colliderWorld = HC(10,on_collide)

	-- create light world
	lightWorld = love.light.newWorld()
	lightWorld.setAmbientColor(0, 0, 0)
	lightWorld.setRefractionStrength(32.0)
  if levelManager == nil then
    levelManager = Level()
  else
    levelManager:reload()
  end
end

function clearWorld()
  colliderWorld:clear()
  player = nil
  lightWorld.lights = {}
  lightWorld = nil
  enemy = nil
  colliderWorld = nil
  hasBeenDetected = false
end

function restartGame()
  clearWorld()
  instanceGame()
  Gamestate.switch(gameLevel)
end

function round(val, decimal)
  local exp = decimal and 10^decimal or 1
  return math.ceil(val * exp - 0.5) / exp
end
