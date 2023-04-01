ogHud = true
function onCreate()
	barY = getPropertyFromClass('flixel.FlxG', 'height') - (14 * 6)
	makeLuaSprite('bg','genesis/ui/bg',0, -27*6+4)
	scaleObject('bg', 6, 6)
	updateHitbox('bg')
	setProperty('bg.antialiasing', false)
	addLuaSprite('bg',true)
	
	makeLuaText('scoreShadow', '000000', 0, 30*6-3.3, 8*6-2)
	setProperty('scoreShadow.borderSize', 0)
	setProperty('scoreShadow.antialiasing', false)
	setTextFont('scoreShadow', 'sonic.ttf')
	setTextSize('scoreShadow', 8*6, 8*6)
	setScrollFactor('scoreShadow', 0, 0)
	setObjectCamera('scoreShadow', 'game')
	setTextColor('scoreShadow', '000000')
	addLuaText('scoreShadow', true)
	
	makeLuaText('scoreSMB1', '000000', 0, getProperty('scoreShadow.x'), getProperty('scoreShadow.y')-(1*6))
	setProperty('scoreSMB1.borderSize', 0)
	setProperty('scoreSMB1.antialiasing', false)
	setTextFont('scoreSMB1', 'sonic.ttf')
	setTextSize('scoreSMB1', 8*6, 8*6)
	setScrollFactor('scoreSMB1', 0, 0)
	setObjectCamera('scoreSMB1', 'game')
	addLuaText('scoreSMB1', true)
	
	makeLuaText('scoreDisplayShadow', 'SCORE', 0, 5*6-3.3, 8*6-2)
	setProperty('scoreDisplayShadow.borderSize', 0)
	setProperty('scoreDisplayShadow.antialiasing', false)
	setTextFont('scoreDisplayShadow', 'sonic.ttf')
	setTextSize('scoreDisplayShadow', 8*6, 8*6)
	setScrollFactor('scoreDisplayShadow', 0, 0)
	setObjectCamera('scoreDisplayShadow', 'game')
	setTextColor('scoreDisplayShadow', '000000')
	addLuaText('scoreDisplayShadow', true)
	
	makeLuaText('scoreTxt', 'SCORE', 0, getProperty('scoreDisplayShadow.x'), getProperty('scoreDisplayShadow.y')-(1*6))
	setProperty('scoreTxt.borderSize', 0)
	setProperty('scoreTxt.antialiasing', false)
	setTextFont('scoreTxt', 'sonic.ttf')
	setTextSize('scoreTxt', 8*6, 8*6)
	setScrollFactor('scoreTxt', 0, 0)
	setObjectCamera('scoreTxt', 'game')
	setTextColor('scoreTxt', 'ECEF02')
	addLuaText('scoreTxt', true)
	
	ogHud = getPropertyFromClass('ClientPrefs', 'hideHud')
	setPropertyFromClass('ClientPrefs', 'hideHud', true)
end

function onCreatePost()
	for b = 0, getProperty('unspawnNotes.length') - 1 do
		setPropertyFromGroup('unspawnNotes', b, 'antialiasing', false)
	end
	
	curRating = floorDecimal(getProperty('ratingPercent') * 100, 2)
	splitRating = mysplit(tostring(curRating), '.')
	
	makeLuaText('accuracyTxtS', '000.00%', 0, 30*6-3.3, 18*6-2)
	setProperty('accuracyTxtS.borderSize', 0)
	setProperty('accuracyTxtS.antialiasing', false)
	setTextFont('accuracyTxtS', 'sonic.ttf')
	setTextSize('accuracyTxtS', 8*6, 8*6)
	setScrollFactor('accuracyTxtS', 0, 0)
	setObjectCamera('accuracyTxtS', 'game')
	setTextColor('accuracyTxtS', '000000')
	addLuaText('accuracyTxtS', true)
	
	makeLuaText('accuracyTxt1', '000.00%', 0, getProperty('accuracyTxtS.x'), getProperty('accuracyTxtS.y')-(1*6))
	setProperty('accuracyTxt1.borderSize', 0)
	setProperty('accuracyTxt1.antialiasing', false)
	setTextFont('accuracyTxt1', 'sonic.ttf')
	setTextSize('accuracyTxt1', 8*6, 8*6)
	setScrollFactor('accuracyTxt1', 0, 0)
	setObjectCamera('accuracyTxt1', 'game')
	addLuaText('accuracyTxt1', true)
	
	makeLuaText('accuracyDisplayS', 'ACC.', 0, 5*6-3.3, 18*6-2)
	setProperty('accuracyDisplayS.borderSize', 0)
	setProperty('accuracyDisplayS.antialiasing', false)
	setTextFont('accuracyDisplayS', 'sonic.ttf')
	setTextSize('accuracyDisplayS', 8*6, 8*6)
	setScrollFactor('accuracyDisplayS', 0, 0)
	setObjectCamera('accuracyDisplayS', 'game')
	setTextColor('accuracyDisplayS', '000000')
	addLuaText('accuracyDisplayS', true)
	
	makeLuaText('accuracyDisplay', 'ACC.', 0, getProperty('accuracyDisplayS.x'), getProperty('accuracyDisplayS.y')-(1*6))
	setProperty('accuracyDisplay.borderSize', 0)
	setProperty('accuracyDisplay.antialiasing', false)
	setTextFont('accuracyDisplay', 'sonic.ttf')
	setTextSize('accuracyDisplay', 8*6, 8*6)
	setScrollFactor('accuracyDisplay', 0, 0)
	setObjectCamera('accuracyDisplay', 'game')
	setTextColor('accuracyDisplay', 'ECEF02')
	addLuaText('accuracyDisplay', true)
	
	makeLuaText('botplayTxt', 'BOTPLAY', 0, getPropertyFromClass('flixel.FlxG', 'width')/2-(28*6)+2, getPropertyFromClass('flixel.FlxG', 'height')/2-(40*6))
	setProperty('botplayTxt.borderSize', 0)
	setProperty('botplayTxt.antialiasing', false)
	setTextFont('botplayTxt', 'sonic.ttf')
	setTextSize('botplayTxt', 8*6, 8*6)
	setScrollFactor('botplayTxt', 0, 0)
	setProperty('botplayTxt.visible', false)
	--addLuaText('botplayTxt')
	
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)
end

