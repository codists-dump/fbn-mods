local duet = false
local del = 0;
local allowCountdown = false
local seenshit = false

local dacount = 0
local maxpages = 2
function onCreate()

	objectPlayAnimation('door','doorclose',false)
		setProperty('camHUD.alpha', 0)

	if isStoryMode and not seenCutscene then
		setPropertyFromClass('PlayState','seenCutscene',true)
		setProperty('camHUD.visible',false)
		makeAnimatedLuaSprite('storybook','storybook/storybook02',0,0)
		for i=0,maxpages,1 do
			addAnimationByIndices('storybook','page' .. i, 'storybook02','' .. i)
		end
		addLuaSprite('storybook',true)
		setLuaSpriteScrollFactor('storybook',0,0)
		runTimer('startMus', 0.3, 1)
	end
end



function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		--runTimer('startDialogue', 0.8);
		--allowCountdown = true;
		return Function_Stop;
	end
	seenshit = true
	return Function_Continue;
end


function onUpdate()
	if del > 0 then
		del = del - 1;
	end
	if keyJustPressed('reset') then

				endSong()

	end

	if not seenshit then
		if keyJustPressed('accept') and getProperty('inCutscene') == true then
			--endSong()
			if dacount == maxpages then
				seenshit = true
				doTweenAlpha('endshit','storybook',0,1)
				allowCountdown = true
				setProperty('inCutscene', false);
				seenCutscene = true
				soundFadeOut('',1,0)
			else
			playSound('dialogueClose')
			dacount = dacount + 1
			objectPlayAnimation('storybook','page' .. dacount)



			end

		end
	end

end




function goodNoteHit(id, direction, noteType, isSustainNote)
	if duet == false then
		if noteType == 'GF Sing' then
			
			triggerEvent('Camera Follow Pos',727.9, 118.9)
		else
			triggerEvent('Camera Follow Pos','','')
		end
	else
		triggerEvent('Camera Follow Pos',610.2, 135.85)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if duet == false then
		triggerEvent('Camera Follow Pos','','')
	else
		triggerEvent('Camera Follow Pos',610.2, 135.85)
		setProperty('defaultCamZoom', 1)
	end
end
function onStepHit()

	if curStep == 1 or curStep == 2 or curStep == 4 or curStep == 81 or curStep == 87 or curStep == 84 then
		setProperty('door.scale.x', 1.05)
		setProperty('door.scale.y', 1.05)

		doTweenX('knock','door.scale',1,0.2,'linear')
		doTweenY('knock2','door.scale',1,0.2,'linear')
	end
	if curStep == 22 or curStep == 127 then
		objectPlayAnimation('door','dooropen',false)
		doTweenAlpha('fadeInn', 'camHUD', 1, 0.5, 'linear')
	end
	if curStep == 41 then
		setProperty('camHUD.alpha', 0)
		objectPlayAnimation('door','doorclose',false)
	end
	if curStep == 50 then
		setProperty('camGame.y', 5000)
	end
	if curStep == 64 then
		setProperty('camGame.y', 0)
		doTweenColor('fadeIn', 'camGame', 'FFFFFF', 0.5, 'linear')
		objectPlayAnimation('wall','wall2',false)
	end

end

function onEvent(name,value1,value2)
	if name == 'Kill Henchmen' then
		
		if del == 0 then
			del = 3
			if duet == true then
				duet = false
			else
				duet = true
			end
		end

	end

end


function onTweenCompleted(t)

	if t == 'endshit' then
		setProperty('camHUD.visible',true)
			startCountdown()
	end

end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
	if tag == 'startMus' then -- Timer completed, play dialogue
		playMusic('cutscene1',1,true)
	end
end
