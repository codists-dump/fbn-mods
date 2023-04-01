function onCreate()
    makeLuaSprite('wowYellow','',0,0)
    setObjectCamera('wowYellow','other')
    makeGraphic('wowYellow',screenWidth,screenHeight,'FFFF96')
    setBlendMode('wowYellow','add')
    addLuaSprite('wowYellow',true)
    setProperty('wowYellow.alpha',0.01)
end
function onStepHit()
    if curStep == 1008 then
        addLuaSprite('wowYellow')
        cameraShake('game',0.05,0.3)
        setProperty('wowYellow.alpha',1)
        playSound('SUPERBF')
        doTweenAlpha('yellowBye','wowYellow',0,0.5,'linear')
    end
end
function onTweenCompleted(tag)
    if tag == 'yellowBye' then
        removeLuaSprite('wowYellow',true)
    end
end