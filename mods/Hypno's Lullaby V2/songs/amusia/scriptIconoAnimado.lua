function onCreate()
		makeAnimatedLuaSprite('animatedicon', 'icons/icon-wigglytuff', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'sinmirar', 'wigglySinMirar', 1, false)
		addAnimationByPrefix('animatedicon', 'poquito', 'wigglyMiraUnPoquito', 1, false)
		addAnimationByPrefix('animatedicon', 'quiere', 'wigglyTeQuiereVer', 1, false)
		addAnimationByPrefix('animatedicon', 'temira', 'wigglyTeVe', 1, false)
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'camHUD')
        setObjectOrder('animatedicon', getObjectOrder("iconP2"))
		addLuaSprite('animatedicon', false)
		setProperty('animatedicon.visible', true)
	end


function onUpdate(elapsed)
   if dadName == 'wiggles' then
   objectPlayAnimation('animatedicon', 'sinmirar', false)
   end
   if dadName == 'wiggles1' then
   objectPlayAnimation('animatedicon', 'poquito', false)
   end
   if dadName == 'wiggles2' then
   objectPlayAnimation('animatedicon', 'quiere', false)
   end
   if dadName == 'wiggles3' or dadName == 'death-stare' or dadName == 'wigglesTerror' then
   objectPlayAnimation('animatedicon', 'temira', false)
   end
    setProperty('iconP2.alpha', 0)
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('animatedicon.x', getProperty('iconP2.x') - 10)
	setProperty('animatedicon.angle', getProperty('iconP2.angle'))
	setProperty('animatedicon.y', getProperty('iconP2.y') - 45)
	setProperty('animatedicon.scale.x', getProperty('iconP2.scale.x'))
    setProperty('animatedicon.scale.y', getProperty('iconP2.scale.y'))
end
