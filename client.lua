-----------------------------------------
--- Disable Pause Menu, Made by FAXES ---
-----------------------------------------

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(PlayerId())
        local veh = GetVehiclePedIsUsing(ped)
        if IsPedStopped(ped) then
            EnableControlAction(1, 199)
            EnableControlAction(1, 200)
        else
            SetPauseMenuActive(false)
            if IsControlJustPressed(1, 199) or IsControlJustPressed(1, 200) then
                if IsPedInVehicle(ped, veh, false) then
                    TriggerEvent("chatMessage", "^1^*You cannot Use The Pause Menu While Driving!")
                elseif not IsPedStopped(ped) then
                    TriggerEvent("chatMessage", "^1^*You cannot Use The Pause Menu While Moving!")
                end
            end
        end
	end
end)