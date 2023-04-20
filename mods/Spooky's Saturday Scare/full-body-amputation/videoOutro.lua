local playCutscene = true;
function onEndSong()
	if isStoryMode and playCutscene then
		setProperty('camGame.alpha', 0)
		setProperty('camHUD.alpha', 0)
		startVideo('Door 2 - Specimen 9 Boss');
		playCutscene = false;
		return Function_Stop;
	end
	return Function_Continue;
end