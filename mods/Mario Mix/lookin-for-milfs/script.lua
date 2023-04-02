function onCreate()
    --you can copy the parts below as much as you want
	makeLuaSprite('omeglebg2', 'omeglebg2', 23, -87); --edit the X and Y values
	setProperty('omeglebg2.antialiasing', true)
	scaleObject('omeglebg2', 1, 1)

	makeLuaSprite('omeglebg3', 'omeglebg3', 23, -87); --edit the X and Y values
	setProperty('omeglebg3.antialiasing', true)
	scaleObject('omeglebg3', 1, 1)
end

function onUpdate(elapsed)
    --Change To Pixel
	if curStep == 576 then
	    removeLuaSprite('omeglebg1', false); --you can copy this as much as you want
		addLuaSprite('omeglebg2', true); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 576 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
	--Back to normal
	if curStep == 636 then
	    removeLuaSprite('omeglebg2', false); --Or true
		addLuaSprite('omeglebg3', true); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 636 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
    end