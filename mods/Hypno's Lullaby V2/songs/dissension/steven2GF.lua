--Code del Nickobelit p
function opponentNoteHit(id, noteData, noteType, isSustainNote)
        if noteData == 0 then
        triggerEvent('Play Animation','singLEFT', 'gf')
end
		if noteData == 1 then
        triggerEvent('Play Animation','singDOWN', 'gf')
end
		if noteData == 2 then
        triggerEvent('Play Animation','singUP', 'gf')
end
		if noteData == 3 then
        triggerEvent('Play Animation','singRIGHT', 'gf')
	end
end

function onUpdate(elapsed)--C Mecánica
if difficultyName == 'Hard' then
if curStep > 400 and curStep < 1440 then
health = getProperty('health')
if getProperty('health') >= 0.395 then
setProperty('health', health - 0.0020 * ((elapsed) * 120));
end
end
end
if curStep > 912 and curStep < 1040 then
cameraShake('hud', 0.002, 0.1)
cameraShake('game', 0.002, 0.1)
end
end

function goodNoteHit()--Con esto se compensa la mecánica (Además que noté que así es xd)
if difficultyName == 'Hard' then
health = getProperty('health')
setProperty('health', health + 0.03);
end
end