--Codigo por Laztrix, Perez Sen y Nickobelit
--Si este code tuvo mucha ayuda pero quedo god
local separation
local receptorSep = 0 -- how much of pixels do you want each note to distance
local receptorSize = 3 -- note size [default: 0.7]
function onCreatePost()
        setProperty('healthBar.flipX', true)
		setProperty('healthBarBG.scale.y', 0.5)
		setProperty('healthBarBG.scale.x', 0.25)
		setProperty('healthBar.visible', true)
		setProperty('healthBar.scale.x', 0.26)
		setProperty('healthBar.scale.y', 0.5)
          setTextSize('healthBar', 20)
			addLuaSprite('healthBar',false)
			setObjectCamera('healthBar', 'HUD')
		    setProperty('healthBarBG.flipX', true)
    		setProperty('iconP1.alpha', 0)
            setProperty('iconP2.alpha', 0)
            
        if getPropertyFromClass('ClientPrefs', 'middleScroll') == false and getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('botplayTxt.x', -30);
        setProperty('botplayTxt.y', 75);
        setProperty('healthBar.x', -90)
    	setProperty('healthBar.y', 171) 	            
		setPropertyFromGroup('opponentStrums',0,'downScroll', true)
		setPropertyFromGroup('opponentStrums',1,'downScroll', true)
		setPropertyFromGroup('opponentStrums',2,'downScroll', true)
		setPropertyFromGroup('opponentStrums',3,'downScroll', true)
		setPropertyFromGroup('opponentStrums',0,'y','570')
  		setPropertyFromGroup('opponentStrums',1,'y','570')
		setPropertyFromGroup('opponentStrums',2,'y','570')
  		setPropertyFromGroup('opponentStrums',3,'y','570')
 		setPropertyFromGroup('opponentStrums',0,'x','882')
  		setPropertyFromGroup('opponentStrums',1,'x','982')
		setPropertyFromGroup('opponentStrums',2,'x','1082')
  		setPropertyFromGroup('opponentStrums',3,'x','1182') 
 		setPropertyFromGroup('playerStrums',0,'x','5')
  		setPropertyFromGroup('playerStrums',1,'x','110')
		setPropertyFromGroup('playerStrums',2,'x','215')
  		setPropertyFromGroup('playerStrums',3,'x','320')
  end
         
        if getPropertyFromClass('ClientPrefs', 'middleScroll') == false and getPropertyFromClass('ClientPrefs', 'downScroll') == true then
        setProperty('botplayTxt.x', -30);
        setProperty('botplayTxt.y', 600);      
        setProperty('healthBar.x', -90)
        setProperty('healthBar.y', 690)
		setPropertyFromGroup('opponentStrums',0,'downScroll', false)
		setPropertyFromGroup('opponentStrums',1,'downScroll', false)
		setPropertyFromGroup('opponentStrums',2,'downScroll', false)
		setPropertyFromGroup('opponentStrums',3,'downScroll', false)
 		setPropertyFromGroup('opponentStrums',0,'x','882')
  		setPropertyFromGroup('opponentStrums',1,'x','982')
		setPropertyFromGroup('opponentStrums',2,'x','1082')
  		setPropertyFromGroup('opponentStrums',3,'x','1182') 
         setPropertyFromGroup('opponentStrums',0,'y','50')
  		setPropertyFromGroup('opponentStrums',1,'y','50')
		setPropertyFromGroup('opponentStrums',2,'y','50')
  		setPropertyFromGroup('opponentStrums',3,'y','50')
 		setPropertyFromGroup('playerStrums',0,'x','5')
  		setPropertyFromGroup('playerStrums',1,'x','110')
		setPropertyFromGroup('playerStrums',2,'x','215')
  		setPropertyFromGroup('playerStrums',3,'x','320')
         setPropertyFromGroup('playerStrums',0,'y','570')
  		setPropertyFromGroup('playerStrums',1,'y','570')
		setPropertyFromGroup('playerStrums',2,'y','570')
  		setPropertyFromGroup('playerStrums',3,'y','570')
  end

         if getPropertyFromClass('ClientPrefs', 'middleScroll') == true and getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('botplayTxt.x', 385);
        setProperty('botplayTxt.y', 78);
        setProperty('healthBar.x', 340)
    	setProperty('healthBar.y', 171) 
        setPropertyFromGroup('opponentStrums',0,'alpha',0)
	    setPropertyFromGroup('opponentStrums',1,'alpha',0)
	    setPropertyFromGroup('opponentStrums',2,'alpha',0)
	    setPropertyFromGroup('opponentStrums',3,'alpha',0)	
	    setPropertyFromGroup('playerStrums',0,'x','420')
  		setPropertyFromGroup('playerStrums',1,'x','525')
		setPropertyFromGroup('playerStrums',2,'x','630')
  		setPropertyFromGroup('playerStrums',3,'x','735')
  end

        if getPropertyFromClass('ClientPrefs', 'middleScroll') == true and getPropertyFromClass('ClientPrefs', 'downScroll') == true then
        setProperty('botplayTxt.x', 385);
        setProperty('botplayTxt.y', 78);
        setProperty('healthBar.x', 340)
    	setProperty('healthBar.y', 690) 
        setProperty('NameSong.x', 570) 
        setPropertyFromGroup('opponentStrums',0,'alpha',0)
	    setPropertyFromGroup('opponentStrums',1,'alpha',0)
	    setPropertyFromGroup('opponentStrums',2,'alpha',0)
	    setPropertyFromGroup('opponentStrums',3,'alpha',0)	
	    setPropertyFromGroup('playerStrums',0,'x','420')
  		setPropertyFromGroup('playerStrums',1,'x','525')
		setPropertyFromGroup('playerStrums',2,'x','630')
  		setPropertyFromGroup('playerStrums',3,'x','735')
  end
           
           separation = screenWidth / 4
	       strumPosY = screenHeight / 6
          resizeStrumline('opponent', screenWidth / 2 - separation, strumPosY, receptorSize, receptorSep)
	      resizeStrumline('player', screenWidth / 2 + separation, strumPosY, receptorSize, receptorSep)
end

function resizeStrumline(strum, x_position, y_position, scale, noteSep)
	local swagWidth = scale * noteSep
	local isPlayer = false
	if strum == 'player' then
      isPlayer = true 
    end
     
	for note=0, getProperty(strum..'Strums.length')-1 do
		setPropertyFromGroup(strum..'Strums', note, 'scale.x', scale)
		setPropertyFromGroup(strum..'Strums', note, 'scale.y', scale)

		updateHitboxFromGroup(strum..'Strums', note)
	end

      for note=0, getProperty('unspawnNotes.length')-1 do
       setPropertyFromGroup('unspawnNotes', note, 'offset.x', -32)
       setPropertyFromGroup('unspawnNotes', note, 'offset.y', -17)
		if getPropertyFromGroup('unspawnNotes',note,'isSustainNote')then--Esto es para las notas largas
		  setPropertyFromGroup('unspawnNotes', note, 'offset.x', -27)
		  setPropertyFromGroup('unspawnNotes', note, 'offset.y', -27)
		end
		if getPropertyFromGroup('unspawnNotes', note, 'mustPress') == isPlayer then
			setPropertyFromGroup('unspawnNotes', note, 'scale.x', scale)
			if not getPropertyFromGroup('unspawnNotes', note, 'isSustainNote') then
				setPropertyFromGroup('unspawnNotes', note, 'scale.y', scale)
				
			end
			--updateHitboxFromGroup('unspawnNotes', note)
		end  
	end
end