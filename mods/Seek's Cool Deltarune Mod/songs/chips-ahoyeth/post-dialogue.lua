local allowEnd = false

function onEndSong()

    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)

    if isStoryMode then
        makeLuaSprite('dark2', 'dark', -300, -100);
        scaleObject('dark2', 5, 5);
        addLuaSprite('dark2', true);
    end

    if not allowEnd then
        setProperty('inCutscene', true);
        startDialogue('post-dialogue', '');
        allowEnd = true;
        return Function_Stop;
    end

    return Function_Continue;

end