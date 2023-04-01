function onCreate()
	addCharacterToList('MinusGarDragon', 'dad');
	addCharacterToList('MinusGarDip', 'dad');
	precacheImage('flashbang');
end

function onStepHit()
	if curStep == 10 then
		makeLuaSprite('image', 'flashbang', -850, -300);
		setScrollFactor('image', 0, 0);
		addLuaSprite('image', true);
		setProperty('image.alpha', 0);

		doTweenAlpha('flash', 'image', 1, 1.5, 'linear');
	elseif curStep == 16 then
		doTweenAlpha('fade', 'image', 0, 1.5, 'linear');
		cameraShake('game', 0.003, 1);
		--oTweenAlpha('smokemachine', 'smokey', 1, 0.0001, 'linear');
		setProperty('smokey.alpha', 1);
		setProperty('smokey2.alpha', 1);
		--doTweenAlpha('smokemachine2', 'smokey2', 1, 0.0001, 'linear');
	elseif curStep == 1126 then
		cameraShake('game', 0.003, 1);
	elseif curStep == 1134 then
		setProperty('dad.alpha', 0);
	end
end