local timesEnded = 0
function onCreate()

	makeAnimatedLuaSprite('misslesprite','tomstage/missle',3000,-300)
	addAnimationByIndices('misslesprite','fire','missle','1,2,3',24)
	setProperty('misslesprite.angle',-30)
	objectPlayAnimation('misslesprite','fire')
	addLuaScript('dialogue')
	addLuaScript('dialogueEnd')

	makeAnimatedLuaSprite('smoke','tomstage/smoke',-500,-600)
	addAnimationByPrefix('smoke','smoke','smoke',24,true)
	objectPlayAnimation('smoke','smoke')

end

function onEndSong()
	timesEnded = timesEnded + 1
	if timesEnded == 2 and isStoryMode then
		addLuaSprite('misslesprite',true);

		doTweenX('kaboom','misslesprite',-2110,1.3,'linear')
		doTweenY('kaboom2','misslesprite',800,1.3,'linear')
		playSound('missle','0.7','zoom')
		setPropertyFromClass("FlxTransitionableState","skipNextTransIn",true)
	end
	if timesEnded == 3 or not isStoryMode then

	return Function_Continue;
		
	else
	return Function_Stop;

	end

	

end
function onTimerCompleted(tag,l,ll)

	if tag == "end" then
		endSong()
	end

end
function onTweenCompleted(tag)
	if tag == 'kaboom' then
		addLuaSprite('smoke',true)
		stopSound('zoom')
		triggerEvent('Flash Camera','0.5','')
		triggerEvent('Screen Shake','1,0.05','1,0')
		playSound('truckboom','1')
		playSound('mommyDies','1')
		removeLuaSprite('misslesprite')
		doTweenX('wdwdw','dadGroup',-1310,0.6,'linear')
		doTweenY('wdwdwd','dadGroup',-2000,0.6,'linear')
		doTweenAngle('wdwdwd','dad',300,0.3,'linear')
		runTimer('end',2)
	end
end
