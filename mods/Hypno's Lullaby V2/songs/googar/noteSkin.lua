--Codigo por Laztrix, Perez Sen y Nickobelit
--Si este code tuvo mucha ayuda pero quedo god
local separation
local receptorSep = 0 -- how much of pixels do you want each note to distance
local receptorSize = 3 -- note size [default: 0.7]
function onCreatePost()
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
       setPropertyFromGroup('unspawnNotes', note, 'offset.y', -80)
		if getPropertyFromGroup('unspawnNotes',note,'isSustainNote')then--Esto es para las notas largas
		  setPropertyFromGroup('unspawnNotes', note, 'offset.x', -27)
		  setPropertyFromGroup('unspawnNotes', note, 'offset.y', -80)
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