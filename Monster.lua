local size = cc.Director:getInstance():getWinsize()
local Defaults = cc.UserDefault:getInstance()

Fighter_hitPoints = 1
local Monster class("Monster",function()
    return cc.Sprite:create()
end)

function Monster.create()
    local sprite = Monster.new()
    return sprite
end

function Monster:ctor()  
    self.hitPoints = Fighter_hitPoints
    local alive = 1
    local speed = 2
    local range = 100

    self.hitPoints = 0

    local body = cc.PhysicsBody:createEdgeBox(0)
end