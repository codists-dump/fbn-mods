function onCreate()
	precacheImage('blinds');
	addCharacterToList('liquidanniepl', 'bf');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'DrownDeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'DrowningDeath'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'DrowningGameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'DrowningRetry'); --put in mods/music/
end

function onStepHit()
	if curStep == 1151 then
		makeLuaSprite('image', 'blinds', -400, -50);
		setScrollFactor('image', 1, 1);
		addLuaSprite('image', true);

	end
end