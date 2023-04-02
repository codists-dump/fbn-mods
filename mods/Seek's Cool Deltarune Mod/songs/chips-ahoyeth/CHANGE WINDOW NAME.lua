function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Freaketh on thine friday evening: Psyche Engineth')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end
