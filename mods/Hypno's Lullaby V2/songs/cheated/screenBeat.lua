local BeatPorcent = 0
local BeatStyle = 0
local BeatStrentghGame = 0.02
local BeatStrentghHUD = 0.04

local Beated = false

function onStepHit()
if not lowQuality then
    if curStep/4 % BeatPorcent == 0 then
        if BeatStyle == 0 then
            if Beated == false then
                Beated = true
                triggerEvent('Add Camera Zoom',BeatStrentghGame,BeatStrentghHUD)
            end
        elseif BeatStyle == 1 then
            if (curStep/4) % 4 ~= 0 then
                if  curStep/4 % BeatPorcent == 0 and Beated == false then
                    triggerEvent('Add Camera Zoom',BeatStrentghGame  * BeatValue,BeatStrentghHUD * BeatValue)
                    BeatValue = BeatValue * -1
                    Beated = true
                end
            else
                if (curStep/4) % BeatPorcent == 0 and Beated == false then
                    triggerEvent('Add Camera Zoom',BeatStrentghGame * BeatValue + (0.025 * BeatValue),BeatStrentghHUD * BeatValue + (0.03 * BeatValue))
                    BeatValue = BeatValue * -1
                    Beated = true
                end
            end
        end
    else
        Beated = false
    end
        if curStep == 1 then
            BeatPorcent = -4
            BeatStyle = 0
    end
if curStep == 255 then
            BeatPorcent = 1
            BeatStyle = 0
    end
if curStep == 511 then
            BeatPorcent = -2
            BeatStyle = 0
    end
if curStep == 534 then
            BeatPorcent = 0
            BeatStyle = 0
end
if curStep == 543 then
            BeatPorcent = -2
            BeatStyle = 0
    end
if curStep == 566 then
            BeatPorcent = 0
            BeatStyle = 0
end
if curStep == 575 then
            BeatPorcent = -2
            BeatStyle = 0
    end
if curStep == 639 then
            BeatPorcent = 0
            BeatStyle = 0
end
if curStep == 655 then
            BeatPorcent = -4
            BeatStyle = 0
    end
if curStep == 911 then
            BeatPorcent = 0
            BeatStyle = 0
end
if curStep == 927 then
            BeatPorcent = -2
            BeatStyle = 0
    end
if curStep == 1311 then
            BeatPorcent = 1
            BeatStyle = 0
    end
if curStep == 1807 then
            BeatPorcent = 0
            BeatStyle = 0
end
if curStep == 1823 then
            BeatPorcent = 1
            BeatStyle = 0
    end
if curStep == 2015 then
            BeatPorcent = -2
            BeatStyle = 0
    end
if curStep == 2038 then
            BeatPorcent = 0
            BeatStyle = 0
end
if curStep == 2047 then
            BeatPorcent = -2
            BeatStyle = 0
    end
if curStep == 2079 then
            BeatPorcent = -4
            BeatStyle = 0
end
if curStep == 2207 then
            BeatPorcent = 0
            BeatStyle = 0
end
end
end
