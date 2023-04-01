local xx = 805;
local yy = 125;
local xx2 = 805;
local yy2 = 125;
local ofs = 0;
local angleshit = 1;
local anglevar = 1;
local followchars = true;
local eventNum = 0;

local xOffset = 0;

function onUpdate()
	if followchars == true then
		local didOffset = true

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
			else
				didOffset = false
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
			else
				didOffset = false
			end
		end

		if didOffset then
			setProperty("camFollow.x", getProperty("camFollow.x") + xOffset)
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
end

function onBeatHit()
	if curBeat >= 64 and curBeat <= 192 or curBeat >= 256 and curBeat <= 320 or curBeat >= 327 and curBeat <= 456 then
		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		setProperty('camGame.angle',angleshit*3)
		doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
		--doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
		xOffset = angleshit*16
	else
		cancelTween('tt')
		--cancelTween('ttrn')
		setProperty('camGame.angle',0)
		xOffset = 0
		--setProperty('camGame.x',0)
		--setProperty('camGame.y',0)
	end

	if curBeat >= 64 and eventNum == 0 then
		cameraFlash('camGame', 'FFFFFF', 0.2)
		xx = 755
		--ofs = 20
		doTweenZoom('camzoomBeatshit', 'camGame', 0.875 * 0.9, 0.3, 'quadOut')
		eventNum = eventNum + 1
	end

	if curBeat >= 192 and eventNum == 1 then
		cameraFlash('camGame', 'FFFFFF', 0.2)
		xx = 805
		ofs = 0
		doTweenZoom('ijewialhvkjdfrhgewlfhsd', 'camGame', 0.875 * 0.8, 0.25, 'quadOut')
		eventNum = eventNum + 1
	end

	if curBeat >= 256 and eventNum == 2 then
		cameraFlash('camGame', 'FFFFFF', 0.2)
		xx = 755
		--ofs = 20
		doTweenZoom('camzoomBeatshit', 'camGame', 0.875 * 0.9, 0.3, 'quadOut')
		eventNum = eventNum + 1
	end

	if curBeat >= 320 and eventNum == 3 then
		doTweenZoom('rgsjrgosfgsdfgdhteshdfvdgh', 'camGame', 0.875 * 0.74, 0.4, 'quadOut')
		xx = 1200
		yy = 85
		yy2 = 85
		eventNum = eventNum + 1
	end

	if curBeat >= 328 and eventNum == 4 then
		xx = 1500
		--ofs = 25
		eventNum = eventNum + 1
	end

	if curBeat >= 456 and eventNum == 5 then
		cameraFlash('camGame', 'FFFFFF', 0.2)
		doTweenZoom('rgsjrgosfgsdfgdhteshdfvdgh', 'camGame', 0.875 * 0.74, 0.5, 'quadOut')
		ofs = 0
		eventNum = eventNum + 1
	end
end

function onCreatePost()
	-- Prevent out of bounds camera
	setProperty('camFollowPos.x', xx)
	setProperty('camFollowPos.y', yy)
end