--Codigo por Laztrix y Nickobelit
local xx = 150;--Enemigo
local yy = 400;--Enemigo
local xx2 = 150;--Tu p
local yy2 = 400;--Tu p
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;

adiosSong = false
adiosHUD = false
porSiAcaso = false
adiosMusica = false
function onCreatePost()
makeAnimatedLuaSprite('feraligatr', 'characters/silver/Feralisleep', -790,-145);
    addAnimationByPrefix('feraligatr', 'idle', 'Feralisleep instance 1', 18, true);
    objectPlayAnimation('feraligatr', 'idle', false);
    scaleObject('feraligatr', 2,2);
    setObjectCamera('feraligatr','game')
    addLuaSprite('feraligatr', false)
    setProperty('feraligatr.alpha', 0)
    
    makeAnimatedLuaSprite('silver', 'stages/feralisleep/Silver Ending Animation', -75,95);
    addAnimationByPrefix('silver', 'scaryJumpscare', 'Silver instancia 1', 24, false);
    objectPlayAnimation('silver', 'scaryJumpscare', false);
    scaleObject('silver', 1,1);
    setObjectCamera('silver','game')
    addLuaSprite('silver', false)
    setProperty('silver.alpha', 0)

    makeAnimatedLuaSprite('feraligatrJumpscare', 'stages/feralisleep/Feraligatr Ending Animation', -1500,-510);
    addAnimationByPrefix('feraligatrJumpscare', 'scaryJumpscare', 'Feraligatr', 24, false);
    objectPlayAnimation('feraligatrJumpscare', 'scaryJumpscare', false);
    scaleObject('feraligatrJumpscare', 2,2);
    setObjectCamera('feraligatrJumpscare','game')
    addLuaSprite('feraligatrJumpscare', true)
    setProperty('feraligatrJumpscare.alpha', 0)
end

function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then               
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then               
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
               triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    end   
end

function onStepHit()
if curStep == 3403 then
        adiosMusica = true
        followchars = false
         triggerEvent('Camera Follow Pos',150,400)
         porSiAcaso = true
        doTweenAlpha('adiosHUD', 'camHUD', 0, 0.5)    
		setProperty('feraligatr.alpha', 1)
        objectPlayAnimation('silver', 'scaryJumpscare', false)
        objectPlayAnimation('feraligatrJumpscare', 'scaryJumpscare', false);
        playSound('InsomniaEnding',1.5,'Ending') 
    runTimer('endSong', 11)
    runTimer('adiosHUD', 1)
    runTimer('atacaFeraligatr', 6)
end
end

local yougonnadie = true
loop = true
function onUpdatePost(elapsed)
if difficultyName == 'Hard' and not botPlay then
if curStep >= 192 then
     if round((getProperty('ratingPercent') * 100), 2) >= 99 then
        setProperty('scoreforever.color',getColorFromHex('00FF00'))
    elseif round((getProperty('ratingPercent') * 100), 2) > 97 then
        setProperty('scoreforever.color',getColorFromHex('74FF00'))
    elseif round((getProperty('ratingPercent') * 100), 2) > 95 then
        setProperty('scoreforever.color',getColorFromHex('B6FF00'))
    elseif round((getProperty('ratingPercent') * 100), 2) > 93 then
        setProperty('scoreforever.color',getColorFromHex('E4FF00')) 
    elseif round((getProperty('ratingPercent') * 100), 2) > 91 then
        setProperty('scoreforever.color',getColorFromHex('FF8000'))  
    elseif round((getProperty('ratingPercent') * 100), 2) < 90 then
        setProperty('scoreforever.color',getColorFromHex('FF0000'))  
        end
        else
        setProperty('scoreforever.color',getColorFromHex('FFFFFF'))
    end
    if curStep >= 192 then
    if round((getProperty('ratingPercent') * 100), 2) == 0 and round((getProperty('ratingPercent') * 100), 2) < 90 and loop == true then --En el inicio se bugueaba y por eso agregue esto
     loop = false
     followchars = false
     runTimer('youwhat',5)       
     setProperty('cameraSpeed',0.2)
     triggerEvent('Camera Follow Pos',getProperty('gf.x'),getProperty('gf.y'))
     playSound('feraligatrWakes',3,'ohshit')
     doTweenZoom('uhoh','camGame',1.4,5,'linear')
end
    if round((getProperty('ratingPercent') * 100), 2) >= 90 then    
      if yougonnadie == true then
        yougonnadie = false
        followchars = true 
        cancelTimer('youwhat')
        stopSound('ohshit')
        cancelTween('uhoh')
        setProperty('cameraSpeed',1)
        end
      elseif round((getProperty('ratingPercent') * 100), 2) < 90 then
        if yougonnadie == false then
        yougonnadie = true
        followchars = false
        runTimer('youwhat',5)       
        setProperty('cameraSpeed',0.2)
        triggerEvent('Camera Follow Pos',getProperty('gf.x'),getProperty('gf.y'))
        doTweenZoom('uhoh','camGame',1.4,5,'linear')
        playSound('feraligatrWakes',3,'ohshit')
        end
     end
end
end
if adiosMusica then
        setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  )
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
        setPropertyFromClass('PlayState', 'instance.vocals.volume', 0)
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
        setPropertyFromClass('PlayState', 'instance.generatedMusic', false)--Este code encerio es god,me salvó de un bug ,grande Perez
end
if adiosHUD == true then
setProperty('camHUD.alpha', 0)
end
if porSiAcaso == true then
setProperty('silver.alpha', 1)
setProperty('dad.visible', false);
setProperty('gf.visible', false);
end
end

function onTimerCompleted(tag)
     if tag == 'youwhat' then
        setProperty('health',0)
end
    if tag == 'adiosHUD' then
     adiosHUD= true
end
    if tag == 'atacaFeraligatr' then
    adiosSong = true
     triggerEvent('Camera Follow Pos',-300,280)
     runTimer('adiosJuego', 1.2) 
     setProperty('feraligatr.alpha', 0)
     setProperty('feraligatrJumpscare.alpha', 1)
end
    if tag == 'adiosJuego' then
    setProperty('camGame.alpha', 0)
    end
    if tag == 'endSong' then
     endSong(true)
end
end

function round(x, n) --https://t.co/GyjERHM1BK
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then
     x = math.floor(x + 0.5) 
     else 
      x = math.ceil(x - 0.5) 
end
    return x / n
end
