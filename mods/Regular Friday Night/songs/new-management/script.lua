
local allowCountdown = false
function opponentNoteHit(id, direction, noteType, isSustainNote)
		 triggerEvent('Screen Shake', '0.1, 0.006', '0.05, 0.007')
		 health = getProperty('health')
		 if getProperty('health') > 0.1 then
				 setProperty('health', health -0.015);
end
end
