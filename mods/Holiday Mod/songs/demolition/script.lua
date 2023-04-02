local timesEnded = 0
function onCreate()
if isStoryMode then
setProperty('inCutscene',true)
setProperty('pico.y',-5000)
end

end
function onStartCountdown()
	timesEnded = timesEnded + 1
	if timesEnded == 1 and isStoryMode then
		triggerEvent('movaDaTom','1000','200')
		runTimer('startdathing',2)
	end
	if timesEnded == 2 and isStoryMode then
		triggerEvent('Camera Follow Pos','1000','200')
		doTweenY('gaga','pico',170,0.6,'sineIn')
	end
	if timesEnded == 3 or not isStoryMode then

		triggerEvent('Camera Follow Pos','','')
	return Function_Continue;
		
	else
	return Function_Stop;

	end

	

end
function onTimerCompleted(tag,l,ll)

	if tag == "end" then
		startDialogue('dialogue2','cutscene3')
	end

	if tag == "startdathing" then

	startDialogue('dialogue','cutscene2')
	end

end
function onTweenCompleted(tag)
	if tag == 'gaga' then
		triggerEvent('Screen Shake','0.5,0.05','1,0')
		playSound('truckboom','1')
		runTimer('end',1)
	end
end
