function onStepHit()
    if curStep >= 64 then
        doTweenZoom('sex', 'camGame', 0.7, 1.9, 'linear')
        setProperty('defaultCamZoom', 0.7)
      doTweenY('ccc', 'abajo', 520, 0.5, 'linear')
    end

   if curStep >= 191 then
        doTweenZoom('sex', 'camGame', 0.9, 1.9, 'linear')
        setProperty('defaultCamZoom', 0.9)
    end

    if curStep >= 323 then
        doTweenZoom('sex', 'camGame', 0.7, 1.5, 'linear')
        setProperty('defaultCamZoom', 0.7)
    end

   
    if curStep >= 508 then
        setTextString('maybe', "maybe is the way you dress")
    end

    if curStep >= 515 then
        doTweenAlpha('ay', 'maybe', 0, 0.2, 'linear')
   end

end
 function onCreate()


  
    makeLuaText('maybe','',0,400,500);
    setTextSize('maybe',50);
    setObjectCamera('maybe', 'HUD')
    addLuaText('maybe');
    setTextColor('maybe', "0981D2")

    
    makeLuaSprite('abajo','',-600,980)
    makeGraphic('abajo',2000,490,'15202B')
    addLuaSprite('abajo',false)
  
    setObjectCamera('abajo','hud')

end