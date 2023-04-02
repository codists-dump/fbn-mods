local seenDaEnd = false
function onCreate()

addLuaScript('dialogue')

end
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
	speak(count+1)
end

function onSkipDialogue(count)
	stopSound('sound')
	stopSound('sound1')
	stopSound('sound2')
	stopSound('sound3')
	stopSound('sound4')
end

function speak(shit)
	stopSound('sound')
	stopSound('sound1')
	stopSound('sound2')
	stopSound('sound3')
	stopSound('sound4')
	playSound('tankman/' ..shit,1,'sound')
	playSound('tankman/' .. shit,1,'sound1')
	playSound('tankman/' .. shit,1,'sound2')
	playSound('tankman/' .. shit,1,'sound4')
	playSound('tankman/' .. shit,1,'sound3')--just to make this shit loud i don't feel like audio editing
end



function onEvent(n,v1,v2)

	if n == 'startDia' then
		
		speak(1)
	end

end

function onEndSong()
	if isStoryMode and not seenDaEnd then
		makeLuaSprite('bg','',0,0)
		makeGraphic('bg',1280,720,'000000')
		addLuaSprite('bg',true)
		setObjectCamera('bg','camHUD')

		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		seenDaEnd = true
		startVideo('Hark End Cutscene')
		return Function_Stop;
	else
		return Function_Continue;
	end
end