function onCreate()
    if isStoryMode then
        makeLuaSprite('dark', 'dark', -300, -100);
        scaleObject('dark', 5, 5);
        addLuaSprite('dark', true);
    end
end

local boobs = true;

function onSongStart()
    if boobs == true then
        doTweenAlpha('dark', 'dark', 0, 0.5);
    end
end