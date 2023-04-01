
local xx = 620;
local yy = 550;
local yyh = 350;
local xx2 = 620;
local yy2 = 550;
local ofs = 30;
local ofs2 = 120;
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
        if mustHitSection == false then
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'Hey' then
                triggerEvent('Camera Follow Pos',xx-ofs,yyh)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
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
function onStepHit()
	if curStep == 5 then
        makeAnimatedLuaSprite('Wario_Apparition_Overlay_v1','Wario/Wario_Apparition_Overlay_v1',-25,-100)
        addAnimationByPrefix('Wario_Apparition_Overlay_v1','idle','WarioOverlay',24,true)
        scaleObject('Wario_Apparition_Overlay_v1',1.05,1.175);
        setObjectCamera('Wario_Apparition_Overlay_v1','other');
        objectPlayAnimation('Wario_Apparition_Overlay_v1','idle',false);
        setProperty('Wario_Apparition_Overlay_v1.alpha',0);
		addLuaSprite('Wario_Apparition_Overlay_v1', true);
	end
	if curStep == 400 then
		doTweenAlpha('wario','Wario_Apparition_Overlay_v1',1,7.25,'linear');
	end
	if curStep == 512 then
		doTweenAlpha('stair','Wario_Apparition_Overlay_v1',0,0.25,'linear');
	end
end