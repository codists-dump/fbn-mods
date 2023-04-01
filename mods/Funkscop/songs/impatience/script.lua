local xx = 685;
local yy = 375;
local xx2 = 685;
local yy2 = 375;
local ofs = 0;
local followchars = true;
local extraZoom = 0;
local mm = false;

function onUpdate()
	if curBeat >= 192 and curBeat <= 384 or curBeat >= 516 and curBeat <= 652 then
		local songPos = getSongPosition() / 1000 * 1.7
		setProperty("camGame.angle", 1.25 * math.sin(songPos))
	else
		setProperty("camGame.angle", 0)
	end

	if followchars == true then
		local didOffset = true
		if mustHitSection == false then
			local dadAnim = getProperty('dad.animation.curAnim.name')

			if dadAnim == 'singLEFT' or dadAnim == 'singLEFT-alt' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			elseif dadAnim == 'singRIGHT' or dadAnim == 'singRIGHT-alt' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			elseif dadAnim == 'singUP' or dadAnim == 'singUP-alt' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			elseif dadAnim == 'singDOWN' or dadAnim == 'singDOWN-alt' then
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

function onCreate()
    mm = getPropertyFromClass("ClientPrefs", "middleScroll")
    setPropertyFromClass("ClientPrefs", "middleScroll", true)
end

function onDestroy()
   setPropertyFromClass("ClientPrefs", "middleScroll", mm)
end

function onBeatHit()
	if curBeat >= 128 then
		yy2 = 475
		ofs = 30
	end

	if curBeat >= 384 then
		yy = 600
		yy2 = 600
	end

	if curBeat >= 384 and curBeat < 385 then
		extraZoom = extraZoom - 0.25
	end

	if curBeat >= 516 then
		yy = 375
		yy2 = 475
		triggerEvent('Camera Follow Pos',xx,yy)
		setProperty('defaultCamZoom', 0.75 + extraZoom)
	end

	if followchars == true then
		if mustHitSection == true then
			setProperty('defaultCamZoom', 0.75 + extraZoom)
		else
			setProperty('defaultCamZoom', 0.9 + extraZoom)
		end
	end

	if curBeat >= 192 and curBeat < 193 then
		extraZoom = extraZoom + 0.05
	end

	if curBeat >= 380 and curBeat <= 383 then
		extraZoom = extraZoom + 0.05
	end

	if curBeat >= 644 and curBeat <= 646 then
		if curBeat % 2 == 0 then
			extraZoom = extraZoom + 0.025
		end
	end

	if curBeat >= 648 and curBeat <= 650 then
		extraZoom = extraZoom + 0.0125
	end

	if curBeat >= 580 then
		angleshit = 1.1
		anglevar = 1.1
	end
end

function onStepHit()

	if curStep >= 2604 and curStep <= 2607 then
		extraZoom = extraZoom + 0.00625
	end

end