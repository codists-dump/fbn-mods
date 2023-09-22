local ffi = require("ffi")  -- Load FFI module (instance)

local user32 = ffi.load("user32")   -- Load User32 DLL handle

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
    MB_ICONINFORMATION = 0x00000040L
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
]]) -- Define C -> Lua interpretation


function onCreatePost() 
    makeLuaSprite('black','',0,0)
    makeGraphic('black',1280,720,'000000')
    setScrollFactor('black',0,0)
    addLuaSprite('black',true)
    setObjectCamera('black','other')
    setProperty('black.alpha',0.00001)

    makeLuaSprite('CHEATER','flashes/CHEATER',0,0)
    addLuaSprite('CHEATER',true)
    setObjectCamera('CHEATER','other')
    setProperty('CHEATER.alpha',0.00001)
end

punchdisable = false

function onGameOver()
    return Function_Stop
end

dead = false
punched = false
function onUpdate(elapsed)
    if getHealth() <= 0.0001 and not dead and not punchdisable then
        openCustomSubstate('gamerrrr',true)
        dead = true
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Y') and not punchdisable then
        punchdisable = true 
        playSound('Loudbtw',1,'bro4')
        setProperty('CHEATER.alpha',1)
        runTimer('i found you',1,1)
        runTimer('cheater',2,2)
    end
end

function onUpdatePost(elapsed)
    if not punchdisable then
        if getRandomBool(0.009) then
            setProperty('health',0)
        end
    end
end 

function onCustomSubstateCreatePost(n)
    if n == 'gamerrrr' then
        if not punched then
            playAnim('boyfriend','die',false)
            playAnim('dad','punch')
            playAnim('gf','NOOO')
            setObjectOrder('dadGroup',getObjectOrder('boyfriendGroup')+1)

            playSound('picodeath/Deathpico',1,'FUCK')
            runTimer('gameOverMusic',1.8)

            doTweenZoom('camz','camGame',0.7,0.5,'backInOut')
            doTweenX('move1','camFollowPos',getGraphicMidpointX('boyfriend')-800,0.5,'backInOut')
            doTweenY('move2','camFollowPos',getGraphicMidpointY('boyfriend')-200,0.5,'backInOut')
            setProperty('camHUD.visible',false)
            punched = true
        end
    end
end

stop = false
function onTimerCompleted(t)
    if t == 'gameOverMusic' then
        if not stop then
            
               
            playSound('DeathLoop (2)fade',1,'deathLoopfade')
        end
    end
end

function onSoundFinished(t)
    if t == 'deathLoopfade' then
        playSound('DeathLoop (2)',1,'deathLoop')
    end
    if t == 'deathLoopfade' then
        playSound('DeathLoop (2)',1,'deathLoopfade')
    end
end

frameBF = 0
frameGF = 0
frameDAD = 0
frameLose = 0
function onCustomSubstateUpdate(n,elapsed)
    if n == 'gamerrrr' then
        frameBF = frameBF + (elapsed*20)
        frameDAD = frameDAD + (elapsed*20)
        frameGF = frameGF + (elapsed*20)
        frameLose = frameLose + (elapsed*20)

        setProperty('boyfriend.animation.curAnim.curFrame',frameBF)
        setProperty('gf.animation.curAnim.curFrame',frameGF)
        setProperty('dad.animation.curAnim.curFrame',frameDAD)
        setProperty('loseSprite.animation.curAnim.curFrame',frameLose)
    end
end

rset = false
function onCustomSubstateUpdatePost(n,elapsed)
    if n == 'gamerrrr' then
        if keyboardJustPressed('ENTER') or keyboardJustPressed('SPACE') then
            stopSound('DeathLoop (2)')
            stopSound('DeathLoop (2)fade')
            stop = true
            if not rset then
                rset = true
                playSound('picodeath/DeathAccept',1,'FUCK2')

                setProperty('camFollowPos.x',getGraphicMidpointX('boyfriend') - 500)
                setProperty('camFollowPos.y',getGraphicMidpointY('boyfriend') - 100)
                doTweenZoom('camz','camGame',1,0.2,'backOut')
                doTweenAlpha('black','black',1,1)
            end
        end

        if keyboardJustPressed('ESCAPE') then
            exitSong(false)
        end
    end
end

function onTweenCompleted(t)
    if t == 'black' then
        restartSong(false)
    end
end

function onTimerCompleted(t)
    if t == 'i found you' then
        user32.MessageBoxA(nil, 'FORTNITE', 'Do not eat stuff off the ground.', ffi.C.MB_OK + ffi.C.MB_ICONINFORMATION)   -- Call C function 'MessageBoxA' from User32
    end
    if t == 'cheater' then
        setProperty('CHEATER.alpha',0)
    end
end