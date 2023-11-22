playVideo = true;
playDialogue = true;

function onStartCountdown()
	if isStoryMode and not seenCutscene then
		if playVideo then --Video cutscene plays first
			startVideo('cutscene4'); --Play video file from "videos/" folder
			playVideo = false;
			return Function_Stop; --Prevents the song from starting naturally
        end
	end
	return Function_Continue; 
end

 function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('cutscene5')
		allowEnd = true
		return Function_Stop; 
	end
	return Function_Continue;
 end

function onCreate()

setProperty('dad.color', getColorFromHex('4db5ff'))
setProperty('boyfriend.color', getColorFromHex('4db5ff'))
setProperty('gf.color', getColorFromHex('4db5ff'))

setObjectOrder('dadGroup', 3)

isMust = mustHitSection
end


function onUpdate()

	--if mustHitSection == true and isMust == false then
	--	setProperty("defaultCamZoom",0.5)
	--	isMust = true
	--end

	--if mustHitSection == false and isMust == true then
	--	setProperty("defaultCamZoom",0.4)
	--	isMust = false
	--end

	
	if curStep == 32 or curStep == 128 or curStep == 224 then
	
	if curStep == 32 then
	makeLuaSprite('thunderchosen', 'stages/fury/Lightning1', -1800, -500)
	end

	if curStep == 128 then
	makeLuaSprite('thunderchosen', 'stages/fury/Lightning3', -1800, -500)
	end

	if curStep == 224 then
	makeLuaSprite('thunderchosen', 'stages/fury/Lightning2', -1800, -500)
	end

	setProperty('thunderchosen.alpha', 0)

	addLuaSprite('thunderchosen', false)

	thunder()
	end

	if curStep == 33 or curStep == 129 or curStep == 225 then
	doTweenAlpha('backlightning', 'lightning', 0, 0.25)
	doTweenAlpha('backthunder', 'thunderchosen', 0, 0.25)
	doTweenColor('backbf', 'boyfriend', '4db5ff', 0.1)
	doTweenColor('backBow', 'dad', '4db5ff', 0.1)
	doTweenColor('backGF', 'gf', '4db5ff', 0.1)
	doTweenColor('backlandscape', 'landscape', '1e4a69', 0.1)
	doTweenColor('backplatform', 'platform', '1e4a69', 0.1)
	doTweenColor('backsky', 'sky', '1e4a69', 0.1)
	removeLuaSprite('thunderchosen')
	end

	if curStep == 352 then
	doTweenAlpha('dedhud', 'camHUD', 0, 0.1, 'linear')
	end


	if curStep == 358 then
	triggerEvent('Screen Shake', '5', '0.1')
	doTweenColor('tweenlandscape', 'landscape', 'FFFFFF', 1)
	doTweenColor('tweenplatform', 'platform', 'FFFFFF', 1)
	doTweenColor('tweensky', 'sky', 'FFFFFF', 1)
	doTweenColor('bfColorTween', 'boyfriend', 'FFFFFF', 1)
	doTweenColor('dadColorTween', 'dad', 'FFFFFF', 1)
	doTweenColor('gfColorTween', 'gf', 'FFFFFF', 1)
	doTweenColor('tweenfury', 'fury', 'FFFFFF', 1)
	doTweenY('tweenfury', 'fury', -900, 0.8)
	doTweenAlpha('tweenrain', 'rain', 0, 0.8, 'linear')
	end

	if curStep == 368 then
	doTweenAlpha('dedhud', 'camHUD', 1, 0.5, 'linear')
	end

	if curStep == 1180 then 
	makeLuaSprite('fade', 'stages/fury/fade', -2000, -800);
	setProperty('fade.alpha', 0)
	addLuaSprite('fade', true);
	doTweenAlpha('fadefade', 'fade', 1, 0.2, 'linear')
	end

	if curStep == 1180 then 
	makeAnimatedLuaSprite('bowserballsjumpscare', 'stages/fury/transition', -1200, -800);
	addAnimationByPrefix('bowserballsjumpscare','jumpscare','transition idle',15, true)
	scaleObject('bowserballsjumpscare', 1.7, 1.7)
	setProperty('bowserballsjumpscare.alpha', 0)
	addLuaSprite('bowserballsjumpscare', true);
	objectPlayAnimation('bowserballsjumpscare','jumpscare',false)
	doTweenAlpha('fadebow', 'bowserballsjumpscare', 1, 0.2, 'linear')
	makeAnimatedLuaSprite('fireball','stages/fury/meteor', -2100, -1100)
	setProperty('fireball.angle', -50)
	addAnimationByPrefix('fireball','flame','meteor idle',24, true)
	objectPlayAnimation('fireball','flame',false)
	addLuaSprite('fireball', false);

	makeAnimatedLuaSprite('fireball2','stages/fury/meteor', -1400, -1300)
	setProperty('fireball2.angle', -50)
	addAnimationByPrefix('fireball2','flame','meteor idle',24, true)
	objectPlayAnimation('fireball2','flame',false)
	addLuaSprite('fireball2', false);

	makeAnimatedLuaSprite('fireball4','stages/fury/meteor', -900, -800)
	setProperty('fireball4.angle', -50)
	addAnimationByPrefix('fireball4','flame','meteor idle',24, true)
	objectPlayAnimation('fireball4','flame',false)
	addLuaSprite('fireball4', false);

	makeAnimatedLuaSprite('fireball3','stages/fury/meteor', -500, -1500)
	setProperty('fireball3.angle', -50)
	addAnimationByPrefix('fireball3','flame','meteor idle',24, true)
	objectPlayAnimation('fireball3','flame',false)
	addLuaSprite('fireball3', false);

	makeAnimatedLuaSprite('fireball5','stages/fury/meteor', 0, -1500)
	setProperty('fireball5.angle', -50)
	addAnimationByPrefix('fireball5','flame','meteor idle',24, true)
	objectPlayAnimation('fireball5','flame',false)
	addLuaSprite('fireball5', false);

	setObjectOrder('fireball', 1)
	setObjectOrder('fireball2', 1)
	setObjectOrder('fireball3', 1)
	setObjectOrder('fireball4', 1)
	setObjectOrder('fireball5', 1)

	fireballdecider()
	end
	
	if curStep == 1200 then
	makeLuaSprite('fadewhite', 'stages/fury/lightningeffect', -2000, -800);
	scaleObject('fadewhite', 4, 4)
	setProperty('fadewhite.alpha', 0)
	addLuaSprite('fadewhite', true);
	doTweenAlpha('fadewhite3', 'fadewhite', 1, 0.1, 'linear')
	end

	if curStep == 1201 then
	removeLuaSprite('bowserballsjumpscare')
	removeLuaSprite('fade')
	doTweenAlpha('fadewhite2', 'fadewhite', 0, 0.2, 'linear')
	end

