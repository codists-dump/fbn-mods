function onCreate()
    makeLuaSprite('whiteScreenLuther',0,0)
    setObjectCamera('whiteScreenLuther','hud')
    makeGraphic('whiteScreenLuther',screenWidth,screenHeight,'FFFFFF')
    setProperty('camGame.alpha','0.01')
    setProperty('camHUD.alpha',0.01)
    setProperty('dad.alpha',0.01)

    makeLuaText('SkipWarning','Press Space To Skip',screenWidth,0,0)
    setObjectCamera('SkipWarning','other')
    runTimer('deleteSkipWarning',4)
    addLuaText('SkipWarning')
end
function onTimerCompleted(tag)
    if tag == 'deleteSkipWarning' then
        doTweenAlpha('ByeSkipWarning','SkipWarning',0,1,'linear')
    end
end
function onTweenCompleted(tag)
    if tag == 'ByeSkipWarning' then
        removeLuaText('ByeSkipWarning',true)
    end
    if tag == 'byeScreenLuther' then
        if curStep < 496 then
            removeLuaSprite('whiteScreenLuther',false)
        else
            removeLuaSprite('whiteScreenLuther',true)
        end
    end
end
function onStepHit()
    if curStep == 121 then
        setProperty('camHUD.alpha',1)
        addLuaSprite('whiteScreenLuther',true)
        doTweenAlpha('byeScreenLuther','whiteScreenLuther',0,1,'linear')
    end
    if curStep == 228 then
        addLuaSprite('whiteScreenLuther',false)
        setProperty('whiteScreenLuther.alpha',1)
        doTweenAlpha('byeScreenLuther','whiteScreenLuther',0,1,'linear')
        setProperty('camGame.alpha',1)
    end
    if curStep == 336 then
        addLuaSprite('whiteScreenLuther',false)
        setProperty('whiteScreenLuther.alpha',1)
        doTweenAlpha('byeScreenLuther','whiteScreenLuther',0,1,'linear')
        setProperty('dad.alpha',1)
    end 
    if curStep == 495 then
        setProperty('camHUD.alpha',1)
        setProperty('camGame.alpha',1)
        addLuaSprite('whiteScreenLuther',false)
        setProperty('whiteScreenLuther.alpha',1)
        doTweenAlpha('byeScreenLuther','whiteScreenLuther',0,1,'linear')
        playSound('SpecialStage')
    end
end
function onUpdate()
    if keyPressed('space') and getSongPosition() < 40000 then
        setPropertyFromClass('Conductor', 'songPosition',40000)
        setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
        setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
        setProperty('camHUD.alpha',1)
        setProperty('camGame.alpha',1)
        setProperty('dad.alpha',1)
    end
end