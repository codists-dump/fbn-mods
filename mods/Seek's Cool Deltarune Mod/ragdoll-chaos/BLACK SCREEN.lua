function onBeatHit()
    if curBeat == 428 then
        makeLuaSprite('dark', 'dark', -220, -100);
        scaleObject('dark', 3, 3);
        addLuaSprite('dark', true);
    end
end
