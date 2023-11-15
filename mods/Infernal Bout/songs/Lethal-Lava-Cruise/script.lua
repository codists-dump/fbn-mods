function onCreate()
	setProperty('gf.visible', false)

	makeLuaSprite('background-ruin-1','stages/pixel-room/background-ruin-1', -1100, 1450)
scaleObject('background-ruin-1', 8, 8)
setProperty('background-ruin-1.antialiasing', false)
addLuaSprite('background-ruin-1', false);


makeLuaSprite('background-ruin-2','stages/pixel-room/background-ruin-2', 300, 1600)
scaleObject('background-ruin-2', 8, 8)
setProperty('background-ruin-2.antialiasing', false)
addLuaSprite('background-ruin-2', false);

makeLuaSprite('background-ruin-3','stages/pixel-room/background-ruin-3', 1700, 1600)
scaleObject('background-ruin-3', 8, 8)
setProperty('background-ruin-3.antialiasing', false)
addLuaSprite('background-ruin-3', false);

makeLuaSprite('background-ruin-4','stages/pixel-room/background-ruin-4', 1700, 1600)
scaleObject('background-ruin-4', 8, 8)
setProperty('background-ruin-4.antialiasing', false)
addLuaSprite('background-ruin-4', false);

makeAnimatedLuaSprite('lava-background','stages/pixel-room/lava-background', -1155, 930)
scaleObject('lava-background', 8, 8)
setProperty('lava-background.antialiasing', false)
addAnimationByPrefix('lava-background','bubble','lavabg idle',12, true)
addLuaSprite('lava-background', false);

makeLuaSprite('boyfriend-platform','stages/pixel-room/boyfriend-platform', 650, 1875)
scaleObject('boyfriend-platform', 8, 8)
setProperty('boyfriend-platform.antialiasing', false)
addLuaSprite('boyfriend-platform', false);

makeLuaSprite('bowser-platform','stages/pixel-room/bowser-platform', -800, 1875)
scaleObject('bowser-platform', 8, 8)
setProperty('bowser-platform.antialiasing', false)
addLuaSprite('bowser-platform', false);

makeAnimatedLuaSprite('lava-foreground','stages/pixel-room/lava-foreground', -1155, 950)
scaleObject('lava-foreground', 8, 8)
setProperty('lava-foreground.antialiasing', false)
addAnimationByPrefix('lava-foreground','bubble','lavafg idle',12, true)
addLuaSprite('lava-foreground', false);

makeLuaSprite('foreground-ruin-1','stages/pixel-room/foreground-ruin-1', -1100, 2000)
scaleObject('foreground-ruin-1', 8, 8)
setProperty('foreground-ruin-1.antialiasing', false)
addLuaSprite('foreground-ruin-1', true);

makeLuaSprite('foreground-ruin-2','stages/pixel-room/foreground-ruin-2', 300, 1950)
scaleObject('foreground-ruin-2', 8, 8)
setProperty('foreground-ruin-2.antialiasing', false)
addLuaSprite('foreground-ruin-2', true);

makeLuaSprite('foreground-ruin-3','stages/pixel-room/foreground-ruin-3', 1700, 1950)
scaleObject('foreground-ruin-3', 8, 8)
setProperty('foreground-ruin-3.antialiasing', false)
addLuaSprite('foreground-ruin-3', true);

makeLuaSprite('foreground-ruin-4','stages/pixel-room/foreground-ruin-4', 1700, 1900)
scaleObject('foreground-ruin-4', 8, 8)
setProperty('foreground-ruin-4.antialiasing', false)
addLuaSprite('foreground-ruin-4', true);

setProperty('background-ruin-1.alpha', 0)
setProperty('background-ruin-2.alpha', 0)
setProperty('background-ruin-3.alpha', 0)
setProperty('background-ruin-4.alpha', 0)
setProperty('foreground-ruin-1.alpha', 0)
setProperty('foreground-ruin-2.alpha', 0)
setProperty('foreground-ruin-2.alpha', 0)
setProperty('foreground-ruin-2.alpha', 0)
end

function onUpdate()

