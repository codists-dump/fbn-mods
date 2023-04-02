function onCreate()
    makeLuaSprite('blackscreen', '', 0, 0)
    makeGraphic('blackscreen', 1280, 720, '000000')
    addLuaSprite('blackscreen', false)
    setScrollFactor('blackscreen', 0,0);
    triggerEvent('Alt Idle Animation', 'GF', '-alt')
    doTweenAlpha('bbb', 'blackscreen', 0, 1.9, 'quintIn')
    setScrollFactor('gfGroup', 0.4, 0.4)
    setObjectCamera('blackscreen', 'hud')
    setObjectOrder('gfGroup', 4);
    makeLuaSprite('flash', '', 0, 0)
    makeGraphic('flash', 1280, 720, 'FFFFFF')
    addLuaSprite('flash', false)
    setScrollFactor('flash', 0,0);
    setObjectCamera('flash', 'hud')
    setProperty('flash.visible', false)
    setScrollFactor('strumLineNotes', 0,0);
end

beatHitFuncs = {

    [30] = function()
        doTweenZoom('zoommm9', 'camGame', 0.9, 1.2, 'quintIn')
    end,

    [32] = function()
        setProperty('flash.visible', true)
        doTweenAlpha('flash1', 'flash', 0, 1, 'linear')
    end,

    [150] = function()
        setProperty('defaultCamZoom', 0.6)
    end,

    [152] = function()
        setProperty('defaultCamZoom', 0.5)
        setProperty('flash.visible', true)
        doTweenAlpha('flash1', 'flash', 0, 1, 'linear')
    end,

    [232] = function()
        setProperty('flash.visible', true)
        doTweenAlpha('flash1', 'flash', 0, 1, 'linear')
    end,


    [260] = function()
        triggerEvent('Play Animation', 'fall', 'GF')
        --triggerEvent('Camera Follow Pos', 1275, 500)
        noteTweenX('oppo0', 0, -1000, 1.5, 'quartInOut')
	    noteTweenX('oppo1', 1, -1000, 1.5, 'quartInOut')
	    noteTweenX('oppo2', 2, -1000, 1.5, 'quartInOut')
	    noteTweenX('oppo3', 3, -1000, 1.5, 'quartInOut')
    end,

    [264] = function()
        setProperty('defaultCamZoom', 0.55)
    end,

    [265] = function()
        setProperty('defaultCamZoom', 0.6)
    end,

    [266] = function()
        setProperty('defaultCamZoom', 0.65)
    end,

    [267] = function()
        setProperty('defaultCamZoom', 0.7)
    end,

    [268] = function()
        setProperty('defaultCamZoom', 0.75)
    end,

    [269] = function()
        setProperty('defaultCamZoom', 0.8)
    end,

    [270] = function()
        setProperty('defaultCamZoom', 0.85)
    end,

    [271] = function()
        setProperty('defaultCamZoom', 0.9)
    end,

    [272] = function()
        doTweenZoom('zoommm9', 'camGame', 1.1, 1.8, 'linear')
    end,

    [275] = function()
        setProperty('gfGroup.x', 805)
        setProperty('gfGroup.y', -75)
        setScrollFactor('gfGroup', 1, 1)
        setObjectOrder('gfGroup', 8);
        setProperty('gfGroup.visible', true)
        triggerEvent('Play Animation', 'rise', 'GF')
        triggerEvent('Alt Idle Animation', 'GF', '')
        setProperty('defaultCamZoom', 0.5)
    end,

    [276] = function()
        setProperty('flash.visible', true)
        doTweenAlpha('flash1', 'flash', 0, 1, 'linear')
    end,

    [390] = function()
        doTweenZoom('zoommm9', 'camGame', 0.9, 1.2, 'quintIn')
    end,

    [392] = function()
        setProperty('flash.visible', true)
        doTweenAlpha('flash1', 'flash', 0, 1, 'linear')
    end,

    [528] = function()
    setProperty('flash.visible', true)
    doTweenAlpha('flashfinale', 'flash', 0, 1.7, 'linear')
    end,
}

stepHitFuncs = {

    [128] = function()
        triggerEvent('Screen Shake', '7.1, 0.01', '')
    end,

    [608] = function()
        triggerEvent('Screen Shake', '7.1, 0.01', '')
    end,

    [928] = function()
        triggerEvent('Screen Shake', '7.1, 0.01', '')
    end,

    [1046] = function()
        setProperty('gfGroup.visible', false)
    end,
}

function onBeatHit()
    if beatHitFuncs[curBeat] then 
        beatHitFuncs[curBeat]() 
    end 
end

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() 
    end 
end

function onTweenCompleted(tag)
    if tag == 'flash1' then
        setProperty('flash.visible', false)
        doTweenAlpha('flashtonormal', 'flash', 1, 1, 'linear')
    elseif tag == 'flashfinale' then
        setProperty('flash.visible', false)
        doTweenAlpha('flashtonormal', 'flash', 1, 1, 'linear')
    end
end