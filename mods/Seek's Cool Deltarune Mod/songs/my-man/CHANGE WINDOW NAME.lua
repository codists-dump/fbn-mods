function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'nubert')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'nubeert')
    end
end