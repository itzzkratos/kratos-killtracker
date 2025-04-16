Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityDead(PlayerPedId()) then
            Citizen.Wait(500)
            local PedKiller = GetPedSourceOfDeath(PlayerPedId())
            local Killer
            if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
                Killer = NetworkGetPlayerIndexFromPed(PedKiller)
            elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
                Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
            end

            if Killer then
                local killerId = GetPlayerServerId(Killer)
                TriggerServerEvent('kratos:playerKilled', killerId)
            end

            while IsEntityDead(PlayerPedId()) do
                Citizen.Wait(0)
            end
        end
    end
end)
