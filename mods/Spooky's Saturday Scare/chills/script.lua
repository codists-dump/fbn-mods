local shaderName = "blur"
local amount = 1
function onCreatePost()
    precacheImage('song specific and bgs/spooky/sp1/Spooklads')

    setProperty('camHUD.alpha', 0)
    setProperty('camHUD.zoom', 1)

    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black', 3000, 3000, '000000')
    addLuaSprite('black', true)

    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'dead');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'yeah');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'retry');
end

function onUpdatePost()
    runHaxeCode([[
        shader0.setFloat("iTime", ]] .. os.clock() .. [[);
    ]])

    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/120)
        doTweenY(dadTweenY, 'dad', 570-30*math.sin((currentBeat*0.85)*math.pi),0.001, 'quadInOut')
    end
end

function onSongStart()
    doTweenAlpha('nomoreblack', 'black', 0, 7.1)
    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";
        
        game.initLuaShader(shaderName);
        
        shader0 = game.createRuntimeShader(shaderName);
        game.camGame.setFilters([new ShaderFilter(shader0)]);
    ]])

    setProperty('camHUD.alpha', 0)
end

function onBeatHit()
    if curBeat == 14 then
        doTweenZoom('piss', 'camGame', 0.9, 0.2, 'quadInOut')
        runHaxeCode([[
            game.camGame.setFilters(null);
        ]])
    end
    if curBeat == 16 then
        doTweenZoom('piss', 'camGame', 0.65, 0.4, 'circInOut')
        doTweenAlpha('hi', 'camHUD', 1, 1)
    end
    if curBeat == 112 then
        moveOnHit = false
        doTweenAlpha('byer', 'camHUD', 0, 0.62)
    end
    if curBeat == 128 then
        doTweenAlpha('hir', 'camHUD', 1, 1)
        moveOnHit = true
    end
end

function onStepHit()
    if curStep == 507 then
        if getProperty('combo') >= 100 and misses < 20 then
            triggerEvent('Play Animation', 'singRIGHT-win', 'bf')
        elseif misses >= 20 then
            triggerEvent('Play Animation', 'singRIGHT-losing', 'bf')
        else
            triggerEvent('Play Animation', 'singRIGHT', 'bf')
        end
    end
    if curStep == 512 then
        if getProperty('combo') >= 100 and misses < 20 then
            triggerEvent('Play Animation', 'idle-win', 'bf')
        elseif misses >= 20 then
            triggerEvent('Play Animation', 'idle-losing', 'bf')
        else
            triggerEvent('Play Animation', 'idle', 'bf')
        end
    end
end

function onGameOver()
    runHaxeCode([[
        game.camGame.setFilters(null);
    ]])
end