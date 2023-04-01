function onUpdate()
    if curStep < 30 then
        for strumLineNotes = 0,7 do
            setPropertyFromGroup('strumLineNotes',strumLineNotes,'alpha',0)
        end
    end
end