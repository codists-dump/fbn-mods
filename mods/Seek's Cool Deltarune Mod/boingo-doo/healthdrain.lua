function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.65 then
        setProperty('health', health- 0.018);
    end
end