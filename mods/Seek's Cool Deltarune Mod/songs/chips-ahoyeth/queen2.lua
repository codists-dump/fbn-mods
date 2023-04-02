function onCreate()
    precacheImage('bitch');
    precacheImage('queen');
    precacheImage('queen2');
end

function onBeatHit()

    if curBeat == 70 then
        makeAnimatedLuaSprite('queen2','queen2', 300, 0);
        addAnimationByPrefix('queen2','lmao','queen2', 24, false);--true or false to loop
        objectPlayAnimation('queen2','lmao', true);
        addLuaSprite('queen2', false);
    end

    if curBeat == 186 then
        makeAnimatedLuaSprite('queen','queen', 270, 0);
        addAnimationByPrefix('queen','oh','queen', 24, false);--true or false to loop
        objectPlayAnimation('queen','oh', true);
        addLuaSprite('queen', false);
    end

    if curBeat == 30 then
        makeAnimatedLuaSprite('bitch','bitch', 500, -500);
        addAnimationByPrefix('bitch','pop','bitch', 20, false);--true or false to loop
        objectPlayAnimation('bitch','pop', true);
        addLuaSprite('bitch', true);
        setObjectCamera('bitch', 'camOther');
        setProperty('bitch.angle', 180);
    end

    if curBeat == 245 then
        makeAnimatedLuaSprite('bitch','bitch', 500, -500);
        addAnimationByPrefix('bitch','pop','bitch', 19, false);--true or false to loop
        objectPlayAnimation('bitch','pop', true);
        addLuaSprite('bitch', true);
        setObjectCamera('bitch', 'camOther');
        setProperty('bitch.angle', 180);
    end
end