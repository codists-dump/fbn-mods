function onCreatePost()
    setPosition('healthBar', 60, 692.5)
    setProperty('healthBarBG.visible', false)
    setPosition('scoreTxt', 335, 688.5)
    setTextSize('scoreTxt', 16)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)
    setPosition('timeTxt', 50, 10)
    setTextSize('timeTxt', 40)
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, 'x', 415 + 112 * (i - 4))
    end
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', -1000)
    end
end

function onUpdatePost()
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, 'y', downscroll and 550 or 30)
    end
end

function onStepHit()
    setTextString('songLength', milliToHuman(math.floor(getPropertyFromClass('Conductor', 'songPosition') - noteOffset)).. ' / ' .. milliToHuman(math.floor(songLength)))
end

function setPosition(obj, x, y)
    setProperty(obj..'.x', x)
    setProperty(obj..'.y', y)
end

function milliToHuman(milliseconds) -- https://forums.mudlet.org/viewtopic.php?t=3258
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%02d:%02d", minutes, seconds)  
end