if curStep == 1200 - 8 then 
addAnimationByPrefix('bridge','fall','bridge idle',12, false)
end

if curStep == 1200 then
triggerEvent("Play Animation", "fall", "BF")
end

if curStep == 1200 + 8 then
	triggerEvent("Play Animation", "fall", "0")
end

if curStep == 1264 then
triggerEvent('Screen Shake', '0.05, 0.05', '0, 0')
triggerEvent("Play Animation", "land", "0")
triggerEvent("Play Animation", "land", "BF")
end

if curStep == 1216 then
doTweenY('dobridgetween', 'bridge', -2000, 0.5, quintInOut)
end

if curStep == 1216 then
	doTweenY('bfdriftup', 'boyfriend', 333, 3.5, quintInOut)
	doTweenY('bowserdriftup', 'dad', 490, 3.5, quintInOut)
end

if curStep == 1264 - 2 then
	doTweenY('bfdriftdown', 'boyfriend', 733, 0.08, quintInOut)
	doTweenY('bowserdriftdown', 'dad', 588, 0.08, quintInOut)
end

if curStep == 1260 then

	

removeLuaSprite('bridge')
setProperty('background-ruin-1.alpha', 1)
setProperty('background-ruin-2.alpha', 1)
setProperty('background-ruin-3.alpha', 1)
setProperty('background-ruin-4.alpha', 1)
setProperty('foreground-ruin-1.alpha', 1)
setProperty('foreground-ruin-2.alpha', 1)
setProperty('foreground-ruin-2.alpha', 1)
setProperty('foreground-ruin-2.alpha', 1)

doTweenY('dobfplatformtween', 'boyfriend-platform', 875, 0.2, quintInOut)
doTweenY('dobplatformtween', 'bowser-platform', 875, 0.2, quintInOut)
doTweenY('dolbtween', 'lava-background', -70, 0.2, quintInOut)
doTweenY('dolftween', 'lava-foreground', -50, 0.2, quintInOut)
doTweenY('dobackground-ruin-1', 'background-ruin-1', 450, 0.2, quintInOut)
doTweenY('dobackground-ruin-2', 'background-ruin-2', 600, 0.2, quintInOut)
doTweenY('dobackground-ruin-3', 'background-ruin-3', 600, 0.2, quintInOut)
doTweenY('dobackground-ruin-4', 'background-ruin-4', 600, 0.2, quintInOut)

doTweenY('doforeground-ruin-1', 'foreground-ruin-1', 1000, 0.2, quintInOut)
doTweenY('doforeground-ruin-2', 'foreground-ruin-2', 1050, 0.2, quintInOut)
doTweenY('doforeground-ruin-3', 'foreground-ruin-3', 1050, 0.2, quintInOut)
doTweenY('doforeground-ruin-4', 'foreground-ruin-4', 900, 0.2, quintInOut)

doTweenX('formaldobackground-ruin-1-x', 'background-ruin-1', -2300, 2)
doTweenX('dobackground-ruin-2-x', 'background-ruin-2', -900, 2)
doTweenX('dobackground-ruin-3-x', 'background-ruin-3', 500, 2)

doTweenX('doforeground-ruin-1-x', 'foreground-ruin-1', -2300, 2)
doTweenX('doforeground-ruin-2-x', 'foreground-ruin-2', -900, 2)
doTweenX('doforeground-ruin-3-x', 'foreground-ruin-3', 500, 2)

end
end

function onTweenCompleted(tag)

if tag == 'formaldobackground-ruin-1-x' then
setProperty('background-ruin-4.x', 1700)
doTweenX('formaldobackground-ruin-2-x', 'background-ruin-2', -2300, 2)
doTweenX('dobackground-ruin-3-x', 'background-ruin-3', -900, 2)
doTweenX('dobackground-ruin-4-x', 'background-ruin-4', 500, 2)

setProperty('foreground-ruin-4.x', 1700)
doTweenX('doforeground-ruin-2-x', 'foreground-ruin-2', -2300, 2)
doTweenX('doforeground-ruin-3-x', 'foreground-ruin-3', -900, 2)
doTweenX('doforeground-ruin-4-x', 'foreground-ruin-4', 500, 2)
end

