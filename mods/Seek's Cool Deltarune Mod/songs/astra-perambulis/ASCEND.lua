


function onCreate()

triggerEvent('Camera Follow Pos', '700', '550');

end

function onBeatHit()

    if curBeat == 192 then
        doTweenY('ascend', 'dad', -5000, 17, 'circIn');
        doTweenY('ascend2', 'boyfriend', -5000, 17, 'circIn');

        doTweenY('camera', 'camFollow', -4490, 16.8, 'circIn')
        doTweenAlpha('starsTween', 'stars', 0.8, 17, 'linear');

    end

    if curBeat == 256 then
        
        makeLuaSprite('star', 'star', getProperty('dad.x') - 1150, getProperty('dad.y') - 1100);
        setProperty('star.alpha', 0.8);
        scaleObject('star', 2.3, 2.3);
        addLuaSprite('star', false);
        setBlendMode('star', 'add');
        doTweenAngle('SPEEEN', 'star', 3600, 20, 'sineOut');
        

    end


end


function opponentNoteHit()

    if curBeat > 255 then
        health = getProperty('health')
        if getProperty('health') > 0.3 then
            setProperty('health', health- 0.019);
        end

        triggerEvent('Add Camera Zoom', 0.03, 0.01);

    end

    if difficulty == 1 then
        triggerEvent('Screen Shake','0.3,0.006','0.4,0.004');
        triggerEvent('Add Camera Zoom', 0.03, 0.01);
    end    

end

function noteMiss()
    if difficulty == 1 then
        health = getProperty('health');
        setProperty('health', health - (0.015 * misses));
    end
end