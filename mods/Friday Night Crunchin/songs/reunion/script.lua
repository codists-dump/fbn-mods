function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('week3tease');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end