local nextShakeTmr = 0
-- THIS IS THE TIMER UNTIL THE NEXT SHAKE --

-- [ IMPORTANT STUFF ] --
local shakeIntensity = 1 -- THE AMMOUNT OF MAX FROM 0, TO THIS VALUE ON WHAT THE STRUMS WILL MOVE (X, Y)
local shakeTime = 0.02 -- THE DELAY BTWN EACH SHAKE
-- [ END OF THE IMPORTANT SHITS ] --

local enabled = true -- IS ENABLED ??? 

local strumPos = {{x,y},{x,y},{x,y},{x,y},{x,y},{x,y},{x,y},{x,y}}
function onCreatePost()
    for i=0,7 do
        strumPos[i + 1].x = getPropertyFromGroup('strumLineNotes', i, 'x')
        strumPos[i + 1].y = getPropertyFromGroup('strumLineNotes', i, 'y')
    end
end

function onUpdatePost(elapsed)
    if enabled and curBeat > 71 then
        nextShakeTmr = nextShakeTmr + elapsed;

        if nextShakeTmr > shakeTime then
            nextShakeTmr = 0
    
            for i=0,7 do
                local negativeValue = getRandomBool()
                local negativeValueRoll = getRandomBool()
    
                local shakeyShakey = getRandomInt(0, shakeIntensity)
                local shakeyShakey2 = getRandomInt(0, shakeIntensity)
                local daValue = shakeyShakey
                local daValueY = shakeyShakey2
                if negativeValue then daValue = -shakeyShakey end
                if negativeValueRoll then daValueY = -shakeyShakey2 end
    
                setPropertyFromGroup('strumLineNotes', i, 'x', strumPos[i + 1].x + daValue)
                setPropertyFromGroup('strumLineNotes', i, 'y', strumPos[i + 1].y + daValueY)
            end
        end
    end
end