local size = cc.Director:getInstance():getWinSize()
local GamePlayScene = class("GamePlayScene",function()
    return cc.Scene:create()
end)

function GamePlayScene.create()
    local scene = GamePlayScene:new()
    return scene
end

function GamePlayScene:ctor()
    cclog("GamePlayScene init")

    self:addChild(self:createInitBGLayer())
    --  场景生命周期事件处理
  --[[ local function onNodeEvent(event)
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
    self:registerScriptTapHandler(onNodeEvent)]]
end

--create背景层
function GamePlayScene:createInitBGLayer()
    cclog("背景层初始化")
    local bgLayer = cc.Layer:create()

    local sprite = cc.Sprite:create("ground.png")
    sprite:setPosition(cc.p(size.width/2,size.height/2))
    bgLayer:addChild(sprite)

    return bgLayer
end

return GamePlayScene

