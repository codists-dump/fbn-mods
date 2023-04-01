local noteTweenDur = 1
function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'eggdick-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'eggman_death'); --Put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end
function onStepHit()
	if curStep == 953 and not middlescroll then
		noteTweenX('note4ToNote0',4,defaultOpponentStrumX0,noteTweenDur,'elasticInOut')
		noteTweenX('note5ToNote1',5,defaultOpponentStrumX1,noteTweenDur,'elasticInOut')
		noteTweenX('note6ToNote2',6,defaultOpponentStrumX2,noteTweenDur,'elasticInOut')
		noteTweenX('note7ToNote3',7,defaultOpponentStrumX3,noteTweenDur,'elasticInOut')
		noteTweenX('note0ToNote4',0,defaultPlayerStrumX0,noteTweenDur,'elasticInOut')
		noteTweenX('note1ToNote5',1,defaultPlayerStrumX1,noteTweenDur,'elasticInOut')
		noteTweenX('note2ToNote6',2,defaultPlayerStrumX2,noteTweenDur,'elasticInOut')
		noteTweenX('note3ToNote7',3,defaultPlayerStrumX3,noteTweenDur,'elasticInOut')
	end
	if curStep == 1472 then
		if middlescroll then
			noteTweenAlpha('note0Fade',0,0,noteTweenDur,'elasticInOut')
			noteTweenAlpha('note1Fade',1,0,noteTweenDur,'elasticInOut')
			noteTweenAlpha('note2Fade',2,0,noteTweenDur,'elasticInOut')
			noteTweenAlpha('note3Fade',3,0,noteTweenDur,'elasticInOut')
		else
			noteTweenX('note4ToMid',4,defaultOpponentStrumX0+320,noteTweenDur,'elasticInOut')
			noteTweenX('note5ToMid',5,defaultOpponentStrumX1+320,noteTweenDur,'elasticInOut')
			noteTweenX('note6ToMid',6,defaultOpponentStrumX2+320,noteTweenDur,'elasticInOut')
			noteTweenX('note7ToMid',7,defaultOpponentStrumX3+320,noteTweenDur,'elasticInOut')
			noteTweenAlpha('note0Fade',0,0,noteTweenDur,'elasticInOut')
			noteTweenAlpha('note1Fade',1,0,noteTweenDur,'elasticInOut')
			noteTweenAlpha('note2Fade',2,0,noteTweenDur,'elasticInOut')
			noteTweenAlpha('note3Fade',3,0,noteTweenDur,'elasticInOut')
		end
	end
end