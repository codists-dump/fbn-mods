
function onCreate()

  addLuaScript("video")
  addLuaScript("videoEnd")

end

function onBeatHit()
	
	if curBeat == 330 then
		doTweenAlpha('55','camHUD',0,0.5)
	end
	
end