local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
	
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;

		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', '(anger) management');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end
function onBeatHit()
 if curBeat == 48 then
	 addAnimationByPrefix('walk','walk','walk',24,false);
	 objectPlayAnimation('walk','walk',true);
 end

 if curBeat == 68 then

 end

 if curBeat == 312 then
	 setProperty('defaultCamZoom',1.3)
 followchars = false;

 end

 if curBeat == 320 then
	 setProperty('defaultCamZoom',0.9)
 followchars = false;
end
 end
