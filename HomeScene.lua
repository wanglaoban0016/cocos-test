local size = cc.Director:getInstance():getWinSize()
local defaults = cc.UserDefault:getInstance()

local HomeScene = class("HomeScene",function()
    return cc.Scene:create()
end)

function  HomeScene.create()
    local scene = HomeScene:new()
    scene:addChild(scene:createLayer())
    return scene
end

function HomeScene:ctor()
    --场景生命周期事件处理
    local function onNodeEvent(event)
        if event == "enter" then
            self:onEnter()
        elseif event == "enterTransitionFinish" then
            self:onEnterTransitionFinish()
        elseif event == "edit" then 
            self:onExit()
        elseif event == "exitTransitionStart" then
            self:onExitTransitionStart()
        elseif event == "cleanup" then 
            self:cleanup()
        end
    end
    self:registerScripthandler(onNodeEvent)
end

--创建层
function HomeScene:createLayer()
    cclog("HomeScene init")
    local layer = cc.Layer:create()
    local director = cc.Director:getInstance()
    local sprite = cc.Sprite:create("background.png")
    sprite:setPosition(cc.p(size.width/2,size.height/2))
    layer:addChild(sprite)
    
    local startSprite = cc.Sprite:createWithSpriteFrameName("start.png")
    local startMenuItem = cc.MenuItemSprite:create(startSprite)
    startMenuItem:setPosition(director:convertToGL(cc.p(330,220)))


    local function menuItemCallback(sender)
        --local GamePlayScene = require("GamePlayScene")
        --local scene = GamePlayScene:create()
       -- local ts = cc.TransitionCrossFade:create(1,scene)
       -- cc.Director:getInstance():pushScene(ts)
    end
    
    local mu = cc.Menu:create(startMenuItem)
    mu:setPosition(size.width/2,size.height/2)
    mu:alignItemsVerticallWithPadding(12)
    layer:addChild(mu)

    return layer
end