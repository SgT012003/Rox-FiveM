-----------------------------------------------------------------------------------------------------------------------------------------
--                                                              TPTOME                                                                 --
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('tptome',function(source,args,rawCommand)

    ------------------
    --  Variaveis 1 --
    ------------------

	local user_id = vRP.getUserId(source)
    local tplayer = vRP.getUserSource(parseInt(args[1]))

    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id, "investidor.permissao") or vRP.hasPermission(user_id, "streamer.permissao") then

        ------------------
        --  Variaveis 2 --
        ------------------

        local player1 = 0
        local player2 = 0

        -----------------
        -- Tier List 1 --
        -----------------
        if vRP.hasPermission(user_id, "investidor.permissao") or vRP.hasPermission(user_id, "streamer.permissao") then
            player1 = 1
        end
        if vRP.hasPermission(user_id, "suporte.permissao") then
            player1 = 2
        end
        if vRP.hasPermission(user_id, "mod.permissao") then
            player1 = 3
        end
        if vRP.hasPermission(user_id, "admin.permissao") then
            player1 = 4
        end
        if vRP.hasPermission(user_id, "ceo.permissao") then
            player1 = 5
        end

        -----------------
        -- Tier List 2 --
        -----------------
        if vRP.hasPermission(parseInt(args[1]), "investidor.permissao") or vRP.hasPermission(parseInt(args[1]), "streamer.permissao") then
            player2 = 1
        end
        if vRP.hasPermission(parseInt(args[1]), "suporte.permissao") then
            player2 = 2
        end
        if vRP.hasPermission(parseInt(args[1]), "mod.permissao") then
            player2 = 3
        end
        if vRP.hasPermission(parseInt(args[1]), "admin.permissao") then
            player2 = 4
        end
        if vRP.hasPermission(parseInt(args[1]), "ceo.permissao") then
            player2 = 5
        end

        -----------------
        -- Teste do TP --
        -----------------
        if player1 >= player2 then

		    if args[1] then
		    	local x,y,z = vRPclient.getPosition(source)
		    	if tplayer then
		    		TriggerClientEvent('golden:ExcecaoTp', tplayer)
		    		vRPclient.teleport(tplayer,x,y,z)

                    ----------------------------------------------------------
		    		--  local service = {}                                  --
		    		--  if vRP.hasPermission(user_id,"logreal") then        --
		    		--  	 service = vRP.getUsersByPermission("logreal")  --
		    		--  end                                                 --
                    ----------------------------------------------------------
		    		
                    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                    --  for k,v in pairs(service) do                                                                                                                                                                                                                --
		    		--	    local nuser_id = vRP.getUserSource(parseInt(v))                                                                                                                                                                                         --
		    		--	    local identity = vRP.getUserIdentity(nuser_id)                                                                                                                                                                                          --
		    		--  TriggerClientEvent("chatMessage",nuser_id,"["..tonumber(os.date("%H"))..":"..tonumber(os.date("%M")).."] HEAVY -"..' ID: ' ..user_id.." "..identity.name.. " "..identity.firstname..' DEU TPTOME NO ID '..tostring(tplayer), {55,221,255})  --
		    		--  end                                                                                                                                                                                                                                         --
                    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                    SendWebhookMessage(webhooktptome,"```[TP to me]:\n[ID]: "..user_id.." puxou o [ID]:"..args[1].."\n"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
		    	end
		    end
            else
                TriggerClientEvent("Notify",source,"negado","você nao tem permissao para puxa o ID ["..args[1].."]")
            end
            -----------------
            --  Sem cargo  --
            -----------------
        else 
            TriggerClientEvent("Notify",source,"negado","você nao tem permissao para usar esse comando!")
        end
    end
)

-----------------------------------------------------------------------------------------------------------------------------------------
--                                                               TPTO                                                                  --
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('tpto',function(source,args,rawCommand)

    ------------------
    --  Variaveis 1 --
    ------------------

	local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id, "investidor.permissao") or vRP.hasPermission(user_id, "streamer.permissao") then

        ------------------
        --  Variaveis 2 --
        ------------------

        local player1 = 0
        local player2 = 0

        -----------------
        -- Tier List 1 --
        -----------------
        if vRP.hasPermission(user_id, "investidor.permissao") or vRP.hasPermission(user_id, "streamer.permissao") then
            player1 = 1
        end
        if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id, "mod.permissao") or vRP.hasPermission(user_id, "admin.permissao")then
            player1 = 2
        end
        if vRP.hasPermission(user_id, "ceo.permissao") then
            player1 = 3
        end

        -----------------
        -- Tier List 2 --
        -----------------
        if vRP.hasPermission((parseInt(args[1])), "investidor.permissao") or vRP.hasPermission((parseInt(args[1])), "streamer.permissao") then
            player2 = 1
        end
        if vRP.hasPermission((parseInt(args[1])), "suporte.permissao") or vRP.hasPermission((parseInt(args[1])), "mod.permissao") or vRP.hasPermission((parseInt(args[1])), "admin.permissao")then
            player2 = 2
        end
        if vRP.hasPermission(((parseInt(args[1]))), "ceo.permissao") then
            player2 = 3
        end

        -----------------
        -- Teste do TP --
        -----------------
        if player1 <= player2 then
            if args[1] then
                local tplayer = vRP.getUserSource(parseInt(args[1]))
                if tplayer then
                    vRPclient.teleport(source,vRPclient.getPosition(tplayer))
                end
            end
            SendWebhookMessage(webhooktptome,"```[TP to]:\n[ID]: "..user_id.." Teleportou para o [ID]:"..args[1].."\n"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
        else
            TriggerClientEvent("Notify",source,"negado","você nao tem permissao para puxa o ID ["..args[1].."]")
        end
            -----------------
            --  Sem cargo  --
            -----------------
        else 
            TriggerClientEvent("Notify",source,"negado","você nao tem permissao para usar esse comando!")
        end
    end
)

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