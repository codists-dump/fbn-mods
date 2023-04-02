local allowCountdown = false
local seenshit = false

local dacount = 0
local maxpages = 1

function  onCreate( )

	if isStoryMode and not seenCutscene then
		setPropertyFromClass('PlayState','seenCutscene',true)
		setProperty('camHUD.visible',false)
		makeAnimatedLuaSprite('storybook','storybook/storybook03',0,0)
		for i=0,maxpages,1 do
			addAnimationByIndices('storybook','page' .. i, 'storybook03','' .. i)
		end
		addLuaSprite('storybook',true)
		setLuaSpriteScrollFactor('storybook',0,0)
		runTimer('startMus', 0.3, 1)
		setObjectCamera('storybook','camOther')
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
if keyJustPressed('back') then

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
function  onEvent(n,v1,v2 )


	if n == 'Trigger BG Ghouls' then
		typebeat = value1
	end
	-- body
end
function onTweenCompleted(t)

	if t == 'endshit' then
		setProperty('camHUD.visible',true)
			startCountdown()
		close(true)
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

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)



	

	-- triggered when the next dialogue line starts, 'line' starts with 1
end






function onSkipDialogue(count)


	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

