function onCreate() 
    makeAnimatedLuaSprite('borders','scottroom/Borders',-2,-8)
    addAnimationByPrefix('borders','idle','Big Border0',24,false)
    addAnimationByPrefix('borders','cover','Border COver0',24,false)
    addAnimationByPrefix('borders','cover2','Border COver2',24,false)
    addAnimationByPrefix('borders','closed','Border Closed0',24,false)
    addAnimationByPrefix('borders','cut','Border Cut0',24,false)
    addAnimationByPrefix('borders','down','Border Down0',24,false)
    addAnimationByPrefix('borders','growth','Border Growth0',24,false)
    addAnimationByPrefix('borders','left','Border Left0',24,false)
    addAnimationByPrefix('borders','meta','Border Meta0',24,false)
    addAnimationByPrefix('borders','right','Border Right0',24,false)
    addAnimationByPrefix('borders','up','Border Up0',24,false)
    addLuaSprite('borders')

    setObjectCamera('borders','other')
    scaleObject('borders',0.97,0.97)
end

function borderhit(num)
    if num == 1 then
        playAnim('borders','cover')
    elseif num == 2 then
        playAnim('borders','left')
    elseif num == 3 then
        playAnim('borders','right')
    elseif num == 4 then
        playAnim('borders','down')
    elseif num == 5 then
        playAnim('borders','up')
    elseif num == 6 then
        playAnim('borders','cut')
    elseif num == 7 then
        playAnim('borders','meta')
    elseif num == 8 then
        playAnim('borders','growth')
    elseif num == 9 then
        playAnim('borders','closed')
    end
end

function onBeatHit()

    if curBeat >= 128 and curBeat < 216 then
        if flashingLights == true then
			borderhit(getRandomInt(1, 8))
		end
    end

end


function onStepHit()

    if curStep == 128 or curStep == 160 or curStep == 192 or curStep == 224 or curStep == 288 or curStep == 315 or curStep == 344 or curStep == 397 or curStep == 428 or curStep == 475 then
		if flashingLights == true then
			borderhit(getRandomInt(1, 8))
		end
    end

    if curStep == 896 then
        borderhit(9)
    end
end