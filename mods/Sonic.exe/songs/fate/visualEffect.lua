function onCreatePost()
    makeLuaSprite('blackScreenFate','',0,0)
    setObjectCamera('blackScreenFate','hud')
    setProperty('blackScreenFate.alpha',0.001)
    makeGraphic('blackScreenFate',screenWidth,screenHeight,'000000')
    addLuaSprite('blackScreenFate')

    makeLuaSprite('whiteScreenFate','',0,0)
    setObjectCamera('whiteScreenFate','hud')
    setProperty('whiteScreenFate.alpha',0.001)
    makeGraphic('whiteScreenFate',screenWidth,screenHeight,'FFFFFF')
    addLuaSprite('whiteScreenFate')

    makeLuaSprite('sonic2006','sonicCut',-300,100)
    scaleObject('sonic2006',1.2,1.2)
    setObjectCamera('sonic2006','hud')
    addLuaSprite('sonic2006')
end
function onStepHit()
    if curStep == 1984 then
        doTweenAlpha('hellFateScreen','blackScreenFate',1,2,'linear')
    elseif curStep == 2032 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.95,2,'linear')
    elseif curStep == 2064 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.9,2,'linear')
    elseif curStep == 2096 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.85,2,'linear')
    elseif curStep == 2128 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.8,1,'linear')
    elseif curStep == 2144 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.75,1,'linear')
    elseif curStep == 2160 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.7,2,'linear')
    elseif curStep == 2192 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.65,2,'linear')
    elseif curStep == 2224 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.6,2,'linear')
    elseif curStep == 2256 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.55,0.5,'linear')
    elseif curStep == 2264 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.5,0.5,'linear')
    elseif curStep == 2272 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.45,0.5,'linear')
    elseif curStep == 2280 then
        doTweenAlpha('hellFateScreen','blackScreenFate',0.4,0.5,'linear')
    elseif curStep == 2288 then
        setProperty('blackScreenFate.alpha',1)
    elseif curStep == 2320 or curStep == 2448 then
        setProperty('blackScreenFate.alpha',0)
        setProperty('whiteScreenFate.alpha',1)
        doTweenAlpha('byeFateWhite','whiteScreenFate',0,1,'linear')
    elseif curStep == 2864 then
        makeGraphic('blackScreenFate',screenWidth,screenHeight,'666666')
        doTweenAlpha('helloFateScreen','blackScreenFate',0.5,1,'linear')
        setBlendMode('blackScreenFate','SUBTRACT')
        doTweenX('hellSonic2006','sonic2006',screenWidth + 200,10,'linear')
    end
end
function onTweenCompleted(tag)
    if tag == 'hellSonic2006' then
        removeLuaSprite('sonic2006',true)
        doTweenAlpha('byeoFateScreen','blackScreenFate',0,1,'linear')
    end
    if tag == 'byeFateWhite' and curStep > 2448 then
        removeLuaSprite('whiteScreenFate',true)
    end
    if tag == 'byeoFateScreen' then
        removeLuaSprite('byeoFateScreen',true)
    end
end