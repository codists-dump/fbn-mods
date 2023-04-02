function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.5 and curBeat > 31 then
        setProperty('health', health- 0.018);
    end
end