end

function thunder()
	doTweenColor('lightningBF', 'boyfriend', '96c4e4', 0.3, 'expoOut')
	doTweenColor('lightningBow', 'dad', '96c4e4', 0.3, 'expoOut')
	doTweenColor('lightningGF', 'gf', '96c4e4', 0.3, 'expoOut')
	doTweenColor('flashlandscape', 'landscape', '4db5ff', 0.2, 'expoOut')
	doTweenColor('flashplatform', 'platform', '4db5ff', 0.2, 'expoOut')
	doTweenColor('flashsky', 'sky', '4db5ff', 0.2, 'expoOut')
	setProperty('lightning.alpha', 0.4)
	doTweenAlpha('tweenlightning', 'lightning', 0.5, 0.08, 'expoOut')
	setProperty('thunderchosen.alpha', 1)
	doTweenAlpha('tweenthunder', 'thunderchosen', 0, 0.1, 'expoOut')
end

function fireballdecider()
	doTweenX('tweenfireballX', 'fireball', '720', 8)
	doTweenY('tweenfireballY', 'fireball', '800', 8)
	doTweenX('tweenfireball2X', 'fireball2', '1420', 8)
	doTweenY('tweenfireball2Y', 'fireball2', '800', 8)
	doTweenX('tweenfireball4X', 'fireball4', '1920', 5)
	doTweenY('tweenfireball4Y', 'fireball4', '800', 5)
	doTweenX('tweenfireball3X', 'fireball3', '2110', 6)
	doTweenY('tweenfireball3Y', 'fireball3', '800', 6)
	doTweenX('tweenfireball5X', 'fireball5', '3520', 4)
	doTweenY('tweenfireball5Y', 'fireball5', '800', 4)
end

function onTweenCompleted(tag)
	if tag == 'tweenfireballY' then
	setProperty('fireball2.x', -1400)
	setProperty('fireball2.y', -1300)
	setProperty('fireball.x', -2100)
	setProperty('fireball.y', -1100)
	setProperty('fireball4.x', -900)
	setProperty('fireball4.y', -800)
	setProperty('fireball3.x', -500)
	setProperty('fireball3.y', -1500)
	setProperty('fireball5.x', 0)
	setProperty('fireball5.y', -1500)
	fireballdecider()
	end

	if tag == 'lightningBF' then
	doTweenColor('bfisdarkagain', 'boyfriend', '4db5ff', 0.3, 'expoOut')
	end

	if tag == 'lightningBow' then
	doTweenColor('bowisdarkagain', 'dad', '4db5ff', 0.3, 'expoOut')
	end

	if tag == 'lightningGF' then
	doTweenColor('gfisdarkagain', 'gf', '4db5ff', 0.3, 'expoOut')
	end

	if tag == 'pulseIn' then
	doTweenAlpha('pulseOut', 'SingGlow', 0.1,  0.5, 'linear')
	end
end

