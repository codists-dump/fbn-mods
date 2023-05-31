local powerup = 1
local lastPowerup = -1

local invFrames = 0
local invFrameAlpha = 0

local dead = false

local deathFrame = 0
local deathVsp = -1

local mfc = true

local fakeScore = 0

function onCreate()
	addCharacterToList("codist-smb", "boyfriend")
	addCharacterToList("codist-smb-small", "boyfriend")
	addCharacterToList("codist-smb-fire", "boyfriend")
	
	x = getProperty("boyfriend.x") + 18
	y = getProperty("boyfriend.y") + 34
	
	makeLuaSprite("deadSprite", "smb/codistSmbDead", x, y)
	setProperty("deadSprite.antialiasing", false)
	setProperty("deadSprite.visible", false)
	addLuaSprite("deadSprite", true)
	
	makeAnimatedLuaSprite("rating", "smb/ratings", 115, 180)
	
	addAnimationByPrefix("rating", "0", "0")
	addAnimationByPrefix("rating", "150", "150")
	addAnimationByPrefix("rating", "350", "350")
	addAnimationByPrefix("rating", "1up", "1up")
	addAnimationByPrefix("rating", "50-minus", "50-minus")
	addAnimationByPrefix("rating", "100-minus", "100-minus")
	
	setProperty("rating.antialiasing", false)
	setProperty("rating.visible", false)
	
	addLuaSprite("rating", true)
	
	setProperty("skipCountdown", true)
end

function onUpdate(elapsed)
	if dead then
		deathFrame = deathFrame + elapsed
		
		if deathFrame > 0.6 then
			deathVsp = deathVsp + (2 * elapsed)
			setProperty("deadSprite.y", getProperty("deadSprite.y") + deathVsp)
		end
	end
	
	ratingY = getProperty("rating.y")
	
	if ratingY < 150 then
		setProperty("rating.visible", false)
	else
		setProperty("rating.y", ratingY-(35*elapsed))
	end
	
	if dead then return end

	if powerup ~= lastPowerup then
		if powerup == 0 then 
			triggerEvent('Change Character', 0, 'codist-smb-small');
		end
		
		if powerup == 1 then 
			triggerEvent('Change Character', 0, 'codist-smb');
		end
		
		if powerup == 2 then 
			triggerEvent('Change Character', 0, 'codist-smb-fire');
		end
	end

	lastPowerup = powerup
	
	if invFrames > 0 then
		invFrames = invFrames - elapsed
		
		timer = 0.025
		
		if invFrameAlpha <= timer then
			setProperty("boyfriend.alpha", 0)
		else
			setProperty("boyfriend.alpha", 1)
			
			if invFrameAlpha >= timer*2 then
				invFrameAlpha = 0
			end
		end
	else
		setProperty("boyfriend.alpha", 1)
	end
	
	invFrameAlpha = invFrameAlpha + elapsed
end

function onBeatHit()
	if dead then return end

	curStep = getProperty("curStep")
	
	if curStep % 192 == 0 then
		if powerup < 2 then
			for i=0, 16, 1 do
				value = getPropertyFromGroup("unspawnNotes", i, "mustPress")
				
				if value == true then
					setPropertyFromGroup("unspawnNotes", i, "noteType", "powerup")
					
					if powerup == 0 then 
						setPropertyFromGroup('unspawnNotes', i, 'texture', 'smb/shroom') 
					else
						setPropertyFromGroup('unspawnNotes', i, 'texture', 'smb/flower') 
					end
					
					break
				end
			end
		end
	end
end

function noteMissPress(direction)
	hit()
	setupRating("miss")
end

function noteMiss(id, direction, noteType, isSustainNote)
	hit()
	setupRating("miss")
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == "powerup" then
		playSound("Powerup")
	
		powerup = powerup + 1
	end
	
	rating = getPropertyFromGroup("notes", id, "rating")
	setupRating(rating)
end

function setupRating(rating)
	if rating ~= "sick" and rating ~= "miss" then mfc = false end

	if rating == "sick" then
		if mfc then
			objectPlayAnimation("rating", "1up", true)
		else
			objectPlayAnimation("rating", "350", true)
		end
	end
	
	if rating == "good" then
		objectPlayAnimation("rating", "150", true)
	end
	
	if rating == "bad" then
		objectPlayAnimation("rating", "0", true)
	end
	
	if rating == "shit" then
		objectPlayAnimation("rating", "50-minus", true)
	end
	
	if rating == "miss" then
		objectPlayAnimation("rating", "100-minus", true)
	end
	
	setProperty("rating.visible", true)
	setProperty("rating.y", 180)
end

function hit()
	setProperty("health", 1)

	if invFrames <= 0 then
		if powerup > 0 then playSound("Powerdown") end
		powerup = powerup - 1
		
		invFrames = 2.5
	end
	
	if powerup < 0 then
		setProperty("health", 0)
	end
end

function onGameOver()
	if not dead then
		playMusic("puttingsomethingheretostopthemusicfromplayinglmao")
		dead = true
		
		setProperty("boyfriend.visible", false)
		setProperty("deadSprite.visible", true)
		
		playSound("Die")
		runTimer("restartTimer", 2)
	end
	
	return Function_Stop;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == "restartTimer" then
		loadSong(songName, difficulty)
	end
end