if tag == 'formaldobackground-ruin-2-x' then
setProperty('background-ruin-1.x', 1700)
doTweenX('formaldobackground-ruin-3-x', 'background-ruin-3', -2300, 2)
doTweenX('dobackground-ruin-4-x', 'background-ruin-4', -900, 2)
doTweenX('dobackground-ruin-1-x', 'background-ruin-1', 500, 2)

setProperty('foreground-ruin-1.x', 1700)
doTweenX('doforeground-ruin-3-x', 'foreground-ruin-3', -2300, 2)
doTweenX('doforeground-ruin-4-x', 'foreground-ruin-4', -900, 2)
doTweenX('doforeground-ruin-1-x', 'foreground-ruin-1', 500, 2)
end

if tag == 'formaldobackground-ruin-3-x' then
setProperty('background-ruin-2.x', 1700)
doTweenX('formaldobackground-ruin-4-x', 'background-ruin-4', -2300, 2)
doTweenX('dobackground-ruin-1-x', 'background-ruin-1', -900, 2)
doTweenX('dobackground-ruin-2-x', 'background-ruin-2', 500, 2)

setProperty('foreground-ruin-2.x', 1700)
doTweenX('doforeground-ruin-4-x', 'foreground-ruin-4', -2300, 2)
doTweenX('doforeground-ruin-1-x', 'foreground-ruin-1', -900, 2)
doTweenX('doforeground-ruin-2-x', 'foreground-ruin-2', 500, 2)
end

if tag == 'formaldobackground-ruin-4-x' then
setProperty('background-ruin-3.x', 1700)
doTweenX('formaldobackground-ruin-1-x', 'background-ruin-1', -2300, 2)
doTweenX('dobackground-ruin-2-x', 'background-ruin-2', -900, 2)
doTweenX('dobackground-ruin-3-x', 'background-ruin-3', 500, 2)

setProperty('foreground-ruin-3.x', 1700)
doTweenX('doforeground-ruin-1-x', 'foreground-ruin-1', -2300, 2)
doTweenX('doforeground-ruin-2-x', 'foreground-ruin-2', -900, 2)
doTweenX('doforeground-ruin-3-x', 'foreground-ruin-3', 500, 2)
end

end

function onBeatHit()
if getProperty('background-ruin-1.y') == 450 then
setProperty('background-ruin-1.y', 455)
setProperty('background-ruin-2.y', 605)
setProperty('background-ruin-3.y', 605)
setProperty('background-ruin-4.y', 605)
runTimer('backgroundup', 0.6)
end

if getProperty('foreground-ruin-1.y') == 1000 then
setProperty('foreground-ruin-1.y', 1005)
setProperty('foreground-ruin-2.y', 1055)
setProperty('foreground-ruin-3.y', 1055)
setProperty('foreground-ruin-4.y', 905)
runTimer('foregroundup', 0.8)
end

if getProperty('bowser-platform.y') == 875 then
setProperty('bowser-platform.y', 880)
setProperty('boyfriend-platform.y', 880)
setProperty('boyfriend.y', getProperty('boyfriend.y') + 5)
setProperty('dad.y', getProperty('dad.y') + 5)
runTimer('platformup', 1)
end
end

function onTimerCompleted(tag)
if tag == 'backgroundup' then
setProperty('background-ruin-1.y', 450)
setProperty('background-ruin-2.y', 600)
setProperty('background-ruin-3.y', 600)
setProperty('background-ruin-4.y', 600)
end

if tag == 'foregroundup' then
setProperty('foreground-ruin-1.y', 1000)
setProperty('foreground-ruin-2.y', 1050)
setProperty('foreground-ruin-3.y', 1050)
setProperty('foreground-ruin-4.y', 900)
end

if tag == 'platformup' then
setProperty('bowser-platform.y', 875)
setProperty('boyfriend-platform.y', 875)
setProperty('boyfriend.y', getProperty('boyfriend.y') - 5)
setProperty('dad.y', getProperty('dad.y') - 5)
end

end