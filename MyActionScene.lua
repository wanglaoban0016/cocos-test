local hiddenFlag = true
local size = cc.Director:getInstance():getWinSize()

local MyActionScene = class("MyActionScene",function()
    return cc.Scene:create()
end)

function MyActionScene.create()
    local fighter = MyActionScene:new()
    fighter:addChild(fighter:createLayer())
    return fighter
end
function MyActionScene:createLayer()
    --cclog("MyActionScene actionFlag = %d",actionFlag)
    cclog("MyActionScene 背景层初始化")
    local layer = cc.Layer:create()

    local bg = cc.Sprite:create("ground.png")
    bg:setPosition(cc.p(size.width/2,size.height/2))
    layer:addChild(bg)
    return layer
end
function MyActionScene:ctor()
    cclog("MyActionScene init")

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

    local bgsprite = cc.Sprite:create("background.png")

    bgsprite:setPosition(cc.p(size.width/2,size.height/2))
    bgLayer:addChild(bgsprite)

    local visiblieSize = cc.Director:getInstance():getVisibleSize()
    local spriteContentSize = bgsprite:getTextureRect()
    bgsprite:setPosition(visiblieSize.width/2, visiblieSize.height/2)
    bgsprite:setScaleX(visiblieSize.width/spriteContentSize.width)
    bgsprite:setScaleY(visiblieSize.height/spriteContentSize.height)


    local sprite = cc.Sprite:create("ground.png")
    sprite:setPosition(cc.p(size.width/2,size.height))
    --sprite:setAnchorPoint(cc.p(0,0))
    bgLayer:addChild(sprite)

    local visiblieSize = cc.Director:getInstance():getVisibleSize()
    local spriteContentSize = sprite:getTextureRect()
    sprite:setAnchorPoint(0.5,0)
    sprite:setPosition(visiblieSize.width/2, 0)
    sprite:setScaleX(visiblieSize.width/spriteContentSize.width)
    --sprite:setScaleY(visiblieSize.height/spriteContentSize.height)


    local sprite = cc.Sprite:create("PurpleMonster.png")
    sprite:setPosition(cc.p(size.width/2,size.height/2))
    bgLayer:addChild(sprite)
    sprite:runAction(cc.MoveTo:create(2,cc.p(size.width-50,size.height-50)))

    local function update(delta)
         --local p = cc.p(size.width/2,math.random()*size.height)
        --sprite:runAction(cc.MoveTo:create(2,cc.p(size.width-50,size.height-50)))
        -- sprite:runAction(cc.Place:create(p))
    end

    bgLayer:scheduleUpdateWithPriorityLua(update,0)

    local function onNodeEvent(tag)

        if tag == "exit" then
            --停止游戏调度
            bgLayer:unscheduleUpdate()
        end
    end
    bgLayer:registerScriptHandler(onNodeEvent)

    return bgLayer
end

return MyActionScene

