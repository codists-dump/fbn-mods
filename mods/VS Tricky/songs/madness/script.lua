--Last Edited 10/12/21 by SaturnSpades
--Tricky mod credits will be put here temporarily until in-game credits can be modified within Lua
--Tricky Mod Developers: Banbuds, Rosebud, KadeDev, CVal, YingYang48, JADS, Moro
--Special Thanks: Tom Fulp, Krinkels, GWebDev, Tsuraran
local allowCountdown = false
function onStartCountdown()
    -- Block the first countdown and start cutscene
    if not allowCountdown and isStoryMode and not seenCutscene then
        setProperty('inCutscene', true)
        startVideo('HankShootsTricky')
	    allowCountdown = true;
        return Function_Stop;
    end
	return Function_Continue;
end
function onCreate()

    --Adds Lua Sprites
    addCharacterToList('signDeath', 'boyfriend');

    makeLuaSprite('TrickyStatic', 'TrickyStatic', -380, -90);
    scaleLuaSprite('TrickyStatic', 10, 10);
    addLuaSprite('TrickyStatic', true)
    setPropertyLuaSprite('TrickyStatic', 'alpha', 0)

    makeAnimatedLuaSprite('signDeath', 'signDeath');
    luaSpriteAddAnimationByPrefix('signDeath', 'bfDies', 'BF dies', 24, false)
    luaSpriteAddAnimationByPrefix('signDeath', 'bfDeadLoop', 'BF Dead Loop', 24, true)
    luaSpriteAddAnimationByPrefix('signDeath', 'bfDeadConfirm', 'BF Dead confirm', 24, false)

    makeAnimatedLuaSprite('TrickyStrings', 'TrickyStrings', 160, 580);
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Suffer', 'Strings', 0)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Incorrect', 'Strings', 1)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Incomplete', 'Strings', 2)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Insufficient', 'Strings', 3)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Invalid', 'Strings', 4)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Correction', 'Strings', 5)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Mistake', 'Strings', 6)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Reduce', 'Strings', 7)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Error', 'Strings', 8)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Adjusting', 'Strings', 9)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Improbable', 'Strings', 10)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Implausible', 'Strings', 11)
    luaSpriteAddAnimationByIndices('TrickyStrings', 'Misjudged', 'Strings', 12)
    scaleLuaSprite('TrickyStrings', 1.5, 1.5)
    addLuaSprite('TrickyStrings', true)
    setPropertyLuaSprite('TrickyStrings', 'alpha', 0)

    makeAnimatedLuaSprite('TrickyMissStrings', 'TrickyMissStrings', 160, 580);
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Terrible', 'Strings', 0)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Waste', 'Strings', 1)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Miss Calculated', 'Strings', 2)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Predicted', 'Strings', 3)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Failure', 'Strings', 4)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Disgusting', 'Strings', 5)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Abhorrent', 'Strings', 6)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Foreseen', 'Strings', 7)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Contemptible', 'Strings', 8)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Prognosticate', 'Strings', 9)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Dispicable', 'Strings', 10)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Reprehensible', 'Strings', 11)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Unsurprising', 'Strings', 12)
    luaSpriteAddAnimationByIndices('TrickyMissStrings', 'Predetermined', 'Strings', 13)
    scaleLuaSprite('TrickyMissStrings', 2.3, 2.3)
    addLuaSprite('TrickyMissStrings', true)
    setPropertyLuaSprite('TrickyMissStrings', 'alpha', 0)
 
    setPropertyFromClass('GameOverSubstate', 'characterName', 'signDeath')

    --cutscene sprites
        makeLuaSprite('Black', '', -550, -100)
        luaSpriteMakeGraphic('Black', 3000, 3000, '000000')
        addLuaSprite('Black', true)
        --setPropertyLuaSprite('Black', 'alpha', 1)
        setPropertyLuaSprite('Black', 'alpha', 0)
        blackAlpha = 1
        blackOutAlpha = 0

        makeLuaSprite('White', '', -550, -100)
        luaSpriteMakeGraphic('White', 3000, 3000, 'FFFFFF')
        addLuaSprite('White', true)
        setPropertyLuaSprite('White', 'alpha', 0)
        whiteAlpha = 0

        setObjectOrder('Black', 30)
        setObjectOrder('White', 30)

        makeAnimatedLuaSprite('bf', 'BOYFRIEND', 890, 450)
        luaSpriteAddAnimationByPrefix('bf', 'idle', 'BF idle dance', 24, true)
        addLuaSprite('bf', true)
        setObjectOrder('bf', 5)
        setPropertyLuaSprite('bf', 'alpha', 0)

        makeAnimatedLuaSprite('girlfriend', 'GF_assets', 400, 130)
        luaSpriteAddAnimationByPrefix('girlfriend', 'idle', 'GF Dancing Beat', 24, true)
        addLuaSprite('girlfriend')
        setPropertyLuaSprite('girlfriend', 'alpha', 0)

        makeAnimatedLuaSprite('trickman', 'trickman', 140, 280)
        luaSpriteAddAnimationByPrefix('trickman', 'cutscene1', 'Cutscene 1', 24, true)
        luaSpriteAddAnimationByPrefix('trickman', 'cutscene2', 'Cutscene 2', 24, false)
        luaSpriteAddAnimationByPrefix('trickman', 'cutscene3', 'Cutscene 3', 24, false)
        luaSpriteAddAnimationByPrefix('trickman', 'cutscene4', 'Cutscene 4', 24, false)

        makeAnimatedLuaSprite('trickbeam', 'trickman', -135, -290)
        luaSpriteAddAnimationByPrefix('trickbeam', 'pillarbeam', 'Pillar Beam Tricky', 24, false)
        scaleLuaSprite('trickman', 1.3, 1.3)
        addLuaSprite('trickman', true)
        scaleLuaSprite('trickbeam', 1.3, 1.3)
        addLuaSprite('trickbeam', true)
        setPropertyLuaSprite('trickbeam', 'alpha', 0)
        setPropertyLuaSprite('trickman', 'alpha', 0)
        setObjectOrder('trickbeam', 5)
        setObjectOrder('trickman', 5)

        makeAnimatedLuaSprite('youDontKillClown', 'youdontkillclown', 180, 530)
        luaSpriteAddAnimationByPrefix('youDontKillClown', 'youDontKillClown', 'Strings0001', 24)
        setPropertyLuaSprite('youDontKillClown', 'alpha', 0)

        makeAnimatedLuaSprite('clownKillsYou', 'clownkillsyou', 180, 530)
        luaSpriteAddAnimationByPrefix('clownKillsYou', 'clownKillsYou', 'Strings0001', 24)
        setPropertyLuaSprite('clownKillsYou', 'alpha', 0)

        scaleLuaSprite('youDontKillClown', 2.5, 2.5)
        addLuaSprite('youDontKillClown', true)
        scaleLuaSprite('clownKillsYou', 2.5, 2.5)
        addLuaSprite('clownKillsYou', true)
