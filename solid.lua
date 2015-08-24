Solid = Class{
    init = function(self, x, y, w, h)
        self.x = x
        self.y = y
        self.w = w
        self.h = h
        self.type = "solid"
        self.lightBody = lightWorld.newRectangle(self.x, self.y, self.w, self.h)
        self.colliderBody = colliderWorld:addRectangle(x,y,w,h)
        self.colliderBody.parent = self
        colliderWorld:setPassive(self.colliderBody)
    end,
}

function Solid:update(dt)
  --local cx,cy = self.colliderBody:center()
  --self.colliderBody:moveTo(self.x-cx, self.y-cy)
end

function Solid:draw()
  --self.colliderBody:draw("line")
  love.graphics.setColor(50,50,50)
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end
