local defaultNotePos = {};
local arrowMoveX = 0;
local arrowMoveY = -14;

function onStepHit()
if difficultyName == 'Hard' then
if curStep == 810 then
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end
if curStep == 1312 then
arrowMoveX = 40
end
if curStep == 1456 then
arrowMoveX = 60
end
if curStep == 1472 then
arrowMoveX = 40
end
if curStep == 1488 then
arrowMoveX = 60
end
if curStep == 1504 then
arrowMoveX = 40
end
end
end

function onUpdate(elapsed)  
if difficultyName == 'Hard' then
if curStep > 812 then
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    currentBeat = (songPos / 1000) * (bpm / 120 )     
         for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
end
end
end