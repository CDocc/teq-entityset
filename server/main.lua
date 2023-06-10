CreateThread(function()
    GlobalState.tequilala = Config.Default
end)

RegisterCommand('settequilala', function(source, args)
    if IsPlayerAceAllowed(source, 'tequilala') then
        local tequilala = args[1]

        if not tequilala or not Config.Sets[tequilala] then return end

        GlobalState.tequilala = tequilala
    end
end, false)
