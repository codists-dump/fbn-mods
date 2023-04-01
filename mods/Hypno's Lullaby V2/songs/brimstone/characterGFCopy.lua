-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'0', '0'}
downoffsets = {'0', '0'}
upoffsets = {'0', '0'}
rightoffsets = {'0', '0'}

animacionoffsets = {'0', '0'}

missleftoffsets = {'50', '0'}
missdownoffsets = {'-0', '0'}
missupoffsets = {'10', '50'}
missrightoffsets = {'-50', '0'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'BAGF_Idle0'
left_xml_name = 'BAGF_Left0'
down_xml_name = 'BAGF_Down0'
up_xml_name = 'BAGF_Up0'
right_xml_name = 'BAGF_Right0'


-- basically horizontal and vertical positions
x_position = 300
y_position = 400

-- scales your character (set to 1 by default)
xScale = 6
yScale = 6

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = true

-- pretty self-explanitory
name_of_charactergf_xml = 'apparitiongf_assets'
name_of_charactergf = 'gf1'
name_of_notetype = 'gf_Nota'

-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = true
playablecharacter = false -- change to 'true' if you want to flipX

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_charactergf, 'characters/buried/' .. name_of_charactergf_xml, x_position, y_position);
	addAnimationByPrefix(name_of_charactergf, 'idle', idle_xml_name, 24, true);
	addAnimationByPrefix(name_of_charactergf, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_charactergf, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_charactergf, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_charactergf, 'singRIGHT', right_xml_name, 24, false);

	addAnimationByPrefix(name_of_charactergf, 'singLEFTmiss', left_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_charactergf, 'singDOWNmiss', down_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_charactergf, 'singUPmiss', up_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_charactergf, 'singRIGHTmiss', right_miss_xml_name, 24, false);

	addAnimationByPrefix(name_of_charactergf, 'singLEFT-alt', left_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_charactergf, 'singDOWN-alt', down_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_charactergf, 'singUP-alt', up_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_charactergf, 'singRIGHT-alt', right_alt_xml_name, 24, false);
	addAnimationByPrefix(name_of_charactergf, 'singRIGHT', right_xml_name, 24, false);

	setProperty(name_of_charactergf .. '.antialiasing', false);

	if playablecharacter == true then
		setPropertyLuaSprite(name_of_charactergf, 'flipX', true);
	else
		setPropertyLuaSprite(name_of_charactergf, 'flipX', false);
	end

	scaleObject(name_of_charactergf, xScale, yScale);


	objectPlayAnimation(name_of_charactergf, 'idle');
	addLuaSprite(name_of_charactergf, foreground);

	if invisible == true then
		setPropertyLuaSprite(name_of_charactergf, 'alpha', 0)
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local altAnims ={"singLEFT-alt", "singDOWN-alt", "singUP-alt", "singRIGHT-alt"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype or noteType == name_of_notetype2 then
		doIdle = false
		objectPlayAnimation(name_of_charactergf, singAnims[direction + 1], true);

		if direction == 0 then
			setProperty(name_of_charactergf .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_charactergf .. '.offset.y', leftoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_charactergf, singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty(name_of_charactergf .. '.offset.x', downoffsets[1]);
			setProperty(name_of_charactergf .. '.offset.y', downoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_charactergf, singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty(name_of_charactergf .. '.offset.x', upoffsets[1]);
			setProperty(name_of_charactergf .. '.offset.y', upoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_charactergf, singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty(name_of_charactergf .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_charactergf .. '.offset.y', rightoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_charactergf, singAnims[direction + 1], true);
			end
		elseif direction == 4 then
			setProperty(name_of_charactergf .. '.offset.x', animaciooffsets[1]);
			setProperty(name_of_charactergf .. '.offset.y', animacionoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_charactergf, singAnims[direction + 1], true);
			end
		end
	end
	if noteType == altnotetype or noteType == altnotetype2 then
        doIdle = false
        objectPlayAnimation(name_of_charactergf, altAnims[direction + 1], true);

        if direction == 0 then
            setProperty(name_of_charactergf .. '.offset.x', leftAltoffsets[1]);
            setProperty(name_of_charactergf .. '.offset.y', leftAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_charactergf, altAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_charactergf .. '.offset.x', dowAltnoffsets[1]);
            setProperty(name_of_charactergf .. '.offset.y', downAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_charactergf, altAnims[direction + 1], true);

            end
        elseif direction == 2 then
            setProperty(name_of_charactergf .. '.offset.x', upAltoffsets[1]);
            setProperty(name_of_charactergf .. '.offset.y', upAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_charactergf, altAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_charactergf .. '.offset.x', rightAltoffsets[1]);
            setProperty(name_of_charactergf .. '.offset.y', rightAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_charactergf, altAnims[direction + 1], true);
            end
		elseif direction == 4 then
            setProperty(name_of_charactergf .. '.offset.x', animacionAltoffsets[1]);
            setProperty(name_of_charactergf .. '.offset.y', animacionAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_charactergf, altAnims[direction + 1], true);
            end
        end
    end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation(name_of_charactergf, 'idle');
		setProperty(name_of_charactergf .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_charactergf .. '.offset.y', idleoffsets[2]);
	end
	doIdle = true
end

function onStepHit()
	if curStep == 3488 then
		doTweenAlpha(name_of_charactergf, name_of_charactergf, 1, 0.1);
		end
end