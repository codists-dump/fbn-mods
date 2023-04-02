local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local seenVid = false -- might use
function onEndSong()
	if isStoryMode and not seenVid then
		startVideo('credits')
		runTimer('end', 41)
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', '(anger) management');
	elseif tag == 'end' then
		seenVid = true
		endSong()
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onCreate()
	makeAnimatedLuaSprite('beam', 'parkangry/beam', 450, 280);
	addAnimationByPrefix('beam', 'parkangry/beam', 'beam',24,true);
	addLuaSprite('beam', false)
	setObjectOrder('beam', 5)
	makeLuaSprite('beamglow', 'parkangry/beamglow', 700, 500);
	setBlendMode('beamglow', 'add')
	addLuaSprite('beamglow', true)
end

function onCreatePost()
	setProperty('beam.alpha', 0);
	setProperty('beamglow.alpha', 0);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	triggerEvent('Screen Shake', '0.1, 0.004', '0.05, 0.004')
	doTweenZoom('cool', 'camGame', 0.95, 0.01, 'easeIn')
	health = getProperty('health')
	if getProperty('health') > 0.1 then
		setProperty('health', health -0.015);
	end
end

function onBeatHit()
	if curBeat == 64 then
		makeLuaSprite('flash', '', 0, 0);
		setBlendMode('flash', 'add');
		makeGraphic('flash', 1920, 1080, 'ffffff');
		addLuaSprite('flash', true);
		setProperty('flash.scale.x', 2);
		setProperty('flash.scale.y', 2);
		setProperty('flash.alpha', 1);
		doTweenAlpha('flTw', 'flash', 0, 1, 'circOut');
		setProperty('beam.alpha', 100);
		setProperty('beamglow.alpha', 100);
	end
	if curBeat == 488 then
		 doTweenAlpha('flTw', 'flash', 1, 2, 'linear');
		 doTweenAlpha('a', 'timeTxt', 0, 2, 'linear');
		 doTweenAlpha('b', 'timeBar', 0, 2, 'linear');
		 doTweenAlpha('c', 'timeBarBG', 0, 2, 'linear');
		 doTweenAlpha('d', 'healthBar', 0, 2, 'linear');
		 doTweenAlpha('e', 'healthBarBG', 0, 2, 'linear');
		 doTweenAlpha('f', 'iconP1', 0, 2, 'linear');
		 doTweenAlpha('g', 'iconP2', 0, 2, 'linear');
		 doTweenAlpha('h', 'scoreTxt', 0, 2, 'linear');
	end
	if curBeat == 504 then

	setProperty('camGame.visible',false)

	setProperty('camHUD.visible',false)
		for i = 0, 3 do
			setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
			setPropertyFromGroup('playerStrums', i, 'alpha', 0)
		end
	end
end
