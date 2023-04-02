function onUpdate()
    if ratingName == '?' then
        setRatingName('...') --When there are no notes
    end
    if ratingName == 'You Suck!' then
        setRatingName('Thoust sucketh') --From 0% to 19% of accuracy
    end
    if ratingName == 'Shit' then
        setRatingName('Shiteth') --From 20% to 39% of accuracy
    end
    if ratingName == 'Bad' then
        setRatingName('Crappeth') --From 40% to 49% of accuracy
    end
    if ratingName == 'Bruh' then
        setRatingName('Bruh-eth') --From 50% to 59% of accuracy
    end
    if ratingName == 'Meh' then
        setRatingName('Mediumst') --From 60% to 68% of accuracy
    end
    if ratingName == 'Nice' then
        setRatingName('SEXETH??? HUH?') --69% of accuracy :bruh:
    end
    if ratingName == 'Good' then
        setRatingName('SHAKETH IN THINE BOOTSETH') --From 70% to 79% of accuracy
    end
    if ratingName == 'Great' then
        setRatingName('Nevereth doubtsted thou') --From 80% to 89% of accuracy
    end
    if ratingName == 'Sick!' then
        setRatingName('EXCEPTIONALETH') --From 90% to 99% of accuracy
    end
    if ratingName == 'Perfect!!' then
        setRatingName('GOD. DAMN IT.') --100% of accuracy
    end
    if ratingName == '?' and botPlay == true then
        setRatingName('CHEATERETH! HOW DARETH THOU') --When the botplay is activated
    end
end