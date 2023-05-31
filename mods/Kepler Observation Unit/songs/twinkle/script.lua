local allowCountdown = false
local startDiag = false
function onStartCountdown()
	if isStoryMode and not allowCountdown and not startDiag and not seenCutscene then
		startVideo('week2cutscene1');
		startDiag = true;
		return Function_Stop;
	end
	if startDiag and not allowCountdown then
		startDialogue('dialogue', 'breakfast');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end