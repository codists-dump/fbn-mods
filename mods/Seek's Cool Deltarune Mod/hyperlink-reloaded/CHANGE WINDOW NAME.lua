function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: WAKE UP AND [smell] THE [pain]')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end