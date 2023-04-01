--Codigo Por Nickobelit
local seenEndCutscene = false

function onCreate()
    GameOverActive = false
    enableEnd = false
end

function onGameOver()
    if not GameOverActive and not enableEnd and not seenEndCutscene then        
        setProperty("camGame.visible", false);
        setProperty("camHUD.visible", false);

        makeLuaSprite('DeathScreen', 'characters/death/frostbite/ScreenshotXD',0,0);
		scaleObject('DeathScreen',0.67,0.67)
		addLuaSprite('DeathScreen', true);
		setObjectCamera('DeathScreen', 'other')
		setProperty('DeathScreen.alpha', 0)

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
        runTimer('empiezaDeath', 1)
               startVideo('frostbiteDX');
               GameOverActive = true
               seenEndCutscene = true
end
return Function_Stop
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
if elije == false then
stopSound('Death')
end
end

function onTimerCompleted(tag)
   if tag == 'loopDeathMusic' then --Lo hago así porque no puedes ageegar musicas en este tipo de sistemas
   playSound('MtSilverLoop',1,'Death')
   runTimer('loopDeathMusic', 97)     
   end
   if tag == 'empiezaDeath' then
     elije = true
     playSound('MtSilverLoop',1,'Death')
     setProperty('DeathScreen.alpha', 1)
     setProperty('restartButton.alpha', 1)
     setProperty('exitButton.alpha', 1)
     runTimer('loopDeathMusic', 97)     
end   
  if tag == 'OtraOportunidad' then
     elije = false
     stopSound('Death')
     playSound('MtSilverEnd')
     setProperty('restartButton.alpha', 0)
     setProperty('exitButton.alpha', 0)
     objectPlayAnimation('confirm', 'confirmo', false);
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
