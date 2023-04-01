function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'dDead'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'dgame_over'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'dgame_over_end'); --put in mods/music/
end