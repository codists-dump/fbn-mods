function onCreatePost()
    setObjectOrder('dadGroup', 3)
    setObjectOrder('boyfriendGroup', 2)

    setProperty('camGame.alpha', 0)
    setProperty('camHUD.alpha', 0)

    makeLuaSprite('bg1', 'song specific and bgs/protag/bgIntro', 0, -75)
	scaleObject('bg1', 0.35, 0.45)
    setProperty('bg1.alpha', 0.4)
    setObjectCamera('bg1', 'other')
    addLuaSprite('bg1')

    makeAnimatedLuaSprite('bfBack', 'song specific and bgs/protag/bf/bfBack', 890, 340)
        addAnimationByPrefix('bfBack', 'idle', 'Lbehind', 24, false)
    scaleObject('bfBack', 0.75, 0.75)
    setProperty('bfBack.origin.x', 0)
    setProperty('bfBack.origin.y', 0)
    setObjectCamera('bfBack', 'other')
    addLuaSprite('bfBack')

    makeAnimatedLuaSprite('protagFront', 'song specific and bgs/protag/protag/protagFront', 85, 130)
        addAnimationByPrefix('protagFront', 'idle', 'SEXOOO', 24, false)
    scaleObject('protagFront', 0.75, 0.75)
    setProperty('protagFront.origin.x', 0)
    setProperty('protagFront.origin.y', 0)
    setObjectCamera('protagFront', 'other')
    addLuaSprite('protagFront')
    
    makeAnimatedLuaSprite('bfFront', 'song specific and bgs/protag/bf/bfFront', 990, 190)
        addAnimationByPrefix('bfFront', 'idle', 'L', 24, false)
    scaleObject('bfFront', 0.75, 0.75)
    setProperty('bfFront.origin.x', 0)
    setProperty('bfFront.origin.y', 0)
    setProperty('bfFront.flipX', true)
    setObjectCamera('bfFront', 'other')

    makeAnimatedLuaSprite('protagBack', 'song specific and bgs/protag/protag/protagBack', 35, 340)
        addAnimationByPrefix('protagBack', 'idle', 'Protaggg', 24, false)
    scaleObject('protagBack', 0.68, 0.68)
    setProperty('protagBack.origin.x', 0)
    setProperty('protagBack.origin.y', 0)
    setProperty('protagBack.flipX', true)
    setObjectCamera('protagBack', 'other')

    makeLuaSprite('black', '', 0, 0)
    makeGraphic('black', 1280, 720, '000000')
    setObjectCamera('black', 'other')
    addLuaSprite('black')
end

function onSongStart()
    doTweenAlpha('blackPee', 'black', 0, 3)
end

function onBeatHit()
    if curBeat < 32 then
        objectPlayAnimation('bfBack', 'idle')
        objectPlayAnimation('protagFront', 'idle')
    elseif curBeat >= 32 and curBeat < 72 then
        objectPlayAnimation('bfFront', 'idle')
        objectPlayAnimation('protagBack', 'idle')
    end
    if curBeat == 32 then
        addLuaSprite('bfFront')
        addLuaSprite('protagBack')
        setProperty('bg1.flipX', true)

        removeLuaSprite('bfBack', true)
        removeLuaSprite('protagFront', true)
    end
    if curBeat == 64 then
        makeLuaSprite('white', '', 0, 0)
        makeGraphic('white', 1280, 720, 'ffffff')
        setObjectCamera('white', 'other')
        setProperty('white.alpha', 0)
        addLuaSprite('white')
        doTweenAlpha('whitePee', 'white', 1, 3.78)
    end
    if curBeat == 72 then
        removeLuaSprite('white', true)
        removeLuaSprite('bfFront', true)
        removeLuaSprite('protagBack', true)
        removeLuaSprite('bg1', true)
        setProperty('camGame.alpha', 1)
        setProperty('camHUD.alpha', 1)
        makeLuaSprite('redFlash', '', 0, 0)
        makeGraphic('redFlash', 1280, 720, '470b0b')
        setObjectCamera('redFlash', 'other')
        addLuaSprite('redFlash')
        doTweenAlpha('byeflash', 'redFlash', 0, 3.5)
    end
end