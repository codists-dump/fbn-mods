function onCreate()


    makeLuaSprite('bars', 'bars', 0,0)
    setObjectCamera('bars', 'other')
    addLuaSprite('bars')
    setProperty('bars.scale.x', 2)
    setProperty('bars.scale.y', 2)
    makeLuaSprite('gradien', 'blackgradien', 0,0)
    setObjectCamera('gradien', 'other')
    addLuaSprite('gradien')

    makeLuaSprite('gradien2', 'funnyrayz', 0,0)
    setObjectCamera('gradien2', 'other')
    setBlendMode('gradien2', 'add')
    addLuaSprite('gradien2')
    setProperty('gradien2.alpha', 0)
    setProperty('gradien2.color', getColorFromHex('FFC000'))

    makeAnimatedLuaSprite('sillyy', 'doors cutscene', 0, 150)
    addAnimationByPrefix('sillyy', 'play', 'Symbol 1', 12, false)
    

end


function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think

    if counter == 0 then
        doTweenY('sanesssssss', 'bars.scale', 1, 1.24, 'quadInOut')
    end
end

function onSongStart()
    spawnCredits()
    addLuaSprite('sillyy')
    setObjectCamera('sillyy', 'other')
    objectPlayAnimation('sillyy', 'play', true)
end

function spawnCredits()
    makeLuaText("cornermark2", 'Special thanks to 1UP Cartoons, the composer of this song.', 1280, 0, 18)
    setTextAlignment("cornermark2", 'center')
    setTextSize('cornermark2', 18)
    setTextBorder('cornermark2', 2, '000000')
    addLuaText("cornermark2")
    setObjectCamera('cornermark2', 'other')
    setProperty('cornermark2.alpha', 0)
    doTweenAlpha('siy2', 'cornermark2', 1, 1, 'quadInOut')
end

function onBeatHit()
    if curBeat == 8 then
        doTweenAlpha('siy2', 'cornermark2', 0, 1, 'quadInOut')
    end

    if curBeat == 16 then
        setProperty('cornermark2.text', 'Seriously, 1UP Cartoons makes some good shit...')
        doTweenAlpha('siy', 'cornermark2', 1, 1, 'quadInOut')
    end

    if curBeat == 24 then
        doTweenAlpha('siy', 'cornermark2', 0, 1, 'quadInOut')
    end
    if curBeat == 48 then
        doTweenY('sanesssssss', 'bars.scale', 2, 5, 'quadInOut')
        doTweenX('sanesssssssss', 'gradien', -2560, 1, 'quadInOut')
        setProperty('sillyy.visible', false)
    end
    if curBeat == 144 then --144
        setProperty('gradien.x', 1280)
        setProperty('gradien.flipX', true)
        doTweenX('sanesssssss', 'gradien', -1280, 1, 'quadInOut')
    end
    if curBeat == 172 then --144
        setProperty('gradien.x', 0)
        setProperty('gradien.flipX', false)
        doTweenX('sanesssssss', 'gradien', -2560, 1, 'quadInOut')
        setObjectCamera('bars', 'hud')
        doTweenY('sanessssssses', 'bars.scale', 1, 0.7, 'quadInOut')
    end

    if curBeat == 214 then --144
        setProperty('gradien.x', 1280)
        setProperty('gradien.flipX', true)
        doTweenX('sanesssssss', 'gradien', -1280, 1, 'quadInOut')
    end

    if curBeat == 224 then --144
        setProperty('gradien.x', 0)
        setProperty('gradien.flipX', false)
        doTweenX('sanesssssss', 'gradien', -2560, 1, 'quadInOut')
        setObjectCamera('bars', 'other')
        doTweenY('sanessssssses', 'bars.scale', 2, 4, 'quadInOut')
    end

    if curBeat == 352 then --144
        setObjectCamera('bars', 'hud')
        setProperty('bars.scale.y', 1)
        setObjectCamera('gradien2', 'hud')
        doTweenAlpha('sanesssssss', 'gradien2', 0.4, 1, 'quadInOut')
        setProperty('gradien.x', 0)
        setProperty('gradien.flipX', false)
        doTweenX('sanesssssss', 'gradien', -2560, 1, 'quadInOut')
    end

    if curBeat == 422 then --144
        makeLuaText("cornermark2", 'Thanks for playing :D', 1280, 0, 18)
        setTextAlignment("cornermark2", 'center')
        setTextSize('cornermark2', 18)
        addLuaText("cornermark2")
        setObjectCamera('cornermark2', 'other')
        setProperty('cornermark2.alpha', 0)
        doTweenAlpha('siy2', 'cornermark2', 1, 1, 'quadInOut')
    end
end

function onUpdatePost()
    screenCenter('bars')
end