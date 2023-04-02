local angleshit = 1;
local anglevar = 1;
function onSongStart()
    noteTweenAlpha("a0", 0, -1, 10, cubeInOut)
    noteTweenAlpha("a1", 1, -1, 10, cubeInOut)
    noteTweenAlpha("a2", 2, -1, 10, cubeInOut)
    noteTweenAlpha("a3", 3, -1, 10, cubeInOut)
end

function onCreatePost()
			setProperty('dad.alpha', 0);
			setProperty('iconP2.alpha', 0);
		end

function onBeatHit()
if curBeat == 64 then
makeLuaSprite('flash', '', 0, 0);
setBlendMode('flash', 'add');
makeGraphic('flash', 1920, 1080, 'ffffff');
addLuaSprite('flash', true);
setProperty('flash.scale.x', 2);
setProperty('flash.scale.y', 2);
setProperty('flash.alpha', 1);
doTweenAlpha('flTw', 'flash', 0, 1, 'circOut');
      setProperty('dad.alpha', 100);
      setProperty('iconP2.alpha', 100);
	 end
   if curBeat == 392 then
      doTweenAlpha("oh", "dad", 0, 10, "quartout")
   	 end
end
