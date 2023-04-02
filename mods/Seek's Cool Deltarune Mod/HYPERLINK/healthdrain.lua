function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.6 and curBeat > 31 and difficulty == 1 then
        setProperty('health', health- 0.022);
    else if getProperty('health') > 0.35 and curBeat > 31 and difficulty == 2 then
        setProperty('health', health- 0.024);
        end
    end
end