local allowCountdown = false;
local playDialogue = false;

function OnCreate()
	precacheImage('flashbang');
end


function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('garcutscene');
		allowCountdown = true;
		playDialogue = true;
		return Function_Stop;
	elseif playDialogue then
		setProperty('inCutscene', true);

		playSound('windmoment', 1);
		makeLuaSprite('image', 'flashbang', -400, -50);
		setScrollFactor('image', 1, 1);
		addLuaSprite('image', true);

		doTweenAlpha('byebye', 'image', 0, 3.8, 'linear');

		runTimer('startDialogue', 4.2);
		playDialogue = false;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end