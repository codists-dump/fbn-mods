function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'bffuckingdies');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'RigorSFX');
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'yeah');
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'retry');

    addCharacterToList('bffuckingdies', 'boyfriend')
end

function onUpdate()
    if curStep >= 0 then
        songPos = getSongPosition()
        local currentBeat = (songPos/1000)*(bpm/120)
        doTweenY(dadTweenY, 'dad', 680-30*math.sin((currentBeat*0.85)*math.pi),0.001)
    end
end

function onBeatHit()
    if curBeat == 20 or curBeat == 52 or curBeat == 148 or curBeat == 180 then
        doZoom(1, 0.48)
    end
end

function doZoom(strength, duration)
    doTweenZoom('camshitttt', 'camHUD', strength * 0.9, duration, 'circIn')
    if not mustHitSection then
        doTweenZoom('camshitt', 'camGame', strength - 0.1, duration, 'circIn')
    else
        doTweenZoom('camshitt', 'camGame', strength, duration, 'circIn')
    end
end

function onTweenCompleted(tag)
    if tag == 'camshitt' then
        doTweenZoom('camshitt2', 'camGame', getProperty('defaultCamZoom'), 0.2, 'cubeOut')
    end
end