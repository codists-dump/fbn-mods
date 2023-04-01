-- script base by ItsCapp
idleoffsets = {'-5', '0'} -- I recommend you have your idle offset at 0
upoffsets = {'-5', '0'}
downoffsets = {'-5', '0'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'Ball_Idle_Normal'
up_xml_name = 'Ball_FinalBurst'
down_xml_name = 'Ball_Throw'

-- basically horizontal and vertical positions
x_position = 1900
y_position = 2600

-- scales your character (set to 1 by default)
xScale = 5.5
yScale = 5.5

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = false

-- pretty self-explanitory
name_of_character_xml = 'missingnopokeball_assets'
name_of_character = 'missingno-intro'
name_of_notetype = 'missingno'

-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = true
playablecharacter = true -- change to 'true' if you want to flipX

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/buried' .. name_of_character_xml, x_position, y_position);

	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	
	setProperty(name_of_character .. '.antialiasing', false);

	scaleObject(name_of_character, xScale, yScale);

	objectPlayAnimation(name_of_character, 'idle');
	addLuaSprite(name_of_character, foreground);

	if invisible == true then
		setPropertyLuaSprite(name_of_character, 'alpha', 0)
	end
end

-- I know this is messy, but it's the only way I know to make it work on both sides.
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype then
		objectPlayAnimation(name_of_character, singAnims[direction + 1], false);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);
		end
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
end

function onStepHit()
	if curStep == 1688 then
		doTweenX(name_of_character, name_of_character, 1, 0)
		doTweenAlpha(name_of_character, name_of_character, 1, 0.1)
	end
		if curStep == 1696 then
			doTweenX(name_of_character, name_of_character, -1, 0)
			doTweenAlpha(name_of_character, name_of_character, 0, 0.1)
	end
end