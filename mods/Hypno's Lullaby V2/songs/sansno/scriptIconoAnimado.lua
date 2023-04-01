function onCreate()
		makeAnimatedLuaSprite('animatedicon', 'icons/icon-sansno', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'normal', 'SansnoIdle', 2, false)
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'hud')
        setObjectOrder('animatedicon', getObjectOrder("iconP2"))
		addLuaSprite('animatedicon', true)
		setProperty('animatedicon.visible', true)
	end

function onBeatHit()
if curBeat % 2 == 0 then
objectPlayAnimation('animatedicon', 'normal', true)
end
end

function onUpdate(elapsed)
   setProperty('iconP2.alpha', 0)
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('animatedicon.x', getProperty('iconP2.x') + -90)
	setProperty('animatedicon.angle', getProperty('iconP2.angle'))
	setProperty('animatedicon.y', getProperty('iconP2.y') + 20)
	setProperty('animatedicon.scale.x', 0.75)
	setProperty('animatedicon.scale.y', 0.75)
end
