function onCreate()
    --you can copy the parts below as much as you want
	makeLuaSprite('bwbg2', 'bwbg2', 40, 25); --edit the X and Y values
	setProperty('bwbg2.antialiasing', false)
	scaleObject('bwbg2', 1.4, 1.4)

	makeLuaSprite('bwbg3', 'bwbg3', 40, 25); --edit the X and Y values
	setProperty('bwbg3.antialiasing', false)
	scaleObject('bwbg3', 1.4, 1.4)
end

function onUpdate(elapsed)
    --Change To Pixel
	if curStep == 652 then
	    removeLuaSprite('bwbg1', false); --you can copy this as much as you want
		addLuaSprite('bwbg2', false); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'smb3Notes');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'smb3Notes');
	    end
	end

	if curStep == 652 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'smb3Notes');
            end
	end
	--Back to normal
	if curStep == 970 then
	    removeLuaSprite('bwbg2', false); --Or true
		addLuaSprite('bwbg3', false); --Or true

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'smb3Notes');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'smb3Notes');
	    end
	end

	if curStep == 970 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'smb3Notes');
            end
	end
    end