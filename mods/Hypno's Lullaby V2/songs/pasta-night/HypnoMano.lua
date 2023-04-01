idle= true
function onCreate()--Por Nickobelit
	makeAnimatedLuaSprite('HypnoMano', 'characters/hypno/PASTA_HYPNO',0, 150); -- Change to characters idle in XML
	addAnimationByPrefix('HypnoMano', 'idle', 'Hypno Idle Front', 24, false); -- Change to characters idle in XML
    addAnimationByPrefix('HypnoMano', 'singLEFT', 'Hypno Left Front', 24, false); -- Change to characters leftnote in XML
    addAnimationByPrefix('HypnoMano', 'singDOWN', 'Hypno Down Front', 24, false); -- Change to characters downnote in XML
    addAnimationByPrefix('HypnoMano', 'singUP', 'Hypno Up Front', 24, false); -- Change to characters upnote in XML
    addAnimationByPrefix('HypnoMano', 'singRIGHT', 'Hypno Right Front', 24, false);-- Change to characters rightnote in XML
	objectPlayAnimation('HypnoMano', 'idle');
	addLuaSprite('HypnoMano', true)
	scaleObject('HypnoMano', 2.5,2.5)
    setProperty('HypnoMano.alpha', 1);
end

function onCreatePost()
        setProperty('HypnoMano.offset.x',-910)
        setProperty('HypnoMano.offset.y',-600)
end

function onBeatHit()
if idle == true then
	if curBeat%2 == 0 then
		objectPlayAnimation('HypnoMano', 'idle', false)
		setProperty('HypnoMano.offset.x',-910)
        setProperty('HypnoMano.offset.y',-600)
	end
end
end

function onUpdatePost()
if difficultyName == 'Lord-X' or difficultyName == 'Mx' then
if idle == false then
if getProperty('gf.animation.curAnim.name') == 'idle' then
objectPlayAnimation('HypnoMano', 'idle',false);
setProperty('HypnoMano.offset.x',-910)
setProperty('HypnoMano.offset.y',-600)
end
end
if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
        idle= false
        setProperty('HypnoMano.offset.x',-980)
        setProperty('HypnoMano.offset.y',-600)
        runTimer('idleHypno', 1)
end
if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
        idle= false
        setProperty('HypnoMano.offset.x',-750)
        setProperty('HypnoMano.offset.y',-350)
        runTimer('idleHypno', 1)
end
if getProperty('gf.animation.curAnim.name') == 'singUP' then
         idle= false
        setProperty('HypnoMano.offset.x',-770)
        setProperty('HypnoMano.offset.y',-170)
        runTimer('idleHypno', 1)
end
if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
        idle= false
        setProperty('HypnoMano.offset.x',-900)
        setProperty('HypnoMano.offset.y',-550)
        runTimer('idleHypno', 1)
end
end
if difficultyName == 'Hypno' then
if idle == false then
if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
objectPlayAnimation('HypnoMano', 'idle',false);
setProperty('HypnoMano.offset.x',-910)
setProperty('HypnoMano.offset.y',-600)
end
end
end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
if difficultyName == 'Hypno' then
if noteData == 0 then
        idle= false
        objectPlayAnimation('HypnoMano', 'singLEFT',true);
        setProperty('HypnoMano.offset.x',-750)
        setProperty('HypnoMano.offset.y',-350)
        runTimer('idleHypno', 1)
end
if noteData == 1 then
        idle= false
        objectPlayAnimation('HypnoMano', 'singDOWN',true);
        setProperty('HypnoMano.offset.x',-980)
        setProperty('HypnoMano.offset.y',-600)
        runTimer('idleHypno', 1)
end
if noteData == 2 then
         idle= false
         objectPlayAnimation('HypnoMano', 'singUP',true);
        setProperty('HypnoMano.offset.x',-770)
        setProperty('HypnoMano.offset.y',-170)
        runTimer('idleHypno', 1)
end
if noteData == 3 then
        idle= false
        objectPlayAnimation('HypnoMano', 'singRIGHT',true);
        setProperty('HypnoMano.offset.x',-900)
        setProperty('HypnoMano.offset.y',-550)
        runTimer('idleHypno', 1)
end
end
end

function onCountdownTick(counter)
	if counter % 2 == 0 then
		if idle == true then
			objectPlayAnimation('HypnoMano', 'idle',false);
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'idleHypno' then
idle= true
end
end