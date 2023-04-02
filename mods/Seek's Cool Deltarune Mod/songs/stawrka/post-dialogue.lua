local allowEnd = false

function onEndSong()

    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)

    if not allowEnd then
        setProperty('inCutscene', true);

        if ratingName == 'Perfect!!' or ratingName == 'Sick!' then
            startDialogue('post-dialogue-perfect', '');
        else 
            if ratingName == 'Bruh' or ratingName == 'Bad' or ratingName == 'Shit' or ratingName == 'You Suck!' then
                startDialogue('post-dialogue', '');
            else
                startDialogue('post-dialogue-good', '');
            end
        end



        allowEnd = true;

        return Function_Stop;
    end

    return Function_Continue;

end
