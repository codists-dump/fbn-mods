vsp = 0
hsp = 0
function onCreate()
		setProperty('skipCountdown', true)
	addCharacterToList('nakedbags', 'dad')
   
	makeAnimatedLuaSprite('coat', 'cashmoney/coat', getProperty('dad.x') + 20, getProperty('dad.y') + 86);
	setProperty('coat.antialiasing', false)
	addAnimationByPrefix('coat', 'coat', 'coat', 12, true)
	objectPlayAnimation('coat', 'coat', true)
	setObjectOrder('coat', getObjectOrder('dadGroup') - 1)
	setProperty('coat.visible', false)
	addLuaSprite('coat', false);

	setProperty('isCameraOnForcedPos', true)
	setProperty('camFollowPos.x', 723/2)
	setProperty('camFollow.x', 723/2)
	setProperty('camFollowPos.y', 405/2)
	setProperty('camFollow.y', 405/2)
	setProperty('defaultCamZoom', 10)
	setProperty('camGame.zoom', 10)
	
	makeLuaSprite('black','', 100,0)
	makeGraphic('black', 900, 900,'000000')
	addLuaSprite('black',true)
    setScrollFactor('black',0,0)
	doTweenAlpha('fadeoutb', 'black', 0, 5, 'sineInOut')
	doTweenZoom('zoomIn', 'camGame', 2.4, 5.5, 'expoInOut')
end

function onEvent(n, v1, v2)
	if n == 'Change Character' and v2 == 'nakedbags' then
		vsp = -4
		hsp = -7
		setProperty('coat.visible', true)
		triggerEvent('Play Animation', 'trans', 'dad')
	end
end

function onUpdate(e)
	if getProperty('defaultCamZoom') > 2.4 then
		setProperty('defaultCamZoom', getProperty('camGame.zoom'))
	end
	
	if getProperty('coat.visible') then
		if vsp < 5 then
			vsp = vsp + (e * 20)
		end
		setProperty('coat.x', getProperty('coat.x') + hsp)
		setProperty('coat.y', getProperty('coat.y') + vsp)
	end
	
	if getProperty('coat.y') < -400 then
		removeLuaSprite('coat')
	end
end