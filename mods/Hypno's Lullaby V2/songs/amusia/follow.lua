local xx = 220;--Enemigo
local yy = 80;--Enemigo
local xx2 = 290;--Tu p
local yy2 = 55;--Tu p
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onStepHit()
if curStep == 34 then
xx= 75;--Tu p
yy = 70;--Tu p
end
if curStep ==799 then
xx2 = 105;--Tu p
yy2 = 80;--Tu p
end
if curStep == 816 then
xx= 235;--Enemigo
yy = 0;--Enemigo
end
end

Terror=true
function onUpdate()
    if followchars == true then
        if mustHitSection == false then
            if dadName == 'wiggles' then           
          setProperty('defaultCamZoom',1.2)
          triggerEvent('Camera Follow Pos',xx,yy)
     end
             if dadName == 'wiggles1' then
          setProperty('defaultCamZoom',1.3)
          triggerEvent('Camera Follow Pos',xx,yy+25)
   end
             if dadName == 'wiggles2' then
          setProperty('defaultCamZoom',1.35)
          triggerEvent('Camera Follow Pos',xx,yy+45)
   end
   if dadName == 'wiggles3' then        
            setProperty('defaultCamZoom',1.4)
            triggerEvent('Camera Follow Pos',xx,yy+65)
   end
   if dadName == 'wigglesTerror' then       
            Terror=false 
            setProperty('defaultCamZoom',1.5)
            triggerEvent('Camera Follow Pos',400,0)
   end  
   if curStep > 799 and curStep < 816 then
    triggerEvent('Camera Follow Pos',105,80)   
end 
   if curStep > 816 and Terror == true then
     triggerEvent('Camera Follow Pos',xx,yy)         
     end
        else
            setProperty('defaultCamZoom',1.45)
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