-- script base by ItsCapp
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'0', '0'}
downoffsets = {'0', '0'}
upoffsets = {'0', '0'}
rightoffsets = {'0', '0'}
animacion2offsets = {'0', '0'}
animacionoffsets = {'0', '0'}

missleftoffsets = {'50', '0'}
missdownoffsets = {'-0', '0'}
missupoffsets = {'10', '50'}
missrightoffsets = {'-50', '0'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'Muk_Idle0'
left_xml_name = 'Muk_Left0'
down_xml_name = 'Muk_Down0'
up_xml_name = 'Muk_Up0'
right_xml_name = 'Muk_Right0'
animacion_xml_name = 'Muk_Puke0'
animacion2_xml_name = 'Muk_Intro0'
animacion3_xml_name = 'Muk_Intro0'

left_miss_xml_name = 'BA_Missingno_Left Miss0'
down_miss_xml_name = 'BA_Missingno_Down Miss'
up_miss_xml_name = 'BA_Missingno_Up Miss0'
right_miss_xml_name = 'BA_Missingno_Right Miss0'
-- basically horizontal and vertical positions
x_position = 700
y_position = 690

-- scales your character (set to 1 by default)
xScale = 6.4
yScale = 6.4

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = true

-- pretty self-explanitory
name_of_character3_xml = 'leanmonster'
name_of_character3 = 'leanmonster'
name_of_notetype = 'leanmonster_Nota'
name_of_notetype2 = 'missingno_Nota'


-- if it's set to true the character appears behind the default characters, including gf, watch out for that
foreground = true
playablecharacter = false -- change to 'true' if you want to flipX

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character3, 'characters/buried/' .. name_of_character3_xml, x_position, y_position);
	addAnimationByPrefix(name_of_character3, 'idle', idle_xml_name, 24, false);
	addAnimationByPrefix(name_of_character3, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character3, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character3, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character3, 'singRIGHT', right_xml_name, 24, false);

	addAnimationByPrefix(name_of_character3, 'singLEFTmiss', left_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character3, 'singDOWNmiss', down_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character3, 'singUPmiss', up_miss_xml_name, 24, false);
    addAnimationByPrefix(name_of_character3, 'singRIGHTmiss', right_miss_xml_name, 24, false);

	addAnimationByPrefix(name_of_character3, 'singLEFT-alt', left_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character3, 'singDOWN-alt', down_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character3, 'singUP-alt', up_alt_xml_name, 24, false);
    addAnimationByPrefix(name_of_character3, 'singRIGHT-alt', right_alt_xml_name, 24, false);
	addAnimationByPrefix(name_of_character3, 'asco', animacion_xml_name, 24, false);
	addAnimationByPrefix(name_of_character3, 'xd', animacion2_xml_name, 24, false);
	addAnimationByIndices(name_of_character3, 'bay', animacion3_xml_name,'34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0',24);


	setProperty(name_of_character3 .. '.antialiasing', false);

	if playablecharacter == true then
		setPropertyLuaSprite(name_of_character3, 'flipX', true);
	else
		setPropertyLuaSprite(name_of_character3, 'flipX', false);
	end

	scaleObject(name_of_character3, xScale, yScale);

	objectPlayAnimation(name_of_character3, 'idle');
	addLuaSprite(name_of_character3, foreground);

	if invisible == true then
		setPropertyLuaSprite(name_of_character3, 'alpha', 0.0)
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
local altAnims ={"singLEFT-alt", "singDOWN-alt", "singUP-alt", "singRIGHT-alt", "asco","xd"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == name_of_notetype or noteType == name_of_notetype2 then
		idle = false
		objectPlayAnimation(name_of_character3, singAnims[direction + 1], true);
         runTimer('idle', 1)
		if direction == 0 then
			setProperty(name_of_character3 .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character3 .. '.offset.y', leftoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character3, singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty(name_of_character3 .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character3 .. '.offset.y', downoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character3, singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty(name_of_character3 .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character3 .. '.offset.y', upoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character3, singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty(name_of_character3 .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character3 .. '.offset.y', rightoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character3, singAnims[direction + 1], true);
			end
		elseif direction == 4 then
			setProperty(name_of_character3 .. '.offset.x', animacionoffsets[1]);
			setProperty(name_of_character3 .. '.offset.y', animacionoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character3, singAnims[direction + 1], true);
			end
		elseif direction == 5 then
			setProperty(name_of_character3 .. '.offset.x', animacion2offsets[1]);
			setProperty(name_of_character3 .. '.offset.y', animacion2offsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character3, singAnims[direction + 1], true);
			end
		end
	end
	if noteType == altnotetype or noteType == altnotetype2 then
        idle = false
        objectPlayAnimation(name_of_character3, altAnims[direction + 1], true);

        if direction == 0 then
            setProperty(name_of_character3 .. '.offset.x', leftAltoffsets[1]);
            setProperty(name_of_character3 .. '.offset.y', leftAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character3, altAnims[direction + 1], true);
            end
        elseif direction == 1 then
            setProperty(name_of_character3 .. '.offset.x', dowAltnoffsets[1]);
            setProperty(name_of_character3 .. '.offset.y', downAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character3, altAnims[direction + 1], true);

            end
        elseif direction == 2 then
            setProperty(name_of_character3 .. '.offset.x', upAltoffsets[1]);
            setProperty(name_of_character3 .. '.offset.y', upAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character3, altAnims[direction + 1], true);
            end
        elseif direction == 3 then
            setProperty(name_of_character3 .. '.offset.x', rightAltoffsets[1]);
            setProperty(name_of_character3 .. '.offset.y', rightAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character3, altAnims[direction + 1], true);
            end
		elseif direction == 4 then
            setProperty(name_of_character3 .. '.offset.x', animacionAltoffsets[1]);
            setProperty(name_of_character3 .. '.offset.y', animacionAltoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character3, altAnims[direction + 1], true);
            end
		elseif direction == 5 then
            setProperty(name_of_character3 .. '.offset.x', animacion2Altoffsets[1]);
            setProperty(name_of_character3 .. '.offset.y', animacion2Altoffsets[2]);

            if isSustainNote then
                objectPlayAnimation(name_of_character3, altAnims[direction + 1], true);
            end
        end
    end
end

	function onStepHit()
	if curStep == 2698 then
	idle = false
	objectPlayAnimation(name_of_character3, 'xd'); 
	setProperty(name_of_character3 .. '.offset.x', animacionoffsets[1]);
    setProperty(name_of_character3 .. '.offset.y', animacionoffsets[2]);
	runTimer('idle', 1.7)
	end
if difficultyName =='Hard' then
	if curStep == 2713 then
		idle = false
		objectPlayAnimation(name_of_character3, 'idle'); 
		runTimer('idle', 1.7)
		end
	if curStep == 2938 then
	idle = false
	objectPlayAnimation(name_of_character3, 'asco'); 
	runTimer('idle', 1.7)
	runTimer('holaCumXD', 0.2)
	end
end
	if curStep == 2944 then
	objectPlayAnimation('dad','xd',false);
		end
		if curStep == 2948 then
			objectPlayAnimation('dad','xd',false);
				end
				if curStep == 2950 then
					objectPlayAnimation('dad','xd',false);
						end
						if curStep == 2952 then
							objectPlayAnimation('dad','xd',false);
								end
if difficultyName =='Hard' then    
	if curStep == 3056 then
		idle = false
		objectPlayAnimation(name_of_character3, 'asco'); 
		runTimer('idle', 1.7)
		runTimer('holaCumXD', 0.2)
		end
		if curStep == 3296 then
			idle = false
			objectPlayAnimation(name_of_character3, 'asco'); 
			runTimer('idle', 1.7)
			runTimer('holaCumXD', 0.2)
			end
			if curStep == 3444 then
				idle = false
				objectPlayAnimation(name_of_character3, 'asco'); 
				runTimer('idle', 1.7)
				runTimer('holaCumXD', 0.2)
				end    
				end
				if curStep > 3458 then
               idle = false
              end
             if curStep == 3458 then  
               objectPlayAnimation('leanmonster', 'bay'); 		
			   runTimer('adiosMuk',1.5)
			   doTweenAlpha('muksludge', 'muksludge', 0, 0.3, 'quadInOut');
				end
              if curStep == 3488 then--Por si acaso
                removeLuaSprite('leanmonster',true)
	            removeLuaSprite('muksludge',true)
     end
	end
	
	function onBeatHit()
	  if idle == true then
	if curBeat % 2 == 0 then     
	objectPlayAnimation(name_of_character3, 'idle');
	doTweenAlpha('muksludge', 'muksludge', 0, 0.3, 'quadInOut');
    end
	end
	end

function onUpdate(elapsed)
    RandomCum = math.random(1,3) 
   end
	
	function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'idle' then
	idle=true
	end
     if tag == 'holaCumXD' then  
      makeAnimatedLuaSprite('muksludge','stages/buried/muksludge',-125,-100)
      scaleObject('muksludge',4,4)
      setProperty('muksludge.antialiasing', false);
      addLuaSprite('muksludge',true)     
      setObjectCamera('muksludge', 'HUD')
      playSound('MukCums',1)
      cameraShake('hud', 0.01, 0.65)
      noLoop = true
      if noLoop == true then
     if RandomCum == 1 then
     addAnimationByPrefix('muksludge','idle','Sludge_01',24,false)
      objectPlayAnimation('muksludge','idle',false)
      noLoop = false
    end
    if RandomCum == 2 then
    addAnimationByPrefix('muksludge','idle2','Sludge_02',24,false)
      objectPlayAnimation('muksludge','idle2',false)
      noLoop = false
    end    
    if RandomCum == 3 then
    addAnimationByPrefix('muksludge','idle3','Sludge_03',24,false)
      objectPlayAnimation('muksludge','idle3',false)
      noLoop = false
    end
    end 
    end
    if tag == 'adiosMuk' then
	removeLuaSprite('leanmonster',true)
	removeLuaSprite('muksludge',true)
	end
	end

function onEvent(name,value1)
	if name == 'Stage Buried' then 
     if value1 == 'intro' then
	doTweenAlpha(name_of_character3, name_of_character3, 1, 0.01)
	   end
	end
end