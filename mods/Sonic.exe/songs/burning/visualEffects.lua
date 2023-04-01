function onCreate()
    precacheSound('SpecialStage')
    makeLuaSprite('whiteScreenBur',nil,0,0)
    setObjectCamera('whiteScreenBur','hud')
    setProperty('whiteScreenBur.alpha',0.001)
    makeGraphic('whiteScreenBur',screenWidth,screenHeight,'FFFFFF')

    makeLuaSprite('RedScreenBur',nil,0,0)
    setObjectCamera('RedScreenBur','hud')
    setProperty('RedScreenBur.alpha',0.001)
    makeGraphic('RedScreenBur',screenWidth,screenHeight,'FF0000')
end
function onStepHit()
    if curStep == 384 or curStep == 896 or curStep == 1536 or curStep == 1792 then
        addLuaSprite('RedScreenBur')
        setProperty('RedScreenBur.alpha',1)
        doTweenAlpha('byeRedBur','RedScreenBur',0,0.7,'linear')
        playSound('SpecialStage')
    end
    if curStep == 640 or curStep == 1152 or curStep == 2048 then
        addLuaSprite('whiteScreenBur')
        setProperty('whiteScreenBur.alpha',1)
        doTweenAlpha('byeWhiteBur','whiteScreenBur',0,0.7,'linear')
        playSound('SpecialStage')
    end
end
function onTweenCompleted(tag)
    if tag == 'byeRedBur' then
        removeLuaSprite('RedScreenBur',false)
    end
    if tag == 'byeWhiteBur' then
        removeLuaSprite('whiteScreenBur',false)
    end
end