--Code por Nickobelit

function onCreate()
    GameOverActive = false
    enableEnd = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true
		makeAnimatedLuaSprite('mikeDead','characters/death/mike/Red_Game_Over_Assets_culosfortnite',0,0)--XD?
		setObjectCamera('mikeDead','other')
		scaleObject('mikeDead',2.5,2.5)
		addLuaSprite('mikeDead',true)
		setProperty('mikeDead.alpha', 0)

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
        
        makeLuaSprite('redoverlay', 'stages/mikes-room/redoverlay', 0, 0);
	    scaleObject('redoverlay', 0.9, 0.9);
	    addLuaSprite('redoverlay', true);
	    setObjectCamera('redoverlay', 'other')
	    setProperty('redoverlay.alpha', 0)

       doTweenAlpha('adiosJuego', 'camGame', 0, 0.5)
       doTweenAlpha('adiosHUD', 'camHUD', 0, 0.5)
  
    runTimer('EmpiezaDeath', 3)  
     end
    return Function_Stop;
end

elije = false
function onUpdate(elapsed)
if GameOverActive then
      setPropertyFromClass('PlayState', 'instance.vocals.volume', 0)
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
        setPropertyFromClass('PlayState', 'instance.generatedMusic', false)--Este code encerio es god,me salvó de un bug ,grande Perez
        setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  ) 
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
end

if elije == true and (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1282) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or elije == true and keyJustPressed('accept') then
objectPlayAnimation('restartButton', 'xPress', false);
runTimer('animConfirmo', 0.1)
end
if elije == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or elije == true and keyJustPressed('back') then
objectPlayAnimation('exitButton', 'bPress', false);
runTimer('adiosP', 0.1)
end
end

function onTimerCompleted(tag)
      if tag == 'EmpiezaDeath' then
     addAnimationByPrefix('mikeDead', 'death', 'Death', 24, false);
     objectPlayAnimation('mikeDead', 'death', false);
     doTweenAlpha('holaDeath', 'mikeDead', 1, 0.3)
     setProperty('redoverlay.alpha', 1)
     playSound('DissensionDeath',1)
     runTimer('adiosOverlay', 0.5)
     runTimer('MomentoReintentar', 4)      
     end
     
    if tag == 'adiosOverlay' then
     doTweenAlpha('adiosRed', 'redoverlay', 0, 0.3)
    end

    if tag == 'MomentoReintentar' then
     addAnimationByPrefix('mikeDead', 'loop', 'Dead Loop', 24, true);
     objectPlayAnimation('mikeDead', 'loop', false);
     setProperty('restartButton.alpha', 1)
     setProperty('exitButton.alpha', 1)
     elije = true
     end

    if tag == 'animConfirmo' then
     elije = false
     playSound('gameOverEnd',1)
     addAnimationByPrefix('mikeDead', 'confirmop', 'Confirm', 24, false);
     objectPlayAnimation('mikeDead', 'confirmop', true);
     runTimer('reinicia', 3)
     setProperty('restartButton.alpha', 0)
     setProperty('exitButton.alpha', 0)
     runTimer('adiosDeath', 1.5)
     end

     if tag == 'adiosDeath' then--Detalles P
     doTweenAlpha('adiosDeath', 'mikeDead', 0, 1)
     end

    if tag == 'reinicia' then
      restartSong(true)
    end

    if tag == 'adiosP' then
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