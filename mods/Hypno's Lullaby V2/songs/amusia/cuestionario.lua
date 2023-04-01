--Codigo por Nickobelit
--(Y no me salgan con que lo robé NADIE HA HECHO ESTO EN LUA)

--Codigo Base del sistema de aparacion de letras de aquí
--https://gamebanana.com/tools/10348
no = true
shake = false
decide = false
died = false
function onCreatePost()
    makeLuaSprite('cuestionario', 'stages/amusia/questionare', 265, 90);
	scaleObject('cuestionario',0.3,0.3);
	addLuaSprite('cuestionario', true)
	setObjectCamera('cuestionario','hud')
	setProperty('cuestionario.alpha', 0)
	
	makeAnimatedLuaSprite('wigglesCuestionario', 'stages/amusia/wiggles_questionare', 520,200);
    addAnimationByPrefix('wigglesCuestionario', 'idle1', 'idle1', 24, true);
    addAnimationByPrefix('wigglesCuestionario', 'idle2', 'idle2', 24, false);
    addAnimationByPrefix('wigglesCuestionario', 'idle3', 'idle3', 24, false);
    objectPlayAnimation('wigglesCuestionario', 'idle1', false);
    scaleObject('wigglesCuestionario', 1,1);
    setObjectCamera('wigglesCuestionario','hud')
    addLuaSprite('wigglesCuestionario', true)
    setProperty('wigglesCuestionario.alpha', 0)
    
    makeAnimatedLuaSprite('GIVEMEYOURSING', 'stages/amusia/Givemeyoursing', 250,-50);
    addAnimationByPrefix('GIVEMEYOURSING', 'idle1', 'Upfront', 24, false);
    addAnimationByPrefix('GIVEMEYOURSING', 'idle2', 'stareLoop', 24, true);
    objectPlayAnimation('GIVEMEYOURSING', 'idle1', false);
    scaleObject('GIVEMEYOURSING', 0.7,0.7);
    setObjectCamera('GIVEMEYOURSING','hud')
    addLuaSprite('GIVEMEYOURSING', true)
    setProperty('GIVEMEYOURSING.alpha', 0)
    
    makeLuaSprite('textBox', 'UI/base/amusia/questionareTextBox', 100, 500);
	scaleObject('textBox',1,1);
	addLuaSprite('textBox', true)
	setObjectCamera('textBox','hud')
	setProperty('textBox.alpha', 0)
	
	makeLuaSprite('answerBox', 'UI/base/amusia/questionareAnswerBox', 1000, 500);
	scaleObject('answerBox',1,1);
	addLuaSprite('answerBox', true)
	setObjectCamera('answerBox','hud')
	setProperty('answerBox.alpha', 0)
	
	makeLuaSprite('selectorCuestionario', 'pauseScreen/selector', 1010, 564)
	addLuaSprite('selectorCuestionario', true)
	setObjectCamera('selectorCuestionario', 'camOther')
	scaleObject('selectorCuestionario', 0.16,0.16);
	setProperty('selectorCuestionario.alpha', 0)

    makeLuaText('fakeTxt','', 1280, 145, 560);
    setTextSize('fakeTxt', 25);
    addLuaText('fakeTxt',true);
    setTextFont('fakeTxt', "poketext.ttf");
    setTextColor('fakeTxt', '000000')
    setTextBorder('fakeTxt',0,'FFFFFF')
    setTextAlignment('fakeTxt', 'left');
    setObjectCamera('fakeTxt', 'hud')
    setProperty('fakeTxt.visible', false)
    setProperty('fakeTxt.antialiasing',false)
    
    makeAnimatedLuaSprite('Bebe', 'pauseScreen/virtualbuttons',1150, 588);
		addAnimationByPrefix('Bebe', 'down', 'down', 24, false);
		addAnimationByPrefix('Bebe', 'downPress', 'downPressed', 24, false);
		addLuaSprite('Bebe', true);
		setObjectCamera('Bebe', 'hud')
		setProperty('Bebe.alpha', 0)
		
		makeAnimatedLuaSprite('Lit', 'pauseScreen/virtualbuttons',1018, 588);
		addAnimationByPrefix('Lit', 'up', 'up', 24, false);
		addAnimationByPrefix('Lit', 'upPress', 'upPressed', 24, false);
		addLuaSprite('Lit', true);
		setObjectCamera('Lit', 'hud')
		setProperty('Lit.alpha', 0)
		
		makeAnimatedLuaSprite('Gogogaga', 'pauseScreen/virtualbuttons', 0, 650);
		addAnimationByPrefix('Gogogaga', 'x', 'x', 24, false);
		addAnimationByPrefix('Gogogaga', 'xPress', 'xPressed', 24, false);
		addLuaSprite('Gogogaga', true);
		scaleObject('Gogogaga', 0.5,0.5);
		setObjectCamera('Gogogaga', 'hud')
		setProperty('Gogogaga.alpha', 0)
		
		makeLuaSprite('WigglyJumpscare', 'jumpscares/Wiggles', 0, 0);
        scaleObject('WigglyJumpscare', 1,1);
        addLuaSprite('WigglyJumpscare', true);
        setProperty('WigglyJumpscare.alpha',0)
        setObjectCamera("WigglyJumpscare", 'hud')
