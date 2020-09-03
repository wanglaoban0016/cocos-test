local size = cc.Director:getInstance():getWinsize()
local Defaults = cc.UserDefault:getInstance()

Fighter_hitPoints = 1
local Fighter class("Fighter",function()
    return cc.Sprite:create()
end)

function Fighter.create()
    local fighter = Fighter.new()
    return fighter
end

function Fighter:ctor()  
    self.hitPoints = Fighter_hitPoints
    
end