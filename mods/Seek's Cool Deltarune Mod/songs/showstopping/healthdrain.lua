function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 1.1 then
        setProperty('health', health- 0.01);
    end
end