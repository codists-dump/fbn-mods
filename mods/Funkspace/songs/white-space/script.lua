local shaderName = "vcr"
local bloom = "bloom"
local shaderboom = 0.0

function onCreate()
    if dadName == "omori-erect" then 
        shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

        makeLuaSprite("tempShader0")

        runHaxeCode([[
            var shaderName = "]] .. shaderName .. [[";
            
            game.initLuaShader(shaderName);
            
            var shader0 = game.createRuntimeShader(shaderName);
            game.camGame.setFilters([new ShaderFilter(shader0)]);
            game.camHUD.setFilters([new ShaderFilter(shader0)]);
            game.getLuaObject("tempShader0").shader = shader0; // setting it into temporary sprite so luas can set its shader uniforms/properties

            var shaderName2 = "]] .. bloom .. [[";
            
            game.initLuaShader(shaderName2);
    
            var shader1 = game.createRuntimeShader(shaderName2);
            game.camGame.setFilters([new ShaderFilter(shader0), new ShaderFilter(shader1)]);
            game.camHUD.setFilters([new ShaderFilter(shader0)]);
            game.getLuaObject("tempShader1").shader = shader1; // setting it into temporary sprite so luas can set its shader uniforms/properties
        ]])
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end

function onUpdatePost(elapsed)
    setShaderFloat("tempShader0", "iTime", os.clock())
    setShaderFloat("tempShader0", "amount", shaderboom)

    shaderboom = lerp(shaderboom, 0.0, 0.003)
end

function onEvent(n,v1,v2)
    if n == 'Shader Boom' then
        shaderboom = shaderboom + v1
    end
end

function lerp(a, b, ratio)
    return a + ratio * (b - a)
end