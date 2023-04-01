function onCreate()
	setProperty('gf.visible', false);

	makeLuaSprite('card', 'nothing', -400, 250);
	setObjectCamera('card', 'hud');
	addLuaSprite('card');
	scaleObject('card', 0.7, 0.7);

	makeLuaText('songname', 'Song: Door Freeman', '500', -462, 262);
	setTextSize('songname', 24);
	setObjectCamera('songname', 'hud');
	setTextColor('songname', 'A4A4A4');
	setTextFont('songname', 'stratum2-medium-webfont.ttf');
	setTextBorder('songname', '0','A4A4A4');
	setObjectOrder('songname', 98);
	addLuaText('songname');

	makeLuaText('desc', 'Song by: SantiOkuu', '500', -517, 320);
	setTextSize('desc', 24);
	setObjectCamera('desc', 'hud');
	setTextColor('desc', 'A4A4A4');
	setTextFont('desc', 'stratum2-medium-webfont.ttf');
	setTextBorder('desc', '0','A4A4A4');
	setObjectOrder('desc', 99);
	addLuaText('desc');

end

function onCountdownTick(counter)
	if counter == 0 then
		doTweenX('card','card', '0', 1, 'expoInOut')
		doTweenX('name','songname', '-62', 1, 'expoInOut')
		doTweenX('line1','desc', '-117', 1, 'expoInOut')
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