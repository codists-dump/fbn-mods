--Code por Nickobelit y Perez Sen
function onCreate()
    GameOverActive = false
    enableEnd = false
    GameOverState = 0
end

function onGameOver()
    if not GameOverActive and not enableEnd then
         GameOverActive = true
        makeLuaSprite('ShitnoConOjosHiperrealistas', 'jumpscares/Shitno', 0, 0);
        scaleObject('ShitnoConOjosHiperrealistas', 0.325,0.325);
        addLuaSprite('ShitnoConOjosHiperrealistas', true);
        setObjectCamera('ShitnoConOjosHiperrealistas', 'other');
        setProperty('ShitnoConOjosHiperrealistas.alpha',0)
        setProperty("camHUD.visible", false);
        setProperty("camGame.visible", false);    
     runTimer('holaShitno', 2)
     runTimer('adiosShitno', 4)
     runTimer('AdiosSong', 5)
end
return Function_Stop;
end

function onUpdate(elapsed)
if GameOverActive then
        cameraShake('other', 0.05, 0.2)
        setPropertyFromClass('PlayState', 'instance.vocals.volume', 0)
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
        setPropertyFromClass('PlayState', 'instance.generatedMusic', false)
        setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  )
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
end
end

function onTimerCompleted(tag)
    if tag == 'holaShitno' then
    setProperty('ShitnoConOjosHiperrealistas.alpha', 1)
    playSound('Shitno-Death')
    end
    if tag == 'adiosShitno' then
    doTweenAlpha('adiosShitnoP','ShitnoConOjosHiperrealistas',0,0.05)
    end
    if tag == 'AdiosSong' then
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

