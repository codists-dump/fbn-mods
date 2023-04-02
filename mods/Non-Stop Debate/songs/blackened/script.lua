local pushLeft = {'himiko', 'standH', 'gfGroup', 'standKo', 'kaito'};
local pushRight = {'boyfriendGroup', 'tenko', 'standT', 'kiibo', 'standKi'};

function onCreate()
    luaDebugMode = true;
    setPropertyFromClass('GameOverSubstate', 'characterName', 'mewhenclairdelune');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'horn');

    makeLuaSprite('endScreen', 'thumbnail', 0, 0);
    setObjectCamera('endScreen', 'hud');
    setProperty('endScreen.visible', false);
    addLuaSprite('endScreen');

    makeLuaSprite('startBG', nil, 0, 0);
    makeGraphic('startBG', 1280, 720, '000000');
    setObjectCamera('startBG', 'hud');
    addLuaSprite('startBG');
end

function onStartCountdown()
    local ohNo = getRandomInt(1, 100);
    if ohNo == 5 then
        triggerEvent('Change Character', 'gf', 'nagito');
        runHaxeCode("game.iconP2.changeIcon('drnagito');");
        setHealthBarColors('42C458', '386DEE');
    else
        runHaxeCode("game.iconP2.changeIcon('drkokichi');");
        setHealthBarColors('CC3AF3', '386DEE');
    end

    return Function_Continue;
end

function onUpdate()
    if ohNo == 5 then
        setTextString('scoreTxt', 'WHAT THE FUCK');
    end
end

function onStepHit()
    if curStep == 1 then
        doTweenZoom('camGameZoom', 'camGame', 0.65, 6, 'quintOut');
        doTweenAlpha('camGameAlpha', 'startBG', 0, 3, 'sineInOut');

    elseif curStep == 256 then
        doTweenZoom('ermmmm', 'camGame', 1, 0.25, 'quadIn');

    elseif curStep == 1128 or curStep == 1192 then
        doTweenZoom('ermmmm', 'camGame', 1, 0.3, 'sineOut');

    elseif curStep == 1152 or curStep == 1216 then
        doTweenZoom('ermmmm', 'camGame', 1.05, 0.3, 'sineOut');

    elseif curStep == 1240 then
        doTweenX('gay', 'eyecatchKo', 0, 0.6, 'expoOut');
        doTweenX('homosexual', 'eyecatchSh', 0, 0.6, 'expoOut');

    elseif curStep == 1244 then
        doTweenX('gay', 'eyecatchKo', screenWidth, 0.4, 'expoIn');
        doTweenX('homosexual', 'eyecatchSh', -screenWidth, 0.4, 'expoIn');

    elseif curStep == 1248 then
        for i = 1,#pushLeft do
            doTweenX('left'..i, pushLeft[i], -1000, 0.8, 'expoIn');
            doTweenX('right'..i, pushRight[i], 1700, 0.8, 'expoIn');
        end
        
        doTweenAlpha('camHUDAlpha', 'camHUD', 0, 1.8, 'sineInOut');
        doTweenY('WHAT', 'dadGroup', -360, 3, 'sineOut');
        doTweenY('WHAT2', 'highChair', -280, 3, 'sineOut');
    elseif curStep == 1301 then
        setHealth(1);
        runHaxeCode("game.iconP2.changeIcon('drmonokuma');");
        doTweenAlpha('camHUDAlpha', 'camHUD', 1, 1, 'sineInOut');
    elseif curStep == 1312 then
        doTweenX('kok', 'gfGroup', 150, 1, 'sineOut');
    elseif curStep == 1328 then
        doTweenX('shush', 'boyfriendGroup', 1000, 1, 'sineOut');
    elseif curStep == 2240 then
        doTweenZoom('itendshere', 'camGame', 1.1, 1.6, 'sineInOut');
    elseif curStep == 2448 then
        doTweenZoom('finalzoom', 'camGame', 1.2, 6.6, 'sineInOut');
    elseif curStep == 2256 then
        doTweenX('shoo', 'dadGroup', -1200, 2, 'expoOut');
        doTweenX('shoo2', 'highChair', -1200, 2, 'expoOut');

        runHaxeCode([[
            game.iconP1.changeIcon('drshuichi');
            game.iconP2.changeIcon('drkokichi');
        ]]);
        setHealthBarColors('CC3AF3', '386DEE');
    elseif curStep == 2512 then
        cameraFlash('hud', 'FFFFFF', 0.6, false);
        triggerEvent('Add Camera Zoom', '', '3.5');
        setProperty('endScreen.visible', true);
    elseif curStep == 2544 then
        doTweenAlpha('camGameAlpha', 'startBG', 1, 6, 'sineInOut');
    end
end

function onTweenCompleted(tag)
    if tag == 'ermmmm' then
        setProperty('defaultCamZoom', 1);
    elseif tag == 'left1' then
        local remove = {'himiko', 'standH', 'standKo', 'kaito', 'tenko', 'standT', 'kiibo', 'standKi'};
        for i = 1,#remove do
            removeLuaSprite(remove[i], false);
        end
    end
end