animationsList = {}

local defaultstrumy
local songPosition

local safeZoneOffset

local isStrummin = false

local player3 = 'HypnoMano' -- Change this to your LUA character

function makeAnimationList(object)
	animationsList[0] = 'keyArrow' -- idle
	animationsList[1] = 'keyConfirm' -- key confirmed
	animationsList[2] = 'keyPressed' -- key miss
end

offsets = {};

function makeOffset(object)
	offsets[0] = {x=36, y=36}
	offsets[1] = {x=63, y=59}
	offsets[2] = {x=34, y=34}
end

function onCreatePost()
	safeZoneOffset = getPropertyFromClass('Conductor', 'safeZoneOffset') / 10

	defaultstrumy = 50

	directions = {'left', 'down', 'up', 'right'}
	
	makeAnimationList('strum')
	makeOffset('strum')
	for i=1, #directions do
if difficultyName == 'Lord-X' or difficultyName == 'Mx' then
		makeAnimatedLuaSprite('strum'..directions[i], 'NOTE_assets' ,853,60)
		end
if difficultyName == 'Hypno' then
		makeAnimatedLuaSprite('strum'..directions[i], 'NOTE_assets' ,425,60)
		end
		
		addAnimationByPrefix('strum'..directions[i], 'keyConfirm', directions[i]..' confirm', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyPressed', directions[i]..' press', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyArrow', 'arrow'..directions[i]:upper(), 24, false)

		setObjectCamera('strum'..directions[i], 'camHUD')
		scaleObject('strum'..directions[i], 0.7, 0.7)
		
		setProperty('strum'..directions[i]..'.alpha', 0)
		
		addLuaSprite('strum'..directions[i])
		
		playAnimation('strum'..directions[i], 0, true)
	end
    for i=2, #directions do
if difficultyName == 'Lord-X' or difficultyName == 'Mx' then
		makeAnimatedLuaSprite('strum'..directions[i], 'NOTE_assets' ,955,60)
		end
if difficultyName == 'Hypno' then
		makeAnimatedLuaSprite('strum'..directions[i], 'NOTE_assets' ,530,60)
		end
		
		addAnimationByPrefix('strum'..directions[i], 'keyConfirm', directions[i]..' confirm', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyPressed', directions[i]..' press', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyArrow', 'arrow'..directions[i]:upper(), 24, false)

		setObjectCamera('strum'..directions[i], 'camHUD')
		scaleObject('strum'..directions[i], 0.7, 0.7)
		
		setProperty('strum'..directions[i]..'.alpha', 0)
		
		addLuaSprite('strum'..directions[i])
		
		playAnimation('strum'..directions[i], 0, true)
	end
   for i=3, #directions do
if difficultyName == 'Lord-X' or difficultyName == 'Mx' then
		makeAnimatedLuaSprite('strum'..directions[i], 'NOTE_assets' ,1058,60)
		end
if difficultyName == 'Hypno' then
		makeAnimatedLuaSprite('strum'..directions[i], 'NOTE_assets' ,636,60)
		end
		
		addAnimationByPrefix('strum'..directions[i], 'keyConfirm', directions[i]..' confirm', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyPressed', directions[i]..' press', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyArrow', 'arrow'..directions[i]:upper(), 24, false)

		setObjectCamera('strum'..directions[i], 'camHUD')
		scaleObject('strum'..directions[i], 0.7, 0.7)
		
		setProperty('strum'..directions[i]..'.alpha', 0)
		
		addLuaSprite('strum'..directions[i])
		
		playAnimation('strum'..directions[i], 0, true)
	end
     for i=4, #directions do
if difficultyName == 'Lord-X' or difficultyName == 'Mx' then
		makeAnimatedLuaSprite('strum'..directions[i], 'NOTE_assets' ,1165,60)
		end
