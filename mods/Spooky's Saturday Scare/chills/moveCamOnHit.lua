--script made by legole0, based on Forever Engine tracking by note system
--please dont steal :)

--customize variables
local camOffset = 30; -- how much will it move
moveOnHit = true; -- basically a switch that enables or disables the script
local onlyBF = false; -- camera moves only when bf hits a note
local onlyOpp = false; -- camera moves only when the opponent hits a note
--

-- dont touch all this if you dont know what you're doing!!
local oppCamX;
local oppCamY;
local bfCamX;
local bfCamY;
local finalOffsetX=0;
local finalOffsetY=0;
local manualZoom = false;
local oppZoom = 0.65;
local bfZoom = 0.75;

function onCreatePost()
    oppCamX = 1320;
    oppCamY = 970;
    bfCamX = 1920;
    bfCamY = 1100;
end
function onUpdatePost()
    if moveOnHit then
        finalOffsetX = 0;
        finalOffsetY = 0;

        --long ass conditionals but less spaghetti code
        if mustHitSection and onlyOpp == false and getProperty('playerStrums.members[0].animation.curAnim.name') == 'confirm' or mustHitSection == false and onlyBF == false and getProperty('opponentStrums.members[0].animation.curAnim.name') == 'confirm' then
            finalOffsetX = 0
            finalOffsetX = -camOffset;
        elseif mustHitSection and onlyOpp == false and getProperty('playerStrums.members[3].animation.curAnim.name') == 'confirm' or mustHitSection == false and onlyBF == false and getProperty('opponentStrums.members[3].animation.curAnim.name') == 'confirm'  then
            finalOffsetX = 0
            finalOffsetX = camOffset;
        end
        if mustHitSection and onlyOpp == false and getProperty('playerStrums.members[1].animation.curAnim.name') == 'confirm' or mustHitSection == false and onlyBF == false and getProperty('opponentStrums.members[1].animation.curAnim.name') == 'confirm'  then
            finalOffsetY = 0
            finalOffsetY = camOffset;
        elseif mustHitSection and onlyOpp == false and getProperty('playerStrums.members[2].animation.curAnim.name') == 'confirm' or mustHitSection == false and onlyBF == false and getProperty('opponentStrums.members[2].animation.curAnim.name') == 'confirm'  then
            finalOffsetY = 0
            finalOffsetY = -camOffset;
        end
          
        if curStep >= 1 then
            if mustHitSection then
                setProperty('camFollow.x', bfCamX + finalOffsetX)
                setProperty('camFollow.y', bfCamY + finalOffsetY)
                setProperty('defaultCamZoom', bfZoom)
            else
                setProperty('camFollow.x', oppCamX + finalOffsetX)
                setProperty('camFollow.y', oppCamY + finalOffsetY)
                setProperty('defaultCamZoom', oppZoom)
            end
        end
    end
end

function onBeatHit()
    if curBeat == 112 then
        oppZoom = 0.9
    end
    if curBeat == 126 then
        oppCamX = 1920;
        oppCamY = 1100;
    end
    if curBeat == 128 then
        oppCamX = 1320;
        oppCamY = 970;
        oppZoom = 0.65
    end
end