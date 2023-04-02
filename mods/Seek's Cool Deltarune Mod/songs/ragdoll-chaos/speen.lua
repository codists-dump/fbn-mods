-- 	Just so I don't get lost
-- Beat 8 (Song start)
-- Beat 24 (Seam sings)
-- Beat 40 (Beat starts)
-- Beat 72 (Chaos begins)
-- Beat 104 (Faster chaos)
-- Beat 136 (So no sapatinho agora o)
-- Beat 168 (Half time drop)
-- Beat 200 (Speeds up again (build-up)
-- Beat 232 (fake-out deltarune motif)
-- Beat 264 (KEY CHAAANGE BABEEYYYY)
-- bEAT 324 (bYE BYE)
-- Beat 328 (What the devilsknife does to a mf)
-- Beat 384 (Drums stop)
-- Beat 392 (Outro)

function onBeatHit()

	if difficulty == 2 then --hard
		if curBeat == 24 then
			noteTweenAngle( 'A0', 0 , 360 ,0.9 , CircInOut);
			noteTweenAngle( 'A1', 1 , 360 ,0.8 , CircInOut);
			noteTweenAngle( 'A2', 2 , 360 ,0.7 , CircInOut);
			noteTweenAngle( 'A3', 3 , 360 ,0.6 , CircInOut);
			noteTweenAngle( 'A4', 4 , 360 ,0.9 , CircInOut);
			noteTweenAngle( 'A5', 5 , 360 ,0.8 , CircInOut);
			noteTweenAngle( 'A6', 6 , 360 ,0.7 , CircInOut);
			noteTweenAngle( 'A7', 7 , 360 ,0.6 , CircInOut);
		end

		if curBeat == 56 then
			noteTweenAngle( 'A0', 0 , 0 ,0.9 , CircInOut);
			noteTweenAngle( 'A1', 1 , 0 ,0.8 , CircInOut);
			noteTweenAngle( 'A2', 2 , 0 ,0.7 , CircInOut);
			noteTweenAngle( 'A3', 3 , 0 ,0.6 , CircInOut);
			noteTweenAngle( 'A4', 4 , 0 ,0.9 , CircInOut);
			noteTweenAngle( 'A5', 5 , 0 ,0.8 , CircInOut);
			noteTweenAngle( 'A6', 6 , 0 ,0.7 , CircInOut);
			noteTweenAngle( 'A7', 7 , 0 ,0.6 , CircInOut);
		end

		if curBeat == 72 then
			noteTweenAngle( 'A0', 0 , 3600 ,30 , CircInOut);
			noteTweenAngle( 'A1', 1 , 3600 ,31 , CircInOut);
			noteTweenAngle( 'A2', 2 , 3600 ,32 , CircInOut);
			noteTweenAngle( 'A3', 3 , 3600 ,33 , CircInOut);
			noteTweenAngle( 'A4', 4 , 360 ,0.6 , CircInOut);
			noteTweenAngle( 'A5', 5 , 360 ,0.5 , CircInOut);
			noteTweenAngle( 'A6', 6 , 360 ,0.4 , CircInOut);
			noteTweenAngle( 'A7', 7 , 360 ,0.3 , CircInOut);
		end

		if curBeat == 200 then
			noteTweenAngle( 'A0', 0 , 0 ,8.9 , CircInOut);
			noteTweenAngle( 'A1', 1 , 0 ,8.85 , CircInOut);
			noteTweenAngle( 'A2', 2 , 0 ,8.8 , CircInOut);
			noteTweenAngle( 'A3', 3 , 0 ,8.75 , CircInOut);
			noteTweenAngle( 'A4', 4 , 0 ,2 , CircInOut);
			noteTweenAngle( 'A5', 5 , 0 ,2.2 , CircInOut);
			noteTweenAngle( 'A6', 6 , 0 ,2.8 , CircInOut);
			noteTweenAngle( 'A7', 7 , 0 ,3 , CircInOut);
		end

		if curBeat == 263 then
			noteTweenAngle( 'A0', 0 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A2', 2 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A4', 4 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A5', 5 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A6', 6 , 360 ,0.45 , CircInOut);
			noteTweenAngle( 'A7', 7 , 360 ,0.45 , CircInOut);
		end

		if curBeat == 264 then
			noteTweenAngle( 'A0', 0 , 3600 ,20.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 3600 ,20.45 , CircInOut);
			noteTweenAngle( 'A2', 2 , 3600 ,20.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 3600 ,20.45 , CircInOut);
		end

		if curBeat == 328 then
			noteTweenAngle( 'A0', 0 , 0 ,20.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 0 ,20.45 , CircInOut);
			noteTweenAngle( 'A2', 2 , 0 ,20.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 0 ,20.45 , CircInOut);
		end

		if curBeat == 392 then
			noteTweenAngle( 'A0', 0 , 360 ,1.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 360 ,2 , CircInOut);
			noteTweenAngle( 'A2', 2 , 360 ,2.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 360 ,3 , CircInOut);
			noteTweenAngle( 'A4', 4 , 360 ,1.45 , CircInOut);
			noteTweenAngle( 'A5', 5 , 360 ,2 , CircInOut);
			noteTweenAngle( 'A6', 6 , 360 ,2.45 , CircInOut);
			noteTweenAngle( 'A7', 7 , 360 ,3 , CircInOut);
		end
	end



	if difficulty == 3 then --CHAOS

		if curBeat == 8 then
			noteTweenAngle( 'A0', 0 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A1', 1 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A2', 2 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A3', 3 , 180 ,0.45 , CircInOut);
		end

		if curBeat == 24 then
			noteTweenAngle( 'A4', 4 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A5', 5 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A6', 6 , 180 ,0.45 , CircInOut);
			noteTweenAngle( 'A7', 7 , 180 ,0.45 , CircInOut);
		end

		if curBeat == 40 then
			noteTweenAngle( 'A0', 0 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A1', 1 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A2', 2 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A3', 3 , -180 ,0.85 , CircInOut);
		end

		if curBeat == 56 then
			noteTweenAngle( 'A4', 4 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A5', 5 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A6', 6 , -180 ,0.85 , CircInOut);
			noteTweenAngle( 'A7', 7 , -180 ,0.85 , CircInOut);
		end

		if curBeat == 71 then
			noteTweenAngle( 'A0', 0 , -100 ,0.9 , CircOut);
			noteTweenAngle( 'A1', 1 , 100 ,0.85 , CircOut);
			noteTweenAngle( 'A2', 2 , -100 ,0.8 , CircOut);
			noteTweenAngle( 'A3', 3 , 100 ,0.75 , CircOut);
			noteTweenAngle( 'A4', 4 , -100 ,0.9 , CircOut);
			noteTweenAngle( 'A5', 5 , 100 ,0.85 , CircOut);
			noteTweenAngle( 'A6', 6 , -100 ,0.8 , CircOut);
			noteTweenAngle( 'A7', 7 , 100 ,0.75 , CircOut);
		end

		if curBeat == 72 then
			noteTweenAngle( 'A0', 0 , 88000 ,800.9 , CircInOut);
			noteTweenAngle( 'A1', 1 , -88000 ,800.85 , CircInOut);
			noteTweenAngle( 'A2', 2 , 88000 ,800.8 , CircInOut);
			noteTweenAngle( 'A3', 3 , -88000 ,800.75 , CircInOut);
			noteTweenAngle( 'A4', 4 , 88000 ,800.9 , CircInOut);
			noteTweenAngle( 'A5', 5 , -88000 ,800.85 , CircInOut);
			noteTweenAngle( 'A6', 6 , 88000 ,800.8 , CircInOut);
			noteTweenAngle( 'A7', 7 , -88000 ,800.75 , CircInOut);
		end

		function opponentNoteHit()
			health = getProperty('health')
			if getProperty('health') > 0.35 then
				setProperty('health', health- 0.02);
			end
		end

	end



end