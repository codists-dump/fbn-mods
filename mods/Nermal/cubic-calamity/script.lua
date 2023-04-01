local keepScroll = false
function onCreate()
    makeLuaSprite('black','',-100,0)
	makeGraphic('black',1500,1500,'000000')
    setObjectCamera('black', 'other')
    addLuaSprite('black', true)   
    visibility()

    if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
        keepScroll = true;
    elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
        setPropertyFromClass('ClientPrefs', 'middleScroll', true);
    end
end

function onDestroy()
    if keepScroll == false then
        setPropertyFromClass('ClientPrefs', 'middleScroll', false);
    elseif keepScroll == true then
        keepScroll = false;
    end
end


function onStepHit()
    if curBeat == 36 then
        noteTweenLol()
    elseif curBeat == 76 then
        cameraShake('game', 0.3, 0.15);
        cameraShake('hud', 0.3, 0.15);
    end
end

function onSongStart()
    doTweenAlpha('BLACK!!', 'black', 0, 1.8, 'linear');
    noteDissapear()
--whatever
end

function onEndSong()
    os.exit();
end

function opponentNoteHit()
    if dadName == 'boxnermal' then
        cameraShake('game', 0.08, 0.15);
        cameraShake('hud', 0.08, 0.15);
        health = getProperty('health')
        setProperty('health', health- 0.01);
    end
end

function visibility()
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('scoreTxt.visible', false)
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
end

function noteDissapear()
    noteTweenAlpha('note1lol', 0, 0, 0.5, 'linear')
    noteTweenAlpha('note2lol', 1, 0, 0.5, 'linear')
    noteTweenAlpha('note3lol', 2, 0, 0.5, 'linear')
    noteTweenAlpha('note4lol', 3, 0, 0.5, 'linear')
    noteTweenAlpha('note5lol', 4, 0, 0.5, 'linear')
    noteTweenAlpha('note6lol', 5, 0, 0.5, 'linear')
    noteTweenAlpha('note7lol', 6, 0, 0.5, 'linear')
    noteTweenAlpha('note8lol', 7, 0, 0.5, 'linear')
end

function noteTweenLol()
    noteTweenAlpha('note9lol', 4, 0.8, 0.5, 'linear')
    noteTweenAlpha('note10lol', 5, 0.8, 0.5, 'linear')
    noteTweenAlpha('note11lol', 6, 0.8, 0.5, 'linear')
    noteTweenAlpha('note12lol', 7, 0.8, 0.5, 'linear')
end