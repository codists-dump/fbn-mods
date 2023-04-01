local xx = 320;
local yy = 650;
local xx2 = 320;
local yy2 = 650;
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;


function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == true then
            if getProperty('dad.animation.curAnim.name') == 'singLEF' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGH' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singP' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDO' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singD' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

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
        triggerEvent('Camera Follow Pos','300','430')--Momento GF Dead
    end
end

function onStepHit()
	if curStep == 96 then
		doTweenX("camGame", "camGame", 50, 0.015, "quadInOut");
	end
		if curStep == 97 then
			doTweenX("camGame", "camGame", -50, 0.015, "quadInOut");
	end
	if curStep == 98 then
		doTweenX("camGame", "camGame", 0, 0.015, "quadInOut");
end
if curStep == 112 then
	doTweenX("camGame", "camGame", 50, 0.015, "quadInOut");
end
	if curStep == 113 then
		doTweenX("camGame", "camGame", -50, 0.015, "quadInOut");
end
if curStep == 114 then
	doTweenX("camGame", "camGame", 0, 0.015, "quadInOut");
end
if curStep == 128 then
	doTweenX("camGame", "camGame", 50, 0.015, "quadInOut");
end
	if curStep == 129 then
		doTweenX("camGame", "camGame", -50, 0.015, "quadInOut");
end
if curStep == 130 then
	doTweenX("camGame", "camGame", 0, 0.015, "quadInOut");
end
	if curStep == 136 then
	doTweenX("camGame", "camGame", 50, 0.015, "quadInOut");
end
	if curStep == 137 then
		doTweenX("camGame", "camGame", -50, 0.015, "quadInOut");
end
if curStep == 138 then
	doTweenX("camGame", "camGame", 0, 0.015, "quadInOut");
end
if curStep == 144 then
	doTweenX("camGame", "camGame", 50, 0.015, "quadInOut");

end
	if curStep == 145 then
		doTweenX("camGame", "camGame", -50, 0.015, "quadInOut");
end
if curStep == 146 then
	doTweenX("camGame", "camGame", 0, 0.015, "quadInOut");
end
if curStep == 3456 then
	doTweenZoom('camZoom','camGame',0.9,4,'sineInOut')
	followchars = false   
end
if curStep == 3504 then
	doTweenZoom('camZoom','camGame',0.55,4,'sineInOut')
    runTimer('holaFollow',2)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'holaFollow' then
followchars = true
end
end

function onTweenCompleted(name)
if name == 'camZoom' then
      	 setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
end
end