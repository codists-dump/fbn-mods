function onCreate()
	addCharacterToList('bensonprankangry', 'boyfriend')
end

function onBeatHit()
	if curBeat == 96 then
		cameraFlash('game', 'ffffff', 0.25, false)
	end
end