function onCreate()
    --you can copy the parts below as much as you want
	makeLuaSprite('illusionpixel', 'illusionpixel', -500, -190); --edit the X and Y values
	setProperty('illusionpixel.antialiasing', false)
	scaleObject('illusionpixel', 8, 8)
end

function onUpdate(elapsed)
    --Change To Pixel
	if curStep == 782 then
	    removeLuaSprite('taforrestbgback', false); --you can copy this as much as you want
		addLuaSprite('illusionpixel', false); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'PIXELNOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'PIXELNOTE_assets');
	    end
	end

	if curStep == 782 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'PIXELNOTE_assets');
            end
	end
	--Back to normal
	if curStep == 1040 then
	    removeLuaSprite('illusionpixel', false); --Or true
		addLuaSprite('taforrestbgback', false); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 1040 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
    end