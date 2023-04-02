function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 and curBeat > 13 then
        setProperty('health', health- 0.022);
    end
end