
function onUpdatePost()
    if hits < 1 then
        setProperty('scoreTxt.text', 'KROMER: 0 | [Combo Breaks]: 0 | Rating: ?')
    elseif misses < 1 then
        setProperty('scoreTxt.text', 'KROMER: ' .. score .. ' | [Combo Breaks]: ' .. misses .. ' | Rating: [' .. ratingName .. '] - ' ..  round(rating * 100, 2) .. '% [' .. ratingFC .. ']')
    else
        setProperty('scoreTxt.text', 'KROMER: ' .. score .. ' | [Combo Breaks]: ' .. misses .. ' | Rating: [' ..ratingName.. '] - ' ..  round(rating * 100, 2) .. '% [Clear]')
    end
end

function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end
