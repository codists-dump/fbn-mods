function onEvent(name,v1,v2)
    if name == 'Play Animation' then
        if v1 == 'shoot1' or v1 == 'shoot2' then
            cameraShake('camGame',0.04,0.1)
            cameraShake('camHUD',0.015,0.1)
        end
    end
end