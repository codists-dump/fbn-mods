function onCreate()
    --you can copy the parts below as much as you want
	makeLuaSprite('taforrestbgsky', 'illusionforrestbgback', -600, 0); --edit the X and Y values
	setProperty('taforrestbgsky.antialiasing', false)
	scaleObject('taforrestbgsky', 1, 1)

	makeLuaSprite('taforrestbgtrees', 'illusionforrestbgtrees', -600, 0);
	setProperty('taforrestbgtrees.antialiasing', false)
	scaleObject('taforrestbgtrees', 1, 1)

	makeLuaSprite('taforrestbgback', 'taforrestbgback', -600, 50);
	setProperty('taforrestbgback.antialiasing', false)
	scaleObject('taforrestbgback', 1, 1)

	makeLuaSprite('taforrestbgfilter', 'taforrestbgfilter', -600, 0);
	setProperty('taforrestbgfilter.antialiasing', false)
	scaleObject('taforrestbgfilter', 1, 1)

	makeLuaSprite('taforrestbgfront', 'taforrestbgfront', -600, 50);
	setProperty('taforrestbgfront.antialiasing', false)
	scaleObject('taforrestbgfront', 1, 1)
end

function onUpdate(elapsed)
    --Change To Pixel
	if curStep == 392 then
	    removeLuaSprite('illusionforrestbgback', false); --you can copy this as much as you want
	    removeLuaSprite('illusionforrestbgtrees', false);
	    removeLuaSprite('illusionforrestbg', false);
	    removeLuaSprite('illusionforrestbgfront', false);
		addLuaSprite('taforrestbgsky', false); --Or true
		addLuaSprite('taforrestbgtrees', false);
		addLuaSprite('taforrestbgfilter', false);
		addLuaSprite('taforrestbgback', false);
		addLuaSprite('taforrestbgfront', true);

	    for i=0,4,1 do
		    setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		    setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
	    end
	end

	if curStep == 392 then --This one MUST be at least 16 or 32 steps earlier (depends of the version of Psych Engine)
        for i = 0, getProperty('unspawnNotes.length')-1 do
		    setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets');
            end
	end
    end