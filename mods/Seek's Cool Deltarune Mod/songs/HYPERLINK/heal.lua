local atkcounter = 0;
local difference = 0;
local maxDiff = 0;
local alphys = 0;
local deltafps = 0;

local allowHeal = true;

function onCreate()
	if difficulty == 0 then
		allowHeal = false;
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'shield' then
		if not isSustainNote then
			atkcounter = atkcounter + 20
		end
	else
		if not isSustainNote then
			atkcounter = atkcounter + 2
		else
			atkcounter = atkcounter + 1
		end
	end
	if atkcounter > 250 then
		atkcounter = 250
	end
	setProperty('boobs2.scale.y', (atkcounter / 250 * 100) * 2)
	setProperty('boobs2.origin.y', 1)
	setProperty('boobs.origin.y', 1)
end

function onCreatePost()

	if allowHeal == true then
		makeLuaSprite('tits', '', 1156, 296)
		makeGraphic('tits', 83, 250, '380915')
		addLuaSprite('tits', false)
		setObjectCamera('tits','hud')

		makeLuaSprite('ass', '', 1160, 300)
		makeGraphic('ass', 75, 200, '120307')
		addLuaSprite('ass', false)
		setObjectCamera('ass','hud')

		makeLuaText('atkText', 'atk: ' .. math.floor(atkcounter / 250 * 100) .. '%' , 300,1050,500)
		addLuaText('atkText')
		setTextSize('atkText', 35);
		setObjectCamera('atkText', 'hud')

		makeLuaSprite('boobs', '', 1160, 500)
		makeGraphic('boobs', 75, 1, 'FFFFFF')
		addLuaSprite('boobs', false)
		setObjectCamera('boobs','hud')

		makeLuaSprite('boobs2', '', 1160, 500)
		makeGraphic('boobs2', 75, 1, 'FFA500')
		addLuaSprite('boobs2', false)
		setObjectCamera('boobs2', 'hud')
	end
end

function onUpdate(elapsed)
	-- start of "update", some variables weren't updated yet
	deltafps = elapsed / (1/240)
	if atkcounter > 250 then
		atkcounter = 250
	end
    setTextString('atkText', math.floor(atkcounter / 250 * 100) .. '%' )
	
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and allowHeal == true then
		if atkcounter > 80 then
			atkcounter = atkcounter - 80
			setProperty('boobs2.scale.y', (atkcounter / 250 * 100) * 2)
			characterPlayAnim('girlfriend', 'heal', true)
			setProperty('girlfriend.specialAnim', true)
			setProperty('health', getProperty('health') + 0.360)
			playSound('heal', 0.8)
		end
	end
	difference = getProperty('boobs2.scale.y') - getProperty('boobs.scale.y')
	if difference < maxDiff then
		maxDiff = difference
	end
	setProperty('boobs.scale.y', getProperty('boobs.scale.y') + (difference / 50 * deltafps))
	if getProperty('boobs.scale.y') > getProperty('boobs2.scale.y') - 0.1 and getProperty('boobs.scale.y') < getProperty('boobs2.scale.y') + 0.1 then
		setProperty('boobs.scale.y', getProperty('boobs2.scale.y'))
		maxDiff = 250
	end
	if atkcounter == 250 and getProperty('boobs.scale.y') == getProperty('boobs2.scale.y') then
		if getProperty('boobs2.alpha') < 1 then
			setProperty('boobs2.alpha', getProperty('boobs2.alpha') + (getProperty('boobs2.alpha') / 100 * deltafps))
		end
	else
		setProperty('boobs2.alpha', 0.8)
	end
	alphys = math.abs(difference) + (alphys + 0.1) / (5 * deltafps) - 0.1
	setProperty('boobs.alpha', alphys)
end
