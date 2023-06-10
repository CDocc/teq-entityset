local hasSpawned = false

local function setTEQLALA(entitySet)
    local interior = GetInteriorAtCoords(-558.00490000, 285.66400000, 81.17640000)

    if interior ~= 0 then
        local removeSets, newEntitySet = Config.Removals.interiors, Config.Sets[entitySet]
        local removeSigns, newSign = Config.Removals.signs, Config.Signs[entitySet]

        for i = 1, #removeSets do
            DeactivateInteriorEntitySet(interior, removeSets[i])
        end

        for i = 1, #removeSigns do
            RemoveIpl(removeSigns[i])
        end

        Wait(100)

        for i = 1, #newEntitySet do
            ActivateInteriorEntitySet(interior, newEntitySet[i])
        end

        if newSign then
            RequestIpl(newSign)
        end

        RefreshInterior(interior)
    end
end

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/setteq', 'Set the maze bank arena interior.', {{ name = 'interior', help = 'The interior entity set name' }})
end)

AddEventHandler('playerSpawned', function()
    if not hasSpawned then
        setTEQLALA(GlobalState.tequilala)

        hasSpawned = true
    end
end)

AddStateBagChangeHandler('tequilala', nil, function(bagName, key, value, _unused, replicated)
    setTEQLALA(value)
end)
