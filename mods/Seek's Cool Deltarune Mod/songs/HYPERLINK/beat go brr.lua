function onBeatHit()


    if curBeat == 28 then
        doTweenAlpha('TUNNELTCHOOTCHOO', 'TUNNELTCHOOTCHOO', 0, 1, 'linear');
    end





    if curBeat > 31 and curBeat < 104 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 115 and curBeat < 128 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 131 and curBeat < 160 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 163 and curBeat < 224 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 227 and curBeat < 252 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 259 and curBeat < 290 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 291 and curBeat < 323 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 331 and curBeat < 339 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

    if curBeat > 355 and curBeat < 448 then
        triggerEvent('Add Camera Zoom', 0.01,0.035)
    end

end

function onStepHit()
	if curBeat > 388 and curBeat < 448 then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end

    if curBeat > 0 then -- THIISSSSSSSSSSS SJAJFGSDGHFKSJHADFHJLSADHFAKJDSBJHFJDBJHFHJSDFBSDJKFBNSDJ CIT6Y CITYY CITY CITY
		doTweenX('CITY GO BRRR', 'neo_city', -1100+3800, 160, linear);
        doTweenX('CITY GO BRRR2', 'neo_city2', 200, 160, linear);
        doTweenX('CITY GO BRRR3', 'neo_amongus', -220+2891, 160, linear);
        doTweenX('CITY GO BRRR4', 'neo_amongus2', 200, 160, linear);
	end

	if curBeat > 388 and curBeat < 448 then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end

end