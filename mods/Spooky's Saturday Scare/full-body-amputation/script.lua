function onCreatePost()
    precacheImage('specimen9/Alert')
    setScrollFactor('boyfriend', 0.95, 1.75)
    setScrollFactor('dad', 0.95, 0.45)
    setProperty('dad.origin.x', getProperty('dad.origin.x') - 100)

    if getPropertyFromClass('ClientPrefs', 'mechanics') then
        makeLuaSprite('warnthing', 'song specific and bgs/specimen9/yeah', 0, 0)
        setProperty('warnthing.y', -getProperty('warnthing.height'))
        screenCenter('warnthing', 'x')
        setObjectCamera('warnthing', 'other')
        addLuaSprite('warnthing')
    end
end

function onSongStart()
    if getPropertyFromClass('ClientPrefs', 'mechanics') then
        doTweenY('warnappear', 'warnthing', 0, 0.1)
        runTimer('warnKill', 4.5)
    end
end

function onUpdatePost()
    zoom = (getProperty('camGame.zoom') * 3.2)
    dadZoom = (getProperty('camGame.zoom') * 1.8)

    setProperty('boyfriend.scale.x', zoom)
    setProperty('boyfriend.scale.y', zoom)
    if curStep >= 1 then
        setProperty('dad.scale.x', dadZoom)
        setProperty('dad.scale.y', dadZoom)
    end
end

function onBeatHit()
    if curBeat == 320 then
        doTweenZoom('omg', 'camGame', 0.7, 0.001)
        setProperty('cameraSpeed', 100)
    elseif curBeat == 325 then
        setProperty('cameraSpeed', 1)
    end
end

function onTweenCompleted(t)
    if t == 'omg' then
        doTweenZoom('omg2', 'camGame', 0.8, 9.33)
    end
    if t == 'warndie' then
        removeLuaSprite('warnthing')
    end
end

function onTimerCompleted(t,l,ll)
    if t == 'warnKill' then
        doTweenY('warndie', 'warnthing', -getProperty('warnthing.height'), 0.6, 'quadInOut')
    end
end