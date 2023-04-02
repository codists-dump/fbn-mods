function onCreate()

	makeLuaText('sonic1', 'WHAT THE HELL MAN?!', 400, 442, 120)
	setTextAlignment('sonic1', 'center')
	setTextSize('sonic1', 30)
	setTextColor('sonic1', '5d80f5')

	makeLuaText('miles1', "Don't worry Sonic, I'll handle this!", 400, 442, 120)
	setTextAlignment('miles1', 'center')
	setTextSize('miles1', 30)
	setTextColor('miles1', 'e0af28')

	makeLuaText('miles2', "Can you give those back?", 400, 442, 120)
	setTextAlignment('miles2', 'center')
	setTextSize('miles2', 30)
	setTextColor('miles2', 'e0af28')

	makeLuaText('knux1', "no", 400, 442, 120)
	setTextAlignment('knux1', 'center')
	setTextSize('knux1', 40)
	setTextColor('knux1', 'f75454')

	makeLuaText('knux2', "Later!", 400, 442, 120)
	setTextAlignment('knux2', 'center')
	setTextSize('knux2', 30)
	setTextColor('knux2', 'f75454')
	
	makeLuaText('knux3', "Same time next week?", 400, 442, 120)
	setTextAlignment('knux3', 'center')
	setTextSize('knux3', 30)
	setTextColor('knux3', 'f75454')

	makeLuaText('miles3', "Sonic...", 400, 442, 120)
	setTextAlignment('miles3', 'center')
	setTextSize('miles3', 30)
	setTextColor('miles3', 'e0af28')

	makeLuaText('miles4', "I think he ran away-", 400, 442, 120)
	setTextAlignment('miles4', 'center')
	setTextSize('miles4', 30)
	setTextColor('miles4', 'e0af28')

	makeLuaText('sonic2', 'SHUT UP, TAILS!!', 400, 442, 120)
	setTextAlignment('sonic2', 'center')
	setTextSize('sonic2', 30)
	setTextColor('sonic2', '5d80f5')


end

function onBeatHit()

	if curBeat == 14 then
		addLuaText('sonic1')
	end
	if curBeat == 16 then
		removeLuaText('sonic1', true)
	end
	if curBeat == 76 then
		addLuaText('miles1')
	end
	if curBeat == 80 then
		removeLuaText('miles1', true)
	end
	if curBeat == 144 then
		addLuaText('miles2')
	end
	if curBeat == 147 then
		removeLuaText('miles2', true)
		addLuaText('knux1')
	end
	if curBeat == 148 then
		removeLuaText('knux1', true)
	end
	if curBeat == 208 then
		addLuaText('knux2')
	end
end

function onStepHit()
	if curStep == 838 then
		removeLuaText('knux2', true)
		addLuaText('knux3')
	end
	if curStep == 848 then
		removeLuaText('knux3', true)
	end
	if curStep == 887 then
		addLuaText('miles3')
	end
	if curStep == 894 then
		removeLuaText('miles3', true)
		addLuaText('miles4')
	end
	if curStep == 904 then
		removeLuaText('miles4', true)
		addLuaText('sonic2')
	end	
	if curStep == 911 then
		removeLuaText('sonic2', true)
	end
end