if difficultyName == 'Hypno' then
		makeAnimatedLuaSprite('strum'..directions[i], 'NOTE_assets' ,740,60)
		end
		
		addAnimationByPrefix('strum'..directions[i], 'keyConfirm', directions[i]..' confirm', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyPressed', directions[i]..' press', 24, false)
		addAnimationByPrefix('strum'..directions[i], 'keyArrow', 'arrow'..directions[i]:upper(), 24, false)

		setObjectCamera('strum'..directions[i], 'camHUD')
		scaleObject('strum'..directions[i], 0.7, 0.7)
		
		setProperty('strum'..directions[i]..'.alpha', 0)
		
		addLuaSprite('strum'..directions[i])
		
		playAnimation('strum'..directions[i], 0, true)
end
end

function playAnimation(characterName, animId, forced) -- thank you shadowmario :imp:
	-- 0 = keyArrow
	-- 1 = keyConfirm
	-- 2 = keyPressed

	local animName = animationsList[animId]
	objectPlayAnimation(characterName, animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	setProperty(characterName..'.offset.x', offsets[animId].x);
	setProperty(characterName..'.offset.y', offsets[animId].y);
	
	if animId == 1 then
		runTimer('stopanim'..characterName, 0.1)
	end
end

function onTimerCompleted(tag)
	if(string.sub(tag,1,8) == "stopanim") then
        	playAnimation(string.sub(tag,9), 0, true)
    	end
end

local direcciones = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
function onUpdatePost()
	songPosition = getPropertyFromClass('Conductor', 'songPosition')

	-- NOTE: IF YOU WANT TO ADD STUFF THAT'LL UPDATE ONUPDATEPOST, PUT THEM BEFORE THE GAME COUNTS ALL 3RD STRUM NOTES

	for i=0,getProperty('notes.length')-1 do
		    if getPropertyFromGroup('notes', i, 'noteType') == 'HypnoPastaNight' then

			if not isStrummin then
				return
			end	

			local noteX = getPropertyFromGroup('notes', i, 'x');
			local noteY = getPropertyFromGroup('notes', i, 'y');

			setPropertyFromGroup('notes', i, 'ignoreNote', true)	

			hitbox = 45;
			local isSustainNote = getPropertyFromGroup('notes', i, 'isSustainNote');
			
			local noteData = getPropertyFromGroup('notes', i, 'noteData');
			
			strumY = getProperty('strum'..directions[noteData + 1]..'.y')	

			noteX = getProperty('strum'..directions[noteData + 1]..'.x')
			local noteStrumTime = getPropertyFromGroup('notes', i, 'strumTime')
			
			local hitMult = 1
			if isSustainNote then
				noteX = noteX + 37;
				hitMult = 0.5
			end

				noteY = strumY - 0.45 * (songPosition - noteStrumTime) * getProperty('songSpeed')
			
			setPropertyFromGroup('notes', i, 'x', noteX)
			setPropertyFromGroup('notes', i, 'y', noteY)
			
			if (noteStrumTime > songPosition - safeZoneOffset and noteStrumTime < songPosition + (safeZoneOffset * hitMult)) then
				removeFromGroup('notes', i)
				playAnimation('strum'..directions[noteData+1], 1, false)
				triggerEvent('Play Animation',direcciones[noteData + 1], 'gf')
				if difficultyName == 'Lord-X' or difficultyName == 'Mx' then
				objectPlayAnimation(player3, 'sing'..directions[noteData+1]:upper(), true);
				setProperty(player3..'.offset.x', offsets[player3]['sing'..directions[noteData+1]:upper()].x)
				setProperty(player3..'.offset.y', offsets[player3]['sing'..directions[noteData+1]:upper()].y)
				end
			end
		end
	end
end


function onCountdownTick(counter)--Para que aparezca antes xd
	if counter  == 0 then
      isStrummin = true
                for strum=1, #directions do
			    setProperty('strum'..directions[strum]..'.y', defaultstrumy+50) 
				doTweenY('strumTweening'..strum, 'strum'..directions[strum], defaultstrumy, 0.1 + 0.1*strum, 'quadInOut')
				doTweenAlpha('strumAlphaTweening'..strum, 'strum'..directions[strum], 0.5, 0.01 + 0.05*strum, 'easeInOut')
			end
end
end