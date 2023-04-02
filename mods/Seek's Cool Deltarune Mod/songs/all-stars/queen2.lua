function onCreate()
    precacheImage('bitch');
end

function onBeatHit()
    if curBeat == 48 then

        if not middlescroll then
            makeAnimatedLuaSprite('bitch','bitch', 500, -550);
            addAnimationByPrefix('bitch','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch','pop', true);
            addLuaSprite('bitch', true);
            setObjectCamera('bitch', 'camOther');
            setProperty('bitch.angle', 180);

            makeAnimatedLuaSprite('bitch2','bitch', 500, 330);
            addAnimationByPrefix('bitch2','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch2','pop', true);
            addLuaSprite('bitch2', true);
            setObjectCamera('bitch2', 'camOther');
        else
            makeAnimatedLuaSprite('bitch','bitch', 150, -570);
            addAnimationByPrefix('bitch','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch','pop', true);
            addLuaSprite('bitch', true);
            setObjectCamera('bitch', 'camOther');
            setProperty('bitch.angle', 180);

            makeAnimatedLuaSprite('bitch2','bitch', 150, 330);
            addAnimationByPrefix('bitch2','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch2','pop', true);
            addLuaSprite('bitch2', true);
            setObjectCamera('bitch2', 'camOther');
        end
    end




    if curBeat == 862 and difficulty == 3 then

        if not middlescroll then
            makeAnimatedLuaSprite('bitch','bitch', 500, -550);
            addAnimationByPrefix('bitch','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch','pop', true);
            addLuaSprite('bitch', true);
            setObjectCamera('bitch', 'camOther');
            setProperty('bitch.angle', 180);

            makeAnimatedLuaSprite('bitch2','bitch', 500, 330);
            addAnimationByPrefix('bitch2','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch2','pop', true);
            addLuaSprite('bitch2', true);
            setObjectCamera('bitch2', 'camOther');
        else
            makeAnimatedLuaSprite('bitch','bitch', 150, -570);
            addAnimationByPrefix('bitch','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch','pop', true);
            addLuaSprite('bitch', true);
            setObjectCamera('bitch', 'camOther');
            setProperty('bitch.angle', 180);

            makeAnimatedLuaSprite('bitch2','bitch', 150, 330);
            addAnimationByPrefix('bitch2','pop','bitch', 20, false);--true or false to loop
            objectPlayAnimation('bitch2','pop', true);
            addLuaSprite('bitch2', true);
            setObjectCamera('bitch2', 'camOther');
        end
    end













end
