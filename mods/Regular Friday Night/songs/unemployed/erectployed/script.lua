local allowCountdown = false

 function onBeatHit()
 if curBeat == 194 then
 doTweenZoom('zoom1', 'camGame', 1.1, 4, 'sineInOut')
end
if curBeat == 226 then
doTweenZoom('zoom1', 'camGame', 1.1, 4, 'sineInOut')
end
if curBeat == 312 then
setProperty('defaultCamZoom', 1.1)
end
if curBeat == 320 then
setProperty('defaultCamZoom', 0.7)
end
end

function onUpdate()
 if mustHitSection == true then
 		setProperty('defaultCamZoom',1.2)
 		end
 if mustHitSection == false then
     setProperty('defaultCamZoom',0.8)
 	  end
 end
