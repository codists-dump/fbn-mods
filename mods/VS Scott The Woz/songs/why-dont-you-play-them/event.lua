function onCreatePost()
    makeLuaSprite('slideborder', 'empty', -2900, 0)
	makeGraphic('slideborder', 1280, 720, '242222')
    scaleObject('slideborder',2,2)
	setObjectCamera('slideborder', 'game')
    setObjectOrder('slideborder',3)
    addLuaSprite('slideborder', false)

    makeLuaSprite('circle', 'effect/circle', -100, -100);
    scaleObject('circle',1.2,1.2)
    setObjectCamera('circle','other')
    addLuaSprite('circle', false);

    makeLuaSprite('pokemon', 'effect/pokemon', 0, 0);
    scaleObject('pokemon',1.5,1.5)
    setObjectOrder('pokemon',4)
    setObjectCamera('pokemon','game')
    addLuaSprite('pokemon', false);
    setProperty('pokemon.visible',false)


    makeAnimatedLuaSprite('borders','effect/game',-2,-8)
    addAnimationByPrefix('borders','red','border0',24,true)
    addAnimationByPrefix('borders','cyan','cyan0',24,true)
    addAnimationByPrefix('borders','yellow','yellow0',24,true)
    addAnimationByPrefix('borders','spike','spike0',24,true)
    addAnimationByPrefix('borders','close','close0',24,true)

    makeLuaText('textfull',([[Turn-based battles and too much text
    I'd rather be out not having sex
    Menu clutter and useless stats
    And random encounters can kiss my ass
    No gameplay till hours in
    Combat-ready? How did I win?
    The same thing happens over again
    And that there fun part comes up when?
    I miss one thing and now I'm lost
    That one inch of text really meant a lot?
    Some shops with items I can't afford
    So grind for money, you won't be bored
    I'm tired, I'm scared, I'm not having fun
    There's no other way this can be spun
    What do I do? What do I check?
    It's an RPG, what did I expect?]]))
    setTextSize('textfull',62)
    setTextAlignment('textfull','left')
    setProperty('textfull.x', -100)
    addLuaText('textfull')

    setObjectCamera('borders','other')
    
    setProperty('borders.visible',false)
    setProperty('circle.visible',false)
    setProperty('textfull.visible',false)
    addLuaSprite('borders')
end

function onSongStart()

    camcontrol(700,600)

    noteTweenX('slide5',0,92,0.6,'expoout')
    noteTweenX('slide6',1,204,0.5,'expoout')
    noteTweenX('slide7',2,316,0.4,'expoout')
    noteTweenX('slide8',3,428,0.3,'expoout')

end

function camcontrol(x,y)

    setProperty('camFollowPos.x',x)
    setProperty('camFollowPos.y',y)
    setProperty('camFollow.x',x)
    setProperty('camFollow.y',y)

    setProperty('camGame.scroll.x',x)
    setProperty('camGame.scroll.y',y)

    setProperty('isCameraOnForcedPos',true)
end

function onStepHit()

    if curStep == 27 then
        doTweenX('slidebg','slideborder',-100,0.4)
        doTweenY('bfslide','boyfriend',2000,0.4,'expoout')
        doTweenX('dadslide','dad',700,0.4)
        noteTweenX('slide',0,440,0.6,'expoout')
        noteTweenX('slide1',1,550,0.5,'expoout')
        noteTweenX('slide2',2,660,0.4,'expoout')
        noteTweenX('slide3',3,770,0.3,'expoout')

        noteTweenX('slide4',4,2000,0.3,'expoout')
        noteTweenX('slide5',5,2000,0.3,'expoout')
        noteTweenX('slide6',6,2000,0.3,'expoout')
        noteTweenX('slide7',7,2000,0.3,'expoout')

        noteTweenAngle('spin',4,360,0.6,'expoout')
        noteTweenAngle('spin1',5,360,0.5,'expoout')
        noteTweenAngle('spin2',6,360,0.4,'expoout')
        noteTweenAngle('spin3',7,360,0.3,'expoout')
        setProperty('healthBar.alpha',0)
        setProperty('iconP1.alpha',0)
        setProperty('scoreTxt.alpha',0)
        setProperty('iconP2.alpha',0)
    end

    if curStep == 57 then
        doTweenX('bfslide3','boyfriend',700,0.4,'expoout')
        doTweenY('bfslide2','boyfriend',670,0.4,'expoout')
        doTweenY('daddown','dad',2000,1,'circout')
        noteTweenAngle('spin',0,360,0.6,'expoout')
        noteTweenAngle('spin1',1,360,0.5,'expoout')
        noteTweenAngle('spin2',2,360,0.4,'expoout')
        noteTweenAngle('spin3',3,360,0.3,'expoout')



        if downscroll then
            noteTweenY('slide',0,-770,0.6,'expoout')
            noteTweenY('slide1',1,-770,0.5,'expoout')
            noteTweenY('slide2',2,-770,0.4,'expoout')
            noteTweenY('slide3',3,-770,0.3,'expoout')
        else
            noteTweenY('slide',0,770,0.6,'expoout')
            noteTweenY('slide1',1,770,0.5,'expoout')
            noteTweenY('slide2',2,770,0.4,'expoout')
            noteTweenY('slide3',3,770,0.3,'expoout')
        end

        noteTweenX('slide4',4,440,0.3,'expoout')
        noteTweenX('slide5',5,550,0.3,'expoout')
        noteTweenX('slide6',6,660,0.3,'expoout')
        noteTweenX('slide7',7,770,0.3,'expoout')
    end

    if curStep == 95 then
        setProperty('borders.visible',true)
        playAnim('borders','red')
        setProperty('boyfriend.y',2000)
        setProperty('dad.x',430)
        setProperty('dad.y',370)

        noteTweenAngle('spin',0,360,0.6,'expoout')
        noteTweenAngle('spin1',1,360,0.5,'expoout')
        noteTweenAngle('spin2',2,360,0.4,'expoout')
        noteTweenAngle('spin3',3,360,0.3,'expoout')

        if downscroll then
            noteTweenY('slide',0,570,0.6,'expoout')
            noteTweenY('slide1',1,570,0.5,'expoout')
            noteTweenY('slide2',2,570,0.4,'expoout')
            noteTweenY('slide3',3,570,0.3,'expoout')
            setProperty('borders.flipY',true)
        else
            noteTweenY('slide',0,50,0.6,'expoout')
            noteTweenY('slide1',1,50,0.5,'expoout')
            noteTweenY('slide2',2,50,0.4,'expoout')
            noteTweenY('slide3',3,50,0.3,'expoout')   
        end



        noteTweenX('slide4',0,440,0.6,'expoout')
        noteTweenX('slide5',1,550,0.5,'expoout')
        noteTweenX('slide6',2,660,0.4,'expoout')
        noteTweenX('slide7',3,770,0.3,'expoout')

        noteTweenX('slide8',4,2000,0.3,'expoout')
        noteTweenX('slide9',5,defaultPlayerStrumX1 + 100,0.3,'expoout')
        noteTweenX('slide10',6,2000,0.3,'expoout')
        noteTweenX('slide11',7,2000,0.3,'expoout')
    


    end

    if curStep == 100 then
        noteTweenAngle('spin',5,360,0.6,'expoout')
        noteTweenX('slide9',5,2000,0.3,'expoout')
    end    

    if curStep == 111 then
        playAnim('borders','spike',true)
        setProperty('dad.x',700)
    end 

    if curStep == 123 then
        playAnim('borders','yellow',true)
        
        doTweenX('lolscale','borders.scale',2,10,'quadin')
        doTweenY('lolscale2','borders.scale',2,10,'quadin')
        setProperty('boyfriend.y',700)
        setProperty('boyfriend.x',670)
        setProperty('dad.y',2000)

        noteTweenAngle('spin',0,360,0.6,'expoout')
        noteTweenAngle('spin1',1,360,0.5,'expoout')
        noteTweenAngle('spin2',2,360,0.4,'expoout')
        noteTweenAngle('spin3',3,360,0.3,'expoout')

        if downscroll then
            setPropertyFromGroup('opponentStrums',0,'y',-770)
            setPropertyFromGroup('opponentStrums',1,'y',-770)
            setPropertyFromGroup('opponentStrums',2,'y',-770)
            setPropertyFromGroup('opponentStrums',3,'y',-770)
        else
            setPropertyFromGroup('opponentStrums',0,'y',770)
            setPropertyFromGroup('opponentStrums',1,'y',770)
            setPropertyFromGroup('opponentStrums',2,'y',770)
            setPropertyFromGroup('opponentStrums',3,'y',770)
        end



        setPropertyFromGroup('playerStrums',0,'x',440)
        setPropertyFromGroup('playerStrums',1,'x',550)
        setPropertyFromGroup('playerStrums',2,'x',660)
        setPropertyFromGroup('playerStrums',3,'x',770)
    end

    if curStep == 151 then
        cancelTween('lolscale')
        cancelTween('lolscale2')
        scaleObject('borders',1,1)
        doTweenZoom('lolzoom','game',1,1)
        setProperty('borders.visible',false)
    end

    if curStep == 159 then
        setProperty('borders.visible',true)
        playAnim('borders','cyan')
        setProperty('boyfriend.y',2000)
        setProperty('dad.x',430)
        setProperty('dad.y',370)

        noteTweenAngle('spin',0,360,0.6,'expoout')
        noteTweenAngle('spin1',1,360,0.5,'expoout')
        noteTweenAngle('spin2',2,360,0.4,'expoout')
        noteTweenAngle('spin3',3,360,0.3,'expoout')

        if downscroll then
            noteTweenY('slide',0,570,0.6,'expoout')
            noteTweenY('slide1',1,570,0.5,'expoout')
            noteTweenY('slide2',2,570,0.4,'expoout')
            noteTweenY('slide3',3,570,0.3,'expoout')  
        else
            noteTweenY('slide',0,50,0.6,'expoout')
            noteTweenY('slide1',1,50,0.5,'expoout')
            noteTweenY('slide2',2,50,0.4,'expoout')
            noteTweenY('slide3',3,50,0.3,'expoout')   
        end

        noteTweenX('slide4',0,440,0.6,'expoout')
        noteTweenX('slide5',1,550,0.5,'expoout')
        noteTweenX('slide6',2,660,0.4,'expoout')
        noteTweenX('slide7',3,770,0.3,'expoout')

        noteTweenX('slide8',4,2000,0.3,'expoout')
        noteTweenX('slide9',5,defaultPlayerStrumX1 + 100,0.3,'expoout')
        noteTweenX('slide10',6,2000,0.3,'expoout')
        noteTweenX('slide11',7,2000,0.3,'expoout')




    end

    if curStep == 166 then
        noteTweenAngle('spin9',5,360,0.6,'expoout')
        noteTweenX('slide9',5,2000,0.3,'expoout')
    end 

    if curStep == 181 then
        doTweenZoom('lolzoom2','game',1,2)
        playAnim('borders','close')
        doTweenX('lolscale','borders.scale',2,10,'quadin')
        doTweenY('lolscale2','borders.scale',2,10,'quadin')
        setProperty('dad.x',430)
        setProperty('dad.y',370)

        setProperty('boyfriend.x',1270)
        setProperty('boyfriend.y',670)

        if downscroll then
            setPropertyFromGroup('opponentStrums',0,'y',570)
            setPropertyFromGroup('opponentStrums',1,'y',570)
            setPropertyFromGroup('opponentStrums',2,'y',570)
            setPropertyFromGroup('opponentStrums',3,'y',570)

            setPropertyFromGroup('playerStrums',0,'y',570)
            setPropertyFromGroup('playerStrums',1,'y',570)
            setPropertyFromGroup('playerStrums',2,'y',570)
            setPropertyFromGroup('playerStrums',3,'y',570)
        else
            setPropertyFromGroup('opponentStrums',0,'y',50)
            setPropertyFromGroup('opponentStrums',1,'y',50)
            setPropertyFromGroup('opponentStrums',2,'y',50)
            setPropertyFromGroup('opponentStrums',3,'y',50)

            setPropertyFromGroup('playerStrums',0,'y',50)
            setPropertyFromGroup('playerStrums',1,'y',50)
            setPropertyFromGroup('playerStrums',2,'y',50)
            setPropertyFromGroup('playerStrums',3,'y',50)
        end



        

        setPropertyFromGroup('opponentStrums',0,'x',defaultOpponentStrumX0)
        setPropertyFromGroup('opponentStrums',1,'x',defaultOpponentStrumX1)
        setPropertyFromGroup('opponentStrums',2,'x',defaultOpponentStrumX2)
        setPropertyFromGroup('opponentStrums',3,'x',defaultOpponentStrumX3)

        setPropertyFromGroup('playerStrums',0,'x',defaultPlayerStrumX0)
        setPropertyFromGroup('playerStrums',1,'x',defaultPlayerStrumX1)
        setPropertyFromGroup('playerStrums',2,'x',defaultPlayerStrumX2)
        setPropertyFromGroup('playerStrums',3,'x',defaultPlayerStrumX3)



    end 

    if curStep == 203 then
        setProperty('borders.visible',false)

        noteTweenX('slide4',0,defaultPlayerStrumX0,0.6,'expoout')
        noteTweenX('slide5',1,defaultPlayerStrumX1,0.5,'expoout')
        noteTweenX('slide6',2,defaultPlayerStrumX2,0.4,'expoout')
        noteTweenX('slide7',3,defaultPlayerStrumX3,0.3,'expoout')

        noteTweenX('slide8',4,defaultOpponentStrumX0,0.6,'expoout')
        noteTweenX('slide9',5,defaultOpponentStrumX1,0.5,'expoout')
        noteTweenX('slide10',6,defaultOpponentStrumX2,0.4,'expoout')
        noteTweenX('slide11',7,defaultOpponentStrumX3,0.3,'expoout')



        doTweenX('bfmove','boyfriend',430,0.5,'expoout')
        doTweenX('dadmove','dad',1270,0.5,'expoout')
        setProperty('dad.flipX',true)
        setProperty('boyfriend.flipX',true)

    end 

    if curStep == 223 then
        setProperty('borders.visible',false)
        setProperty('dad.flipX',false)
        setProperty('boyfriend.flipX',false)
        doTweenX('bfslide3','boyfriend',1270,0.4,'expoout')
        doTweenY('bfslide2','boyfriend',670,0.4,'expoout')
        doTweenX('slidebg','slideborder',-2900,0.4)
        doTweenX('dad1','dad',430,0.4,'expoout')
        doTweenY('daddown','dad',370,1,'circout')
        setProperty('isCameraOnForcedPos',false)

        noteTweenX('slide4',4,defaultPlayerStrumX0,0.3,'expoout')
        noteTweenX('slide5',5,defaultPlayerStrumX1,0.3,'expoout')
        noteTweenX('slide6',6,defaultPlayerStrumX2,0.3,'expoout')
        noteTweenX('slide7',7,defaultPlayerStrumX3,0.3,'expoout')

        noteTweenX('slide8',0,defaultOpponentStrumX0,0.3,'expoout')
        noteTweenX('slide9',1,defaultOpponentStrumX1,0.3,'expoout')
        noteTweenX('slide10',2,defaultOpponentStrumX2,0.3,'expoout')
        noteTweenX('slide11',3,defaultOpponentStrumX3,0.3,'expoout')

        setProperty('healthBar.alpha',1)
        setProperty('iconP1.alpha',1)
        setProperty('scoreTxt.alpha',1)
        setProperty('iconP2.alpha',1)
    end

    if curStep == 423 then
        camcontrol(700,600)
        cancelTween('lolscale')
        cancelTween('lolscale2')
        scaleObject('borders',1,1)
        doTweenX('slidebg','slideborder',-100,0.4)
        doTweenY('bfslide','boyfriend',2000,0.4,'expoout')
        doTweenX('dadslide','dad',700,0.4)
        noteTweenX('slide',0,440,0.6,'expoout')
        noteTweenX('slide1',1,550,0.5,'expoout')
        noteTweenX('slide2',2,660,0.4,'expoout')
        noteTweenX('slide3',3,770,0.3,'expoout')

        noteTweenX('slide4',4,2000,0.3,'expoout')
        noteTweenX('slide5',5,2000,0.3,'expoout')
        noteTweenX('slide6',6,2000,0.3,'expoout')
        noteTweenX('slide7',7,2000,0.3,'expoout')

        noteTweenAngle('spin',4,360,0.6)    
        noteTweenAngle('spin1',5,360,0.5)
        noteTweenAngle('spin2',6,360,0.4)
        noteTweenAngle('spin3',7,360,0.3)
        setProperty('healthBar.alpha',0)
        setProperty('iconP1.alpha',0)
        setProperty('scoreTxt.alpha',0)
        setProperty('iconP2.alpha',0)
    end

    if curStep == 430 then
        setProperty('textfull.visible',true)
    end

    if curStep == 439 then
        setProperty('textfull.visible',false)
    end

    if curStep == 450 then
        doTweenX('bfslide3','boyfriend',700,0.4,'expoout')
        doTweenY('bfslide2','boyfriend',670,0.4,'expoout')
        doTweenY('daddown','dad',2000,1,'circout')
        noteTweenAngle('spin',0,360,0.6)
        noteTweenAngle('spin1',1,360,0.5)
        noteTweenAngle('spin2',2,360,0.4)
        noteTweenAngle('spin3',3,360,0.3)



        if downscroll then
            noteTweenY('slide',0,-770,0.6,'expoout')
            noteTweenY('slide1',1,-770,0.5,'expoout')
            noteTweenY('slide2',2,-770,0.4,'expoout')
            noteTweenY('slide3',3,-770,0.3,'expoout')
        else
            noteTweenY('slide',0,770,0.6,'expoout')
            noteTweenY('slide1',1,770,0.5,'expoout')
            noteTweenY('slide2',2,770,0.4,'expoout')
            noteTweenY('slide3',3,770,0.3,'expoout')
        end

        noteTweenX('slide4',4,440,0.3)
        noteTweenX('slide5',5,550,0.3)
        noteTweenX('slide6',6,660,0.3)
        noteTweenX('slide7',7,770,0.3)
    end

    if curStep == 487 then
        setProperty('borders.visible',true)
        playAnim('borders','red')
        setProperty('boyfriend.y',2000)
        setProperty('dad.x',430)
        setProperty('dad.y',370)

        noteTweenAngle('spin',0,360,0.6)
        noteTweenAngle('spin1',1,360,0.5)
        noteTweenAngle('spin2',2,360,0.4)
        noteTweenAngle('spin3',3,360,0.3)

        if downscroll then
            noteTweenY('slide',0,570,0.6,'expoout')
            noteTweenY('slide1',1,570,0.5,'expoout')
            noteTweenY('slide2',2,570,0.4,'expoout')
            noteTweenY('slide3',3,570,0.3,'expoout')  
            setProperty('borders.flipY',true)
        else
            noteTweenY('slide',0,50,0.6,'expoout')
            noteTweenY('slide1',1,50,0.5,'expoout')
            noteTweenY('slide2',2,50,0.4,'expoout')
            noteTweenY('slide3',3,50,0.3,'expoout')
        end



        noteTweenX('slide4',0,440,0.6,'expoout')
        noteTweenX('slide5',1,550,0.5,'expoout')
        noteTweenX('slide6',2,660,0.4,'expoout')
        noteTweenX('slide7',3,770,0.3,'expoout')

        noteTweenX('slide8',4,2000,0.3)
        noteTweenX('slide9',5,2000,0.3)
        noteTweenX('slide10',6,2000,0.3)
        noteTweenX('slide11',7,2000,0.3)
    


    end

    if curStep == 518 then
        playAnim('borders','yellow',true)
        
        doTweenX('lolscale','borders.scale',2,10,'quadin')
        doTweenY('lolscale2','borders.scale',2,10,'quadin')
        setProperty('boyfriend.y',700)
        setProperty('boyfriend.x',670)
        setProperty('dad.y',2000)

        noteTweenAngle('spin',0,360,0.6)
        noteTweenAngle('spin1',1,360,0.5)
        noteTweenAngle('spin2',2,360,0.4)
        noteTweenAngle('spin3',3,360,0.3)

        if downscroll then
            setPropertyFromGroup('opponentStrums',0,'y',-770)
            setPropertyFromGroup('opponentStrums',1,'y',-770)
            setPropertyFromGroup('opponentStrums',2,'y',-770)
            setPropertyFromGroup('opponentStrums',3,'y',-770)
        else
            setPropertyFromGroup('opponentStrums',0,'y',770)
            setPropertyFromGroup('opponentStrums',1,'y',770)
            setPropertyFromGroup('opponentStrums',2,'y',770)
            setPropertyFromGroup('opponentStrums',3,'y',770)
        end



        setPropertyFromGroup('playerStrums',0,'x',440)
        setPropertyFromGroup('playerStrums',1,'x',550)
        setPropertyFromGroup('playerStrums',2,'x',660)
        setPropertyFromGroup('playerStrums',3,'x',770)
    end

    if curStep == 550 then
        setProperty('circle.visible',true)
        setProperty('borders.visible',false)
        playAnim('borders','spike')
        cancelTween('lolscale')
        cancelTween('lolscale2')
        scaleObject('borders',1,1)
        doTweenX('lolscale','borders.scale',2,10,'quadin')
        doTweenY('lolscale2','borders.scale',2,10,'quadin')
        setProperty('dad.x',430)
        setProperty('dad.y',370)

        setProperty('boyfriend.x',1270)
        setProperty('boyfriend.y',670)

        if downscroll then
            noteTweenY('slide',0,-770,0.6,'expoout')
            noteTweenY('slide1',1,-770,0.5,'expoout')
            noteTweenY('slide2',2,-770,0.4,'expoout')
            noteTweenY('slide3',3,-770,0.3,'expoout')
        else
            noteTweenY('slide',0,770,0.6,'expoout')
            noteTweenY('slide1',1,770,0.5,'expoout')
            noteTweenY('slide2',2,770,0.4,'expoout')
            noteTweenY('slide3',3,770,0.3,'expoout')
        end

        noteTweenX('slide4',4,440,0.3)
        noteTweenX('slide5',5,550,0.3)
        noteTweenX('slide6',6,660,0.3)
        noteTweenX('slide7',7,770,0.3)

    end

    if curStep == 566 then
        setProperty('circle.visible',false)
        setProperty('textfull.visible',true)

        noteTweenAngle('spin',0,360,0.6)
        noteTweenAngle('spin1',1,360,0.5)
        noteTweenAngle('spin2',2,360,0.4)
        noteTweenAngle('spin3',3,360,0.3)

        if downscroll then
            setPropertyFromGroup('opponentStrums',0,'y',570)
            setPropertyFromGroup('opponentStrums',1,'y',570)
            setPropertyFromGroup('opponentStrums',2,'y',570)
            setPropertyFromGroup('opponentStrums',3,'y',570)

            setPropertyFromGroup('playerStrums',0,'y',570)
            setPropertyFromGroup('playerStrums',1,'y',570)
            setPropertyFromGroup('playerStrums',2,'y',570)
            setPropertyFromGroup('playerStrums',3,'y',570)
        else
            setPropertyFromGroup('opponentStrums',0,'y',50)
            setPropertyFromGroup('opponentStrums',1,'y',50)
            setPropertyFromGroup('opponentStrums',2,'y',50)
            setPropertyFromGroup('opponentStrums',3,'y',50)

            setPropertyFromGroup('playerStrums',0,'y',50)
            setPropertyFromGroup('playerStrums',1,'y',50)
            setPropertyFromGroup('playerStrums',2,'y',50)
            setPropertyFromGroup('playerStrums',3,'y',50)
        end



        

        setPropertyFromGroup('opponentStrums',0,'x',defaultOpponentStrumX0)
        setPropertyFromGroup('opponentStrums',1,'x',defaultOpponentStrumX1)
        setPropertyFromGroup('opponentStrums',2,'x',defaultOpponentStrumX2)
        setPropertyFromGroup('opponentStrums',3,'x',defaultOpponentStrumX3)

        setPropertyFromGroup('playerStrums',0,'x',defaultPlayerStrumX0)
        setPropertyFromGroup('playerStrums',1,'x',defaultPlayerStrumX1)
        setPropertyFromGroup('playerStrums',2,'x',defaultPlayerStrumX2)
        setPropertyFromGroup('playerStrums',3,'x',defaultPlayerStrumX3)


    end

    if curStep == 583 then
        cancelTween('lolscale')
        cancelTween('lolscale2')
        scaleObject('borders',1,1)
        setProperty('borders.visible',true)
        playAnim('borders','close',true)
        doTweenX('lolscale','borders.scale',2,20,'quadin')
        doTweenY('lolscale2','borders.scale',2,20,'quadin')
        setProperty('circle.visible',false)
        setProperty('textfull.visible',false)
    end

    if curStep == 679 then
        doTweenX('slidebg','slideborder',-2900,0.4)
        setProperty('borders.visible',false)
        setProperty('pokemon.visible',true)
        if downscroll then
            noteTweenY('slide',0,-770,0.6)
            noteTweenY('slide1',1,-770,0.5)
            noteTweenY('slide2',2,-770,0.4)
            noteTweenY('slide3',3,-770,0.3)
        else
            noteTweenY('slide',0,770,0.6)
            noteTweenY('slide1',1,770,0.5)
            noteTweenY('slide2',2,770,0.4)
            noteTweenY('slide3',3,770,0.3)
        end
        camcontrol(900,600)
        doTweenY('bfmove','boyfriend',260,0.5,'expoout')
        doTweenY('dadmove','dad',360,0.5,'expoout')
        doTweenX('dadmove2','dad',320,0.5,'expoout')
    end

    if curStep == 736 then
        setProperty('borders.visible',false)
        setProperty('dad.flipX',false)
        setProperty('pokemon.visible',false)
        setProperty('boyfriend.flipX',false)
        doTweenX('bfslide3','boyfriend',1270,0.4,'expoout')
        doTweenY('bfslide2','boyfriend',670,0.4,'expoout')
        doTweenX('slidebg','slideborder',-2900,0.4)
        doTweenX('dad1','dad',430,0.4,'expoout')
        doTweenY('daddown','dad',370,1,'expoout')
        setProperty('isCameraOnForcedPos',false)

        noteTweenX('slide4',4,defaultPlayerStrumX0,0.3)
        noteTweenX('slide5',5,defaultPlayerStrumX1,0.3)
        noteTweenX('slide6',6,defaultPlayerStrumX2,0.3)
        noteTweenX('slide7',7,defaultPlayerStrumX3,0.3)

        noteTweenX('slide8',0,defaultOpponentStrumX0,0.3)
        noteTweenX('slide9',1,defaultOpponentStrumX1,0.3)
        noteTweenX('slide10',2,defaultOpponentStrumX2,0.3)
        noteTweenX('slide11',3,defaultOpponentStrumX3,0.3)

        if downscroll then
            noteTweenY('slide',0,570,0.6)
            noteTweenY('slide1',1,570,0.5)
            noteTweenY('slide2',2,570,0.4)
            noteTweenY('slide3',3,570,0.3)   
        else
            noteTweenY('slide',0,50,0.6)
            noteTweenY('slide1',1,50,0.5)
            noteTweenY('slide2',2,50,0.4)
            noteTweenY('slide3',3,50,0.3)   
        end
        
        setProperty('healthBar.alpha',1)
        setProperty('iconP1.alpha',1)
        setProperty('scoreTxt.alpha',1)
        setProperty('iconP2.alpha',1)
    end


end