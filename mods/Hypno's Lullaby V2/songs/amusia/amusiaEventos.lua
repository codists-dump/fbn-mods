function onStepHit()
    if curStep == 16 then
    doTweenX('dadintroTweenX', 'dadintro', -115, 0.6, 'cubeOut')
    end
    if curStep == 24 then
    doTweenX('bfintroTweenX', 'bfintro', 345, 0.6, 'cubeOut')
    end
    if curStep == 32 then        
    removeLuaSprite('black', true)
    removeLuaSprite('dadintro', true)
    removeLuaSprite('bfintro', true)
    doTweenAlpha('holaHUD', 'camHUD', 1, 1, 'linear');
    end
     if curStep == 272 then     
     doTweenAlpha('holaStatic', 'static', 0.8, 0.7, 'linear');
     end
     if curStep == 278 then     
     doTweenAlpha('holaStatic', 'static', 0, 0.2, 'linear');
     end
     if curStep == 281 then     
     doTweenAlpha('holaStatic', 'static', 0.8, 0.7, 'linear');
     end
     if curStep == 284 then     
     doTweenAlpha('holaStatic', 'static', 0, 0.2, 'linear');
     end
     if curStep == 416 then     
     doTweenAlpha('holaStatic', 'static', 0.8, 0.7, 'linear');
     end
     if curStep == 424 then     
     doTweenAlpha('holaStatic', 'static', 0, 0.2, 'linear');
     end
     if curStep == 538 then
     doTweenAlpha('static', 'static', 0.3, 0.2, 'linear');
     end
     if curStep == 544 then        
    removeLuaSprite('bg', true)
    setProperty('bg2.visible', true)
    doTweenAlpha('static', 'static', 0.1, 0.05, 'linear');
    end
     if curStep == 695 then   
     doTweenAlpha('adiosHUD', 'camHUD', 0, 0.3, 'linear');     
     end
     if curStep == 704 then   
     doTweenAlpha('holaHUD', 'camHUD', 1, 0.3, 'linear');     
     end
     if curStep == 794 then        
    doTweenX('blue1', 'blue1', -750, 0.5,'circIn')      
    doTweenX('blue2', 'blue2', 650, 0.5,'circIn')      
    doTweenX('boyfriend1', 'boyfriend', -750, 0.5,'circIn')         
    doTweenX('dad1', 'dad', 650, 0.5,'circIn') 
    end   
    if curStep == 800 then
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then--Detalles pa ,Detalles
    noteTweenX("noteMove01", 0, 732, 1, 'cubeInOut')
    noteTweenX("noteMove02", 1, 844, 1, 'cubeInOut')
    noteTweenX("noteMove03", 2, 956, 1, 'cubeInOut')
    noteTweenX("noteMove04", 3, 1068, 1, 'cubeInOut')
    noteTweenX("noteMove05", 4, 92, 1, 'cubeInOut')
    noteTweenX("noteMove06", 5, 204, 1, 'cubeInOut')
    noteTweenX("noteMove07", 6, 316, 1, 'cubeInOut')
    noteTweenX("noteMove08", 7, 428, 1, 'cubeInOut')
    end
    noteTweenAngle('A',0 , 360 , 1, 'cubeInOut')
    noteTweenAngle('B',1 , 360 , 1, 'cubeInOut')
    noteTweenAngle('C',2 , 360 , 1, 'cubeInOut')
    noteTweenAngle('D',3 , 360 , 1, 'cubeInOut')
    noteTweenAngle('E',4 , 360 , 1, 'cubeInOut')
    noteTweenAngle('F',5 , 360 , 1, 'cubeInOut')
    noteTweenAngle('G',6 , 360 , 1, 'cubeInOut')
    noteTweenAngle('H',7 , 360 , 1, 'cubeInOut')
    noteTweenAngle('I',8 , 360 , 1, 'cubeInOut')
    noteTweenAngle('J',9 , 360 , 1, 'cubeInOut')
    end
     if curStep == 805 then    
    doTweenX('blue3', 'blue1', 200, 0.7,'quadIn')
    doTweenX('blue4', 'blue2', -400, 0.7,'quadIn')
    doTweenX('boyfriend2', 'boyfriend', -100, 0.7,'quadIn')      
    doTweenX('dad2', 'dad', 180, 0.7,'quadIn')    
   end 
     if curStep == 807 then    
    doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.2)
	doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.2)
	doTweenAlpha('AlphaTween3', 'scoreforever', 0, 0.2)
	doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.2)
	doTweenAlpha('AlphaTween6', 'NameSong', 0, 0.2)
	doTweenAlpha('AlphaTween7', 'ForeverMarcadeAgua', 0, 0.2)
	doTweenAlpha('AlphaTween8', 'animatedicon', 0, 0.2)
	end
    if curStep == 812 then
    doTweenAlpha('AlphaTween1', 'healthBarBG', 0.7, 0.2)
	doTweenAlpha('AlphaTween2', 'healthBar', 0.7, 0.2)
    doTweenAlpha('AlphaTween3', 'scoreforever', 0.5, 0.2)
	doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.2)
	doTweenAlpha('AlphaTween6', 'NameSong', 0.5, 0.2)
	doTweenAlpha('AlphaTween7', 'ForeverMarcadeAgua', 0.5, 0.2)
	doTweenAlpha('AlphaTween8', 'animatedicon', 1, 0.2)
end
    if curStep == 1312 then
     doTweenAlpha('holaStaticOverlay', 'static-overlay', 0.45, 1, 'linear');
   end
    if curStep == 2000 then
     doTweenAlpha('holaStaticOverlay', 'static-overlay', 0.85, 3, 'linear');     
   end
     if curStep == 2040 then
    doTweenAlpha('adiosStaticOverlay2', 'static-overlay', 0, 2.5, 'linear');
    end
    if curStep == 2052 then
     doTweenAlpha('holaStatic', 'static', 1, 1, 'linear');  
   end
    if curStep == 2064 then
     doTweenAlpha('adiosJuego', 'camGame', 0, 1, 'linear');
     doTweenAlpha('adiosStatic', 'static', 0, 4, 'linear');
     
     doTweenAlpha('holaCuestionario', 'cuestionario', 1, 1, 'linear');
     doTweenAlpha('holaWiggles', 'wigglesCuestionario', 1, 1, 'linear');
     end
end