end

function onStepHit()
if curStep == 2080 then
texto='I just wanted to sing...'
runTimer('empieza', 0.5)
doTweenAlpha('holaTextBox', 'textBox', 1, 0.2)
end
if curStep == 2100 then
texto="Why... why... why... can't I sing?"
runTimer('empieza', 0.5)
end
if curStep == 2130 then
texto="Just.. Sing... Sing..."
runTimer('empieza', 0.5)
end
if curStep == 2160 then
texto="Why can't I sing? Why? Why?"
runTimer('empieza', 0.5)
end
if curStep == 2225 then
texto="Can you sing?"
runTimer('empieza', 0.5)
runTimer('decide', 0.5)
end
if curStep == 2464 then--3era Ruta por si "Alguien" se no selecciona nada
decide = false
    doTweenAlpha('adiosCamHUD', 'camHUD', 0, 5)
    setProperty('Bebe.alpha', 0)
    setProperty('Lit.alpha', 0)
    setProperty('Gogogaga.alpha', 0)
    setProperty('answerBox.alpha', 0)
    setProperty('fakeTxt.alpha', 0)
    setProperty('textBox.alpha', 0)
    setProperty('selectorCuestionario.alpha', 0)
end
end

function onUpdatePost(elapsed)
if decide == true then
if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1282) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('down') then  
     no=true
     yes=false
objectPlayAnimation('Bebe', 'downPress', false);
doTweenY('selectorY2', 'selectorCuestionario', 562, 0.1, 'linear')
playSound('scrollMenu', 0.3)
end

if (getMouseX('camHUD') > 1018 and getMouseX('camHUD') < 1150) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or keyJustPressed('up') then
     yes=true
     no=false
objectPlayAnimation('Lit', 'upPress', false);
doTweenY('selectorY1', 'selectorCuestionario', 532, 0.1, 'linear')
playSound('scrollMenu', 0.3)
end

if yes == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 70) and (getMouseY('camHUD') > 635 and getMouseY('camHUD') < 720 and mouseClicked('left')) or yes == true and keyJustPressed('accept') then
texto="Thank you..."
    setProperty('Bebe.alpha', 0)
    setProperty('Lit.alpha', 0)
    setProperty('Gogogaga.alpha', 0)
    setProperty('answerBox.alpha', 0)
    setProperty('selectorCuestionario.alpha', 0)
runTimer('empieza', 0.1)
runTimer('UltimoDialogo', 3)
decide = false
end

