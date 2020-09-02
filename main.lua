
cc.FileUtils:getInstance():setPopupNotify(false)

--require "config"
require "cocos.init"
--cclog
cclog = function(...)
    print(string.format(...))
end
local function main()
    collectgarbage("collect")
    --avoid memory leak
    collectgarbage("setpause",100)
    collectgarbage("setstepmul",5000)

    cc.FileUtils:getInstance():addSearchPath("src")
    cc.FileUtils:getInstance():addSearchPath("res")
    
    local director = cc.Director:getInstance()
    director:getOpenGLView():setDesignResolutionSize(960,640,0)

    director:setDisplayStats(true)
    director:setAnimationInterval(1.0/60)

    local scene = require("GameScene")
    local gameScene = scene.create()

    if cc.Director:getInstance():getRunningScene() then
        cc.Director:getInstance():replaceScene(gameScene)
    else 
        cc.Director:getInstance():runWithScene(gameScene)
    end
end
    --require("app.MyApp"):create():run()
    
local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
