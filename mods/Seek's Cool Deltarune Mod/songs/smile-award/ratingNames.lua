function onUpdate()
    if ratingName == '?' then
        setRatingName('...') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('Boo.') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('Youre hopeless') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('Truly sad.') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Hmm...') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('Not bad...') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('Not bad...') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('Good...') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('Great...') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('Excellent...') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('Perfect...') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('Heaven is no place for cheaters.') --When the botplay is activated
    end
end