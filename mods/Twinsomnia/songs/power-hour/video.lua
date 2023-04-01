
local allowCountdown = false
local seenCutscene = false;
function onStartCountdown()
	if not seenCutscene and isStoryMode then
		setProperty('inCutscene', true);
		addLuaSprite('cancergrab', true)
			
		runTimer('vido', 0.5);
		setProperty('camGame.alpha', 0);
		setProperty('camHUD.alpha', 0);
		seenCutscene = true;
		allowCountdown = true
		return Function_Stop;
	end		
	if not allowCountdown  and isStoryMode then
		return Function_Stop;
		end
		setProperty('inCutscene', false);
		doTweenAlpha('ss','camHUD',1,0.1)
	return Function_Continue;
end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'vido' then
		startVideo(songName);
		runTimer('fadeO', 40);
	end
	if tag == 'fadeO' then
		setProperty('camGame.alpha', 1);
		doTweenAlpha('psyc','vido',0,2)
	end
end






function onCreatePost()
		setProperty('camGame.scroll.x', 690);
		setProperty('camGame.scroll.y', 500);
		setProperty('camFollowPos.x', 580);
		setProperty('camFollowPos.y', 460);
end