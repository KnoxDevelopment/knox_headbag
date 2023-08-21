KnoxDev_HeadBag_Config = {}

KnoxDev_HeadBag_Config.Item = 'sacchetto'

KnoxDev_HeadBag_Config.Model = 'prop_money_bag_01'


KnoxDev_HeadBag_Config.Target = function ()
    local options = {
        {
            name = 'Knox_HeadBag:Put:HeadBag',
            event = 'Knox_HeadBag:Put:HeadBag',
            icon = 'fa-solid fa-mask',
            label = KnoxDev_HeadBag_Config.Lang['Put_HeadBag'],
            canInteract = function (entity, distance, coords, name, bone)
                local entity = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                if not KnoxDev_HeadBag.Table[entity] then
                    return entity
                end
            end
        },
        {
            name = 'Knox_HeadBag:Remove:HeadBag',
            event = 'Knox_HeadBag:Remove:HeadBag',
            icon = 'fa-solid fa-mask',
            label = KnoxDev_HeadBag_Config.Lang['Remove_HeadBag'],
            canInteract = function (entity, distance, coords, name, bone)
                local entity = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                if KnoxDev_HeadBag.Table[entity] then
                    return entity
                end
            end
        },
    }

    exports.ox_target:addGlobalPlayer(options)
end

KnoxDev_HeadBag_Config.Notify = function (msg) 
    ESX.ShowNotification(msg)
end

KnoxDev_HeadBag_Config.Lang = {
    ['Put_HeadBag'] = 'Put HeadBag',
    ['Remove_HeadBag'] = 'Remove HeadBag',
    ['NO_ITEM'] = 'You do not have the item headbag'
}