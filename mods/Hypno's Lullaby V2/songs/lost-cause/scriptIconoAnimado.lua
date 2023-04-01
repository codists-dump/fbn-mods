function onCreate()
		makeAnimatedLuaSprite('animatedicon', 'icons/icon-NEW_ABOMINATION_HYPNO_ICON', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'normal', 'ABOMINATION HYPNO ICON instance 1', 24, true)
		addAnimationByPrefix('animatedicon', 'losing', 'ABOMINATION HYPNO ICON instance 1', 24, true)
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'hud')
        setObjectOrder('animatedicon', getObjectOrder("iconP2"))
		addLuaSprite('animatedicon', true)
		objectPlayAnimation('animatedicon', 'normal', false)
		setProperty('animatedicon.visible', false)
	end


function onUpdate(elapsed)
    if curStep >= 310 then
	setProperty('iconP2.alpha', 0)
	setProperty('animatedicon.visible', true)
	else
	setProperty('iconP2.alpha', 1)
	end
		if getProperty('health') > 1.6 then
			objectPlayAnimation('animatedicon', 'losing', false)
		else
			objectPlayAnimation('animatedicon', 'normal', false)
		end
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('animatedicon.x', getProperty('iconP2.x') + -90)
	setProperty('animatedicon.angle', getProperty('iconP2.angle'))
	setProperty('animatedicon.y', getProperty('iconP2.y') + -150)
	setProperty('animatedicon.scale.x', 0.42)
	setProperty('animatedicon.scale.y', 0.42)
end
