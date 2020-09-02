local size = cc.Director:getInstance():getWinsize()
local Defaults = cc.UserDefault:getInstance()

Fighter_hitPoints = 1
local Fighter class("Fighter",function()
    return cc.Sprite:create()
end)

function Fighter.create(spriteFrameName)
    local fighter = Fighter.new(spriteFrameName)
    return fighter
end

function Fighter:ctor(spriteFrameName)  
    self.hitPoints = Fighter_hitPoints
    self:setSpriteFrame(spriteFrameName)
end