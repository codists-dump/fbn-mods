function onCountdownStarted()
		noteTweenX('bf', 4, defaultOpponentStrumX0, 0.01, linear)
		noteTweenX('bf1', 5, defaultOpponentStrumX0+110, 0.01, linear)
		noteTweenX('bf2', 6, defaultOpponentStrumX0+110+110, 0.01, linear)
		noteTweenX('bf3', 7, defaultOpponentStrumX0+110+110+110, 0.01, linear)
		noteTweenX('dad4', 0, defaultPlayerStrumX0, 0.01, linear)
		noteTweenX('dad5', 1, defaultPlayerStrumX0+110, 0.01, linear)
		noteTweenX('dad6', 2, defaultPlayerStrumX0+110+110, 0.01, linear)
		noteTweenX('dad7', 3, defaultPlayerStrumX0+110+110+110, 0.01, linear)
end

function onCreatePost()
    setProperty('iconP1.flipX', 1)
    setProperty('iconP2.flipX', 1)
    setProperty('healthBar.flipX', 1)
end

function onUpdatePost()
    setProperty('iconP1.x', -593+getProperty('healthBar.x') + (getProperty('healthBar.width')*(remapToRange(getProperty('healthBar.percent'), 0, -100, 100, 0)*0.01))-(150 * getProperty('iconP1.scale.x'))/2 - 26*2)
    setProperty('iconP2.x', -593+getProperty('healthBar.x') + (getProperty('healthBar.width')*(remapToRange(getProperty('healthBar.percent'), 0, -100, 100, 0)*0.01))+(150 * getProperty('iconP2.scale.x')-150)/2 - 26)
end

function remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end