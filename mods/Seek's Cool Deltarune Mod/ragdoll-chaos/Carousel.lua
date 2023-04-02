
function onCreate()
    precacheImage('carousel');
    precacheImage('carousel_everyman');
end

local carspeed = 2;
local carspeedHard = 2.5;

function onBeatHit()

    if difficulty == 3 then




        if curBeat == 72 then -- bottom cars    FIRST ROW
            makeLuaSprite('carousel','carousel', -2200, 450);
            setObjectCamera('carousel', 'camOther');
            addLuaSprite('carousel', true);
            scaleObject('carousel', 1.2, 1.2);
        end

        if curBeat > 0 then --bottom tween
            doTweenX('carouselx', 'carousel', 1500, carspeed, linear);
            doTweenY('carousely', 'carousel', getRandomInt(400, 480), 1, sineIn);
        end

        if curBeat == 72 then --top cars
            makeLuaSprite('carousel2','carousel', 1500, -100);
            setProperty('carousel2.angle', 180);
            setObjectCamera('carousel2', 'camOther');
            addLuaSprite('carousel2', true);
            scaleObject('carousel2', 1.2, 1.2);
        end

        if curBeat > 0 then --top tween
            doTweenX('carouselx2', 'carousel2', -2200, carspeed, linear);
            doTweenY('carousely2', 'carousel2', getRandomInt(-20, -100), 1, sineIn);
        end

        if curBeat == 104 then --cleanup
            removeLuaSprite('carousel');
            removeLuaSprite('carousel2');
        end









        if curBeat == 180 then -- bottom cars    SECOND ROW
            makeLuaSprite('carousel','carousel', -2200, 450);
            setObjectCamera('carousel', 'camOther');
            addLuaSprite('carousel', true);
            scaleObject('carousel', 1.2, 1.2);
        end

        if curBeat > 0 then --bottom tween
            doTweenX('carouselx', 'carousel', 1500, carspeed, linear);
            doTweenY('carousely', 'carousel', getRandomInt(400, 480), 1, sineIn);
        end

        if curBeat == 180 then --top cars
            makeLuaSprite('carousel2','carousel', 1500, -100);
            setProperty('carousel2.angle', 180);
            setObjectCamera('carousel2', 'camOther');
            addLuaSprite('carousel2', true);
            scaleObject('carousel2', 1.2, 1.2);
        end

        if curBeat > 0 then --top tween
            doTweenX('carouselx2', 'carousel2', -2200, carspeed, linear);
            doTweenY('carousely2', 'carousel2', getRandomInt(-20, -100), 1, sineIn);
        end

        if curBeat == 200 then --cleanup
            removeLuaSprite('carousel');
            removeLuaSprite('carousel2');
        end








        if curBeat == 264 then -- bottom cars    THIRD ROW
            makeLuaSprite('carousel','carousel', -2200, 450);
            setObjectCamera('carousel', 'camOther');
            addLuaSprite('carousel', true);
            scaleObject('carousel', 1.2, 1.2);
        end

        if curBeat > 0 then --bottom tween
            doTweenX('carouselx', 'carousel', 1500, carspeedHard, linear);
            doTweenY('carousely', 'carousel', getRandomInt(400, 480), 1, sineIn);
        end

        if curBeat == 264 then --top cars
            makeLuaSprite('carousel2','carousel', 1500, -100);
            setProperty('carousel2.angle', 180);
            setObjectCamera('carousel2', 'camOther');
            addLuaSprite('carousel2', true);
            scaleObject('carousel2', 1.2, 1.2);
        end

        if curBeat > 0 then --top tween
            doTweenX('carouselx2', 'carousel2', -2200, carspeedHard, linear);
            doTweenY('carousely2', 'carousel2', getRandomInt(-20, -100), 1, sineIn);
        end

        if curBeat == 300 then --cleanup
            removeLuaSprite('carousel');
            removeLuaSprite('carousel2');
        end




        if curBeat == 332 then -- bottom cars    FINAL ROW

            sex = getRandomInt(1, 2);

            if sex == 2 then
                makeLuaSprite('carousel','carousel', -2200, 450);
                setObjectCamera('carousel', 'camOther');
                addLuaSprite('carousel', true);
                scaleObject('carousel', 1.2, 1.2);
            else
                makeLuaSprite('carousel','carousel_everyman', -2200, 450);
                setObjectCamera('carousel', 'camOther');
                addLuaSprite('carousel', true);
                scaleObject('carousel', 1.2, 1.2);
            end
        end

        if curBeat > 0 then --bottom tween
            doTweenX('carouselx', 'carousel', 1500, carspeed, linear);
            doTweenY('carousely', 'carousel', getRandomInt(400, 480), 1, sineIn);
        end

        if curBeat == 330 then --top cars
            makeLuaSprite('carousel2','carousel', 1500, -100);
            setProperty('carousel2.angle', 180);
            setObjectCamera('carousel2', 'camOther');
            addLuaSprite('carousel2', true);
            scaleObject('carousel2', 1.2, 1.2);
        end

        if curBeat > 0 then --top tween
            doTweenX('carouselx2', 'carousel2', -2200, carspeed, linear);
            doTweenY('carousely2', 'carousel2', getRandomInt(-20, -100), 1, sineIn);
        end

        if curBeat == 360 then --cleanup
            removeLuaSprite('carousel');
            removeLuaSprite('carousel2');
        end



    end
end