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
idle_xml_name = 'BA_Missingno_Idle0'
left_xml_name = 'BA_Missingno_Left0'
down_xml_name = 'BA_Missingno_Down0'
up_xml_name = 'BA_Missingno_Up0'
right_xml_name = 'BA_Missingno_Right0'

animacion_xml_name = 'gengar idle'

left_miss_xml_name = 'BA_Missingno_Left Miss0'
down_miss_xml_name = 'BA_Missingno_Down Miss'
up_miss_xml_name = 'BA_Missingno_Up Miss0'
right_miss_xml_name = 'BA_Missingno_Right Miss0'

-- basically horizontal and vertical positions
x_position = 0
y_position = 600

-- scales your character (set to 1 by default)
xScale = 6.5
yScale = 6.5

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = true

-- pretty self-explanitory
name_of_characterMissigno_xml = 'ba_missingno_assets'
name_of_characterMissigno = 'missingno'
name_of_notetype = 'missingno_Nota'
name_of_notetype2 = 'missingno_Nota'


-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = true
playablecharacter = false -- change to 'true' if you want to flipX

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_characterMissigno, 'characters/buried/' .. name_of_characterMissigno_xml, x_position, y_position);
	addAnimationByPrefix(name_of_characterMissigno, 'idle', idle_xml_name, 24, false);
	addAnimationByPrefix(name_of_characterMissigno, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_characterMissigno, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_characterMissigno, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_characterMissigno, 'singRIGHT', right_xml_name, 24, false);

	addAnimationByPrefix(name_of_characterMissigno, 'singLEFTmiss', left_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_characterMissigno, 'singDOWNmiss', down_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_characterMissigno, 'singUPmiss', up_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_characterMissigno, 'singRIGHTmiss', right_miss_xml_name, 24, false);

	addAnimationByPrefix(name_of_characterMissigno, 'singLEFT-alt', left_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_characterMissigno, 'singDOWN-alt', down_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_characterMissigno, 'singUP-alt', up_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_characterMissigno, 'singRIGHT-alt', right_alt_xml_name, 24, false);
	addAnimationByPrefix(name_of_characterMissigno, 'singRIGHT', animacion_xml_name, 24, false);

	setProperty(name_of_characterMissigno .. '.antialiasing', false);

	if playablecharacter == true then
		setPropertyLuaSprite(name_of_characterMissigno, 'flipX', true);
	else
		setPropertyLuaSprite(name_of_characterMissigno, 'flipX', false);
	end

	scaleObject(name_of_characterMissigno, xScale, yScale);


	objectPlayAnimation(name_of_characterMissigno, 'idle');
	addLuaSprite(name_of_characterMissigno, foreground);

	if invisible == true then
		setPropertyLuaSprite(name_of_characterMissigno, 'alpha', 0)
	end
end

-- I know this is messy, but it's the only way I know to make it work on both sides.
local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local altAnims ={"singLEFT-alt", "singDOWN-alt", "singUP-alt", "singRIGHT-alt"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype or noteType == name_of_notetype2 then
		doIdle = false
		objectPlayAnimation(name_of_characterMissigno, singAnims[direction + 1], true);

		if direction == 0 then
			setProperty(name_of_characterMissigno .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_characterMissigno .. '.offset.y', leftoffsets[2]);
		elseif direction == 1 then
			setProperty(name_of_characterMissigno .. '.offset.x', downoffsets[1]);
			setProperty(name_of_characterMissigno .. '.offset.y', downoffsets[2]);
		elseif direction == 2 then
			setProperty(name_of_characterMissigno .. '.offset.x', upoffsets[1]);
			setProperty(name_of_characterMissigno .. '.offset.y', upoffsets[2]);
		elseif direction == 3 then
			setProperty(name_of_characterMissigno .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_characterMissigno .. '.offset.y', rightoffsets[2]);
		elseif direction == 4 then
			setProperty(name_of_characterMissigno .. '.offset.x', animacionoffsets[1]);
			setProperty(name_of_characterMissigno .. '.offset.y', animacionoffsets[2]);
		end
	end
	if noteType == altnotetype or noteType == altnotetype2 then
        doIdle = false
        objectPlayAnimation(name_of_characterMissigno, altAnims[direction + 1], true);

        if direction == 0 then
            setProperty(name_of_characterMissigno .. '.offset.x', leftAltoffsets[1]);
            setProperty(name_of_characterMissigno .. '.offset.y', leftAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_characterMissigno, altAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_characterMissigno .. '.offset.x', dowAltnoffsets[1]);
            setProperty(name_of_characterMissigno .. '.offset.y', downAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_characterMissigno, altAnims[direction + 1], true);

            end
        elseif direction == 2 then
            setProperty(name_of_characterMissigno .. '.offset.x', upAltoffsets[1]);
            setProperty(name_of_characterMissigno .. '.offset.y', upAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_characterMissigno, altAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_characterMissigno .. '.offset.x', rightAltoffsets[1]);
            setProperty(name_of_characterMissigno .. '.offset.y', rightAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_characterMissigno, altAnims[direction + 1], true);
            end
		elseif direction == 4 then
            setProperty(name_of_characterMissigno .. '.offset.x', animacionAltoffsets[1]);
            setProperty(name_of_characterMissigno .. '.offset.y', animacionAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_characterMissigno, altAnims[direction + 1], true);
            end
        end
    end
end

local missAnims = {"singLEFTmiss", "singDOWNmiss", "singUPmiss", "singRIGHTmiss"}
function noteMiss(id, direction, noteType, isSustainNote)
    if noteType == name_of_notetype or noteType == name_of_notetype2 then
        doIdle = false
        objectPlayAnimation(name_of_characterMissigno, missAnims[direction + 1], true);
        if direction == 0 then
            setProperty(name_of_characterMissigno .. '.offset.x', leftMissoffsets[1]);
            setProperty(name_of_characterMissigno .. '.offset.y', leftMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_characterMissigno, missAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_characterMissigno .. '.offset.x', downMissoffsets[1]);
            setProperty(name_of_characterMissigno .. '.offset.y', downMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_characterMissigno, missAnims[direction + 1], true);
            end
        elseif direction == 2 then
            setProperty(name_of_characterMissigno .. '.offset.x', upMissoffsets[1]);
            setProperty(name_of_characterMissigno .. '.offset.y', upMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_characterMissigno, missAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_characterMissigno .. '.offset.x', rightMissoffsets[1]);
            setProperty(name_of_characterMissigno .. '.offset.y', rightMissoffsets[2]);
            if isSustainNote then
                objectPlayAnimation(name_of_characterMissigno, missAnims[direction + 1], true);
            end
        end
    end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation(name_of_characterMissigno, 'idle');
		setProperty(name_of_characterMissigno .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_characterMissigno .. '.offset.y', idleoffsets[2]);
	end
	doIdle = true
end
function onStepHit()
	if curStep == 1728 then
		doTweenAlpha(name_of_characterMissigno, name_of_characterMissigno, 1, 0.1)
	end
		if curStep == 2384 then
			doTweenAlpha(name_of_characterMissigno, name_of_characterMissigno, 0, 0.9)
	end
	if curStep == 2379 then
		doTweenY("missigno", name_of_characterMissigno, 4000, 1.9, "quadInOut");

end
end