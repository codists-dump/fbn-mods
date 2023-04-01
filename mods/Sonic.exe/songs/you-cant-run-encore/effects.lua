function onStepHit()
    if curStep == 520 or curStep == 904 then
        cameraShake('camGame',0.03,1)
    end
    if curStep == 1280 then
        cameraShake('camGame',0.002,0.25)
    end
    if curStep == 1284 then
        cameraShake('camGame',0.004,0.5)
    end
    if curStep == 1288 then
        cameraShake('camGame',0.006,1)
    end
end