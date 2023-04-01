local allowCountdown = false;

function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then
        startVideo("leftunchecked");
        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end

