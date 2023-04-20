--this script is a mess but im not redoing this shit ever lmao
--unless i port engines smile
chromAmount = 10;
function onCreatePost()
    addCharacterToList('whiteface', 'dad')
    addCharacterToList('HER', 'gf')
    addCharacterToList('HER-pixel', 'gf')

    setProperty('camHUD.alpha', 0)
    setProperty('boyfriend.alpha', 0)

    setObjectOrder('dadGroup', 10)
    setObjectOrder('gfGroup', 11)
    runHaxeCode([[

        //prefer to create all shaders at the start, not only for avoiding lag but also crashes

        var shaderName = "lensDistortion";
        var shaderName2 = "crt";
        var shaderName3 = "glitchEnd";
                
        game.initLuaShader(shaderName);
        game.initLuaShader(shaderName2);
        game.initLuaShader(shaderName3);
        
        shader0 = game.createRuntimeShader(shaderName);
        shader1 = game.createRuntimeShader(shaderName2);
        shader2 = game.createRuntimeShader(shaderName3);

        game.camGame.setFilters([new ShaderFilter(shader0)]);
        game.camHUD.setFilters([new ShaderFilter(shader0)]);
    ]])
end

function onUpdatePost()
    --[[ if curStep >= 352 then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/120)
        doTweenY('gfFloat', 'gf', 570-30*math.sin((currentBeat*0.85)*math.pi),0.001)
    end ]]

    if curBeat > 55 then
        runHaxeCode([[shader0.setFloat("iTime", ]]..getSongPosition()..[[/2000 + 0.35);]])
    else
        runHaxeCode([[shader0.setFloat("iTime", 60);]])
    end

    runHaxeCode([[
        shader1.setFloat("iTime", ]]..os.clock()..[[);
        shader2.setFloat("iTime", ]]..os.clock()..[[);
    ]])
end



function onBeatHit()
    if curBeat == 32 then
        doTweenAlpha('dwdwwd', 'camHUD', 1, 1, 'circInOut')
        setProperty('cameraSpeed', 1)
    end
    if curBeat == 64 then
        setProperty('bgggggg.alpha', 1)
        removeLuaSprite('bgPixel', true)
        setProperty('cameraSpeed', 1)
        runHaxeCode([[
            game.camGame.setFilters([new ShaderFilter(shader1)]);
            game.camHUD.setFilters([new ShaderFilter(shader1)]);
        ]])
    end
    if curBeat == 320 then
        removeHud(1);
    end
    if curBeat == 348 then
        doTweenAlpha('camhi', 'camGame', 1, 0.6, 'circInOut')
        setProperty('dad.alpha', 0)
        doTweenY('himommy', 'gf', getProperty('gf.y') + 105, 0.1, 'expoInOut')

        setProperty('cameraSpeed', 10)
    end
    if curBeat == 352 then
        setProperty('cameraSpeed', 1)
        removeLuaText('funny', true)
        doTweenAlpha('hudhi', 'camHUD', 1, 1, 'circInOut')
    end
    if curBeat == 384 then
        makeLuaSprite('whitething', '', -500, -400)
        makeGraphic('whitething', 1920, 1080, 'e3e3e3')
        scaleObject('whitething', 4, 4)
        setObjectOrder('whitething', 1)
        addLuaSprite('whitething')

        setCharacterY('gf', -37)
    end
    if curBeat == 448 then
        addLuaSprite('graveyard')
        removeLuaSprite('bgggggg', true)
        removeLuaSprite('whitething', true)
        removeLuaSprite('FUCK YOUU', true)
        removeLuaSprite('mirror2', true)
        setCharacterY('gf', -37)
    end
    if curBeat == 512 then
        doTweenAlpha('wholehudh', 'camHUD', 0, 1, 'circInOut')
    end
    if curBeat == 526 then
        doTweenAlpha('youabihfr', 'dad', 1, 8)
    end
    if curBeat == 544 then
        doTweenAlpha('camhi', 'camGame', 1, 0.6, 'elasticInOut')
        doTweenAlpha('hudhi2', 'camHUD', 1, 0.6, 'elasticInOut')

        removeLuaSprite('graveyard', true)
        setProperty('blackRoom.alpha', 1)
        
        runHaxeCode([[
            game.camGame.setFilters([new ShaderFilter(shader2)]);
            game.camHUD.setFilters([new ShaderFilter(shader2)]);
        ]])
    end
    if curBeat == 584 then
        doTweenX('roomshit', 'blackRoom.scale', 0.6, 0.1, 'quadInOut')
        doTweenY('roomshit2', 'blackRoom.scale', 0.6, 0.1, 'quadInOut')
        setProperty('walltext.alpha', 1)
    end
    if curBeat == 704 then
        doTweenAlpha('score', 'scoreTxt', 1, 0.5)
        doTweenAlpha('byefucker', 'dad', 0, 2)
        doTweenAlpha('mybad', 'walltext', 0, 2)
    end
