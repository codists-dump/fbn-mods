function onCreate()
    GameOverActive = false
    enableEnd = false
    elije = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
    GameOverActive = true
    doTweenY("boyfriend", "boyfriend", 1450, 2, "quadOut");
    triggerEvent('Screen Shake', '1, 0.01', '0.1');
    playSound('buryman-death/buriedDeath');
    doTweenAlpha('camGame', 'camGame',0, 0.01, 'quadOut');
    setProperty("camHUD.visible", false);
    doTweenAlpha('camGame', 'camGame', 1, 3.5, 'quadOut');
    triggerEvent('Play Animation','asco', 'bf')
        
        makeAnimatedLuaSprite('buriedLunchXD','characters/buried/BA_DeathRetry',430,250)
		addAnimationByPrefix('buriedLunchXD', 'death', 'buried_death', 24, false);
		objectPlayAnimation('buriedLunchXD', 'death', false);
		setObjectCamera('buriedLunchXD','other')
		scaleObject('buriedLunchXD',3,3)
		addLuaSprite('buriedLunchXD', true)
		setProperty('buriedLunchXD.alpha', 0)
		
		makeAnimatedLuaSprite('Retry','characters/buried/BA_DeathRetry',430,50)
		addAnimationByPrefix('Retry', 'retry', 'BA_retry0', 24, true);
		addAnimationByPrefix('Retry', 'confirmo', 'BA_retry_confirm', 24, false);
		objectPlayAnimation('Retry', 'retry', false);
		setObjectCamera('Retry','other')
		scaleObject('Retry',3,3)
		addLuaSprite('Retry', true)
		setProperty('Retry.alpha', 0)
		
		makeAnimatedLuaSprite('restartButton', 'pauseScreen/virtualbuttons',1150, 588);
		addAnimationByPrefix('restartButton', 'x', 'x', 24, false);
		addAnimationByPrefix('restartButton', 'xPress', 'xPressed', 24, false);
		addLuaSprite('restartButton', true);
		setObjectCamera('restartButton', 'other')
		setProperty('restartButton.alpha', 0)
		
		makeAnimatedLuaSprite('exitButton', 'pauseScreen/virtualbuttons', 0, 588);
		addAnimationByPrefix('exitButton', 'b', 'b', 24, false);
		addAnimationByPrefix('exitButton', 'bPress', 'bPressed', 24, false);
		addLuaSprite('exitButton', true);
		setObjectCamera('exitButton', 'other')
        setProperty('exitButton.alpha', 0)
		
        runTimer('iniciaDEAD', 0.8)
        runTimer('animBF', 0.4)
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
        setPropertyFromClass('PlayState', 'instance.generatedMusic', false)--Este code encerio es god,me salvó de un bug ,grande Perez
end
if elije == true and (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1282) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or elije == true and keyJustPressed('accept') then
objectPlayAnimation('restartButton', 'xPress', false);
runTimer('UltimoDialogo', 0.1)
end
if elije == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or elije == true and keyJustPressed('back') then
objectPlayAnimation('exitButton', 'bPress', false);
runTimer('adiosP', 0.1)
end
end

function onTimerCompleted(tag)
    if tag == 'LoopBuriedDeath' then
      objectPlayAnimation('buriedLunchXD', 'death', false);
      runTimer('LoopBuriedDeath', 3.5)
    end
    if tag == 'animBF' then
    triggerEvent('Play Animation','asco', 'bf')
    triggerEvent('Screen Shake', '1, 0.01', '0.1');
     end
    if tag == 'iniciaDEAD' then      
      playSound('buryman-death/buriedThud');     
      setProperty("camGame.visible", false);
      runTimer('hablaBuried', 0.8)
     end
      if tag == 'hablaBuried' then
      playSound('buryman-death/BA0');
      runTimer('empiezaLunchXD', 3)
      end
      if tag == 'empiezaLunchXD' then
      playSound('buryman-death/BurymanDeath',1,'Death');
      doTweenAlpha('holaBuriedLunch', 'buriedLunchXD', 1, 0.5, 'linear');    
      doTweenAlpha('holaRetry', 'Retry', 1, 0.5, 'linear');
      doTweenAlpha('holaBoton1', 'restartButton', 1, 0.5, 'linear');
      doTweenAlpha('holaBoton2', 'exitButton', 1, 0.5, 'linear');
      objectPlayAnimation('buriedLunchXD', 'death', false);
      objectPlayAnimation('Retry', 'retry', false);     
      runTimer('LoopBuriedDeath', 3.5)
      runTimer('elije', 1)     
end

  if tag == 'elije' then
      elije = true
      setProperty('restartButton.alpha', 1)
      setProperty('exitButton.alpha', 1)
      end

  if tag == 'UltimoDialogo' then
     elije = false
     stopSound('Death')
     playSound('gameOverEnd',1)
     setProperty('restartButton.alpha', 0)
     setProperty('exitButton.alpha', 0)
     objectPlayAnimation('Retry', 'confirmo', false);
     doTweenAlpha('adiosOther', 'camOther', 0, 1, 'linear');    
     runTimer('reinicia', 3)     
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