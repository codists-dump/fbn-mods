startedPlaying = false
finishedGameover = false
function onUpdate(elapsed)
    if inGameOver and not startedPlaying and not finishedGameover then
        setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.2);
    end
    if not finishedGameover and getProperty('boyfriend.animation.curAnim.name') == 'deathLoop' and not startedPlaying then
        math.randomseed(curStep * 4)
        soundName = string.format('SpamCall/SpamCall-%i', math.random(1, 9))
        playSound(soundName, 1, 'voiceJuno')
        startedPlaying = true
    end
end

function onGameOverConfirm(reset)
    finishedGameover = true;
end

function onSoundFinished(tag)
    if tag == 'voiceJuno' and not finishedGameover then
        soundFadeIn(nil, 4, 0.2, 1)
    end
end