AddEventHandler('esx:playerLoaded', function (pl,xp)
    KnoxDev_HeadBag.Table[pl] = false
    TriggerClientEvent('Knox_HeadBag:Response:HeadBag', xp.source, KnoxDev_HeadBag.Table)
end)

AddEventHandler('playerDropped', function (reason)
    if KnoxDev_HeadBag.Table[source] then
        KnoxDev_HeadBag.Table[source] = false
        TriggerClientEvent('Knox_HeadBag:Response:HeadBag', -1, KnoxDev_HeadBag.Table)
    end
end)

ESX.RegisterServerCallback('Knox_HeadBag:Put:HeadBag', function (source,cb,entity)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(entity)
    if (xPlayer and xTarget) and not KnoxDev_HeadBag.HeadBag then
        if xPlayer.getInventoryItem(KnoxDev_HeadBag_Config.Item).count >= 1 then
            xPlayer.removeInventoryItem(KnoxDev_HeadBag_Config.Item,1)
            KnoxDev_HeadBag.Table[xTarget.source] = true
            TriggerClientEvent('Knox_HeadBag:Response:HeadBag', -1, KnoxDev_HeadBag.Table)
            KnoxDev_HeadBag.TriggerCL('Knox_HeadBag:WITH:HeadBag', xTarget.source)
        else
            KnoxDev_HeadBag.TriggerCL('Knox_HeadBag:NOTIFY:HeadBag', xPlayer.source, KnoxDev_HeadBag_Config.Lang['NO_ITEM'])
        end
    end
end)

ESX.RegisterServerCallback('Knox_HeadBag:Remove:HeadBag', function (source,cb,entity)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xTarget = ESX.GetPlayerFromId(entity)
    if (xPlayer and xTarget) and not KnoxDev_HeadBag.HeadBag then
        xPlayer.addInventoryItem(KnoxDev_HeadBag_Config.Item,1)
        KnoxDev_HeadBag.Table[xTarget.source] = false
        TriggerClientEvent('Knox_HeadBag:Response:HeadBag', -1, KnoxDev_HeadBag.Table)
        KnoxDev_HeadBag.TriggerCL('Knox_HeadBag:WITHOUT:HeadBag', xTarget.source)
    end
end)