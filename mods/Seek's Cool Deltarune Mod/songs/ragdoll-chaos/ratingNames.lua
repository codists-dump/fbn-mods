function onUpdate()
    if ratingName == '?' then
        setRatingName('...') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('You suck, suck.') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('Hopeless, hopeless!') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('Truly sad, sad.') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Locked away!') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('A mischief, mischief.') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('Funny, funny!') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('Chaos!') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('CHAOS, CHAOS!') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('You can do anything!') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('The true and neo chaos!') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('Cheater, cheater!') --When the botplay is activated
    end
end