end

local shitpiss = 0
function onStepHit()
    if curStep % 2 == 0 then
        if curStep > 1656 and curStep < 1664 then
            shitpiss = shitpiss + 0.2
            setProperty('mirror1.alpha', shitpiss)
            doTweenAlpha('unshitpiss', 'mirror1', 0, 0.5)
        end
        if curStep > 1784 and curStep < 1792 then
            shitpiss = shitpiss + 0.2
            setProperty('mirror2.alpha', shitpiss)
            doTweenAlpha('unshitpiss2', 'mirror2', 0, 0.5)
        end
    end
    if curStep == 1664 then
        shitpiss = 0
        removeLuaSprite('mirror1')
        makeLuaSprite('FUCK YOUU', 'song specific and bgs/whiteface/MIRROR_DAY', -665, -185)
        scaleObject('FUCK YOUU', 1.1, 1)
        setObjectOrder('FUCK YOUU', 2)
        addLuaSprite('FUCK YOUU')
    end
    if curStep == 2102 then
        playSound('herdie')
    end
end

function onEvent(name, value1, value2)
    if name == 'Add Camera Zoom' then
        if value1 == '0.0201' then
            doTweenAlpha('cam1', 'camGame', 1, 0.1, 'circInOut')
            if curBeat <= 352 then
                doTweenY('piss', 'gf', getProperty('gf.y') + 46, 0.1, 'circInOut')
                --setCharacterY('gf', getProperty('gf.y') + 45)
            elseif curBeat > 525 then
                doTweenY('piss2', 'gf', getProperty('gf.y') + 145, 0.1, 'circInOut')
                --setCharacterY('gf', getProperty('gf.y') + 118)
            end
        end
        if value1 == '0.035' then
            chromAmount = 1;
            runTimer('unchrom', 0.6)
        end
    end
end

function onTweenCompleted(tag)
    if tag == 'cam1' then
        doTweenAlpha('cam2', 'camGame', 0, 0.4, 'circInOut')
    end
end

function onTimerCompleted(t, l, ll)
    if t == 'unchrom' then
        chromAmount = 0;
    end
end

function onGameOver()
    runHaxeCode([[
        game.camGame.setFilters(null);  
        game.camHUD.setFilters(null);
    ]])
end

function removeHud(speed)
    doTweenAlpha('healthbarbg', 'healthBarBG', 0, speed, 'circInOut')
    doTweenAlpha('healthbar', 'healthBar', 0, speed, 'circInOut')
    doTweenAlpha('staminabar', 'staminaBar', 0, speed, 'circInOut')
    doTweenAlpha('scoretext', 'scoreTxt', 0, speed, 'circInOut')
    doTweenAlpha('timebg', 'timeBarBG', 0, speed, 'circInOut')
    doTweenAlpha('timetext', 'timeTxt', 0, speed, 'circInOut')
    doTweenAlpha('timebar', 'timeBar', 0, speed, 'circInOut')
    doTweenAlpha('wholehud', 'camHUD', 0, speed, 'circInOut')
end