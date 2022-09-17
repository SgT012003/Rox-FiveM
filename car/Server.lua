-----------------------------------------------------------------------------------------------------------------------------------------
-- DELAY
-----------------------------------------------------------------------------------------------------------------------------------------
local cardelay = {}

CreateThread(function()
    while true do
        for k,v in pairs(cardelay) do
            if v > 0 then
                cardelay[k] = v - 1
            end
        end
        Wait(1000)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('car',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local perms = false
    local auth = 0

    if vRP.hasPermission(user_id, "investidor.permissao") or vRP.hasPermission(user_id, "streamer.permissao") then
        auth = 1
    end
    if vRP.hasPermission(user_id, "suporte.permissao") then
        auth = 2
    end
    if vRP.hasPermission(user_id, "mod.permissao") then
        auth = 3
    end
    if vRP.hasPermission(user_id, "admin.permissao") then
        auth = 4
    end
    if vRP.hasPermission(user_id, "ceo.permissao") then
        auth = 5
    end

    if auth == 0 then
        TriggerClientEvent("Notify",source,"negado","você nao tem permissao para usar esse comando!")
        return
    end

    if goddelay[user_id] == nil then
        goddelay[user_id] = 0;
    end
    -----------------
    -- Car Policia --
    -----------------

    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id, "paisanapolicia.permissao") or vRP.hasPermission(user_id, "policiaacao.permissao") or vRP.hasPermission(user_id, "policia.permissao") then 
        if args[1] == "wrcontender" or args[1] == "WRCONTENDER" then
            perms = true
        end
        if args[1] == "wrcypher" or args[1] == "WRCYPHER" then
            perms = true
        end
        if args[1] == "wrafricat" or args[1] == "WRAFRICAT" then
            perms = true
        end
        if args[1] == "wrdubsta3" or args[1] == "WRDUBSTA3" then
            perms = true
        end
        if args[1] == "wrtailgater2" or args[1] == "WRATILGATER2" then
            perms = true
        end
        if args[1] == "wrmesa" or args[1] == "WRMESA" then
            perms = true
        end
        if args[1] == "wrjugular" or args[1] == "WRJUGULAR" then
            perms = true
        end
        if args[1] == "wrbmwm4" or args[1] == "WRBMWM4" then
            perms = true
        end
        if args[1] == "expolmav" or args[1] == "EXPOLMAV" then
            perms = true
        end
        if args[1] == "pbus" or args[1] == "PBUS" then
            perms = true
        end
    else
        TriggerClientEvent("Notify",source,"negado","Você nao tem permissao para puxar o carro "..args[1].." por não trabalhar na R.P.D!")
    end

    --------------------
    -- Carros Normais --
    --------------------
    if args[1] == "adder" then
        perms = true
    end
    if args[1] == "alpha" then
        perms = true
    end
    if args[1] == "baller5" then
        perms = true
    end
    if args[1] == "baller6" then
        perms = true
    end
    if args[1] == "bifta" then
        perms = true
    end
    if args[1] == "blista" then
        perms = true
    end
    if args[1] == "brioso" then
        perms = true
    end
    if args[1] == "carbonizzare" then
        perms = true
    end
    if args[1] == "cheburek" then
        perms = true
    end
    if args[1] == "elegy" then
        perms = true
    end
    if args[1] == "entity2" then
        perms = true
    end
    if args[1] == "faction3" then
        perms = true
    end
    if args[1] == "gb200" then
        perms = true
    end
    if args[1] == "gp1" then
        perms = true
    end
    if args[1] == "guardian" then
        perms = true
    end
    if args[1] == "issi2" then
        perms = true
    end
    if args[1] == "italigtb" then
        perms = true
    end
    if args[1] == "jester" then
        perms = true
    end
    if args[1] == "osiris" then
        perms = true
    end
    if args[1] == "panto" then
        perms = true
    end
    if args[1] == "retinue" then
        perms = true
    end
    if args[1] == "rhapsody" then
        perms = true
    end
    if args[1] == "sandking" then
        perms = true
    end
    if args[1] == "sandking2" then
        perms = true
    end
    if args[1] == "sentinel3" then
        perms = true
    end
    if args[1] == "seven70" then
        perms = true
    end
    if args[1] == "surfer" then
        perms = true
    end
    if args[1] == "t20" then
        perms = true
    end
    if args[1] == "tempesta" then
        perms = true
    end
    if args[1] == "toros" then
        perms = true
    end
    if args[1] == "windsor" then
        perms = true
    end
    if args[1] == "xa21" then
        perms = true
    end
    if args[1] == "xls2" then
        perms = true
    end
    if args[1] == "zentorno" then
        perms = true
    end
    if args[1] == "akuma" then
        perms = true
    end
    if args[1] == "bati" then
        perms = true
    end
    if args[1] == "bati2" then
        perms = true
    end
    if args[1] == "bf400" then
        perms = true
    end
    if args[1] == "double" then
        perms = true
    end
    if args[1] == "enduro" then
        perms = true
    end
    if args[1] == "faggio" then
        perms = true
    end
    if args[1] == "faggio2" then
        perms = true
    end
    if args[1] == "hakuchou" then
        perms = true
    end
    if args[1] == "sanchez" then
        perms = true
    end
    if args[1] == "sanchez2" then
        perms = true
    end
    if args[1] == "jugular" then
        perms = true
    end
    if args[1] == "sultan2" then
        perms = true
    end
    if args[1] == "furia" then
        perms = true
    end
    if args[1] == "rebla" then
        perms = true
    end
    if args[1] == "bmwm3f80" then
        perms = true
    end
    if args[1] == "veto2" then
        perms = true
    end
    if args[1] == "veto" then
        perms = true
    end
    if args[1] == "bmwm4gts" then
        perms = true
    end
    if args[1] == "outlaw" then
        perms = true
    end
    if args[1] == "h2carb" then
        perms = true
    end
    if args[1] == "hotknife" then
        perms = true
    end
    if args[1] == "toyotasupra" then
        perms = true
    end
    if args[1] == "issi3" then
        perms = true
    end
    if args[1] == "rallytruck" then
        perms = true
    end
    if args[1] == "kuruma" then
        perms = true
    end
    if args[1] == "r1" then
        perms = true
    end
    if args[1] == "mercedesgt63s" then
        perms = true
    end
    if args[1] == "a45amg" then
        perms = true
    end
    if args[1] == "amarok" then
        perms = true
    end
    if args[1] == "bnr34" then
        perms = true
    end
    if args[1] == "civictyper" then
        perms = true
    end
    if args[1] == "gol" then
        perms = true
    end
    if args[1] == "golf75r" then
        perms = true
    end
    if args[1] == "lamborghinihuracan" then
        perms = true
    end
    if args[1] == "lancerevolutionx" then
        perms = true
    end
    if args[1] == "mazdarx7" then
        perms = true
    end
    if args[1] == "nissangtr" then
        perms = true
    end
    if args[1] == "teslaprior" then
        perms = true
    end
    if args[1] == "up" then
        perms = true
    end
    if args[1] == "20xmax" then
        perms = true
    end
    if args[1] == "africat" then
        perms = true
    end
    if args[1] == "audirs6" then
        perms = true
    end
    if args[1] == "f800" then
        perms = true
    end
    if args[1] == "hcbr17" then
        perms = true
    end
    if args[1] == "mobi" then
        perms = true
    end
    if args[1] == "s1000rr" then
        perms = true
    end
    if args[1] == "xj6" then
        perms = true
    end
    if args[1] == "golfgti7" then
        perms = true
    end
    if args[1] == "jettagli" then
        perms = true
    end

    --------------------------------------
    -- command car execution auth 1 - 3 --
    --------------------------------------
    if auth <= 3 then
        if goddelay[user_id] > 0 then
            TriggerClientEvent('Notify',source,'negado','Aguarde <b>'..goddelay[user_id]..'</b> segundos para utilizar esse comando.')
            return
        else
            if perms == true then
                TriggerClientEvent('spawnarveiculo',source,args[1])
                TriggerClientEvent("Notify",source,"sucesso","O Veiculo "..args[1].." foi spawnado com sucesso!")
                SendWebhookMessage(webhookcarro,"```[Car Spawn]\n[ID]: "..user_id.."\n[Car]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                cardelay[user_id] = 120
                return
            else
                TriggerClientEvent("Notify",source,"negado","O Veiculo "..args[1].." não esta na WhiteList ou foi escrito errado!")
                return
            end
        end
    end

    --------------------------------------
    -- command car execution auth 4 - 5 --
    --------------------------------------

    if auth <= 5 then

        ------------------------------------------------
        --   Car Exeptions   --   args[1] == "riot"   --
        ------------------------------------------------

        if args[1] == "riot" then
            perms = true
        end

    -----------------------
    -- command execution --
    -----------------------

        if perms == true then
            TriggerClientEvent('spawnarveiculo',source,args[1])
            TriggerClientEvent("Notify",source,"sucesso","O Veiculo "..args[1].." foi spawnado com sucesso!")
            SendWebhookMessage(webhookcarro,"```[Car Spawn]\n[ID]: "..user_id.."\n[Car]: "..(args[1]).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
            return
        else
            TriggerClientEvent("Notify",source,"negado","O Veiculo "..args[1].." não esta na WhiteList ou foi escrito errado! [Auth Level "..auth.."]")
            return
        end
    end
end)