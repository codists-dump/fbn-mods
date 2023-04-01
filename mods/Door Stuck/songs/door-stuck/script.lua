function onCreate()
        --make lady with booba be in front of funny door guy
    	setProperty('explode.alpha',0);

	makeLuaSprite('card', 'nothing', -400, 250);
	setObjectCamera('card', 'hud');
	addLuaSprite('card');
	scaleObject('card', 0.7, 0.7);

	makeLuaText('songname', 'Song: DOOR STUCK', '500', -462, 262);
	setTextSize('songname', 24);
	setObjectCamera('songname', 'hud');
	setTextColor('songname', 'A4A4A4');
	setTextFont('songname', 'stratum2-medium-webfont.ttf');
	setTextBorder('songname', '0','A4A4A4');
	addLuaText('songname');

	makeLuaText('desc', 'Song by: SantiOkuu', '500', -517, 320);
	setTextSize('desc', 24);
	setObjectCamera('desc', 'hud');
	setTextColor('desc', 'A4A4A4');
	setTextFont('desc', 'stratum2-medium-webfont.ttf');
	setTextBorder('desc', '0','A4A4A4');
	addLuaText('desc');

	--makeLuaText('desc1', 'SantiOkuu', '500', -580, 350);
	--setTextSize('desc1', 24);
	--setObjectCamera('desc1', 'hud');
	--setTextColor('desc1', 'A4A4A4');
	--setTextFont('desc1', 'stratum2-medium-webfont.ttf');
	--setTextBorder('desc1', '0','A4A4A4');
	--addLuaText('desc1');
end

function onBeatHit()
	if curBeat == 111 then
		doTweenX('in', 'boyfriendGroup', 2550, 1, 'quartInOut')
	elseif curBeat == 123 then
		doTweenX('out', 'boyfriendGroup', 2650, 1, 'linear')
	elseif curBeat == 125 then
		runTimer('aaargh', 0.3);
	elseif curBeat == 384 then
		setProperty('explode.alpha',1)
	end

	if getPropertyFromClass('ClientPrefs', 'flashing') == true then
		if curBeat % 2 == 0 and curStep > 1408 and curStep < 1536 then
			makeLuaSprite('flash', '', 0, 0);
 		       	makeGraphic('flash',1920,1080,'ff3030')
		        addLuaSprite('flash', true);
		        setLuaSpriteScrollFactor('flash',0,0)
		        setProperty('flash.scale.x',2)
		        setProperty('flash.scale.y',2)
		        setProperty('flash.alpha',0)
			setProperty('flash.alpha',0.2)
			doTweenAlpha('flTw','flash',0,0.2,'linear')
		end
	end
end

function onCountdownTick(counter)
	if counter == 0 then
		doTweenX('card','card', '0', 1, 'expoInOut')
		doTweenX('name','songname', '-82', 1, 'expoInOut')
		doTweenX('line1','desc', '-125', 1, 'expoInOut')
		runTimer('cardback', 4)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'cardback' then
		doTweenX('dawg','card', '-400', 1, 'expoInOut')
		doTweenX('andnamowashisnamo','songname', '-462', 1, 'expoInOut')
		doTweenX('lineo1','desc', '-517', 1, 'expoInOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'dawg' then
		removeLuaSprite('dawg', true);
		removeLuaText('desc', true);
		removeLuaText('songname', true);
	end
end

local allowEndSong = false
function onEndSong()
	if not allowEndSong and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('CUTSCENE2');
		allowEndSong = true;
		return Function_Stop;
	end
	
	return Function_Continue;
end