if no == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 70) and (getMouseY('camHUD') > 635 and getMouseY('camHUD') < 720 and mouseClicked('left')) or no == true and keyJustPressed('accept') then
texto="You're lying"
    objectPlayAnimation('wigglesCuestionario', 'idle2', false);
    setProperty('Bebe.alpha', 0)
    setProperty('Lit.alpha', 0)
    setProperty('Gogogaga.alpha', 0)
    setProperty('answerBox.alpha', 0)
    setProperty('selectorCuestionario.alpha', 0)
runTimer('empieza', 0.1)
runTimer('Dialogo2', 2)
decide = false
end
end

if shake == true then
cameraShake('hud', 0.01, 0.8)
end

if stopSong == true then
       setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  )
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setPropertyFromClass('PlayState', 'instance.generatedMusic', false)
end
end

function onTimerCompleted(tag)
    if tag == 'empieza' then
        inDia = true
        stop = false
        diaTable = Split(texto, ',')
        thing = 0
        yappin = ''
        setTextString('fakeTxt', '')
        setProperty('fakeTxt.visible', true)
        runTimer('addTx', 0.15)
        hold = {}
        guh = diaTable[1]
        for letter in guh:gmatch(".") do 
        table.insert(hold, letter) 
end
end

if tag == 'addTx' then
        setTextString('fakeTxt', diaTable[1])
        if #hold ~= thing then
            thing = thing + 1 else
                stop = true
        end
        if not stop then
            yappin = yappin .. hold[thing]
        end
        if inDia then
            setTextString('fakeTxt', yappin)
            runTimer('addTx', 0.05) 
       end
    end

    if tag == 'decide' then
    setProperty('Bebe.alpha', 1)
    setProperty('Lit.alpha', 1)
    setProperty('Gogogaga.alpha', 1)
    setProperty('answerBox.alpha', 1)
    setProperty('selectorCuestionario.alpha', 1)
    decide = true
end

--Ruta Si
    if tag == 'UltimoDialogo' then
     texto="for accepting your sacrifice."
     objectPlayAnimation('wigglesCuestionario', 'idle2', false);
     runTimer('empieza', 0.1)
     runTimer('Si', 0.1)   
    end

--Ruta No
if tag == 'Dialogo2' then
     texto="You... can sing"
     objectPlayAnimation('wigglesCuestionario', 'idle3', false);
     runTimer('empieza', 0.1)
     runTimer('Dialogo3', 2)   
    end
if tag == 'Dialogo3' then
     setProperty('GIVEMEYOURSING.alpha', 1)
     setProperty('wigglesCuestionario.alpha', 0)
     objectPlayAnimation('GIVEMEYOURSING', 'idle1', false);
     texto="Give me your sing"
     runTimer('empieza', 0.1)
     runTimer('Dialogue4', 2)   
     stopSong = true
    end
if tag == 'Dialogue4' then
     objectPlayAnimation('GIVEMEYOURSING', 'idle2', false);
     texto="GIVE ME YOUR SING!!"
     runTimer('empieza', 0.1)
     runTimer('Si', 0.1)
    end

--Si y No
if tag == 'Si' then
     stopSong = true
     runTimer('Muere', 2.5)
end

  if tag == 'Muere' then
  setProperty('textBox.alpha', 0)
  setProperty('fakeTxt.alpha', 0)
  setProperty('cuestionario.alpha', 0)
  setProperty('wigglesCuestionario.alpha', 0)
  setProperty('GIVEMEYOURSING.alpha', 0)
  runTimer('ahora', 2.5)
end

if tag == 'ahora' then
   shake=true
   playSound('WigglyTuffJumpscare', 1)
   setProperty('WigglyJumpscare.alpha', 1)
   runTimer('endSong', 5)
   runTimer('adiosWiggles', 3.7)
end

  if tag == 'adiosWiggles' then
  doTweenAlpha('adiosWigglesP','WigglyJumpscare',0,0.05)
  end
  if tag == 'endSong' then
   endSong(true)
end
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match));
    end
    return result;
end