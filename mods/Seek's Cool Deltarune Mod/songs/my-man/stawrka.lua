function onCreate()
    makeAnimatedLuaSprite('stawrka', 'characters/starwalker', 2000, 100);
	addAnimationByPrefix('stawrka', 'idle', 'starwalker idle', 24, true);
    objectPlayAnimation('stawrka', 'idle');
	addLuaSprite('stawrka', false);
    scaleObject('stawrka', -0.8, 0.8);

    local boyx = getProperty('boyfriend.x');

    scaleObject('boyfriend', 0.82 ,0.82);
    setProperty('boyfriend.x', boyx - 50);
end

function onUpdate()

    if curBeat == 276 then
        doTweenX('i will also join', 'stawrka', 680, 1, 'circOut');
    end

end