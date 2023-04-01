function onStepHit()
	if curStep == 464 then
	setProperty('wall2.visible', false);
	setProperty('light2.visible', false);
	setProperty('light.visible', true);
	setProperty('wall.visible', true);
	setProperty('floor.visible', true);
	setProperty('table.visible', true);

	end
	if curStep == 1487 then
	    makeLuaSprite('flash2', '', 0, 0);
        makeGraphic('flash2',1280,720,'ffffff')
		doTweenAlpha('flTf2','flash2',0,0.3,'linear')
        addLuaSprite('flash2', true);
        setLuaSpriteScrollFactor('flash2',0,0)
        setProperty('flash2.scale.x',2)
        setProperty('flash2.scale.y',2)
        setProperty('flash2.alpha',0.4)
        setProperty('flash2.alpha',0.6)
        doTweenAlpha('flTw2','flash2',0,0.3,'linear')
		
	setProperty('DeadHallway.visible', true);
	setProperty('BF_BODY.visible', true);
	setProperty('light.visible', false);
    triggerEvent('Change Character', 'dad', 'SPONGECHASE')
    triggerEvent('Change Character', 'gf', 'PATRICKCHASE')
    triggerEvent('Change Character', 'bf', 'bf-head')
    luaSpritePlayAnimation('DeadHallway', 'deadhallway')
    luaSpritePlayAnimation('BF_BODY', 'BF BODY idle')
	end
end