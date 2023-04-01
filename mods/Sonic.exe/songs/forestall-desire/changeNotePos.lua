local opponentAlpha = 0.3
local spin = false
function onCreatePost()
   leftStrum()
end
function leftStrum()
    if not middlescroll then
        for strumLine = 0,3 do
            setPropertyFromGroup('playerStrums',strumLine,'x',92 + (112 * strumLine + 1))
            setPropertyFromGroup('opponentStrums',strumLine,'x',732 + (112 * strumLine + 1))
            opponentAlpha = 1
        end
    end
end
function fadeMiddleStrum(duration,easing,spin,opacity)
    if not middlescroll then
        for strumLine = 0,7 do
            if strumLine < 2 then
                noteTweenX('GTPStrum'..strumLine,strumLine,112 + (112 * strumLine),duration,easing)
            elseif strumLine >= 2 and strumLine < 4 then
                noteTweenX('GTPStrum'..strumLine,strumLine,732 + (112 * strumLine),duration,easing)
            elseif strumLine >= 4 then
                noteTweenX('GTPStrum'..strumLine,strumLine,92 + (112 * (strumLine - 1)),duration,easing)
            end
            if strumLine < 4 then
                noteTweenAlpha('WowTweenAlpha'..strumLine,strumLine,opacity,1,'linear')
            end
            if spin == true then
                noteTweenAngle('wowTweenAngle'..strumLine,strumLine,360,duration,'quartOut')
            end
        end
    end
end
function fadeLeftStrum(duration,easing,spin,opacity)
    if not middlescroll then
        for strumLine = 0,7 do
            if strumLine < 4 then
                noteTweenX('GTPStrum'..strumLine,strumLine,732 + (112 * strumLine),duration,easing)
            elseif strumLine >= 4 then
                noteTweenX('GTPStrum'..strumLine,strumLine,92 + (112 * (strumLine - 4)),duration,easing)
            end
            if strumLine < 4 then
                noteTweenAlpha('WowTweenAlpha'..strumLine,strumLine,opacity,1,'linear')
            end
            if spin == true then
                noteTweenAngle('WowTweenAngle'..strumLine,strumLine,360,duration,'quartOut')
            end
        end
    end
end
function middleStrum()
    if not middlescroll then
        for strumLine = 0,7 do
            if strumLine < 2 then
                setPropertyFromGroup('strumLineNotes',strumLine,'x',112 + (112 * strumLine))
            elseif strumLine >= 2 and strumLine < 4 then
                setPropertyFromGroup('strumLineNotes',strumLine,'x',732 + (112 * strumLine))
            elseif strumLine >= 4 then
                setPropertyFromGroup('strumLineNotes',strumLine,'x',92 + (112 * (strumLine - 1)))
            end
            if strumLine < 4 then
                setPropertyFromGroup('strumLineNotes',strumLine,'alpha',0.3)
            end
        end
    end
end
function onStepHit()
    if curStep == 787 or curStep == 1312 then
        fadeMiddleStrum(1,'quartOut',true,0.3)
    end
    if curStep == 1056 then
        fadeLeftStrum(1,'quartOut',true,1)
    end
end
function onTweenCompleted(name)
    if string.find(name,'wowTweenAngle',0,true) ~= nil then
        for tweenLenght = 0,7 do
            if name == 'wowTweenAngle'..tweenLenght then
                setPropertyFromGroup('strumLineNotes',tweenLenght,'angle',0)
            end
        end
    end
end