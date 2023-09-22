function onCreate()
    
    setProperty('opponentCameraOffset[0]', getProperty('opponentCameraOffset[0]') + 100)
    setProperty('opponentCameraOffset[1]', getProperty('opponentCameraOffset[1]') + 100)

    
    setProperty('boyfriendCameraOffset[0]', getProperty('boyfriendCameraOffset[0]') - 100)
    setProperty('boyfriendCameraOffset[1]', getProperty('boyfriendCameraOffset[1]') - 100)
end
function onCreatePost()
    setProperty('defaultCamZoom', 0.65)
end

function onUpdatePost()
    for i = 0, getProperty('notes.length') -1 do
        if getPropertyFromGroup('notes', i, 'noteType') == 'mimi' then
            setPropertyFromGroup('notes', i, 'alpha', 0.4)
        end
        
        if getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
            setPropertyFromGroup('notes', i, 'alpha', 0.4)
        end
    end
end