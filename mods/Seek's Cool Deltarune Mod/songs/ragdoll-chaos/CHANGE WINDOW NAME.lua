function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS CHAOS ')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end
