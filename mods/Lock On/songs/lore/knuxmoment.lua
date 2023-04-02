function onStepHit()

    if curStep == 896 then
        triggerEvent('Play Animation', 'break', 'gf')
        triggerEvent('Alt Idle Animation', 'boyfriend', '')
    end
    if curStep == 904 or curStep == 972 or curStep == 1100 or curStep == 1228 then
        triggerEvent('Play Animation', 'idle-hey', 'gf')
    end
    if curStep == 983 or curStep == 1110 or curStep == 1239 then
        triggerEvent('Play Animation', 'idle-alt', 'gf')
    end
    if curStep == 984 then
        triggerEvent('Alt Idle Animation', 'gf', '-alt')
    end

    if curStep == 656 then
        doTweenZoom('knuxzoom', 'camGame', 1.9, 32, 'linear')
        triggerEvent('Alt Idle Animation', 'boyfriend', '-alt')
    end
end