math.round = function(num)
    return math.floor(num + 0.5)
end

local triggered = false
function onUpdate(elapsed)
	for i=0, getProperty('strumLineNotes.length')-1 do
		setPropertyFromGroup('strumLineNotes', i, 'resetAnim', 50)
	end
	if curBeat == 0 and not triggered then
		triggered = true
			for b = 0, getProperty('opponentStrums.length') - 1 do
				setPropertyFromGroup('playerStrums', b, 'y', getPropertyFromGroup('playerStrums', b, 'y') - 8 * 6)
				setPropertyFromGroup('opponentStrums', b, 'y', getPropertyFromGroup('opponentStrums', b, 'y') - 8 * 6)
				setPropertyFromGroup('opponentStrums', b, 'antialiasing', false)
				setPropertyFromGroup('playerStrums', b, 'antialiasing', false)
			end
	end
	setTextString('scoreSMB1', score)
	if getProperty('scoreSMB1.text.length') == 1 then
		setTextString('scoreSMB1', "00000"..getProperty('scoreSMB1.text'))
	elseif getProperty('scoreSMB1.text.length') == 2 then
		setTextString('scoreSMB1', "0000"..getProperty('scoreSMB1.text'))
	elseif getProperty('scoreSMB1.text.length') == 3 then
		setTextString('scoreSMB1', "000"..getProperty('scoreSMB1.text'))
	elseif getProperty('scoreSMB1.text.length') == 4 then
		setTextString('scoreSMB1', "00"..getProperty('scoreSMB1.text'))
	elseif getProperty('scoreSMB1.text.length') == 5 then
		setTextString('scoreSMB1', "0"..getProperty('scoreSMB1.text'))
	end
	setTextString('scoreShadow', getProperty('scoreSMB1.text'))
	
	curRating = floorDecimal(getProperty('ratingPercent') * 100, 1)
	splitRating = mysplit(tostring(curRating), '.')
	
	if getProperty('ratingFC') == 'SFC' then
		splitRating[1] = '100'
		splitRating[2] = '00'
	end
	
	if #splitRating[1] == 1 then
		splitRating[1] = '00'..splitRating[1]
	elseif #splitRating[1] == 2 then	
		splitRating[1] = '0'..splitRating[1]
	end
	
	if #splitRating[2] == 1 then
		splitRating[2] = '0'..splitRating[2]
	end
	if #splitRating[2] == nil then	
		splitRating[2] = '00'
	end
	
	setTextString('accuracyTxt1', splitRating[1]..'.'..splitRating[2]..'%')
	setTextString('accuracyTxtS', getProperty('accuracyTxt1.text'))
end

function onUpdatePost(elapsed)
	for b = 0, getProperty('notes.length') - 1 do
		if getPropertyFromGroup('notes', b, 'isSustainNote') and getPropertyFromGroup('notes', b, 'alpha') ~= 1 then -- change 'if' to 'if not' for DD notes
			setPropertyFromGroup('notes', b, 'alpha', 1)
			setPropertyFromGroup('notes', b, 'offsetX', (6*7)-4)
		end
	end
	
	for b = 0, getProperty('grpNoteSplashes.length') - 1 do
		if getPropertyFromGroup('grpNoteSplashes', b, 'alpha') ~= 1 then
			setPropertyFromGroup('grpNoteSplashes', b, 'alpha', 1)
			setPropertyFromGroup('grpNoteSplashes', b, 'offset.x', 0.5)
			setPropertyFromGroup('grpNoteSplashes', b, 'offset.y', -25)
			setPropertyFromGroup('grpNoteSplashes', b, 'scale.x', 0.5)
			setPropertyFromGroup('grpNoteSplashes', b, 'scale.y', 0.5)
			setPropertyFromGroup('grpNoteSplashes', b, 'antialiasing', false)
		end
	end
end

function onDestroy()
	setPropertyFromClass('ClientPrefs', 'hideHud', ogHud)
end

function mysplit (inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
end

function floorDecimal(value, decimals) --just a port of Highscore.floorDecimal
	if decimals < 1 then
		return math.floor(value)
	end
	
	local tempMult = 1
	for i=0, decimals do
		tempMult = tempMult * 10
	end
	newValue = math.floor(value * tempMult)
	return newValue / tempMult
end