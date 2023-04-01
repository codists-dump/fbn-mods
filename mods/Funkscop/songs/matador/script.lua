local xx = 1000;
local yy = 0;
local xx2 = 1550;
local yy2 = 20;
local ofs = 25;
local followchars = true;

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