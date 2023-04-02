local Healed = false; --means the player did not heal yet


function onUpdate()
    if (getPropertyFromClass("flixel.FlxG", "keys.justPressed.F1")) and Healed == false then --If you press F1 and haven't healed yet, then
        setProperty('health', 2); --heals you
        playSound('heal', 0.8); --plays heal sound
        playSound('bigshot', 1.5); --plays bigshot sound
        setRatingName('Big Shot'); --Funky rating name for funsies

        Healed = true; --lets game know you healed once

        makeAnimatedLuaSprite('heal','heal', 250, 100); --spamton pop up animation
        addAnimationByPrefix('heal','heal','heal', 15, false);
        objectPlayAnimation('heal','heal', true);
        scaleObject('heal', 0.3, 0.3);
        addLuaSprite('heal', true);
    end


end