function onUpdate()
    if curStep >= 0 then
      doTweenY('dadTweenY', 'dad', 300-70*math.sin(((getSongPosition()/1000)*(bpm/80)*0.25)*math.pi),0.001)
  end
end
function onCreate()
  makeLuaSprite('blackScreenSunshine',nil,0,0)
  setObjectCamera('blackScreenSunshine','hud')
  makeGraphic('blackScreenSunshine',screenWidth,screenHeight,'000000')

  makeLuaSprite('whiteScreenSunshine',nil,0,0)
  setObjectCamera('whiteScreenSunshine','hud')
  makeGraphic('whiteScreenSunshine',screenWidth,screenHeight,'FFFFFF')

  makeAnimatedLuaSprite('shid','luther/CUpheqdshid',0,0)
  addAnimationByPrefix('shid','sdj','Cupheadshit_gif instance 1',24,true)
  setObjectCamera('shid','other')
  setProperty('shid.alpha',0.001)

  makeAnimatedLuaSprite('Grain','luther/Grainshit',0,0)
  addAnimationByPrefix('Grain','sdj','Geain instance 1',24,true)
  setObjectCamera('Grain','other')
  setProperty('Grain.alpha',0.001)

  addLuaSprite('shid',true)
  addLuaSprite('Grain',true)
end
function onStepHit()
  if curStep == 918 then
    addLuaSprite('blackScreenSunshine',false)
  end
  if curStep == 951 then
    removeLuaSprite('blackScreenSunshine',true)
    addLuaSprite('whiteScreenSunshine',false)
    doTweenAlpha('byeWhiteSun','whiteScreenSunshine',0,1,'linear')
  end
  if curStep == 1171 then
     cameraShake('game',0.1,0.2)
     cameraShake('game',0.05,0.2)
  end
  if curStep == 1179 then
    cameraShake('game',0.1,0.5)
    cameraShake('game',0.05,0.5)
 end
 if curStep == 1183 then
   setProperty('shid.alpha',1)
   setProperty('Grain.alpha',1)
 end
 if curStep == 1298 then
  cameraShake('game',0.1,1.1)
  cameraShake('game',0.05,1.1)
end
end
function onTweenCompleted(tag)
  if tag == 'byeWhiteSun' then
    removeLuaSprite('whiteScreenSunshine',true)
  end
end
