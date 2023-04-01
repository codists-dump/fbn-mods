--Codigo por Nickobelit (Este fue el mas facil sin duda)
function onCreate()
    GameOverActive = false
    enableEnd = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true       
        setProperty("camHUD.visible", false);
        runTimer('reinicia', 2)     
        runTimer('adiosGame', 0.5)
        if curStep < 1600 then
        triggerEvent('Play Animation','fadeOut', 'dad')
        else
        doTweenAlpha('adiosGame','camGame',0,0.2)
        end
 end   
    return Function_Stop;
end

function onUpdate(elapsed)
if GameOverActive then
       setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  )
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
        setPropertyFromClass('PlayState', 'instance.vocals.volume', 0)
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
        setPropertyFromClass('PlayState', 'instance.generatedMusic', false)--Este code encerio es god,me salvo de un bug ,grande Perez
end
end

function onTimerCompleted(tag)
   if tag == 'adiosGame' then
     setProperty("camGame.visible", false);
       end
   if tag == 'reinicia' then
      restartSong(true)
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