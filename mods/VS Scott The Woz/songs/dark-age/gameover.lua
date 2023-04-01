function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'scott-dead');
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'gameoverscott');
end
function onGameOverStart()
    runHaxeCode("FlxG.camera.zoom = 1.2;")
    setProperty('boyfriend.alpha',0)
    makeLuaSprite('bg', 'scottroom/RoomBG', -100, -100);
    addLuaSprite('bg', false);
    makeLuaSprite('slideborder', 'empty', 1400, 10)
	makeGraphic('slideborder', 1280, 720, '324bf4')

    makeAnimatedLuaSprite('hedead','characters/dead-scott',-160,-500)
    setProperty('hedead.flipX',true)
    addAnimationByPrefix('hedead','idle','Scott Dies0',24,false)
    addLuaSprite('hedead')
    setObjectCamera('hedead','game')
    playAnim('hedead','idle',true)

	setObjectCamera('slideborder', 'game')
	addLuaSprite('slideborder', false)
    setProperty('updateCamera',false)

    setProperty('camFollowPos.x',1170);
    setProperty('camFollowPos.y',300)
    setProperty('defaultCamZoom',1)
end


function onUpdate(elapsed)
    if health == 0 then
        triggerEvent('Camera Follow Pos',1170,300)
    end
    if inGameOver then
        setProperty('updateCamera',false)

        setProperty('camFollowPos.x',1170);
        setProperty('camFollowPos.y',300)
    end
end