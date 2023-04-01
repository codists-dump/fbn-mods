--Codigo Por Nickobelit
function onCreate()
    GameOverActive = false
    enableEnd = false
    elije = false
end

function onGameOver()
    if not GameOverActive and not enableEnd then
        GameOverActive = true
        cam = true
        triggerEvent('Camera Follow Pos',340,810)
        doTweenZoom('acercateCam','camGame',1.1,0.1,'cubeOut')
        stopSound('trance')
        setProperty("boyfriend.visible", false);
        doTweenAlpha('adiosCueva', 'cave', 0, 2, 'linear');
        doTweenAlpha('adiosdad', 'dadGroup', 0, 2, 'linear');
        doTweenAlpha('adiosHUD', 'camHUD', 0, 2, 'linear');      
        doTweenAlpha('adiosbf', 'bf', 0, 2, 'linear');
		
	    makeAnimatedLuaSprite('GfDead', 'characters/death/gf/gameover',20, 570);
		addAnimationByPrefix('GfDead', 'death', 'firstDeath', 24, false);
		addAnimationByPrefix('GfDead', 'loop', 'loop', 24, true);
		addAnimationByPrefix('GfDead', 'confirmoP', 'confirm', 24, false);
		objectPlayAnimation('GfDead', 'death', false);
		addLuaSprite('GfDead', true);
		scaleObject('GfDead',1,1)
		setObjectCamera('GfDead', 'game')
		setProperty('GfDead.alpha', 1)
	
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
        runTimer('empiezaDeath', 4)
 end   
    return Function_Stop;
end

function onUpdate(elapsed)
if cam == true then
setProperty('defaultCamZoom',1.1)
end
if cam2 == true then
setProperty('defaultCamZoom',1.25)
end
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
playSound('LostCauseLoop',1,'Death')
runTimer('loopDeathMusic', 55)     
end

if tag == 'empiezaDeath' then
doTweenZoom('acercateCam','camGame',1.25,2,'cubeOut')
playSound('LostCauseLoop',1,'Death')
objectPlayAnimation('GfDead', 'loop', false);
setProperty('restartButton.alpha', 1)
setProperty('exitButton.alpha', 1)
setProperty('GfDead.offset.x',-100)
setProperty('GfDead.offset.y',0)
runTimer('loopDeathMusic', 55)     
cam2 = true
elije = true
end

  if tag == 'OtraOportunidad' then
     elije = false
     doTweenAlpha('adiosJuego', 'camGame', 0, 2, 'linear');
     doTweenZoom('acercateCam','camGame',0.8,5,'cubeOut')
     playSound('LostCauseEnd')
     objectPlayAnimation('GfDead', 'confirmoP', false);
     setProperty('GfDead.offset.x',-10)
     setProperty('GfDead.offset.y',200)
     setProperty('restartButton.alpha', 0)
     setProperty('exitButton.alpha', 0)
     runTimer('reinicia', 5.5)     
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