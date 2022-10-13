------------------------------------------------- Tunel Setup ----------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
------------------------------------------------- WebHook Setup --------------------------------------------------
local webhookkit = "https://canary.discord.com/api/webhooks/1011282089741656114/zYvUA0C2VKCkO4xnLwwf_6Oh7fDlXP3I0l1iqIHJ1gzExy-8cc6Qeok2bKDaukMHJyt4"
------------------------------------------------- Setup Variables ------------------------------------------------
local delayStreamer = {}
local delayInvestidor = {}
local delayParceria = {}
------------------------------------------------- Delay Setup ----------------------------------------------------
CreateThread(function()
    while true do
        for k,v in pairs(delayStreamer) do
            if v > 0 then
                delayStreamer[k] = v - 1
            end
        end
        for k,v in pairs(delayInvestidor) do
            if v > 0 then
                delayInvestidor[k] = v - 1
            end
        end
        for k,v in pairs(delayParceria) do
            if v > 0 then
                delayParceria[k] = v - 1
            end
        end
        Wait(1000)
    end
end)
------------------------------------------------- Command Setup --------------------------------------------------
RegisterCommand('kit',function(source,args,rawCommand)

    ---- Set Internal Variables ----
    local user_id = vRP.getUserId(source)
    local stats = args[1]
    local set_id = args[2]
    local nuser_id = parseInt(args[2])
    local nsource = vRP.getUserSource(nuser_id)

    -- Set Intenal Args --
    if args[1] then
        elseif stats == 'streamer' then
            if vRP.hasPermission(user_id,"streamer.permissao") then
                if delayStreamer[user_id] == nil then
                    delayStreamer[user_id] = 0;
                end
                if delayStreamer[user_id] > 0 then
                    TriggerClientEvent("Notify",source,"negado","Falta "..delayStreamer[user_id].." segundos até o proximo Kit Streamer!")
                else
                    vRPclient.giveWeapons(source,{["weapon_pistol_mk2"] = { ammo = 250 }})
                    vRP.giveInventoryItem(user_id,"mochila",3)
                    vRP.giveInventoryItem(user_id,"celular",1)
                    vRP.giveInventoryItem(user_id,"radio",1)
                    vRP.giveInventoryItem(user_id,"compattach",1)
                    vRP.giveInventoryItem(user_id,"energetico",10)
                    delayStreamer[user_id] = 900
                    TriggerClientEvent("Notify",source,"sucesso","O seu Kit foi <g>Resgatado</g>!")
                    SendWebhookMessage(webhookkit,"```prolog\n[Kit - Streamer]:\n[ID]: "..user_id.." coletou o Kit Streamer"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não tem o Cargo Streamer!")
            end
        elseif stats == 'investidor' then
            if vRP.hasPermission(user_id,"investidor.permissao") then
                if delayInvestidor[user_id] == nil then
                    delayInvestidor[user_id] = 0;
                end
                if delayInvestidor[user_id] > 0 then
                    TriggerClientEvent("Notify",source,"negado","Falta "..delayInvestidor[user_id].." segundos até o proximo Kit Investidor!")
                else
                    vRPclient.giveWeapons(source,{["weapon_pistol_mk2"] = { ammo = 250 }})
                    vRP.giveInventoryItem(user_id,"mochila",3)
                    vRP.giveInventoryItem(user_id,"celular",1)
                    vRP.giveInventoryItem(user_id,"radio",1)
                    vRP.giveInventoryItem(user_id,"compattach",1)
                    vRP.giveInventoryItem(user_id,"energetico",10)
                    delayInvestidor[user_id] = 900
                    TriggerClientEvent("Notify",source,"sucesso","O seu Kit foi <g>Resgatado</g>!")
                    SendWebhookMessage(webhookkit,"```prolog\n[Kit - Investidor]:\n[ID]: "..user_id.." coletou o Kit Investidor"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não tem o Cargo Investidor!")
            end
        elseif stats == 'Parceria' then
            if vRP.hasPermission(user_id,"parceria.permissao") then
                if delayParceria[user_id] == nil then
                    delayParceria[user_id] = 0;
                end
                if delayParceria[user_id] > 0 then
                    TriggerClientEvent("Notify",source,"negado","Falta "..delayParceria[user_id].." segundos até o proximo Kit Investidor!")
                else
                    vRPclient.giveWeapons(source,{["weapon_pistol_mk2"] = { ammo = 250 }})
                    vRP.giveInventoryItem(user_id,"mochila",3)
                    vRP.giveInventoryItem(user_id,"celular",1)
                    vRP.giveInventoryItem(user_id,"radio",1)
                    vRP.giveInventoryItem(user_id,"compattach",1)
                    vRP.giveInventoryItem(user_id,"energetico",10)
                    delayParceria[user_id] = 900
                    TriggerClientEvent("Notify",source,"sucesso","O seu Kit foi <g>Resgatado</g>!")
                    SendWebhookMessage(webhookkit,"```prolog\n[Kit - Investidor]:\n[ID]: "..user_id.." coletou o Kit Investidor"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não tem o Cargo Investidor!")
            end
        elseif stats == 'especial' then
            if vRP.hasPermission(user_id,"ceo.permissao") then
                vRPclient.giveWeapons(source,{["weapon_pistol_mk2"] = { ammo = 250 }})
                vRPclient.giveWeapons(source,{["weapon_assaultrifle_mk2"] = { ammo = 250 }})
                vRPclient.giveWeapons(source,{["weapon_smg_mk2"] = { ammo = 250 }})
            else
                TriggerClientEvent("Notify",source,"negado","Você não tem o Cargo Investidor!")
            end
        elseif stats == 'set' then
            if args[2] then
                vRPclient.giveWeapons(nsource,{["weapon_pistol_mk2"] = { ammo = 250 }})
                vRP.giveInventoryItem(nsource,"bandagem",3)
                vRP.giveInventoryItem(nsource,"mochila",3)
                vRP.giveInventoryItem(nsource,"radio",1)
                vRP.giveInventoryItem(nsource,"compattach",1)
                vRP.giveInventoryItem(nsource,"cocaina",10)
                vRP.giveInventoryItem(nsource,"maconha",10)
                vRP.giveInventoryItem(nsource,"metanfetamina",10)
                TriggerClientEvent("Notify",source,"sucesso","Você Setou o Kit Inicial no [ID: "..args[2].."]")
                TriggerClientEvent("Notify",nsource,"sucesso","Você recebeu o Kit Inicial do [ID: "..user_id.."]")
                SendWebhookMessage(webhookkit,"```prolog\n[Kit - Set Kit]:\n[ID]: "..user_id.." setou o Kit no [ID]: "..args[2]..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
            else
                TriggerClientEvent("Notify",source,"negado","Comando errado - /kit set [ID]")
            end
        else
            TriggerClientEvent("Notify",source,"negado","Comando errado - /kit [Inicial / investidor / streamer]")
        end
    else
        TriggerClientEvent("Notify",source,"negado","/kit [variavel]")
    end

------------------------------------------------------------------------------------------------------------------
































end)