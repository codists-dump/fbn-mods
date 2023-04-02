function onCreate()
    setPropertyFromClass("openfl.Lib", "application.window.title",'Friday Night Funkin`: SCRIMBLO BIMBLO ENGINE (DOO-DOO FART UPDATE 2.69 ALPHA 3000)')
end

function onUpdate()
    if getProperty("health") < 0 then
        setPropertyFromClass("openfl.Lib", "application.window.title",'DARKNESS')
    end
end