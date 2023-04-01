--Codigo por Nickobelit
function onCreate()
    GameOverActive = false
    enableEnd = false
    elije = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true      
        setProperty("camGame.visible", false);
        setProperty("camHUD.visible", false);
        
        makeAnimatedLuaSprite('retry', 'characters/death/bygone/retry',400, 260);
		addAnimationByPrefix('retry', 'retry', 'Retry instance 1', 24, true);
		objectPlayAnimation('retry', 'retry', false);
		scaleObject('retry',0.7,0.7)
		addLuaSprite('retry', true);
		setObjectCamera('retry', 'other')
		setProperty('retry.alpha', 0)
		
		makeAnimatedLuaSprite('confirm', 'characters/death/bygone/Confirm',430, 0);
		addAnimationByPrefix('confirm', 'confirmo', 'Confirm instance 1', 24, false);
		addLuaSprite('confirm', true);
		scaleObject('confirm',1,1)
		setObjectCamera('confirm', 'other')
		setProperty('confirm.alpha', 0)
        
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
        
        makeAnimatedLuaSprite('alexisPoof', 'characters/death/bygone/GGirl_Poof', 780, 100);        
        addAnimationByPrefix('alexisPoof', 'chau', 'GGirlPoof', 24, false);
        objectPlayAnimation('alexisPoof', 'chau', false);
        scaleObject('alexisPoof', 0.9, 0.9);
	    addLuaSprite('alexisPoof', true);
	    setObjectCamera('alexisPoof', 'other');
	    setProperty('alexisPoof.alpha', 0)
	
        if curStep > 711 then
        elije = false
        objectPlayAnimation('alexisPoof', 'chau', false)
        playSound('bygonedeathNoise',1)
        setProperty('alexisPoof.alpha', 1)
        runTimer('IniciaDeath',1.5)
        else
        elije = true
        cameraFlash('other', 'FF0000', 1.5)
        playSound('bygonedeathmusic',1,'Death')
        doTweenAlpha('holaRetry', 'retry', 1, 2, 'linear');
        setProperty('restartButton.alpha', 1)
        setProperty('exitButton.alpha', 1)
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
        setPropertyFromClass('PlayState', 'instance.generatedMusic', false)--Este code encerio es god,me salvó de un bug ,grande Perez
end
if elije == true and (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1282) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or elije == true and keyJustPressed('accept') then
objectPlayAnimation('restartButton', 'xPress', false);
runTimer('DeGrandeAPequeñoXD', 0.1)
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
playSound('bygonedeathmusic',1,'Death')
runTimer('loopDeathMusic', 100)     
end
  if tag == 'IniciaDeath' then
   elije = true
   setProperty('alexisPoof.alpha', 0)
   doTweenAlpha('holaRetry', 'retry', 1, 3, 'linear');
   playSound('bygonedeathmusic',1,'Death')
   setProperty('restartButton.alpha', 1)
     setProperty('exitButton.alpha', 1)
end

  if tag == 'DeGrandeAPequeñoXD' then
     elije = false
     stopSound('Death')
     playSound('bygoneconfirm')
     setProperty('confirm.alpha', 1)
     setProperty('retry.alpha', 0)
     setProperty('restartButton.alpha', 0)
     setProperty('exitButton.alpha', 0)
     objectPlayAnimation('confirm', 'confirmo', false);
     runTimer('loopDeathMusic', 100)     
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