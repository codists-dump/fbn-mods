function onCreate()
    --you can copy the parts below as much as you want
	makeAnimatedLuaSprite('forestfirebg', 'forestfirebg', 600, 0)
	addAnimationByPrefix('forestfirebg','forestfirebg','p3bg',24, true)
	scaleObject('forestfirebg', 1, 1); 

	makeLuaSprite('peachbg', 'peachbg', 400, 20); --edit the X and Y values
	setProperty('peachbg.antialiasing', true)
	scaleObject('peachbg', 1, 1)

	makeLuaSprite('yoshibg', 'yoshibg', 300, 30); --edit the X and Y values
	setProperty('yoshibg.antialiasing', true)
	scaleObject('yoshibg', 1, 1)
end

function onUpdate(elapsed)
    --Change To Pixel
	if curStep == 1038 then
	    removeLuaSprite('luigibg', false); --you can copy this as much as you want
		addLuaSprite('forestfirebg', false); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 1038 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
	--Back to normal
	if curStep == 1294 then
	    removeLuaSprite('forestfirebg', false); --Or true
		addLuaSprite('peachbg', false); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 1294 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
    --Change To Pixel
	if curStep == 2318 then
	    removeLuaSprite('peachbg', false); --you can copy this as much as you want
		addLuaSprite('forestfirebg', false); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 2318 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
    --Change To Pixel
	if curStep == 2832 then
	    removeLuaSprite('forestfirebg', false); --you can copy this as much as you want
		addLuaSprite('yoshibg', false); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 2832 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
    --Change To Pixel
	if curStep == 4112 then
	    removeLuaSprite('yoshibg', false); --you can copy this as much as you want
		addLuaSprite('forestfirebg', false); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 4112 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
    end