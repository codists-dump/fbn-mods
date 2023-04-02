function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.8 and difficulty == 2 then
        setProperty('health', health- 0.018);
    end
end

function onBeatHit()

    if curBeat == 103 then
        doTweenAlpha('goDark', 'escuro', 0.9, 1, 'linear');
    end

    if curBeat == 135 then
        doTweenAlpha('goLight', 'escuro', 0, 1, 'linear');
    end

    if curBeat == 167 then
        doTweenAlpha('goDark', 'escuro', 0.9, 1, 'linear');
    end

    if curBeat == 231 then
        doTweenAlpha('goLight', 'escuro', 0, 1, 'linear');
    end

    if curBeat == 327 then
        doTweenAlpha('goDark', 'escuro', 0.9, 1, 'linear');
    end

    if curBeat == 392 then
        doTweenAlpha('goDark2', 'escuro2', 1, 1, 'linear');
    end

end