function onCreate()

addLuaScript('dialogueEnd')

end
local timesend = 0
function onEndSong()
timesend = timesend + 1
if timesend == 1 and isStoryMode then

	
	playSound('pickup',1)
	return Function_Stop;
end
	return Function_Continue;


end

function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
	speak(count+1)
	if count == 2 then

		runTimer("endCall",5+getRandomInt(0,3))

	end
end

function onSkipDialogue(count)
	stopSound('sound')
	stopSound('sound1')
	stopSound('sound2')
	stopSound('sound3')
	stopSound('sound4')

end
function onTimerCompleted(t,l,ll)

	if t == 'endCall' then
	stopSound('sound')
	stopSound('sound1')
	stopSound('sound2')
	stopSound('sound3')
	stopSound('sound4')
	setProperty('camGame.visible',false)
	setProperty('camHUD.visible',false)
		playSound('hangup')
		runTimer("endshit",0.5)
	end

	if t == 'endshit' then
		endSong()

	end

end
function speak(shit)
	stopSound('sound')
	stopSound('sound1')
	stopSound('sound2')
	stopSound('sound3')
	stopSound('sound4')
	playSound('tankphone/tankman' ..shit,1,'sound')
	playSound('tankphone/tankman' .. shit,1,'sound1')
	playSound('tankphone/tankman' .. shit,1,'sound2')
	playSound('tankphone/tankman' .. shit,1,'sound4')
	playSound('tankphone/tankman' .. shit,1,'sound3')--just to make this shit loud i don't feel like audio editing
end



function onEvent(n,v1,v2)

	if n == 'startDia' then
		
		speak(1)
	end

end