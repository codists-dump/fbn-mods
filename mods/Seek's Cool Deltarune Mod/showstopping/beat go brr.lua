function onBeatHit()
    if curBeat > 31 and curBeat < 60 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 63 and curBeat < 94 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 111 and curBeat < 124 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 127 and curBeat < 156 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 159 and curBeat < 189 then
        triggerEvent('Add Camera Zoom', 0.03,0.04)
    end

    if curBeat > 0 then
		doTweenY('cock', 'mike_city', 1000, 90, 'linear')
		doTweenY('balls', 'mike_city_2', 1000, 130, 'linear')
        doTweenY('boobs big ones', 'mike_clouds', 0, 90, 'linear')
	end

    if curBeat == 188 then
		doTweenAlpha('mike_bg', 'mike_bg', 0, 2);
	end

    if curBeat == 192 then
		doTweenAlpha('mike_lights2', 'mike_lights2', 1, 0.5);
	end

    if curBeat == 256 then
        makeLuaSprite('dark', 'dark', -220, -100);
        scaleObject('dark', 3, 3);
        addLuaSprite('dark', true);
    end

end