function onUpdate()
    if ratingName == '?' then
        setRatingName('...') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('Fucking hell youre terrible.') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('You suck ass.') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('You suck.') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Gonna cry?') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('Get crushed, dumbass.') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('Sex') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('Stay still.') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('Stop resisting!') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('Not bad.') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('How the hell--') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('Cringe.') --When the botplay is activated
    end
end