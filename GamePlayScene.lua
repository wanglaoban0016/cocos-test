local size = cc.Director:getInstance():getWinSize()
local GamePlayScene = class("GamePlayScene",function()
    return cc.Scene:create()
end)
local num1 = size.width/2-100
local num2 = size.height/2-100

function GamePlayScene.create()
    local scene = GamePlayScene:new()
    return scene
end

function GamePlayScene:ctor()
    cclog("GamePlayScene init")
    self:addChild(self:createInitBGLayer())
    --  场景生命周期事件处理
   --[[local function onNodeEvent(event)
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

function GamePlayScene:onEnter()
    --cclog("GamePlayScene init")
    --self:addChild(self:createInitBGLayer())
end
    --create背景层
function GamePlayScene:createInitBGLayer()
    cclog("背景层初始化")
    local bgLayer = cc.Layer:create()

    local bgsprite = cc.Sprite:create("bgd.png")
    bgsprite:setAnchorPoint(0,0.5)
    bgsprite:setPosition(cc.p(0,size.height/2))
    bgLayer:addChild(bgsprite)

    local visiblieSize = cc.Director:getInstance():getVisibleSize()
    local spriteContentSize = bgsprite:getTextureRect()
    --bgsprite:setPosition(visiblieSize.width/2, visiblieSize.height/2)
    --bgsprite:setScaleX(visiblieSize.width/spriteContentSize.width)
    --bgsprite:setScaleY(visiblieSize.height/spriteContentSize.height)

    --[[local gsprite = cc.Sprite:create("ground.png")
    gsprite:setPosition(cc.p(size.width/2,size.height))
    --sprite:setAnchorPoint(cc.p(0,0))
    bgLayer:addChild(gsprite)

    local visiblieSize = cc.Director:getInstance():getVisibleSize()
    local spriteContentSize = gsprite:getTextureRect()
    gsprite:setAnchorPoint(0.5,0)
    gsprite:setPosition(visiblieSize.width/2, 0)
    gsprite:setScaleX(visiblieSize.width/spriteContentSize.width)]]

    local msprite = cc.Sprite:create("PurpleMonster.png")
    msprite:setAnchorPoint(0.5,0)
    msprite:setPosition(cc.p(size.width/2,size.height/2-100))
    bgLayer:addChild(msprite)

    local ac0 = msprite:runAction(cc.MoveTo:create(2,cc.p(size.width-100,size.height/2-100)))
    local ac1 = msprite:runAction(cc.MoveTo:create(2,cc.p(size.width/2,size.height/2-100)))
    local seq =  cc.Sequence:create(ac0,ac1)
    msprite:runAction(cc.Repeat:create(seq,100))

    local upsprite = cc.Sprite:create("redMask.png")
    upsprite:setPosition(cc.p(size.width/2-300,100))
    bgLayer:addChild(upsprite)

    local atacksprite = cc.Sprite:create("mapMask.png")
    atacksprite:setPosition(cc.p(size.width/2+300,100))
    bgLayer:addChild(atacksprite)

    local playersprite = cc.Sprite:create("player.png")
    playersprite:setAnchorPoint(0.5,0)
    playersprite:setPosition(cc.p(size.width/2-300,size.height/2-100))
    local x = size.width/2-300
    local y = size.height/2-100
    bgLayer:addChild(playersprite)

    --local ac2 = playersprite:runAction(cc.MoveTo:create(1,cc.p(x,y+100)))
    --local ac3 = playersprite:runAction(cc.MoveTo:create(1,cc.p(x,y-100)))
    --local seq1 =  cc.Sequence:create(ac2,ac3)
    --playersprite:runAction(cc.Repeat:create(seq1,2))

    local function movemove()
        
    end
    local function touchBegan(touch,event)
        --movemove()
        local node = event:getCurrentTarget()
        local locationInNode = node:convertToNodeSpace(touch:getLocation())
        local s = node:getContentSize()
        local rect = cc.rect(0,0,s.width,s.height)
        if cc.rectContainsPoint(rect, locationInNode) then 
            playersprite:runAction(cc.MoveTo:create(0.2,cc.p(x,y+100)))
            --cclog("touch begin")
            --local ac3 = playersprite:runAction(cc.MoveTo:create(1,cc.p(x,y-100)))
            --cclog("sprite x = %d, y = %d",locationInNode.x, locationInNode.y)
            --cclog("sprite tag = %d", node:getTag())
            --node:runAction(cc.ScaleBy:create(0.06,1.06))
            return true
        end
        --playersprite:runAction(cc.MoveTo:create(0.3,cc.p(x,y)))
        return false
    end
    --bgLayer:registerScriptHandler(touchBegan)

    local function touchMove(touch,event)
        return true
    end
    --bgLayer:registerScriptHandler(touchMove)

    local function touchEnd(touch,event)
        local node = event:getCurrentTarget()
        local locationInNode = node:convertToNodeSpace(touch:getLocation())
        local s = node:getContentSize()
        local rect = cc.rect(0,0,s.width,s.height)
        if cc.rectContainsPoint(rect, locationInNode) then 
            playersprite:runAction(cc.MoveTo:create(0.3,cc.p(x,y)))
            return true
        end
        return true
    end
    --bgLayer:registerScriptHandler(touchEnd)


    local listener1 = cc.EventListenerTouchOneByOne:create()
    listener1:setSwallowTouches(false)
    listener1:registerScriptHandler(touchBegan,cc.Handler.EVENT_TOUCH_BEGAN)
    listener1:registerScriptHandler(touchMove,cc.Handler.EVENT_TOUCH_MOVED)
    listener1:registerScriptHandler(touchEnd,cc.Handler.EVENT_TOUCH_ENDED)
    
    local eventDispatcher = cc.Director:getInstance():getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener1,upsprite)

    local function atackBegan(touch,event)
        local node = event:getCurrentTarget()
        local locationInNode = node:convertToNodeSpace(touch:getLocation())
        local s = node:getContentSize()
        local rect = cc.rect(0,0,s.width,s.height)
        if cc.rectContainsPoint(rect, locationInNode) then 
            local bsprite = cc.Sprite:create("Bullet.png")
            bsprite:setPosition(cc.p(size.width/2-300,size.height/2))
            bgLayer:addChild(bsprite)

            bsprite:runAction(cc.MoveTo:create(2,cc.p(size.width-100,size.height/2-50)))
            return true
        end
        --playersprite:runAction(cc.MoveTo:create(0.3,cc.p(x,y+100)))
        --playersprite:runAction(cc.MoveTo:create(0.3,cc.p(x,y)))
        return true
    end

    local listener2 = cc.EventListenerTouchOneByOne:create()
    listener2:setSwallowTouches(false)
    listener2:registerScriptHandler(atackBegan,cc.Handler.EVENT_TOUCH_BEGAN)
    --listener2:registerScriptHandler(touchMove,cc.Handler.EVENT_TOUCH_MOVED)
    --listener2:registerScriptHandler(touchEnd,cc.Handler.EVENT_TOUCH_ENDED)
    
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener2,atacksprite)

    local function update(delta)
         --local p = cc.p(size.width/2,math.random()*size.height)
        --sprite:runAction(cc.MoveTo:create(2,cc.p(size.width-50,size.height-50)))
        -- sprite:runAction(cc.Place:create(p))
        --cclog("Move sequence")
        --local p = cc.p(size.width/2,size.height/2)
       -- local ac0 = msprite:runAction(cc.MoveTo:create(10,cc.p(num1,num2)))
        --local ac1 = msprite:runAction(cc.MoveTo:create(10,cc.p(num2,num1)))
       -- sprite:runAction(cc.Sequence:create(ac0,ac1))
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
function GamePlayScene:OnRepeat()
    cclog("Repeat action")
    
end
return GamePlayScene

