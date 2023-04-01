local xx = 480;
local yy = 250;
local xx2 = 670;
local yy2 = 460;
local ofs = 20;
local followchars = false;
local del = 0;
local del2 = 0;


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end

if followchars == false then
  if mustHitSection == false then
      setProperty("defaultCamZoom",0.6)
      if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
          triggerEvent('Camera Follow Pos',xx-ofs,yy)
      end
      if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
          triggerEvent('Camera Follow Pos',xx+ofs,yy)
      end
      if getProperty('dad.animation.curAnim.name') == 'singUP' then
          triggerEvent('Camera Follow Pos',xx,yy-ofs)
      end
      if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
          triggerEvent('Camera Follow Pos',xx,yy+ofs)
      end
      if getProperty('dad.animation.curAnim.name') == 'idle' then
          triggerEvent('Camera Follow Pos',xx,yy)
      end
  else
    if curStep > 384 then
      setProperty("defaultCamZoom",0.8)
    end
      if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
          triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
      end
      if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
          triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
      end
      if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
          triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
      end
      if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
          triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
      end
if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
          triggerEvent('Camera Follow Pos',xx2,yy2)
      end
  end
else
  triggerEvent('Camera Follow Pos','','')
end
end
