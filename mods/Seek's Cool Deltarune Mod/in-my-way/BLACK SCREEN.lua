function onCreate()
    makeLuaSprite('dark', 'dark', -220, -100);
    scaleObject('dark', 3, 3);
    addLuaSprite('dark', true);
end

local boobs = true;

function onSongStart()
    if boobs == true then
        doTweenAlpha('dark', 'dark', 0, 0.5);
    end
end