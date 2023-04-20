--script made by legole0, based on Forever Engine tracking by note system
--please dont steal :)

--customize variables
local camOffset = 25; -- how much will it move
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
local pissed = false

function goodNoteHit() --this fixes a bug that makes it go always to the opponent cam in the first section ignoring the mustHitSection value
    if pissed == false then
        startScript()
        mustHitSection = true
    end
end
function opponentNoteHit()
    if pissed == false then
        startScript()
        mustHitSection = false
    end
end
function startScript()
    oppCamX = getProperty('dad.cameraPosition[0]') + getMidpointX('dad') + 250;
    oppCamY = getProperty('dad.cameraPosition[1]') + getMidpointY('dad');
    bfCamX = getProperty('boyfriend.cameraPosition[0]') + getMidpointX('boyfriend') - 200;
    bfCamY = getProperty('boyfriend.cameraPosition[1]') + getMidpointY('boyfriend') - 100;
    pissed = true
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
          
        if curStep >= 1 and pissed then
            if mustHitSection then
                setProperty('camFollow.x', bfCamX + finalOffsetX)
                setProperty('camFollow.y', bfCamY + finalOffsetY)
                setProperty('defaultCamZoom', 0.95)
            else
                setProperty('camFollow.x', oppCamX + finalOffsetX)
                setProperty('camFollow.y', oppCamY + finalOffsetY)
                setProperty('defaultCamZoom', 0.85)
            end
        end
    end
end