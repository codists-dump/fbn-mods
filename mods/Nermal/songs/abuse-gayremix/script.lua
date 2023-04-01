local allowCountdown = false
local ogP1 = ''
local ogP2 = ''


function onCreate()
	precacheImage('garfieldjumpin')
	triggerEvent('Change Character','BF','bfShot')
	triggerEvent('Change Character','dad','angrynermal')
end

function onStartCountdown()
	if not allowCountdown then
		runTimer('playAnim', 1)
		allowCountdown = true
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'playAnim' then
		setProperty('boyfriend.visible',false)
		setProperty('dad.visible',false)
		makeAnimatedLuaSprite('garfJumpIn','garfieldjumpin',141,-808)
		scaleObject('garfJumpIn',2,2)
		addAnimationByPrefix('garfJumpIn','jumpIn','garf jumpscare fr fr',24,false)
		objectPlayAnimation('garfJumpIn','jumpIn')
		addLuaSprite('garfJumpIn')
		runTimer('startSong', 2)
	elseif tag == 'startSong' then
		startCountdown()
		removeLuaSprite('garfJumpIn',true)
		triggerEvent('Change Character','BF','angrynermal')
		triggerEvent('Change Character','dad','garfield')
		setProperty('boyfriend.visible',true)
		setProperty('dad.visible',true)
	end
end