
local xx = 220;
local yy = 450;
local yyh = 350;
local xx2 = 920;
local yy2 = 550;
local ofs = 30;
local ofs2 = 120;
local followchars = true;
local del = 0;
local del2 = 0;

function onStartCountdown()
	if not allowCountdown then
		runTimer('startText', 0.1);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startText' then
		makeLuaSprite('hatestart', 'IHY/hatestart', 500, 320);
		setObjectCamera('hatestart', 'other');
        scaleObject('hatestart',3,3);
        setProperty('hatestart.antialiasing',false);
		addLuaSprite('hatestart', true);
		makeLuaSprite('tvscreen', 'MX/tvscreen', 0, 0);
		setObjectCamera('tvscreen', 'hud');
        scaleObject('tvscreen',250,250);
        setProperty('tvscreen.antialiasing',false);
		addLuaSprite('tvscreen', true);
		runTimer('appear', 0.6, 1);
		runTimer('fadeout', 1.9, 1);
	elseif tag == 'fadeout' then
		doTweenAlpha('blackfade', 'hatestart', 0,0.1, 'linear');
		doTweenAlpha('lok', 'tvscreen', 0,0.1, 'linear');
	end
end
function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
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
            if getProperty('dad.animation.curAnim.name') == 'Hey' then
                triggerEvent('Camera Follow Pos',xx-ofs,yyh)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
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
        triggerEvent('Camera Follow Pos','','')
    end
    
end