local allowEnd = false

function onEndSong()

    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)

    if isStoryMode and not allowEnd then
        setProperty('inCutscene', true);
        startDialogue('post-dialogue', '');
        allowEnd = true;
        return Function_Stop;
    end

    return Function_Continue;

end