end


trickyStrings = {
    [0] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Suffer')
        runTimer('stringAngles', 0.02, 90)
    end,

    [1] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Incorrect')
        runTimer('stringAngles', 0.02, 90)
    end,

    [2] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Incomplete')
        runTimer('stringAngles', 0.02, 90)
    end,

    [3] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Insufficient')
        runTimer('stringAngles', 0.02, 90)
    end,

    [4] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Invalid')
        runTimer('stringAngles', 0.02, 90)
    end,

    [5] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Correction')
        runTimer('stringAngles', 0.02, 90)
    end,

    [6] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Mistake')
        runTimer('stringAngles', 0.02, 90)
    end,

    [7] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Reduce')
        runTimer('stringAngles', 0.02, 90)
    end,

    [8] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Error')
        runTimer('stringAngles', 0.02, 90)
    end,

    [9] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Adjusting!')
        runTimer('stringAngles', 0.02, 90)
    end,

    [10] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Improbable')
        runTimer('stringAngles', 0.02, 90)
    end,

    [11] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Implausible')
        runTimer('stringAngles', 0.02, 90)
    end,

    [12] = function()
        luaSpritePlayAnimation('TrickyStrings', 'Misjudged')
        runTimer('stringAngles', 0.02, 90)
    end,
}

trickyMissStrings = {
    [0] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Terrible')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [1] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Waste')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [2] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Miss Calculated')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [3] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Predicted')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [4] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Failure')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [5] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Disgusting')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [6] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Abhorrent')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [7] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Foreseen')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [8] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Contemptible')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [9] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Prognosticate')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [10] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Dispicable')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [11] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Reprehensible')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [12] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Unsurprising')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [13] = function()
        luaSpritePlayAnimation('TrickyMissStrings', 'Predetermined')
        runTimer('stringMissAngles', 0.02, 90)
    end,
}

