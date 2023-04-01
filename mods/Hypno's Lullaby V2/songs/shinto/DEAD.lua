--Code por Perez Sen y Nickobelit
function onCreate()
    GameOverActive = false
    enableEnd = false
    GameOverState = 0
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true
		makeAnimatedLuaSprite('shintoRisaP','characters/shinto/shitno_assets',650,250)
		addAnimationByIndices('shintoRisaP', 'lost', 'shitno_lose','1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23',24)
		objectPlayAnimation('shintoRisaP', 'lost', true);
		scaleObject('shintoRisaP',6,6)
		setProperty('shintoRisaP.antialiasing', false);
		addLuaSprite('shintoRisaP',true)
		
    setProperty("boyfriend.visible", false);
    setProperty("dad.visible", false);
    setProperty("camHUD.visible", false);

     playSound('ShintoRetry')
     runTimer('AdiosSong', 1.5)
     end
    return Function_Stop;
end

function onUpdate(elapsed)
if GameOverActive then
      setPropertyFromClass('PlayState', 'instance.vocals.volume', 0)
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
        setPropertyFromClass('PlayState', 'instance.generatedMusic', false)
        setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  )
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
end
end

function onTimerCompleted(tag)
    if tag == 'AdiosSong' then
     setProperty("camGame.visible", false);
     exitSong(true);
     end
end

function onPause()
    if GameOverActive then
        return Function_Stop
    end
end

function onEndSong()
    if GameOverActive and not enableSong then
     return Function_Stop;
    end
    return Function_Continue;
end