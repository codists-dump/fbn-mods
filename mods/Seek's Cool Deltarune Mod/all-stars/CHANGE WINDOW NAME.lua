function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Intro')
end

function onUpdate()
    if curBeat == 32 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Chips Ahoyeth (reprise)')
    end

    if curBeat == 144 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - In My Way (reprise)')
    end

    if curBeat == 272 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Ragdoll Chaos (reprise)')
    end

    if curBeat == 400 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Showstopping (reprise)')
    end

    if curBeat == 528 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Smile Award (reprise)')
    end

    if curBeat == 656 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - HYPERLINK (reprise)')
    end

    if curBeat == 768 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - [[OST: Ugh]]')
    end

    if curBeat == 800 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: ALL STARS - Don`t Forget')
    end



    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end