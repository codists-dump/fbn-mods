--Codigo por Nickobelit
function onCreate()
    GameOverActive = false
    enableEnd = false
    elije = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true  
        stopSound('trance')    
        setProperty("camGame.visible", false);
        setProperty("camHUD.visible", false);
        
        playSound('PS_Death',1)
	
	   
	   if difficultyName == 'Mx' then
       makeAnimatedLuaSprite('creppyDeath', 'UI/base/pasta/PN_LoseSprites', 565, 180)
	   addAnimationByPrefix('creppyDeath', 'cortinas', 'pastanight_LoseMX0', 24, false);
	  end
       if difficultyName == 'Hypno' then
       makeAnimatedLuaSprite('creppyDeath', 'UI/base/pasta/PN_LoseSprites', 570, 180)
       addAnimationByPrefix('creppyDeath', 'cortinas', 'pastanight_LoseHypno0', 24, false);
       end
       if difficultyName == 'Lord-X' then
       makeAnimatedLuaSprite('creppyDeath', 'UI/base/pasta/PN_LoseSprites', 585, 180)
       addAnimationByPrefix('creppyDeath', 'cortinas', 'pastanight_LoseLordX0', 24, false);
       end
	    addLuaSprite('creppyDeath', true)
	    setObjectCamera('creppyDeath', 'camOther')
	    setProperty('creppyDeath.antialiasing',false)
	   scaleObject('creppyDeath',3,3);
	
	    doTweenY('DeathY', 'creppyDeath', 100, 0.5,'quartOut')
	
	    makeAnimatedLuaSprite('bgRetry', 'UI/base/pasta/PN_GameOver', 225, -10)
	    addLuaSprite('bgRetry', true)
	    setObjectCamera('bgRetry', 'camOther')
	    setProperty('bgRetry.antialiasing',false)
	    scaleObject('bgRetry',3.3,3.3);
	          
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
	     
        runTimer('IniciaDeath',3)
        runTimer('holaCortinas',1.5)
        runTimer('chauCreppy',0.5)
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
   if tag == 'chauCreppy' then
   doTweenY('DeathY', 'creppyDeath', 800, 0.5,'quadIn')
end
   if tag == 'holaCortinas' then
   addAnimationByPrefix('bgRetry', 'cortinas', 'pastanight_curtains0', 24, false);
  objectPlayAnimation('bgRetry', 'cortinas', false);
  end
  if tag == 'IniciaDeath' then
     elije = true
     addAnimationByPrefix('bgRetry', 'retry', 'pastanight_curtains_retry', 24, false);
     objectPlayAnimation('bgRetry', 'retry', false);
     setProperty('restartButton.alpha', 1)
     setProperty('exitButton.alpha', 1)
end

  if tag == 'OtraOportunidad' then
     elije = false
     playSound('gameOverEnd')
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