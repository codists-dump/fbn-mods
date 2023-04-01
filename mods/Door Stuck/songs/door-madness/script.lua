function onCreate()
        --make lady with booba be in front of funny door guy
    setObjectOrder('dad', 2);
    setObjectOrder('gf', 99);
    setProperty('explode.alpha',0)

    makeLuaSprite('card', 'nothing', -400, 250);
	setObjectCamera('card', 'hud');
	addLuaSprite('card');
	scaleObject('card', 0.7, 0.7);

	makeLuaText('songname', 'Song: Door Madness', '500', -462, 262);
	setTextSize('songname', 24);
	setObjectCamera('songname', 'hud');
	setTextColor('songname', 'A4A4A4');
	setTextFont('songname', 'stratum2-medium-webfont.ttf');
	setTextBorder('songname', '0','A4A4A4');
	addLuaText('songname');

	makeLuaText('desc', 'Song by: Rozebud', '500', -580, 320);
	setTextSize('desc', 24);
	setObjectCamera('desc', 'hud');
	setTextColor('desc', 'A4A4A4');
	setTextFont('desc', 'stratum2-medium-webfont.ttf');
	setTextBorder('desc', '0','A4A4A4');
	addLuaText('desc');

	makeLuaText('desc1', 'Cover by: Drazically\nand SantiOkuu', '500', -580, 350);
	setTextSize('desc1', 24);
	setObjectCamera('desc1', 'hud');
	setTextColor('desc1', 'A4A4A4');
	setTextFont('desc1', 'stratum2-medium-webfont.ttf');
	setTextBorder('desc1', '0','A4A4A4');
	addLuaText('desc1');
end

function onCountdownTick(counter)
	if counter == 0 then
		doTweenX('card','card', '0', 1, 'expoInOut')
		doTweenX('name','songname', '-75', 1, 'expoInOut')
		doTweenX('line1','desc', '-143', 1, 'expoInOut')
		doTweenX('line2','desc1', '-137', 1, 'expoInOut')
		runTimer('cardback', 4)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'cardback' then
		doTweenX('dawg','card', '-400', 1, 'expoInOut')
		doTweenX('andnamowashisnamo','songname', '-462', 1, 'expoInOut')
		doTweenX('lineo1','desc', '-580', 1, 'expoInOut')
		doTweenX('lineo2','desc1', '-580', 1, 'expoInOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'dawg' then
		removeLuaSprite('dawg', true);
		removeLuaText('desc', true);
		removeLuaText('songname', true);
		removeLuaText('desc1', true);
	end
end