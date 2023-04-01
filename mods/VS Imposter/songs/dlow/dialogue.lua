local Turnos = {'dad', 'bf', 'dad', 'dad','gf','dad','bf','gf','bf','dad'}
local TurnosNombres = {'Yellow', 'Boyfriend', 'Yellow', 'Yellow','Girlfriend','Yellow','Boyfriend','Girlfriend','Boyfriend','Yellow'}
local Emociones = {'happy', 'neutral', 'neutral', 'happy', 'suspect', 'neutral', 'neutral', 'suspect', 'happy','happy'}
local Numero = 1
local NumeroI2 = 0
local NumeroFinal = 11
local Cinematica = true
local EnDialogo = false
local allowCountdown = false
local seenCutscene = false

local Dialogo = {
'Wow! T-that sure was fun! ^_^',
'speak normally please',
'sry',
'wow guys that was a cool song!',
'so are you gonna kill us now',
'kill you?? no sirree bob i would never do such a heinous crime',
'you mean youre really not the impostor..?',
'i mean he probably woulda killed us by now if he was',
'youre so right babe this is why i let u peg me every night' ,
'next song please!',

}

function onSongStart()

end

function onStartCountdown() 
if not seenCutscene then

else
end
if not allowCountdown and isStoryMode then
seenCutscene = true
allowCountdown = true
DialogoInicial()
return Function_Stop
end 
if allowCountdown then
return Function_Continue
end 
end

function onCreate()
if isStoryMode then
EnDialogo = true
makeAnimatedLuaSprite('Portraitgf', 'Stages/dialogueV4/gf', 240, 175);
addAnimationByPrefix('Portraitgf', 'happy', 'happy', 24, false);  
addAnimationByPrefix('Portraitgf', 'mad', 'mad', 24, false);
addAnimationByPrefix('Portraitgf', 'nervous', 'nervous', 24, false);
addAnimationByPrefix('Portraitgf', 'neutral', 'neutral', 24, false);
addAnimationByPrefix('Portraitgf', 'q', 'q', 24, false);
addAnimationByPrefix('Portraitgf', 'glint', 'glint', 24, false);
addAnimationByPrefix('Portraitgf', 'suspect', 'suspect', 24, false);
setObjectCamera('Portraitgf', 'camOther')
setProperty('Portraitgf.visible', false)
screenCenter('Portraitgf', 'x')
scaleObject('Portraitgf', 1, 1);
addLuaSprite('Portraitgf', false);
objectPlayAnimation('Portraitgf', 'happy');

makeAnimatedLuaSprite('Portraitbf', 'Stages/dialogueV4/boyfriend', 850, 230);
addAnimationByPrefix('Portraitbf', 'happy', 'happy', 24, false);  
addAnimationByPrefix('Portraitbf', 'mad', 'mad', 24, false);
addAnimationByPrefix('Portraitbf', 'nervous', 'nervous', 24, false);
addAnimationByPrefix('Portraitbf', 'neutral', 'neutral', 24, false);
addAnimationByPrefix('Portraitbf', 'q', 'q', 24, false);
addAnimationByPrefix('Portraitbf', 'sad', 'sad', 24, false);
setObjectCamera('Portraitbf', 'camOther')
setProperty('Portraitbf.visible', false)
scaleObject('Portraitbf', 1, 1);
addLuaSprite('Portraitbf', false);

makeAnimatedLuaSprite('Portraitdad', 'Stages/dialogueV4/yellow', 240, 225);
addAnimationByPrefix('Portraitdad', 'happy', 'happy', 24, false);  
addAnimationByPrefix('Portraitdad', 'died', 'died', 24, false);
addAnimationByPrefix('Portraitdad', 'nervous', 'nervous', 24, false);
addAnimationByPrefix('Portraitdad', 'neutral', 'neutral', 24, false);
addAnimationByPrefix('Portraitdad', 'skeptical', 'skeptical', 24, false);
addAnimationByPrefix('Portraitdad', 'what', 'what', 24, false);
setProperty('Portraitdad.visible', false)
setObjectCamera('Portraitdad', 'camOther')
scaleObject('Portraitdad', 1, 1);
addLuaSprite('Portraitdad', false);

makeAnimatedLuaSprite('dialogueBox', 'Stages/dialogueV4/dialogueBox', 0, 450);
addAnimationByPrefix('dialogueBox', 'bf', 'bf', 24, false);  
addAnimationByPrefix('dialogueBox', 'gf', 'gf', 24, false);
addAnimationByPrefix('dialogueBox', 'dad', 'dad3', 24, false);
addAnimationByPrefix('dialogueBox', 'white', 'dad4', 24, false);
addAnimationByPrefix('dialogueBox', 'maroon', 'dad5', 24, false);
addAnimationByPrefix('dialogueBox', 'grey', 'dad6', 24, false);
addAnimationByPrefix('dialogueBox', 'pink', 'dad7', 24, false);
setObjectCamera('dialogueBox', 'camOther')
scaleObject('dialogueBox', 1, 1);
addLuaSprite('dialogueBox', false);
screenCenter('dialogueBox', 'x')

makeLuaSprite('bubble', 'Stages/dialogueV4/bubble', 230, 500);
scaleObject('bubble', 1, 1);
setScrollFactor('bubble', 1, 1);
setObjectCamera('bubble', 'camOther')
addLuaSprite('bubble', false);

makeLuaSprite('bubble2', 'Stages/dialogueV4/bubble', 230, 610);
scaleObject('bubble2', 1, 1);
setScrollFactor('bubble2', 1, 1);
setObjectCamera('bubble2', 'camOther')
addLuaSprite('bubble2', false);
setProperty('bubble2.visible', false)

