local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false

function onStartCountdown()
    if not allowCountdown and isStoryMode and not startedFirstDialogue then
        setProperty('inCutscene', true);
        runTimer('startDialogue', 0.8);
        startedFirstDialogue = true;
        return Function_Stop;
    end

    return Function_Continue;
end

function onEndSong()
    if not allowCountdown and isStoryMode and not startedEndDialogue then
        setProperty('inCutscene', true);
        runTimer('startDialogueEnd', 0.8);
        startedEndDialogue = true;
        return Function_Stop;
    end

    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then
        startDialogue('dialogue', 'breakfast');
    elseif tag == 'startDialogueEnd' then
        setProperty('healthBar.alpha',0)
        setProperty('scoreTxt.alpha',0)
        setProperty('timeTxt.visible',false)
        setProperty('timeBar.visible',false)
        setProperty('botplayTxt.y',-9000)
        setProperty('iconP1.alpha',0)
        setProperty('iconP2.alpha',0)
        setProperty('showRating',false)
        setProperty('showComboNum',false)
        startDialogue('dialogueEnd', 'breakfast');
    end
end