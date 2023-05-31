local sickbeats = false
local SICKERBEATSWTF = false

local gfZoom = 1.7

local smugisth = false

local doFunny = true

local yoffseter = 0

local ogOffset = 1

function onCreate()
    setProperty("camZooming", false)

    addCharacterToList("codist-says-speak")

    if downscroll then yoffseter = 240 end
    if downscroll then makeLuaSprite('indicator', 'indicator_you_down', 270, 200+yoffseter)
    else makeLuaSprite('indicator', 'indicator_you', 270, 200) end
    
    setObjectCamera('indicator', 'hud')
    setProperty("indicator.visible", false)
    setProperty("indicator.alpha", 0)

    if middlescroll then 
        doFunny = false 
        ogOffset = 0.4
    end

    addLuaSprite('indicator')
end

function onSongStart()
	setProperty("indicator.visible", true)

    if doFunny then
        doTweenAlpha("indicatorALPHA", "indicator", 1, 0.4, "circOut")
    end
end

function onStepHit()
    if curStep == 42 then
        doTweenAlpha("indicatorALPHABACK", "indicator", 0, 0.4, "circOut")
    end

    if curStep == 58 then
        fadeHud(true)

        triggerEvent("Change Character", "dad", "codist-says-speak")
        characterPlayAnim("dad", "talk1", true)
    end

    if curStep == 60 then
        characterPlayAnim("dad", "die", true)
    end

    if curStep == 64 then
        doTweenZoom("camZOomererererere", "camGame", 1.3, 2, "circOut")
    end

    if curStep == 61 then
        characterPlayAnim("dad", "talk1", true)
    end

    if curStep == 82 then
        characterPlayAnim("dad", "die", true)
    end

    if curStep == 87 then
        characterPlayAnim("dad", "talk2", true)
    end

    if curStep == 94 then
        characterPlayAnim("dad", "throw", true)
    end

    if curStep == 95 then
        oldPos = getProperty("gfspr.x")
        
        setProperty("gfspr.x", oldPos+50)
        setProperty("gfspr.visible", true)

        doTweenX("gfx", "gfspr", oldPos, 0.2, "circOut")
    end

    if curStep == 97 then
        characterPlayAnim("dad", "talk3", true)
    end

    if curStep == 100 then
        triggerEvent("Camera Follow Pos", 280, 460)
        
        doTweenZoom("camZOomer", "camGame", gfZoom, 2, "circOut")
    end

    if curStep == 106 then
        characterPlayAnim("dad", "proud", true)
    end

    if curStep == 111 then
        characterPlayAnim("dad", "talk4", true)
    end
    
    local gfspd = 0.01
    if curStep == 120 then doTweenZoom("camZOomer1", "camGame", gfZoom+0.15, gfspd) end
    if curStep == 123 then doTweenZoom("camZOomer2", "camGame", gfZoom+0.4, gfspd) end
    if curStep == 126 then doTweenZoom("camZOomer3", "camGame", gfZoom+1.5, gfspd) end
    
    if curStep == 126 then fadeHud(false) end

    if curStep == 128 then
        triggerEvent("Camera Follow Pos")

        setProperty("camZooming", true)

        triggerEvent("Change Character", "dad", "codist-says")
    end

    if curStep == 255 then
        sickbeats = true
    end

    if curStep == 495 then
        setProperty("camZooming", false)

        sickbeats = false
        SICKERBEATSWTF = false
    end

    if curStep == 512 then
        sickbeats = false
        SICKERBEATSWTF = true
    end

    if curStep == 762 then
        sickbeats = false
        SICKERBEATSWTF = false
    end

    if curStep == 884 then
        triggerEvent("Change Character", "dad", "codist-says-speak")
        characterPlayAnim("dad", "talk5", true)
    end

    if curStep == 888 then
        oldPos = getProperty("boyfriend.y")
        speed = 0.6

        setProperty("boyfriend.scale.x", 1.8)
        setProperty("boyfriend.scale.y", 0.6)
        setProperty("boyfriend.y", oldPos + 80)
        
        doTweenX("boyfriendscalex", "boyfriend.scale", 1, speed, "bounceOut")
        doTweenY("boyfriendscaley", "boyfriend.scale", 1, speed, "bounceOut")
        
        doTweenY("boyfriendscaposit", "boyfriend", oldPos, speed, "bounceOut")

        smugisth = true
    end

    if curStep == 895 then
        triggerEvent("Change Character", "dad", "codist-says-speak")
        characterPlayAnim("dad", "talk6", true)
    end
end

function onBeatHit()
    if sickbeats then
        if curBeat % 2 == 0 then triggerEvent("Add Camera Zoom") end
    end

    if SICKERBEATSWTF then
        triggerEvent("Add Camera Zoom")
    end
end

function onUpdatePost()
    if smugisth then
        characterPlayAnim("boyfriend", "smug", true)
    end
end

function fadeHud(into)
    fadeHudElement("timeBar", into)
    fadeHudElement("timeBarBG", into)
    fadeHudElement("healthBar", into)
    fadeHudElement("healthBarBG", into)
    fadeHudElement("iconP1", into)
    fadeHudElement("iconP2", into)
    fadeHudElement("timeTxt", into)
    fadeHudElement("scoreTxt", into)

    for i=1,8,1 do
        if into then
            noteTweenAlpha("notetween"..i, i, 0, 0.2, "linear")
        else
            local alpha = 1
            if i < 4 or i >= 8 then
                alpha = ogOffset
            end

            noteTweenAlpha("notetween"..i, i, alpha, 0.2, "linear")
        end
    end
end

function fadeHudElement(object, into)
    if into then
        setProperty(object..".alpha", 1)
        doTweenAlpha("tween"..object, object, 0, 0.2)
    else
        setProperty(object..".alpha", 0)
        doTweenAlpha("tween"..object, object, 1, 0.2)
    end
end

function onTweenCompleted(tag)
	-- A tween you called has been completed, value "tag" is it's tag
    if tag == "indicatorUP" or tag == "indicatorALPHA" then
        doTweenY("indictaorDOWN", "indicator", 210+yoffseter, 0.8, "quadInOut")
    end

    if tag == "indictaorDOWN" then
        doTweenY("indicatorUP", "indicator", 190+yoffseter, 0.8, "quadInOut")
    end
end