function opponentNoteHit()
	doTweenAlpha('pulseIn', 'SingGlow', 0.5,  0.05, 'linear')
	triggerEvent("Screen Shake", "0.1, 0.005", "0, 0")
end
	













--
local Intensity = 25; --[[      CHANGE YOUR INTENSITY CAMERA MOVEMENT HERE       ]]
-- default : 40

--[[

The dont-need-to-change-anything Camera Movement Script !
- An Ammar

---------------------

Turn On Movement VVV
runTimer("camOn", 0)

Turn Off Movement VVV
runTimer("camOff", 0)

]]
 
local followchars = true;
local startCam = false;

local camOffX = 0;
local camOffY = 0;
local oldCamX = 0;
local oldCamY = 0;

local dadPos = {0,0};
local bfPos = {0,0};
local gfPos = {0,0};

function onSongStart()
   findCharCam()

   runTimer("canStartCamera", 0.4);

end

local oldCam = {0,0};
function onUpdatePost()

   if followchars and startCam then
      anim = getProperty('dad.animation.curAnim.name');
      if mustHitSection and not gfSection then
         anim = getProperty('boyfriend.animation.curAnim.name');
      end
      if gfSection then 
         anim = getProperty('gf.animation.curAnim.name');
      end

      if startsWith(anim, "singLEFT") then
         camOffY = 0;
         camOffX = 0 - Intensity; -- this
      end
      if startsWith(anim, "singRIGHT") then
         camOffY = 0;
         camOffX = Intensity;
      end
      if startsWith(anim, "singUP") then
         camOffX = 0;
         camOffY = 0 - Intensity;
      end
      if startsWith(anim, "singDOWN") then
         camOffX = 0;
         camOffY = Intensity;
      end
      if startsWith(anim, "idle") then
         camOffX = 0;
         camOffY = 0;
      end
   end
   
   if followchars and startCam --[[and (camOffX ~= oldCam[1] or camOffY ~= oldCam[2])]] then
      --debugPrint('halo');
      cameraX = getProperty('camFollow.x');
      cameraY = getProperty('camFollow.y');
      bfX = getProperty('boyfriend.x');
      bfY = getProperty('boyfriend.y');
      dadX = getProperty('dad.x');
      dadY = getProperty('dad.y');
      gfX = getProperty('gf.x');
      gfY = getProperty('gf.y');
      --debugPrint('halo');

      if mustHitSection and not gfSection and (bfPos[1] ~= nil and bfPos[2] ~= nil) then -- bf
         cameraX = getMid(bfX , getProperty('boyfriend.width')) - 100;
         cameraY = getMid(bfY , getProperty('boyfriend.height')) - 100;
         cameraX = cameraX - bfPos[1];
         cameraY = cameraY + bfPos[2];
      elseif not mustHitSection and not gfSection and (dadPos[1] ~= nil and dadPos[2] ~= nil) then
         cameraX = getMid(dadX , getProperty('dad.width')) + 150;
         cameraY = getMid(dadY , getProperty('dad.height')) - 100;
         cameraX = cameraX + dadPos[1];
         cameraY = cameraY + dadPos[2];
      end
      if gfSection and (gfPos[1] ~= nil and gfPos[2] ~= nil) then 
         cameraX = getMid(gfX);
         cameraY = getMid(gfY);
         cameraX = cameraX + gfPos[1];
         cameraY = cameraY + gfPos[2];
      end
      
      setProperty('camFollow.x', cameraX + camOffX);
      setProperty('camFollow.y', cameraY + camOffY);

      --oldCam[1] = camOffX;
      --oldCam[2] = camOffY;
      --debugPrint(getProperty('camFollow.x') .. "  " .. getProperty('camFollow.y')); 
      --[[
      setProperty('camFollow.x', getProperty('camFollow.x') + cameraX);
            setProperty('camFollow.y', getProperty('camFollow.y') + cameraY);
      ]]
      --debugPrint('oooh');
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == "camOff" then
      followchars = false;
   elseif tag == "camOn" then
      followchars = true;
   end
   if tag == "canStartCamera" then
      startCam = true;
   end
end

function getMid(value, size)
   fixSize = 0;

   if size ~= null then
      fixSize = size;
   else
      fixSize = value;
   end
   result = value + (size / 2);


   return result;
end

function startsWith(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function onEvent(name, value1, value2)
	if name == "Change Character" then 
      findCharCam()
   end
end

function findCharCam()

   cameraDad = getProperty('dad.cameraPosition');
   dadPos[1] = cameraDad[1];
   dadPos[2] = cameraDad[2];

   cameraBf = getProperty('boyfriend.cameraPosition');
   bfPos[1] = cameraBf[1];
   bfPos[2] = cameraBf[2];

   cameraGf = getProperty('gf.cameraPosition');
   gfPos[1] = cameraGf[1];
   gfPos[2] = cameraGf[2];

end


