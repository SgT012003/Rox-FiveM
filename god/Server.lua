-----------------------------------------------------------------------------------------------------------------------------------------
-- Delay Setup [variaveis]
-----------------------------------------------------------------------------------------------------------------------------------------

local goddelay = {}
CreateThread(function()
    while true do
        for k,v in pairs(goddelay) do
            if v > 0 then
                goddelay[k] = v - 1
            end
        end
        Wait(1000)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--  God Delay | auth 1 e auth 2 [1 - com delay | 2 - sem delay]
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('god',function(source,args,rawCommand) 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id, "mod.permissao") or vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id, "investidor.permissao") or vRP.hasPermission(user_id, "streamer.permissao") or vRP.hasPermission(user_id, "diamond.permissao") then
        ---------------
        -- Varaiavel --
        ---------------
        local player = 0
        ---------------
        -- Tier List --
        ---------------
        if vRP.hasPermission(user_id, "investidor.permissao") or vRP.hasPermission(user_id, "streamer.permissao") or vRP.hasPermission(user_id, "diamond.permissao") then
            player = 1
        end
        if vRP.hasPermission(user_id, "suporte.permissao") or vRP.hasPermission(user_id, "mod.permissao") or vRP.hasPermission(user_id, "admin.permissao") or vRP.hasPermission(user_id, "ceo.permissao") then
            player = 2
        end
        if player == 0  or player > 2 then
            return
        end
        if player == 1 then
            if goddelay[user_id] == nil then
                goddelay[user_id] = 0;
            end
            if goddelay[user_id] > 0 then
                TriggerClientEvent('Notify',source,'negado','Aguarde <b>'..goddelay[user_id]..'</b> segundos para utilizar esse comando.')
                return
            else
                if args[1] then
                    local nplayer = vRP.getUserSource(parseInt(args[1]))
                    if nplayer then
                        TriggerClientEvent('golden:ExcecaoVida', nplayer)
                        vRPclient.killGod(nplayer)
                        vRPclient.setHealth(nplayer,400)
                        TriggerClientEvent("Notify",source,"sucesso","Você aplicou god com sucesso no ID: "..args[1])
                        SendWebhookMessage(webhookgod1,"```prolog\n[God Em Outro] \n[ID]: "..user_id.." reviveu o [ID]: "..args[1].. os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."```")
                        goddelay[user_id] = 15
                    end
                else
                    vRPclient.killGod(source)
                    vRPclient.setHealth(source,400)
                    TriggerClientEvent("Notify",source,"sucesso","Você aplicou god com sucesso no ID: "..user_id)
                    SendWebhookMessage(webhookgod2,"```prolog\n[God Em Si]\n[ID]: "..user_id.. os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."```")
                    goddelay[user_id] = 15
                end
            end
        end
        if player == 2 then
            if args[1] then
                local nplayer = vRP.getUserSource(parseInt(args[1]))
                if nplayer then
                    TriggerClientEvent('golden:ExcecaoVida', nplayer)            
                    vRPclient.killGod(nplayer)
                    vRPclient.setHealth(nplayer,400)
                    TriggerClientEvent("Notify",source,"sucesso","Você aplicou god com sucesso no ID: "..args[1])
                    SendWebhookMessage(webhookgod1,"```prolog\n[God Em Outro] \n[ID]: "..user_id.." reviveu o [ID]: "..args[1].. os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."```") 
                end
            else
                vRPclient.killGod(source)
                vRPclient.setHealth(source,400)
                TriggerClientEvent("Notify",source,"sucesso","Você aplicou god com sucesso no ID: "..user_id)
                SendWebhookMessage(webhookgod2,"```prolog\n[God Em Si]\n[ID]: "..user_id.. os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."```") 
            end
        end
    else
        TriggerClientEvent("Notify",source,"negado","você nao tem permissao para usar esse comando!")
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--  GOD Delay : Death Time
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent('GodDelay')
AddEventHandler('GodDelay',function(killer,reason)
    local user_id = vRP.getUserId(source)
    goddelay[user_id] = 15
end)