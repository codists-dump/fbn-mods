
function onCreate()

    makeLuaSprite('blackscreenSlow','',0,0)
    setObjectCamera('blackscreenSlow','hud')
    makeGraphic('blackscreenSlow',screenWidth,screenHeight,'000000')
    setProperty('blackscreenSlow.alpha',0.001)


    makeLuaSprite('RedScreenSlow','',0,0)
    setObjectCamera('RedScreenSlow','hud')
    makeGraphic('RedScreenSlow',screenWidth,screenHeight,'FF0000')
    setBlendMode('RedScreenSlow','add')
    setProperty('RedScreenSlow.alpha',0.001)


    makeLuaSprite('WhiteScreenSlow','',0,0)
    setObjectCamera('WhiteScreenSlow','hud')
    makeGraphic('WhiteScreenSlow',screenWidth,screenHeight,'FFFFFF')
    setProperty('WhiteScreenSlow.alpha',0.001)
    
end
function onStepHit()
    if curStep == 384 then
        addLuaSprite('blackscreenSlow',false)
        setProperty('blackscreenSlow.alpha',1)
    end
    if curStep == 400 then
        addLuaSprite('RedScreenSlow',false)
        setProperty('RedScreenSlow.alpha',1)
        doTweenAlpha('byeRedSlow','RedScreenSlow',0,0.5,'linear')
        doTweenAlpha('byeBlackSlow','blackscreenSlow',0,0.5,'linear')
    end
    if curStep == 544 or curStep == 928 or curStep == 1056 or curStep == 1312 or curStep == 1504 then
        addLuaSprite('WhiteScreenSlow',false)
        setProperty('WhiteScreenSlow.alpha',1)
        doTweenAlpha('byeWhiteSlow','WhiteScreenSlow',0,0.3,'linear')
    end
end
function onTweenCompleted(tag)
    if tag == 'byeRedSlow' then
        removeLuaSprite('RedScreenSlow',true)
    end
    if tag == 'byeBlackSlow' then
        removeLuaSprite('blackscreenSlow',true)
    end
    if tag == 'byeWhiteSlow' then
        removeLuaSprite('WhiteScreenSlow',false)
    end
end
