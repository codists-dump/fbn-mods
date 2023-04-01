--Code por Nickobelit
shake = false
function onCreate()
    GameOverActive = false
    enableEnd = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true
		makeLuaSprite('WigglyJumpscare', 'jumpscares/Wiggles', 0, 0);
        scaleObject('WigglyJumpscare', 1,1);
        addLuaSprite('WigglyJumpscare', true);
        setProperty('WigglyJumpscare.alpha',0)
        setObjectCamera("WigglyJumpscare", 'other')
        
    setProperty("camHUD.visible", false);
    setProperty("camGame.visible", false);
   
     runTimer('Boo', 3)
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
if shake == true then
cameraShake('other', 0.01, 0.8)
end
end

function onTimerCompleted(tag)
    if tag == 'Boo' then
     shake=true
     playSound('WigglyTuffJumpscare', 1)
     setProperty('WigglyJumpscare.alpha', 1)
     runTimer('endSong', 5)
     runTimer('adiosWiggles', 3.7)
     end
     if tag == 'adiosWiggles' then
  doTweenAlpha('adiosWigglesP','WigglyJumpscare',0,0.05)
  end
  if tag == 'endSong' then
   exitSong(true)
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