--Codigo Por Nickobelit
function onCreate()
    GameOverActive = false
    enableEnd = false
    elije = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true
        elije = true
        stopSound('trance')
        cameraFlash('other', 'FF0000', 1)
        setProperty("camGame.visible", false);
        setProperty("camHUD.visible", false);
               
        makeLuaSprite('bgDeath', 'characters/death/gf/bgDeathLullaby',-180, -50);
		scaleObject('bgDeath',1.4,1.4)
		addLuaSprite('bgDeath', true);
		setObjectCamera('bgDeath', 'other')
		setProperty('bgDeath.alpha', 1)
		
	    makeAnimatedLuaSprite('hypnoMano', 'characters/death/gf/claw',-150, 200);
		addAnimationByPrefix('hypnoMano', 'idle', 'claw', 24, true);
		objectPlayAnimation('hypnoMano', 'idle', false);
		addLuaSprite('hypnoMano', true);
		scaleObject('hypnoMano',0.7,0.7)
		setObjectCamera('hypnoMano', 'other')
		setProperty('hypnoMano.alpha', 1)
		
		makeAnimatedLuaSprite('gfHypnosis', 'characters/death/gf/gf',700, 70);
		addAnimationByPrefix('gfHypnosis', 'opening', 'GF_DIZZLE_OPENING instance 1', 24, false);
		addAnimationByPrefix('gfHypnosis', 'idle', 'GF_DIZZLE_LOOP instance 1', 24, true);
		addAnimationByPrefix('gfHypnosis', 'wakywaky', 'GF_WAKEUP instance 1', 24, false);
		objectPlayAnimation('gfHypnosis', 'opening', false);
		addLuaSprite('gfHypnosis', true);
		setObjectCamera('gfHypnosis', 'other')
		setProperty('gfHypnosis.alpha', 1)
		
		makeAnimatedLuaSprite('gfRetry', 'characters/death/gf/gf_gameover',100, 350);
		addAnimationByPrefix('gfRetry', 'opening', "gameover_start' instance 1", 24, false)--No caere con esa comilla B-)
		addAnimationByPrefix('gfRetry', 'idle', 'gameover_concept instance 1', 24, true);
		addAnimationByPrefix('gfRetry', 'end', 'gameover_over instance 1', 24, false);
		objectPlayAnimation('gfRetry', 'opening', false);
		addLuaSprite('gfRetry', true);
		scaleObject('gfRetry',0.9,0.9)
		setObjectCamera('gfRetry', 'other')
		setProperty('gfRetry.alpha', 1)
	
		makeAnimatedLuaSprite('restartButton', 'pauseScreen/virtualbuttons',1150, 588);
		addAnimationByPrefix('restartButton', 'x', 'x', 24, false);
		addAnimationByPrefix('restartButton', 'xPress', 'xPressed', 24, false);
		addLuaSprite('restartButton', true);
		setObjectCamera('restartButton', 'other')
		setProperty('restartButton.alpha', 1)
		
		makeAnimatedLuaSprite('exitButton', 'pauseScreen/virtualbuttons', 0, 588);
		addAnimationByPrefix('exitButton', 'b', 'b', 24, false);
		addAnimationByPrefix('exitButton', 'bPress', 'bPressed', 24, false);
		addLuaSprite('exitButton', true);
		setObjectCamera('exitButton', 'other')
        setProperty('exitButton.alpha', 1)
        runTimer('empiezaDeath', 0.2)
 end   
    return Function_Stop;
end

function onUpdate(elapsed)
if GameOverActive then
        removeLuaSprite('BotonPendulo', true)
        setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  )
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
        setPropertyFromClass('PlayState', 'instance.vocals.volume', 0)
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
        setPropertyFromClass('PlayState', 'instance.generatedMusic', false)--Este code encerio es god,me salvó de un bug ,grande Perez
end
if elije == true and (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1282) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or elije == true and keyJustPressed('accept') then
objectPlayAnimation('restartButton', 'xPress', false);
runTimer('OtraOportunidad', 0.1)
end
if elije == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or elije == true and keyJustPressed('back') then
objectPlayAnimation('exitButton', 'bPress', false);
runTimer('adiosP', 0.1)
end
end

function onTimerCompleted(tag)   
if tag == 'empiezaDeath' then
objectPlayAnimation('gfHypnosis', 'idle', false);
objectPlayAnimation('gfRetry', 'idle', false);
end
  if tag == 'OtraOportunidad' then
     elije = false
     playSound('gameOverEnd')
     setProperty('gfRetry.offset.x',140)
     setProperty('gfRetry.offset.y',40)
     setProperty('gfHypnosis.offset.x',50)
     setProperty('gfHypnosis.offset.y',0)
     objectPlayAnimation('gfHypnosis', 'wakywaky', false);
     objectPlayAnimation('gfRetry', 'end', false);     
     setProperty('restartButton.alpha', 0)
     setProperty('exitButton.alpha', 0)
     runTimer('reinicia', 3)     
     runTimer('adiosOther', 2)     
     end

   if tag == 'adiosOther' then
   doTweenAlpha('adiosOther', 'camOther', 0, 1, 'linear');
end

   if tag == 'reinicia' then
      restartSong(true)
    end

    if tag == 'adiosP' then
      elije = false
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