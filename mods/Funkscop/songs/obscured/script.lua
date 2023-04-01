local xx = 470;
local yy = 320;
local xx2 = 480;
local yy2 = 330;
local ofs = 15;
local ofs2 = 5;
local angleshit = 0.35;
local anglevar = 0.35;
local followchars = true;

local xOffset = 0;

function onUpdate()
	if followchars == true then
		local didOffset = true

		if mustHitSection == false then
			local dadAnim = getProperty('dad.animation.curAnim.name')

			if dadAnim == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx-ofs2,yy)
			elseif dadAnim == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx+ofs2,yy)
			elseif dadAnim == 'singUP' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs2)
			elseif dadAnim == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs2)
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

	if curBeat >= 160 and curBeat <= 224 or curBeat >= 288 and curBeat <= 351 then
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

end