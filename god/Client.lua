-----------------------------------------------------------------------------------------------------------------------------------------
-- Death Delay [Log] | Set time on death
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    alreadyDead = false
    while true do
        Citizen.Wait(250)
        local playerPed = GetPlayerPed(-1)
        if IsEntityDead(playerPed) and not alreadyDead then
            TriggerServerEvent('GodDelay')
            alreadyDead = true
        end
        if not IsEntityDead(playerPed) then
            alreadyDead = false
        end
    end
end)