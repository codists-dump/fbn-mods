--Code por Nickobelit
function onCreate()
    GameOverActive = false
    enableEnd = false
    elije = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true
        cameraFlash('other', 'FF0000', 3)
        playSound('DT_Loss_SFX')
        setProperty("camGame.visible", false);
        setProperty("camHUD.visible", false);
   
		makeAnimatedLuaSprite('cMurioBFXD', 'characters/death/hellbell/hellbellDeath',-60,-100);
		addAnimationByPrefix('cMurioBFXD', 'idle', 'deathIdle', 24, false);
		addAnimationByPrefix('cMurioBFXD', 'lol', 'deathLol', 24, true);
		addAnimationByPrefix('cMurioBFXD', 'confirmoP', 'deathConfirm', 24, false);
		objectPlayAnimation('cMurioBFXD', 'idle', false);
		scaleObject('cMurioBFXD',1.7,1.7)
		addLuaSprite('cMurioBFXD', true);
		setObjectCamera('cMurioBFXD', 'other')
		setProperty('cMurioBFXD.alpha', 1)
        
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
		
		removeLuaSprite('dsgra',true)
		removeLuaSprite('ds',true)
		removeLuaSprite('dsbf',true)
        doTweenZoom('acercateCam','camOther',2.5,0.1,'quartOut')
        setProperty('exitButton.alpha', 1)
        runTimer('empiezaDeath', 1)
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
runTimer('otraOportunidad', 0.1)
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
playSound('DeathTollDeathAmbience',1,'Death')
runTimer('loopDeathMusic', 13)     
end

  if tag == 'empiezaDeath' then 
  doTweenX('BfDeathX','cMurioBFXD',100,1,'cubeOut')
  doTweenY('BfDeathY','cMurioBFXD',-40,1,'cubeOut')
  playSound('DeathTollDeathAmbience',1,'Death')
  objectPlayAnimation('cMurioBFXD', 'lol', false);
  doTweenZoom('alejateCam','camOther',1,2,'cubeOut')
  runTimer('loopDeathMusic', 13)
  elije = true
  end

  if tag == 'otraOportunidad' then
     elije = false
     stopSound('Death')
     playSound('gameOverEnd',1)
     objectPlayAnimation('cMurioBFXD', 'confirmoP', false);
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