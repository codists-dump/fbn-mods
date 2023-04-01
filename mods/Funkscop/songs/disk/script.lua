local xx = 640;
local yy = 300;
local xx2 = 850;
local yy2 = 300;
local ofs = 20;
local followchars = true;
local anglevar = 0;
local angleshit = 0;
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
		
		if curBeat >= 32 then
			angleshit = 0.75;
			anglevar = 0.75;
		end

		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		setProperty('camGame.angle',angleshit*3)
		doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
		--doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
		xOffset = angleshit*16
end