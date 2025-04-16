RegisterServerEvent('kratos:playerKilled')
AddEventHandler('kratos:playerKilled', function(killerID)
    if killerID ~= -1 then
        local discordID = nil
        for _, id in ipairs(GetPlayerIdentifiers(killerID)) do
            if string.match(id, "^discord:") then
                discordID = string.sub(id, 9)
                break
            end
        end

        if discordID then
            MySQL.Async.fetchScalar('SELECT kills FROM player_kills WHERE discord = @discord', {
                ['@discord'] = discordID
            }, function(existingKills)
                local addToDB = existingKills and 'UPDATE player_kills SET kills = kills + 1 WHERE discord = @discord' or 'INSERT INTO player_kills (discord, kills) VALUES (@discord, 1)'
                MySQL.Async.execute(addToDB, { ['@discord'] = discordID })
            end)
        end
    end
end)