makeAnimatedLuaSprite('icon1', 'Stages/dialogueV4/iconos', 240, 495);
addAnimationByPrefix('icon1', 'bf', 'bf', 24, false);  
addAnimationByPrefix('icon1', 'gf', 'gf', 24, false);
addAnimationByPrefix('icon1', 'dad', 'yellow', 24, false);
setObjectCamera('icon1', 'camOther')
scaleObject('icon1', 0.75, 0.75);
addLuaSprite('icon1', false);

makeAnimatedLuaSprite('icon2', 'Stages/dialogueV4/iconos', 240, 605);
addAnimationByPrefix('icon2', 'bf', 'bf', 24, false);  
addAnimationByPrefix('icon2', 'gf', 'gf', 24, false);
addAnimationByPrefix('icon2', 'dad', 'yellow', 24, false);
setObjectCamera('icon2', 'camOther')
scaleObject('icon2', 0.75, 0.75);
setProperty('icon2.visible', false)
addLuaSprite('icon2', false);

objectPlayAnimation('icon1', Turnos[Numero]);
objectPlayAnimation('icon2', Turnos[NumeroI2]);
objectPlayAnimation('dialogueBox', Turnos[Numero]);
end
end

Dialogo2 = ''

function DialogoInicial()

makeLuaText('Dialogo', '', getPropertyFromClass('flixel.FlxG', 'width'), 350, 530);
setTextSize('Dialogo', 20);
setTextAlignment('Dialogo', 'left');
setTextBorder('Dialogo', 0, '000000');
setTextFont("Dialogo", "arial.ttf");
addLuaText('Dialogo');
setObjectCamera('Dialogo', 'other');
setProperty('Dialogo.color', '000000')

makeLuaText('NombreD', TurnosNombres[Numero], getPropertyFromClass('flixel.FlxG', 'width'), 350, 505);
setTextSize('NombreD', 20);
setTextAlignment('NombreD', 'left');
setTextFont("NombreD", "arial.ttf");
addLuaText('NombreD');
setObjectCamera('NombreD', 'other');

runTimer('Letra', 0.04, string.len(Dialogo[Numero])+1)

objectPlayAnimation('icon1', Turnos[Numero]);
objectPlayAnimation('icon2', Turnos[NumeroI2]);
objectPlayAnimation('dialogueBox', Turnos[Numero]);
end

function RecargarDialogo()
if Numero == NumeroFinal then
removeLuaSprite('bubble')
removeLuaSprite('bubble2')
removeLuaSprite('icon1')
removeLuaSprite('icon2')
removeLuaSprite('dialogueBox')

removeLuaSprite('Portraitdad')
removeLuaSprite('Portraitgf')
removeLuaSprite('Portraitbf')

setProperty('NombreD.visible', false)
setProperty('NombreD2.visible', false)
setProperty('Dialogo.visible', false)
setProperty('Dialogo2.visible', false)

setPropertyFromClass('Conductor', 'songPosition', -10) 
EnDialogo = false
cameraFlash('camGame', '000000', 0.2)
startCountdown()
else
makeLuaText('Dialogo', '', getPropertyFromClass('flixel.FlxG', 'width'), 350, 530);
setTextSize('Dialogo', 20);
setTextAlignment('Dialogo', 'left');
setTextBorder('Dialogo', 0, '000000');
setTextFont("Dialogo", "arial.ttf");
addLuaText('Dialogo');
setObjectCamera('Dialogo', 'other');
setProperty('Dialogo.color', '000000')

makeLuaText('Dialogo2', ''..Dialogo2, getPropertyFromClass('flixel.FlxG', 'width'), 350, 640);
setTextSize('Dialogo2', 20);
setTextAlignment('Dialogo2', 'left');
setTextBorder('Dialogo2', 0, '000000');
setTextFont("Dialogo2", "arial.ttf");
addLuaText('Dialogo2');
setObjectCamera('Dialogo2', 'other');
setProperty('Dialogo2.color', '000000')
setProperty('bubble2.visible', true)
setProperty('icon2.visible', true)

makeLuaText('NombreD', TurnosNombres[Numero], getPropertyFromClass('flixel.FlxG', 'width'), 350, 505);
setTextSize('NombreD', 20);
setTextAlignment('NombreD', 'left');
setTextFont("NombreD", "arial.ttf");
addLuaText('NombreD');
setObjectCamera('NombreD', 'other');

makeLuaText('NombreD2', TurnosNombres[NumeroI2], getPropertyFromClass('flixel.FlxG', 'width'), 350, 615);
setTextSize('NombreD2', 20);
setTextAlignment('NombreD2', 'left');
setTextFont("NombreD2", "arial.ttf");
addLuaText('NombreD2');
setObjectCamera('NombreD2', 'other');

objectPlayAnimation('icon1', Turnos[Numero]);
objectPlayAnimation('icon2', Turnos[NumeroI2]);
objectPlayAnimation('dialogueBox', Turnos[Numero]);

runTimer('Letra', 0.04, string.len(Dialogo[Numero])+1)
end
end

function onTimerCompleted(tag, loops, loopsLeft)	
if tag == 'Letra' then
setProperty('Portrait'..Turnos[Numero]..'.visible', true)
objectPlayAnimation('Portrait'..Turnos[Numero], Emociones[Numero]);
setTextString('Dialogo', string.sub(Dialogo[Numero], 0, (loops - loopsLeft)));
playSound('dialogo'..Turnos[Numero], 0.8);
end
end

function rgbToHex(array)
return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end

function onUpdate()
if EnDialogo then
if mouseReleased() or keyJustPressed('space') then
Dialogo2 = getProperty('Dialogo.text')
Numero = Numero + 1
NumeroI2 = NumeroI2 + 1
RecargarDialogo()
end
end
if EnDialogo then
setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition')-20) 
setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
end
end