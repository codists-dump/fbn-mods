local allowCountdown = false;
local playDialogue = false;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('metal');
		allowCountdown = true;
		playDialogue = true;
		return Function_Stop;
	elseif playDialogue then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		playDialogue = false;
		return Function_Stop;
	end
	return Function_Continue;
end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('Dialogue', '');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end



function onStepHit()


local squish= 640
local incs = false

	setProperty('gf.visible',true)
    if curStep == 1 then
		noteTweenX('0',0,defaultOpponentStrumX0+squish,0.01,'linear')
		noteTweenX('1',1,defaultOpponentStrumX1+squish,0.01,'linear')
		noteTweenX('2',2,defaultOpponentStrumX2+squish,0.01,'linear')
		noteTweenX('3',3,defaultOpponentStrumX3+squish,0.01,'linear')
		noteTweenX('4',4,defaultPlayerStrumX0-squish,0.01,'linear')
		noteTweenX('5',5,defaultPlayerStrumX1-squish,0.01,'linear')
		noteTweenX('6',6,defaultPlayerStrumX2-squish,0.01,'linear')
		noteTweenX('7',7,defaultPlayerStrumX3-squish,0.01,'linear')
	end
end

function onTweenCompleted(teg)
    if teg=='bopP1' then --Bop BF Icon
        doTweenAngle('BoppinP1', 'iconP1', 0, 4.1);
    elseif teg=='bopP2' then --Bop Opponent Icon
        doTweenAngle('BoppinP2', 'iconP2', 0, 4.1);
    end
end