trickyCutsceneStrings = {
    [1] = function()
        luaSpritePlayAnimation('youDontKillClown', 'youDontKillClown')
        runTimer('stringCutSceneAngles', 0.02, 500)
    end,

    [2] = function()
        luaSpritePlayAnimation('clownKillsYou', 'clownKillsYou')
        runTimer('stringCutSceneAngles', 0.02, 500)
    end,
}

function opponentNoteHit(id, direction, noteType, isSustainNote)

    local luckyRoll = math.random(1, 65)

    if (luckyRoll >= 60 and isSustainNote == false) then
        runTimer('TrickyStringTime', 0, 1)
        runTimer('TrickyAlpha', 0.3, 1)
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    runTimer('TrickyAlpha2', 0.3, 1)
end

function noteMiss()
    runTimer('TrickyAlpha2', 0.3, 1)
    local unluckyRoll = math.random(1, 70)
    if unluckyRoll >= 65 then
        runTimer('TrickyMissString', 0, 1)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	
    if tag == 'TrickyStringTime' then
        playSound('staticSound')
        setPropertyLuaSprite('TrickyStatic', 'alpha', 0.2)
        setPropertyLuaSprite('TrickyStrings', 'alpha', 1)
        counter = math.random(0, 12)
        trickyStrings[counter]()
	end

    if tag == 'TrickyMissString' then
        playSound('staticSound')
        setPropertyLuaSprite('TrickyStatic', 'alpha', 0.2)
        setPropertyLuaSprite('TrickyMissStrings', 'alpha', 1)
        misscounter = math.random(0, 13)
        trickyMissStrings[misscounter]()
        runTimer('TrickyMissAlpha', 0.33, 1)
	end

    if tag == 'CutsceneString1' then
        playSound('staticSound')
        setPropertyLuaSprite('TrickyStatic', 'alpha', 0.2)
        setPropertyLuaSprite('youDontKillClown', 'alpha', 1)
        trickyCutsceneStrings[1]()
        runTimer('staticAlpha', 0.33, 1)
    end

    if tag == 'CutsceneString2' then
        runTimer('staticAlphaOn', 0.1, 3)
        setPropertyLuaSprite('clownKillsYou', 'alpha', 1)
        trickyCutsceneStrings[2]()
        runTimer('staticAlpha', 0.33, 1)
    end

    if tag == 'TrickyAlpha' then
        setPropertyLuaSprite('TrickyStatic', 'alpha', 0)
        setPropertyLuaSprite('TrickyStrings', 'alpha', 0)
    end
    
    if tag == 'TrickyAlpha2' then
        setPropertyLuaSprite('TrickyStatic', 'alpha', 0)
        setPropertyLuaSprite('TrickyStrings', 'alpha', 0)
    end
    
    if tag == 'staticAlpha' then
        setPropertyLuaSprite('TrickyStatic', 'alpha', 0)
    end

    if tag == 'staticAlphaOn' then
        playSound('staticSound')
        setPropertyLuaSprite('TrickyStatic', 'alpha', 0.2)
    end

    if tag == 'dontkillalpha' then
        runTimer('staticAlphaOn', 0, 1)
        setPropertyLuaSprite('youDontKillClown', 'alpha', 0)
        runTimer('staticAlpha', 0.15, 1)
    end

    if tag == 'killsyoualpha' then
        playSound('staticSound')
        setPropertyLuaSprite('clownKillsYou', 'alpha', 0)
        runTimer('staticAlpha', 0.15, 1)
    end

    if tag == 'TrickyMissAlpha' then
        setPropertyLuaSprite('TrickyStatic', 'alpha', 0)
        setPropertyLuaSprite('TrickyMissStrings', 'alpha', 0)
    end

    if tag == 'stringAngles' then
        setStringAngle = math.random(-5,5)
        setProperty('TrickyStrings.angle', setStringAngle)
    end

    if tag == 'stringMissAngles' then
        setStringAngle = math.random(-5,5)
        setProperty('TrickyMissStrings.angle', setStringAngle)
    end

    if tag == 'stringCutSceneAngles' then
        setStringAngle = math.random(-5,5)
        setProperty('youDontKillClown.angle', setStringAngle)
        setProperty('clownKillsYou.angle', setStringAngle)
    end

    if tag == 'trickyglitch' then
        playSound('TrickyGlitch')
    end

    if tag == 'fadeIn' then
        blackAlpha = blackAlpha - 0.1
        setPropertyLuaSprite('Black', 'alpha', blackAlpha)

        if loopsLeft == 0 then
            runTimer('cutscene1', 0, 1)
        end
    end

    if tag == 'fadeOut' then
        blackOutAlpha = blackOutAlpha + 0.1
        --if blackAlpha > 1 then
        setPropertyLuaSprite('Black', 'alpha', blackOutAlpha)
    end

    if tag == 'fadeWhite' then
        whiteAlpha = whiteAlpha + 0.05
        setPropertyLuaSprite('White', 'alpha', whiteAlpha)
    end

    if tag == 'cutscene1' then
        luaSpritePlayAnimation('trickman', 'cutscene1')
        runTimer('CutsceneString1', 0, 1)
        runTimer('dontkillalpha', 7, 1)
        runTimer('cutscene2', 12, 1)
        runTimer('cutscene3', 12.15, 1)
        runTimer('cutscene4', 12.2, 1)
        runTimer('killsyoualpha', 22, 1)
        runTimer('pillarshot', 23, 1)
    end

    if tag == 'cutscene2' then
        runTimer('CutsceneString2', 0, 1)
        luaSpritePlayAnimation('trickman', 'cutscene2')
    end

    if tag == 'cutscene3' then
        playSound('energy shot')
        luaSpritePlayAnimation('trickman', 'cutscene3')
    end

    if tag == 'cutscene4' then
        luaSpritePlayAnimation('trickman', 'cutscene4')
    end

    if tag == 'pillarshot' then
        setPropertyLuaSprite('trickman', 'alpha', 0)
        setPropertyLuaSprite('trickbeam', 'alpha', 1)
        playSound('firepillar')
        soundFadeOut('honk', 3, 0)
        luaSpritePlayAnimation('trickbeam', 'pillarbeam')
        runTimer('trickyscream', 3, 1)
        cameraShake('game', 0.05, 6)
        runTimer('fadeWhite', 0.1, 30)
        --runTimer('endSong', 8, 1)
    end

    if tag == 'trickyscream' then
        playSound('sound_clown_roar')
    end

    if tag == 'startCount' then
        --removeLuaSprite('Black')
        --setProperty('dad.alpha', 1)
        startCountdown()
    end

    if tag == 'cutsceneStart' then
        setProperty('dad.alpha', 0)
        setProperty('gf.alpha', 0)
        setProperty('boyfriend.visible', false)
        setProperty('camFollowPos.y', 430)
        setProperty('camFollowPos.x', 660)
        setPropertyLuaSprite('bf', 'alpha', 1)
        setPropertyLuaSprite('girlfriend', 'alpha', 1)
        setPropertyLuaSprite('trickman', 'alpha', 1)
        runTimer('fadeIn', 0.12, 10)
    end

    if tag == 'endSong' then
        seenCutscene = true
        endSong()
    end

    if tag == 'end' then
        endSong()
    end

end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
    setProperty('boyfriend.curCharacter', 'signDeath')
    playSound('death', 0.3)
    playSound('BF_Deathsound')
    playMusic('gameOver', 1, true)
	return Function_Continue;
end

function onGameOverConfirm(retry)
	-- Called when you Press Enter/Esc on Game Over
	-- If you've pressed Esc, value "retry" will be false
    setProperty('boyfriend.curCharacter', 'signDeath')
    luaSpritePlayAnimation('bfDeadConfirm')
    playMusic('gameOverEnd', 1, true)
end

function onEndSong()
	-- song ended/starting transition (Will be delayed if you're unlocking an achievement)
    if isStoryMode and not seenCutscene then
        setProperty('inCutscene', true)
        setProperty('Boyfriend.alpha', 0)
        playSound('honkers', 1, 'honk')
        setProperty('camHUD.visible', false)
        runTimer('fadeOut', 0.12, 10)
        runTimer('cutsceneStart', 2, 1)
        runTimer('endSong', 36, 1)
        return Function_Stop
    end
    return Function_Continue
end
