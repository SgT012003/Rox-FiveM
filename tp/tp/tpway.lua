-- Client

-----------------------------------------------------------------------------------------------------------------------------------------
-- TpWayEvent
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('TpWayEvent')
AddEventHandler('TpWayEvent',function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsUsing(ped)
	if IsPedInAnyVehicle(ped) then
		ped = veh
    end

	local waypointBlip = GetFirstBlipInfoId(8)
	local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09,waypointBlip,Citizen.ResultAsVector()))

	local ground
	local groundFound = false
	local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }

	for i,height in ipairs(groundCheckHeights) do
		SetEntityCoordsNoOffset(ped,x,y,height,0,0,1)

		RequestCollisionAtCoord(x,y,z)
		while not HasCollisionLoadedAroundEntity(ped) do
			RequestCollisionAtCoord(x,y,z)
			Citizen.Wait(1)
		end
		Citizen.Wait(20)

		ground,z = GetGroundZFor_3dCoord(x,y,height)
		if ground then
			z = z + 1.0
			groundFound = true
			break;
		end
	end

	if not groundFound then
		z = 1200
		GiveDelayedWeaponToPed(PlayerPedId(),0xFBAB5776,1,0)
	end

	RequestCollisionAtCoord(x,y,z)
	while not HasCollisionLoadedAroundEntity(ped) do
		RequestCollisionAtCoord(x,y,z)
		Citizen.Wait(1)
	end

	SetEntityCoordsNoOffset(ped,x,y,z,0,0,1)
end)

-- Server

-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpway',function(source,args,rawCommand)

	local user_id = vRP.getUserId(source)

	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"investidor.permissao") or vRP.hasPermission(user_id,"streamer.permissao") then
		TriggerClientEvent('TpWayEvent',source)
        SendWebhookMessage(webhooktpway,"```prolog\n[TP Way]:\n[ID]: "..user_id.." usou tp way"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
    else
        TriggerClientEvent("Notify",source,"negado","você nao tem permissao para usar esse comando!")
    end
end)