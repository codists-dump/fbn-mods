local xx = 990;
local yy = 715;
local xx2 = 450;
local yy2 = 495;
local ofs = 45;
local fuckdickshit = 0.875;
local carezoom = 0.725;
local followchars = false;

function onUpdate()
	if followchars == true then
		if mustHitSection == false then
			local dadAnim = getProperty('dad.animation.curAnim.name')

			if dadAnim == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			elseif dadAnim == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			elseif dadAnim == 'singUP' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			elseif dadAnim == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			elseif dadAnim == 'idle' then
				triggerEvent('Camera Follow Pos',xx,yy)
			end
		else
			local bfAnim = getProperty('boyfriend.animation.curAnim.name')
			if bfAnim == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
			elseif bfAnim == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
			elseif bfAnim == 'singUP' then
				triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
			elseif bfAnim == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
			elseif bfAnim == 'idle' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
			end
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
end

function onBeatHit()
	if followchars == true then
		if curBeat % 4 == 0 then
			if mustHitSection == true then
				doTweenZoom('a', 'camGame', fuckdickshit, 0.65, 'quadOut')
				setProperty('defaultCamZoom', fuckdickshit)
			else
				doTweenZoom('b', 'camGame', carezoom, 0.65, 'quadOut')
				setProperty('defaultCamZoom', carezoom)
			end
		end
	end

	if curBeat >= 12 * 2 then
		followchars = true
	end

	if curBeat >= 282 * 2 then
		followchars = false
		xx = 990
		yy = 715
		xx2 = 990
		yy2 = 475
		fuckdickshit = 0.6
		carezoom = 0.685
	end

	if curBeat >= 306 * 2 then
		followchars = true
	end

	if curBeat >= 411 * 2 then
		fuckdickshit = 0.45
		carezoom = 0.45
	end

	if curBeat >= 412 * 2 then
		xx = 990
		yy = 550
		xx2 = 990
		yy2 = 550
	end
end

function onCountdownStarted()
	setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
	setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
	setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
	setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

	setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
	setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
	setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
	setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
end