local hiddenFlag = true
local size = cc.Director:getInstance():getWinSize()

local MyActionScene class("MyActionScene",function()
    return cc.Sprite:create()
end)

function MyActionScene.create()
    local fighter = MyActionScene:new()
    fighter:addChild(fighter:createLayer())
    return fighter
end

function MyActionScene:ctor()  
    
end
function MyActionScene:createLayer()
    --cclog("MyActionScene actionFlag = %d",actionFlag)
    local layer = cc.Layer:create()

    local bg = cc.Sprite:create("ground.png")
    bg:setPosition(cc.p(size.width/2,size.height/2))
    layer:addChild(bg)

    local sprite = cc.Sprite:create("PurpleMonster.png")
    sprite:setPosition(cc.p(size.width/2,size.height/2))
    layer:addChild(sprite)


    local function update(delta)
         local p = cc.p(math.random()*size.width,math.random()*size.height)
        sprite:runAction(cc.Place:create(p))
    end

    layer:scheduleUpdateWithPriorityLua(update,0)

    local function onNodeEvent(tag)

        if tag == "exit" then
            --停止游戏调度
            layer:unscheduleUpdate()
        end
    end
    layer:registerScriptHandler(onNodeEvent)

   

    return layer
end
return MyActionScene