function onCreate()
    precacheImage('mikelings');
end

function onBeatHit()

    if curBeat == 28 then
        makeAnimatedLuaSprite('mikelings','mikelings', -2000, 80);
        addAnimationByPrefix('mikelings','vroom','mikelings', 6, true);--true or false to loop
        objectPlayAnimation('mikelings','vroom', true);
        scaleObject('mikelings', 0.7, 0.7);
        addLuaSprite('mikelings', false);
    end

    if curBeat == 30 then
        doTweenX('mikelingsTween01', 'mikelings', 2000, 5, CircInOut);
    end

    if curBeat == 38 then
        removeLuaSprite('carousel');
    end

    if curBeat == 126 then
        makeAnimatedLuaSprite('mikelings','mikelings', -2000, 80);
        addAnimationByPrefix('mikelings','vroom','mikelings', 8, true);--true or false to loop
        objectPlayAnimation('mikelings','vroom', true);
        scaleObject('mikelings', 0.7, 0.7);
        addLuaSprite('mikelings', false);
    end

    if curBeat == 127 then
        doTweenX('mikelingsTween02', 'mikelings', 2000, 6, CircInOut);
    end

end



