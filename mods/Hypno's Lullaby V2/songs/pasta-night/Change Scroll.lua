--Codigo por Nickobelit y Methew (Abajo lo conoceran...)
Reverso = true
function onEvent(name, value1, value2)
    if name == "Pow" then
        if difficultyName == 'Lord-X' or difficultyName == 'Hypno' then
        runTimer('changeScroll',0.65)
    end 
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'changeScroll' then
CambiarScroll()
end
if tag == 'reversoFalse' then
Reverso = false
end
if tag == 'reversoTrue' then
Reverso = true
end
if tag == 'Bounce1' then
noteTweenY("E", 6, 530, 0.6, 'bounceOut')
runTimer('Bounce2',0.02)
end
if tag == 'Bounce2' then
noteTweenY("V", 5, 530, 0.6, 'bounceOut')
runTimer('Bounce3',0.02)
end
if tag == 'Bounce3' then
noteTweenY("Q", 4, 530, 0.6, 'bounceOut')
end
if tag == 'Bounce4' then
noteTweenY("E", 6, 50, 0.6, 'bounceOut')
runTimer('Bounce5',0.02)
end
if tag == 'Bounce5' then
  noteTweenY("V", 5, 50, 0.6, 'bounceOut')
runTimer('Bounce6',0.02)
end
if tag == 'Bounce6' then
noteTweenY("Q", 4, 50, 0.6, 'bounceOut')
end
end

function CambiarScroll()
if Reverso == true then
for i = 4, 7 do
    noteTweenDirection('scrollDir' .. i, i,-90, 0.05, quadOut)
    end
    noteTweenY("S", 7, 530, 0.6, 'bounceOut')
    doTweenY("BotplayRebote", 'botplayTxt', 565, 0.6, 'bounceOut')
    runTimer('Bounce1',0.02)
    runTimer('reversoFalse',0.4)
end
if Reverso == false then
for i = 4, 7 do
    noteTweenDirection('scrollDir' .. i, i,90, 0.05, quadOut)
    end
    noteTweenY("S", 7, 50, 0.6, 'bounceOut')
    doTweenY("BotplayRebote", 'botplayTxt', 85, 0.6, 'bounceOut')
    runTimer('Bounce4',0.02)
    runTimer('reversoTrue',0.4)
 end
end

function onUpdatePost(elapsed)
	-- Shit here by methewhenmethe#7219 this is to fix the wired visual issues with noteTweenDirection!
	--Encerio ese capo si le sabe me solucionó ese problema ,Methew Dios
	noteCount = getProperty('notes.length')
	for i = 0, noteCount-1 do
		noteData = getPropertyFromGroup('notes', i, 'noteData')
		if getPropertyFromGroup('notes', i, 'isSustainNote') then
            if (getPropertyFromGroup('notes', i, 'mustPress')) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'direction') - 90)
            else
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'direction') - 90)
            end	
		else
            if (noteData >= 4) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('playerStrums', noteData, 'angle'))
            else
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup('opponentStrums', noteData, 'angle'))
            end	
		end
	end
end