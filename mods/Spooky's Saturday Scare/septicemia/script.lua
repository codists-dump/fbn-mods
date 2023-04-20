function onCreatePost()
    makeLuaSprite('dark', '', -1000, -1000)
    makeGraphic('dark', 2000, 2000, '000000')
    scaleObject('dark', 10, 10)
    setProperty('dark.alpha', 0.8)
    addLuaSprite('dark', true)
    setProperty('dad.alpha', 0)

    setScrollFactor('boyfriend', 0.95, 1.4)

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', -1000)
    end
end

function onUpdatePost()
    if curBeat < 8 then
        hudDisable(true)
    end
end

function onBeatHit()
    if curBeat == 72 then
        removeLuaSprite('dark')
        setProperty('bg.alpha', 1)
        doTweenY('shit', 'boyfriend', 620, 1)
        setProperty('dad.alpha', 1)
    end
    if curBeat == 136 then
        hudDisable(false)
    end
end

function hudDisable(sexy)
    if sexy == true then
        setProperty('healthBarBG.alpha', 0)
        setProperty('healthBar.alpha', 0)
        setProperty('staminaBar.alpha', 0)
        setProperty('timeBar.alpha', 0)
        setProperty('timeBarBG.alpha', 0)
        setProperty('timeTxt.alpha', 0)
        setProperty('scoreTxt.alpha', 0)
    else
        doTweenAlpha('health', 'healthBar', 1, 0.4)
        doTweenAlpha('healthbg', 'healthBarBG', 1, 0.4)
        doTweenAlpha('stamina', 'staminaBar', 1, 0.4)
        doTweenAlpha('timebar', 'timeBar', 1, 0.4)
        doTweenAlpha('timebg', 'timeBarBG', 1, 0.4)
        doTweenAlpha('time', 'timeTxt', 1, 0.4)
        doTweenAlpha('score', 'scoreTxt', 1, 0.4)
    end
end