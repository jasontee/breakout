Powerup = Class{}

function Powerup:init(x,y)
    self.x = x
    self.y = y
	
    self.dy = 50
	
	self.type = math.random(1,10)
	
	self.width = 16
	self.height = 16
	
	self.inPlay = false
end

function Powerup:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    return true
end

function Powerup:update(dt)
	self.y = self.y + self.dy * dt
	
	if self.y + self.height > VIRTUAL_HEIGHT then 
		self.inPlay = false
	end
end

function Powerup:render()	
	if self.inPlay then
		love.graphics.draw(gTextures['main'], gFrames['powerups'][self.type], self.x, self.y)
	end
end