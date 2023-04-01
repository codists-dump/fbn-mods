local CurrentFocus = 0
function onCreate()
    addLuaScript('custom_events/Set Cam Zoom')
end
function onUpdate()
    if curStep == 0 then
        triggerEvent('Set Cam Zoom','0.9','3')
    end

    if curStep == 94 then
        triggerEvent('Set Cam Zoom','0.9','0.4')
    end
    if mustHitSection == true then
        if CurrentFocus ~= 1 then
            triggerEvent('Set Cam Zoom','0.9','0.4')
            CurrentFocus = 1
        end
    else
        if CurrentFocus ~= 2 then
            triggerEvent('Set Cam Zoom','0.73','0.4')
            CurrentFocus = 2
        end
    end
end
