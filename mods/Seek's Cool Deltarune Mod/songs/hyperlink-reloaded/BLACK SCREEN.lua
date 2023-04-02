function onCreate()
    makeLuaSprite('escuro', '', -1000, -200)
    makeGraphic('escuro', 4000, 2000, '000000')
    addLuaSprite('escuro', true);
	setProperty('escuro.alpha', 1);
    precacheImage('ass')
end

function onBeatHit()
    if curBeat == 28 then
        makeAnimatedLuaSprite('ass','ass', 0, 0);
		addAnimationByPrefix('ass','ass','ass ass', 15, false);--true or false to loop
		objectPlayAnimation('ass','ass', true);
		setObjectCamera('ass', 'camHUD', false);
		addLuaSprite('ass', false);
    end

    if curBeat == 31 then
        doTweenAlpha('escuro', 'escuro', 0, 0.5);
    end
end