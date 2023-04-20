function onCreate()
    if getPropertyFromClass('ClientPrefs', 'mechanics') then
        makeLuaSprite('warning', 'song specific and bgs/lean/warn', 0, 0)
        setObjectCamera('warning', 'other')
        setScrollFactor('warning', 0, 0)
        addLuaSprite('warning')
        setProperty('warning.alpha', 0)
    end


    staminafromstaminacord = 2
    health = getProperty('health')
    if getPropertyFromClass('ClientPrefs', 'mechanics') then
        setProperty('healthGain', 0)
    end

    setPropertyFromClass('GameOverSubstate', 'characterName', 'exp-leanBF')
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx')
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'leanDeath')
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd')

    addCharacterToList('leansp9', 'dad')
end

function onSongStart()
    staminaLoss = 0.45;
    staminaGain = 0.01
    leanHealing = 0.6
    canHeal = true
    healthDrain = 0.015

    if getPropertyFromClass('ClientPrefs', 'mechanics') then
        doTweenAlpha('warningAppear', 'warning', 1, 0.4)
    end
end

function onUpdate()
    if staminafromstaminacord < staminaLoss then
        canHeal = false
    end
    if staminafromstaminacord > staminaLoss then
        canHeal = true
    end

    setProperty('stamina', staminafromstaminacord)
    if staminafromstaminacord > 2 then
        staminafromstaminacord = 2
    end

    if staminafromstaminacord < 0 then
        staminafromstaminacord = 0
    end

    if canHeal == true and keyJustPressed('space') and staminafromstaminacord > staminaLoss and getPropertyFromClass('ClientPrefs', 'mechanics') then
        staminafromstaminacord = staminafromstaminacord - staminaLoss
        playSound('slurp')
        addHealth(leanHealing)
        if getProperty('combo') >= 100 and getProperty('songMisses') <= 20 then
            characterPlayAnim('boyfriend', 'drink-win', true);
        elseif getProperty('songMisses') >= 20 then
            characterPlayAnim('boyfriend', 'drink-losing', true);
        else
            characterPlayAnim('boyfriend', 'drink', true);
        end
        setProperty('boyfriend.specialAnim', true);
    end
end

function opponentNoteHit()
    if not isSustainNote and getPropertyFromClass('ClientPrefs', 'mechanics') then
        health = getProperty('health')
        setProperty('health', health - healthDrain);
    end
end

function goodNoteHit()
    staminafromstaminacord = staminafromstaminacord + staminaGain
end

function onStepHit()
    if curStep == 1892 then
        playSound('disguise')
    end
end

function onBeatHit()
    if curBeat == 8 then
        if getPropertyFromClass('ClientPrefs', 'mechanics') then
            doTweenAlpha('warningDie', 'warning', 0, 0.4)
        end
    end
    if curBeat == 351 then
        makeLuaSprite('fade', '', -400, -400);
        makeGraphic('fade', 1920, 1080, '000000');
        scaleObject('fade', 4, 4);
        setProperty('fade.alpha', 0);
        doTweenAlpha('fadeappear', 'fade', 1, 0.32, 'circInOut')
        addLuaSprite('fade', true);
    end
    if curBeat == 552 then
        staminaGain = 0.015
        healthDrain = 0.02
    end
    if curBeat == 680 then
        healthDrain = 0
        doTweenAlpha('byebar', 'healthBar', 0, 0.4, 'circInOut')
        doTweenAlpha('byebar2', 'healthBarBG', 0, 0.4, 'circInOut')
        doTweenAlpha('byebar3', 'staminaBar', 0, 0.4, 'circInOut')
    end
end

function onTweenCompleted(t)
    if t == 'fadeappear' then
        doTweenAlpha('fadedeath', 'fade', 0, 10, 'circInOut')
    end
end