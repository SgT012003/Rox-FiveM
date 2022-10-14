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
------------------------------------------------- Delay Setup ----------------------------------------------------
RegisterCommand('kit',function(source,args,rawCommand)

    local auth = 0
    local cmd1 = args[1]
    local cmd2 = args[2]

    local user_id = vRP.getUserId(source)
    local nuser_id = parseInt(args[2])

    local nsource = vRP.getUserSource(nuser_id)

    if vRP.hasPermission(user_id,"streamer.permissao") or vRP.hasPermission(user_id,"investidor.permissao") or vRP.hasPermission(user_id,"parceria.permissao") then
    auth = 1
    end

    if auth == 0 then
        TriggerClientEvent("Notify",source,"negado","Você não tem acesso a esse comando!")
        return
    end

    if auth >= 1 then
        if args[1] then
            -- kit streamer
            if cmd1 == 'streamer' then
                if vRP.hasPermission(user_id,"streamer.permissao") or auth > 1 then
                    if auth > 1 then
                        TriggerServerEvent('kit',source,user_id)
                    end
                    if auth == 1 then
                        TriggerServerEvent('delaystreamer',source,user_id)
                    end
                else
                    if vRP.hasPermission(user_id,"investidor.permissao") then
                        TriggerClientEvent("Notify",source,"negado","Você não tem acesso a esse kit, tente [ /kit investidor ]!")
                    end
                    if vRP.hasPermission(user_id,"parceria.permissao") then
                        TriggerClientEvent("Notify",source,"negado","Você não tem acesso a esse kit, tente [ /kit parceria ]!")
                    end
                end
            end
            -- kit investidor
            if cmd1 == 'investidor' then
                if vRP.hasPermission(user_id,"investidor.permissao") or auth > 1 then
                    if auth > 1
                        TriggerServerEvent('kit',source,user_id)
                    end
                    if auth == 1 then
                        TriggerServerEvent('delayinvestidor',source,user_id)
                    end
                else
                    if vRP.hasPermission(user_id,"streamer.permissao") then
                        TriggerClientEvent("Notify",source,"negado","Você não tem acesso a esse kit, tente [ /kit streamer ]!")
                    end
                    if vRP.hasPermission(user_id,"parceria.permissao") then
                        TriggerClientEvent("Notify",source,"negado","Você não tem acesso a esse kit, tente [ /kit parceria ]!")
                    end
                end
            end
            -- kit parceria
            if cmd1 == 'parceria' then
                if vRP.hasPermission(user_id,"parceria.permissao") or auth > 1 then
                    if auth > 1
                        TriggerServerEvent('kit',source,user_id)
                    end
                    if auth == 1 then
                        TriggerServerEvent('delayparceria',source,user_id)
                    end
                else
                    if vRP.hasPermission(user_id,"streamer.permissao") then
                        TriggerClientEvent("Notify",source,"negado","Você não tem acesso a esse kit, tente [ /kit streamer ]!")
                    end
                    if vRP.hasPermission(user_id,"investidor.permissao") then
                        TriggerClientEvent("Notify",source,"negado","Você não tem acesso a esse kit, tente [ /kit investidor ]!")
                    end
                end
            end

            -- Sem acesso | inexistente
            if cmd1 ~= 'streamer' or cmd1 ~= 'investidor' or cmd1 ~= 'parceria' then
                TriggerClientEvent("Notify",source,"negado","Erro, esse kit não existe [ /kit "..arg[1].." ]")
                return
            end
        else
            TriggerClientEvent("Notify",source,"negado","Erro, comando invalido [ /kit <value> ]")
            return
        end
    end
    if auth > 1 then
        if args[1] then
            if cmd1 == 'set' then
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
                    TriggerClientEvent("Notify",source,"negado","Erro, comando invalido [ /kit set <value> ]")
                end
            end
            if cmd1 == 'especial' then
                vRPclient.giveWeapons(source,{["weapon_pistol_mk2"] = { ammo = 250 }})
                vRPclient.giveWeapons(source,{["weapon_assaultrifle_mk2"] = { ammo = 250 }})
                vRPclient.giveWeapons(source,{["weapon_smg_mk2"] = { ammo = 250 }})
            end
        else
            TriggerClientEvent("Notify",source,"negado","Erro, comando invalido [ /kit <value> ]")
            return
        end
    end
end)

RegisterServerEvent("delaystreamer")
AddEventHandler("delaystreamer",function(source,user_id)
    if delayStreamer[user_id] == nil then
        delayStreamer[user_id] = 0
    end
    if delayStreamer[user_id] > 0 then
        TriggerClientEvent("Notify",source,"negado","Falta "..delayStreamer[user_id].." segundos até o proximo Kit Streamer!")
    else
        TriggerServerEvent('kit',source,user_id)
        delayStreamer[user_id] = 900
    end
end)

RegisterServerEvent("delayinvestidor")
AddEventHandler("delayinvestidor",function(source,user_id)
    if delayInvestidor[user_id] == nil then
        delayInvestidor[user_id] = 0
    end
    if delayInvestidor[user_id] > 0 then
        TriggerClientEvent("Notify",source,"negado","Falta "..delayInvestidor[user_id].." segundos até o proximo Kit Investidor!")
    else
        TriggerServerEvent('kit',source,user_id)
        delayInvestidor[user_id] = 900
    end
end)

RegisterServerEvent("delayparceria")
AddEventHandler("delayparceria",function(source,user_id)
    if delayParceria[user_id] == nil then
        delayParceria[user_id] = 0
    end
    if delayParceria[user_id] > 0 then
        TriggerClientEvent("Notify",source,"negado","Falta "..delayParceria[user_id].." segundos até o proximo Kit Parceria!")
    else
        TriggerServerEvent('kit',source,user_id)
        delayParceria[user_id] = 900
    end
end)

RegisterServerEvent("kit")
AddEventHandler("kit",function(source,user_id)
    vRPclient.giveWeapons(source,{["weapon_pistol_mk2"] = { ammo = 250 }})
    vRP.giveInventoryItem(user_id,"mochila",3)
    vRP.giveInventoryItem(user_id,"celular",1)
    vRP.giveInventoryItem(user_id,"radio",1)
    vRP.giveInventoryItem(user_id,"compattach",1)
    vRP.giveInventoryItem(user_id,"energetico",10)
    TriggerClientEvent("Notify",source,"sucesso","O seu Kit foi <g>Resgatado</g>!")
end)