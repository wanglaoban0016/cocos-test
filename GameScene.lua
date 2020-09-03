local size = cc.Director:getInstance():getWinSize()

local GameScene = class("GameScene",function()
    return cc.Scene:create()
end)

function  GameScene.create()
    local scene = GameScene:new()
    --将层添加到场景中
    scene:addChild(scene:createLayer())
    return scene
end

function GameScene:ctor()

end
   
--创建层
function   GameScene:createLayer()
    --[[cclog("GameScene init")
    local layer = cc.Layer:create()

    --创建精灵对象
    local sprite = cc.Sprite:create("HelloWorld.png")
    sprite:setPosition(cc.p(size.width/2,size.height/2))
    layer:addChild(sprite)
   
    --创建标签对象
    local label = cc.Label:createWithSystemFont("HelloWorld","Aria",16)
    label:setPosition(cc.p(size.width/2,
    size.height/2))
    layer:addChild(label)

    
    
    local star = cc.Sprite:create("star.png")
    sprite:setPosition(cc.p(size.width/2,size.height/2))
    layer:addChild(star)
    



    local function update(delta)
        local x,y = star:getPosition()
        star:setPosition(cc.p(x+2,y+2))
    end

    --开始游戏调度
    layer:scheduleUpdateWithPriorityLua(update,0)

    local function onNodeEvent(tag)

        if tag == "exit" then
            --停止游戏调度
            layer:unscheduleUpdate()
        end
    end
    layer:registerScriptHandler(onNodeEvent)]]
    local layer = cc.Layer:create()
    local director = cc.Director:getInstance()
    local sprite = cc.Sprite:create("background.png")

    sprite:setPosition(cc.p(size.width/2,size.height/2))
    layer:addChild(sprite)

    local visiblieSize = cc.Director:getInstance():getVisibleSize()
    local spriteContentSize = sprite:getTextureRect()
    sprite:setPosition(visiblieSize.width/2, visiblieSize.height/2)
    sprite:setScaleX(visiblieSize.width/spriteContentSize.width)
    sprite:setScaleY(visiblieSize.height/spriteContentSize.height)
    print("x %d,y ",size.width,size.height)
    print("visiblieSize.width - %d, visiblieSize.height - %d",visiblieSize.width,visiblieSize.height)
    print("spriteContentSize.width %d---- spriteContentSize.height  %d",spriteContentSize.width,spriteContentSize.height)
    
    local startSprite = cc.Sprite:create("start.png")
    local startSelected = cc.Sprite:create("star.png")
    local startMenuItem = cc.MenuItemSprite:create(startSprite,startSelected)
    startMenuItem:setPosition(director:convertToGL(cc.p(0,600)))

    local function menuItemCallback(sender)

        cclog("Touch Start!")
        local GamePlayScene = require("GamePlayScene")
        local gamescene = GamePlayScene:create()
        --local ts = cc.TransitionCrossFade:create(1,gamescene)
        cc.Director:getInstance():pushScene(gamescene)
    end
    startMenuItem:registerScriptTapHandler(menuItemCallback)

    local mu = cc.Menu:create(startMenuItem)
    mu:setPosition(size.width/2,size.height/2)
    layer:addChild(mu)
    return layer
end
        -- body
return GameScene
