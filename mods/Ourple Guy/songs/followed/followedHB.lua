HP = 15
counter = 1

function onCreatePost()
    setProperty('healthBarBG.alpha', 0);
    setProperty('scoreTxt.alpha', 0);
    setProperty('healthBar.alpha', 0);
    setProperty('iconP1.alpha', 0);
    setProperty('iconP2.alpha', 0);


    

    makeAnimatedLuaSprite('bar', 'barFuck', getProperty('healthBar.x')+25,getProperty('healthBar.y') - 50);
    makeAnimatedLuaSprite('gauge', 'barFuck', getProperty('healthBar.x') + 25,getProperty('healthBar.y') - 50);
    makeAnimatedLuaSprite('FollowedIcon', 'FollowedIcon', getProperty('healthBar.x') - 75, getProperty('healthBar.y') - 125)

    addAnimationByPrefix('FollowedIcon', 'Normal', 'SinnohIcon', 24, true);
    addAnimationByPrefix('FollowedIcon', 'Losing', 'LoseIcon', 24, true);
    
    
    addAnimationByPrefix('bar', '1Bar', '15Bar', 24, true);
    addAnimationByPrefix('bar', '2Bar', '14Bar', 24, true);
    addAnimationByPrefix('bar', '3Bar', '13Bar', 24, true);
    addAnimationByPrefix('bar', '4Bar', '12Bar', 24, true);
    addAnimationByPrefix('bar', '5Bar', '11Bar', 24, true);
    addAnimationByPrefix('bar', '6Bar', '10Bar', 24, true);
    addAnimationByPrefix('bar', '7Bar', '9Bar', 24, true);
    addAnimationByPrefix('bar', '8Bar', '8Bar', 24, true);
    addAnimationByPrefix('bar', '9Bar', '7Bar', 24, true);
    addAnimationByPrefix('bar', '10Bar', '6Bar', 24, true);
    addAnimationByPrefix('bar', '11Bar', '5Bar', 24, true);
    addAnimationByPrefix('bar', '12Bar', '4Bar', 24, true);
    addAnimationByPrefix('bar', '13Bar', '3Bar', 24, true);
    addAnimationByPrefix('bar', '14Bar', '2Bar', 24, true);
    addAnimationByPrefix('bar', '15Bar', '1Bar', 24, true);

    addAnimationByPrefix('gauge', '1Gauge', '1Gauge', 24, true);
    addAnimationByPrefix('gauge', '2Gauge', '2Gauge', 24, true);
    addAnimationByPrefix('gauge', '3Gauge', '3Gauge', 24, true);
    addAnimationByPrefix('gauge', '4Gauge', '4Gauge', 24, true);
    addAnimationByPrefix('gauge', '5Gauge', '5Gauge', 24, true);
    addAnimationByPrefix('gauge', '6Gauge', '6Gauge', 24, true);
    addAnimationByPrefix('gauge', '7Gauge', '7Gauge', 24, true);
    addAnimationByPrefix('gauge', '8Gauge', '8Gauge', 24, true);
    addAnimationByPrefix('gauge', '9Gauge', '9Gauge', 24, true);
    addAnimationByPrefix('gauge', '10Gauge', '10Gauge', 24, true);
    addAnimationByPrefix('gauge', '11Gauge', '11Gauge', 24, true);
    addAnimationByPrefix('gauge', '12Gauge', '12Gauge', 24, true);
    addAnimationByPrefix('gauge', '13Gauge', '13Gauge', 24, true);
    addAnimationByPrefix('gauge', '14Gauge', '14Gauge', 24, true);
    addAnimationByPrefix('gauge', '15Gauge', '15Gauge', 24, true);
    addAnimationByPrefix('gauge', '16Gauge', '16Gauge', 24, true);
    addAnimationByPrefix('gauge', '17Gauge', '17Gauge', 24, true);
    addAnimationByPrefix('gauge', '18Gauge', '18Gauge', 24, true);
    addAnimationByPrefix('gauge', '19Gauge', '19Gauge', 24, true);



    setObjectCamera('bar','HUD');
    setObjectCamera('gauge','HUD');
    setObjectCamera('FollowedIcon','HUD');
    
    scaleObject('FollowedIcon', 1.25, 1.25);
    scaleObject('bar', 1.5, 1.5);
    scaleObject('gauge', 1.5, 1.5);

	addLuaSprite('bar');
    addLuaSprite('gauge');
    addLuaSprite('FollowedIcon');
	setProperty('bar.antialiasing', false)
	setProperty('gauge.antialiasing', false)
	setProperty('FollowedIcon.antialiasing', false)

    playAnim('bar', HP..'Bar', true);

end



        

function onUpdatePost()
    --debugPrint(HP)
    if HP <= 0 then
        setProperty('health', 0)
    end

    --debugPrint(getProperty('bar.animation.curAnim.name'))
    runHaxeCode("for (note in game.unspawnNotes) note.hitHealth = 0;")
    runHaxeCode("for (note in game.notes) note.hitHealth = 0;")
end

  function goodNoteHit(a, b, c, isSustain)
    if not isSustain then
        counter = counter+1
    end

    if counter == 21 and HP ~= 15 and not isSustain then 
        counter = 0
        HP = HP + 1 
    end

    if counter >= 20 then
        counter = 20
    end

    if HP >= 15 then
        HP = 15
    end

    if HP <= 3 then
        playAnim('FollowedIcon', 'Losing', true)
    else
        playAnim('FollowedIcon', 'Normal', true)
    end

    playAnim('gauge', counter..'Gauge', true)
    playAnim('bar', HP..'Bar', true)
end

function noteMiss()
    HP = HP - 1
    counter = 0
    playAnim('bar', HP..'Bar', true)
    if HP <= 3 then
        playAnim('FollowedIcon', 'Losing', true)
    else
        playAnim('FollowedIcon', 'Normal', true)
    end
end


function noteMissPress()
    HP = HP - 1
    counter = 0
    playAnim('bar', HP..'Bar', true)
    if HP <= 3 then
        playAnim('FollowedIcon', 'Losing', true)
    else
        playAnim('FollowedIcon', 'Normal', true)
    end
end
