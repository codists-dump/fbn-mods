-- Script by a dumbass you just watched from (HenrySMD)

local healthBarIsFlip = true
local stickThere = false
function onUpdate(elapsed)
	if healthBarIsFlip == true then -- if you want to flip the health bar or not (set to true to flip, set false will turn back to normal)
		setProperty('healthBar.flipX', true)

		if getProperty('health') < 2 then
			stickThere = false
		end

		if getProperty('health') >= 2 then
			stickThere = true
		end
	else
		setProperty('healthBar.flipX', false)
	end
end

function onUpdatePost()
	if healthBarIsFlip == true then
		setProperty('iconP1.flipX', true)
		setProperty('iconP2.flipX', true)

		if stickThere == false then
			if getProperty('health') > 0 then
				setProperty('iconP1.x', 216+getProperty('health')*296+getProperty('healthBar.x')-343.5)
				setProperty('iconP2.x', 317+getProperty('health')*297+getProperty('healthBar.x')-343.5)
			end

			if getProperty('health') <= 0 then
				setProperty('iconP1.x', 216+getProperty('healthBar.x')-343.5)
				setProperty('iconP2.x', 317+getProperty('healthBar.x')-343.5)
			end
		end

		if stickThere == true then
		   setProperty('iconP1.x', 808+getProperty('healthBar.x')-343.5)
		   setProperty('iconP2.x', 911+getProperty('healthBar.x')-343.5)
		end

		--setProperty('iconP1.y', getProperty('healthBar.y') -75) -- icons stick to health bar (y position), I added if you guys want
		--setProperty('iconP2.y', getProperty('healthBar.y') -75)
	else
		setProperty('iconP1.flipX', false)
		setProperty('iconP2.flipX', false)
	end
end