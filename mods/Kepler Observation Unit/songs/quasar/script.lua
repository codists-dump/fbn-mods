local allowCountdown = false

local timesEndedPreSong = 0
local timesEndedPostSong = 0


function onStartCountdown()
    timesEndedPreSong = timesEndedPreSong + 1

    if timesEndedPreSong == 1 and isStoryMode and not seenCutscene then
		startVideo('week2cutscene3')
		allowCountdown = false;
	end

    if timesEndedPreSong == 2 and isStoryMode and not seenCutscene then
		startDialogue('dialogue', 'breakfast');
	end

    if timesEndedPreSong == 3 or not isStoryMode or seenCutscene then
		return Function_Continue;
	else
		return Function_Stop
	end

    --code was a lil messy, cleaned it up :p
	-- if isStoryMode and not allowCountdown and not startDiag and not seenCutscene then
	-- 	startVideo('week2cutscene3');
	-- 	startDiag = true;
	-- 	return Function_Stop;
	-- end
	-- if startDiag and not allowCountdown then
	-- 	allowCountdown = true;
	-- 	return Function_Stop;
	-- end
	-- return Function_Continue;
end

function onEndSong()
    timesEndedPostSong = timesEndedPostSong + 1

    if timesEndedPostSong == 1 and isStoryMode then
        startDialogue('dialogue2', 'breakfast');
    end

    if timesEndedPostSong == 2 and isStoryMode then
        startVideo('week2cutscene4');        
    end

    if timesEndedPostSong == 3 or not isStoryMode then
        return Function_Continue;
    else    
        return Function_Stop;
    end

	-- if startDiag then
	-- end
	-- if not allowEnd and isStoryMode then
	-- 	allowEnd = true;
	-- 	return Function_Stop;
	-- end
end