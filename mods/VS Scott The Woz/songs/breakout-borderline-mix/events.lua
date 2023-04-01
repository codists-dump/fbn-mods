function onCreate() 
    makeLuaSprite('slideborder', 'empty', 0, 0)
	makeGraphic('slideborder', 1280, 720, '324bf4')
	setObjectCamera('slideborder', 'other')
	addLuaSprite('slideborder', true)
    setProperty('slideborder.alpha',1)
    setProperty('defaultCamZoom',2)

end

function onCreatePost()
    setProperty('camZooming', true)
end

function onSongStart()
    doTweenAlpha('alphablue','slideborder',0,1)
    doTweenZoom('lolcam','camGame',0.6,2)
end

function onTweenCompleted(tag)
    if tag == 'alphablue' then
        setProperty('slideborder.y',-900)
        setProperty('slideborder.alpha',1)
    end

    if tag == 'slider' then
        setProperty('slideborder.y',-900)
    end
end

function borderhit()
    doTweenY('slider','slideborder',900,0.5)
end

function onBeatHit()
    if curBeat >= 40 and curBeat < 76 then
        triggerEvent('Add Camera Zoom',0.05,0.05)
    end

    if curBeat >= 76 and curBeat < 148 then
        triggerEvent('Add Camera Zoom',0.02,0.02)
    end

    if curBeat >= 176 and curBeat < 210 then
        triggerEvent('Add Camera Zoom',0.05,0.05)
    end

    if curBeat >= 212 and curBeat < 246 then
        triggerEvent('Add Camera Zoom',0.05,0.05)
    end

    if curBeat >= 248 and curBeat < 282 then
        triggerEvent('Add Camera Zoom',0.035,0.03)
    end

end

function onStepHit()
    if curStep == 1135 then
        doTweenZoom('lolcam3','camGame',0.6,2)
    end

    if curStep >= 575 and curStep < 703 then
        triggerEvent('Add Camera Zoom',0.02,0.02)
    end

    if curStep == 703 then
        borderhit()
    end

    if curStep == 1135 then
        doTweenY('slider2','slideborder',0,0.5)
        doTweenZoom('lolcam2','camGame',0.6,3)
    end
end