function onEndSong()

    if isStoryMode then
        makeLuaSprite('dark', 'dark', -300, -100);
        scaleObject('dark', 5, 5);
        addLuaSprite('dark', true);
    end

    if not allowEnd then
        setProperty('inCutscene', true);
        startDialogue('post-dialogue', '');
        allowEnd = true;
        return Function_Stop;
    end

    return Function_Continue;

end