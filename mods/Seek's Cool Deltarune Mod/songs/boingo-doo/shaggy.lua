function onUpdate(elapsed)
	if dadName == 'skuntle-bingoid' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/1000)*(bpm/110)
  
		doTweenY(dadTweenY, 'dad', -130+10*math.sin((currentBeat*1.7)*math.pi),0.001);


	  end
	end
end
