function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-pixel-missingno-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pixel'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'MissingnoDeath'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'MissingnoDone'); --put in mods/music/
end