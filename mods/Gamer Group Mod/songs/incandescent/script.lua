fakeSing = false

singLength = 0.5
fakePlayerSingTimer = 0
fakeEnemySingTimer = 0

function onCreate()
	addCharacterToList("kuu-player", "boyfriend")
	addCharacterToList("pico", "dad")
	
	makeFakeCharacter("fakePlayer", "codist", "boyfriend")
	makeFakeCharacter("fakeEnemy", "koji", "dad")
end

function onUpdate(elapsed)
	if (fakePlayerSingTimer > 0) then fakePlayerSingTimer = fakePlayerSingTimer - elapsed end
	if (fakeEnemySingTimer > 0) then fakeEnemySingTimer = fakeEnemySingTimer - elapsed end
end

function makeFakeCharacter(tag, name, character)
	makeAnimatedLuaSprite(tag, "characters/"..name, 0, 0)
	
	addAnimationByPrefix(tag, "idle", "Idle", 24, false)
	addAnimationByPrefix(tag, "left", "Right", 24, false)
	addAnimationByPrefix(tag, "down", "Down", 24, false)
	addAnimationByPrefix(tag, "up", "Up", 24, false)
	addAnimationByPrefix(tag, "right", "Left", 24, false)
	
	if (tag == "fakeEnemy") then
		addAnimationByPrefix(tag, "idle", "BG", 24, false)
	end

	if (tag == "fakePlayer") then
		addAnimationByPrefix(tag, "idle-left", "BG Left", 24, false)
		addAnimationByPrefix(tag, "idle-right", "BG Right", 24, false)
	end

	objectPlayAnimation(tag, "idle", true)
	
	if (character == "boyfriend") then
		setProperty("fakePlayer.flipX", true)
	end
end

function tweenFakeCharacter(tag, character, x, y)
	setProperty(tag..".x", getProperty(character..".x"))
	setProperty(tag..".y", getProperty(character..".y"))
	
	doTweenX(tag.."MoveX", tag, getProperty(character..".x")+x, 1, "circOut")
	doTweenY(tag.."MoveY", tag, getProperty(character..".y")+y, 1, "circOut")
end

function singFakeCharacter(tag, anim)
	if (tag == "fakePlayer") then
		fakePlayerSingTimer = singLength
		
		if (anim == "right") then setOffset(tag, -71, -9) end
		if (anim == "down") then setOffset(tag, 29, -63) end
		if (anim == "up") then setOffset(tag, -41, 56) end
		if (anim == "left") then setOffset(tag, 22, 15) end

		setProperty("fakePlayer.flipX", true)
	end
	
	if (tag == "fakeEnemy") then
		fakeEnemySingTimer = singLength
		
		if (anim == "left") then setOffset(tag, -70, 0) end
		if (anim == "down") then setOffset(tag, 103, -51) end
		if (anim == "up") then setOffset(tag, 90, 120) end
		if (anim == "right") then setOffset(tag, 140, -20) end
	end

	objectPlayAnimation(tag, anim, true)
end

function onStepHit()
	curStep = getProperty("curStep")
	
	if (curStep == 820) then
		tweenFakeCharacter("fakePlayer", "boyfriend", -20, -20)
		tweenFakeCharacter("fakeEnemy", "dad", 280, -25)
		
		triggerEvent("Change Character", 1, "pico")
		triggerEvent("Change Character", 0, "kuu-player")
		
		addLuaSprite("fakePlayer", true)
		addLuaSprite("fakeEnemy", true)

		setObjectOrder("fakePlayer", 11)
		setObjectOrder("fakeEnemy", 11)

		doTweenX("bfMoveX", "boyfriend", getProperty("boyfriend"..".x")+200, 1, "circOut")
	end
	
	if (curStep == 1152) then
		fakeSing = true
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if (fakeSing) then
		if (direction == 0) then singFakeCharacter("fakePlayer", "left") end
		if (direction == 1) then singFakeCharacter("fakePlayer", "down") end
		if (direction == 2) then singFakeCharacter("fakePlayer", "up") end
		if (direction == 3) then singFakeCharacter("fakePlayer", "right") end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if (fakeSing) then
		if (direction == 0) then singFakeCharacter("fakeEnemy", "right") end
		if (direction == 1) then singFakeCharacter("fakeEnemy", "down") end
		if (direction == 2) then singFakeCharacter("fakeEnemy", "up") end
		if (direction == 3) then singFakeCharacter("fakeEnemy", "left") end
	end
end

function onBeatHit()
	if (fakePlayerSingTimer <= 0) then idle("fakePlayer", true) end
	if (fakeEnemySingTimer <= 0) then idle("fakeEnemy", false) end
end

function idle(tag, leftRight)
	setOffset(tag, 0, 0)
	
	if (leftRight == false) then
		objectPlayAnimation(tag, "idle", true)
	else
		curBeat = getProperty("curBeat") % 2
		
		setProperty("fakePlayer.flipX", false)
		idleXOffset = 40
		idleYOffset = 10
		if (curBeat == 0) then
			setOffset(tag, -46 + idleXOffset, -12 + idleYOffset)
			objectPlayAnimation(tag, "idle-right", true)
		else
			setOffset(tag, idleXOffset, idleYOffset)
			objectPlayAnimation(tag, "idle-left", true)
		end
	end
end

function setOffset(tag, x, y)
	setProperty(tag..".offset.x", x)
	setProperty(tag..".offset.y", y)
end