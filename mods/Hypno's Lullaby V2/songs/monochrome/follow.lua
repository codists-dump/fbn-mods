
local xx = 330;--Enemigo
local yy = 400;--Enemigo
local xx2 = 330;--Tu p
local yy2 = 400;--Tu p
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;


function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if curStep > 1670 then
            setProperty('defaultCamZoom',0.65)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then               
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then               
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then                
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then                
            triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then          
            triggerEvent('Camera Follow Pos',xx,yy)
            end
        else        
            if curStep > 1670 then
            setProperty('defaultCamZoom',0.65)
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