local drainAmount = 0.023
local minHealth = 0.01

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if dadName == "gumball" then
        local health = getProperty('health')

        if health > minHealth then
            setProperty('health', math.max(minHealth, health - drainAmount))
        end
    end
end