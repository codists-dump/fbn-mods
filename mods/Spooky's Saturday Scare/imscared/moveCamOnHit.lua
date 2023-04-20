--script made by legole0, based on Forever Engine tracking by note system
--please dont steal :)

--also this script is modified for this specific song

--customize variables
local camOffset = 20; -- how much will it move
local moveOnHit = false; -- basically a switch that enables or disables the script
--

-- dont touch all this if you dont know what you're doing!!
local camX = 450;
local camY = 350;
local finalOffsetX=0;
local finalOffsetY=0;

function onUpdatePost()
    finalOffsetX = 0;
    finalOffsetY = 0;

    if moveOnHit then
        if getProperty('playerStrums.members[0].animation.curAnim.name') == 'confirm' then
            finalOffsetX = 0
            finalOffsetX = -camOffset;
        elseif getProperty('playerStrums.members[3].animation.curAnim.name') == 'confirm' then
            finalOffsetX = 0
            finalOffsetX = camOffset;
        end
        if getProperty('playerStrums.members[1].animation.curAnim.name') == 'confirm' then
            finalOffsetY = 0
            finalOffsetY = camOffset;
        elseif getProperty('playerStrums.members[2].animation.curAnim.name') == 'confirm' then
            finalOffsetY = 0
            finalOffsetY = -camOffset;
        end
    end
       
    triggerEvent('Camera Follow Pos', camX + finalOffsetX, camY + finalOffsetY)
end

function onBeatHit()
    if curBeat == 64 then
        moveOnHit = true
    end
    if curBeat == 348 then
        camY = camY - 260;
    end
    if curBeat == 352 then
        camY = camY + 260;
    end
    if curBeat == 544 then
        camX = camX + 50;
        camY = camY + 50;
    end
end