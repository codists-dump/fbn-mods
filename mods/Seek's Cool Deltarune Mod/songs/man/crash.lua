function onEndSong()
    addHaxeLibrary('Sys')
    runHaxeCode([[
        Sys.exit(0);
    ]])
end
