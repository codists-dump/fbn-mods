function onCreate()
    makeLuaSprite('bartop','',0,-100)
    makeGraphic('bartop',1381,100,'000000')
    addLuaSprite('bartop',false)
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,900)
    makeGraphic('barbot',1381,100,'000000')
    addLuaSprite('barbot',false)
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud')
end

function onStepHit() -- Events
    if curStep >= 895 then doTweenY('bartopTweenY1', 'bartop', -30, 1, 'linear') end
    if curStep >= 895 then doTweenY('barbotTweenY2', 'barbot', 650, 1, 'linear') end      
    if curStep == 640 then cameraFlash("camhud", "0xFFFFFF ", 1.6, true) end
    if curStep == 895 then cameraFlash("camhud", "0xFFFFFF ", 1.6, true) end
    if curStep == 1   then setProperty('gf.visible', false) end
    if curStep >= 895 then setProperty('gf.visible', true) end
    if curStep == 895 then setProperty('boyfriend.visible', true) end
    if curStep >= 1439 then doTweenY('bartopTweenY1', 'bartop', -100, 1, 'linear') end
    if curStep >= 1439 then doTweenY('barbotTweenY2', 'barbot', 800, 1, 'linear') end  
    if curStep == 640 then cameraFlash("camhud", "0xFFFFFF ", 1.6, true) end
    if curStep == 1439 then cameraFlash("camhud", "0xFFFFFF ", 1.6, true) end
    if curStep == 1824 then doTweenAlpha('camGameFadeOut', 'camHUD', 0, 1.1, 'linear') end
    if curStep == 1954 then setProperty('camGame.visible', false) end
end