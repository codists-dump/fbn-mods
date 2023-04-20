--script made by legole0, based on Forever Engine tracking by note system
--please dont steal :)

--customize variables
local camOffset = 25; -- how much will it move
local moveOnHit = true; -- basically a switch that enables or disables the script
local onlyBF = false; -- camera moves only when bf hits a note
local onlyOpp = false; -- camera moves only when the opponent hits a note
--

--
local oppCamX=350;
local oppCamY=800;
local bfCamX=350;
local bfCamY=800;
local finalOffsetX=0;
local finalOffsetY=0;
local bfZoom=0.75;
local oppZoom=0.55;

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
          
        if curStep >= 72 then
            if mustHitSection then
                setProperty('camFollow.x', bfCamX + finalOffsetX)
                setProperty('camFollow.y', bfCamY + finalOffsetY)
                setProperty('defaultCamZoom', bfZoom)
            else
                setProperty('camFollow.x', oppCamX + finalOffsetX)
                setProperty('camFollow.y', oppCamY + finalOffsetY)
                setProperty('defaultCamZoom', oppZoom)
            end
        else
            setProperty('camFollow.x', bfCamX + finalOffsetX)
            setProperty('camFollow.y', bfCamY + finalOffsetY)
        end
    end
end

function onBeatHit()
    if curBeat == 72 then
        oppCamY = -130;
        bfCamY = 650;
    end
    if curBeat == 136 then
        oppCamY = 175;
        oppZoom = 0.385;
        bfCamY = 300;
        bfZoom = 0.435;
    end
end

function onEvent(n,v1,v2)
    if n == 'textBoss' then
        if v2 == '' then
            oppCamY = -130;
            oppZoom = 0.55;
        else
            oppCamY = 175;
            oppZoom = 0.385;
        end
    end
end