function onCreate()
	makeLuaSprite('blackScreenSomething','',0,0)
	setObjectCamera('blackScreenSomething','hud')
	setProperty('blackScreenSomething.alpha',0.001)
	makeGraphic('blackScreenSomething',screenWidth,screenHeight,'000000')
	addLuaSprite('blackScreenSomething')
	setObjectOrder('boyfriendGroup', getObjectOrder('gfGroup') - 0)

	makeLuaSprite('blackForestallVignette','black_vignette',0,0)
	setObjectCamera('blackForestallVignette','other')
	addLuaSprite('blackForestallVignette',true)
end
function opponentNoteHit()
    if getProperty('health') > 0.4 then
        setProperty('health', getProperty('health')- 0.017);
    end
end
function onStepHit()
	if curStep == 144 or curStep == 1056 then
		setProperty('blackForestallVignette.visible',false)
	end
	if curStep == 787 then
		setProperty('blackScreenSomething.alpha',1)
	end
	if curStep == 787 or curStep == 1312 then
		setProperty('blackForestallVignette.alpha',1)
	end
	if curStep == 805 then
		removeLuaSprite('blackScreenSomething',true)
	end
end