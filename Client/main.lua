

RegisterNetEvent('Knox_HeadBag:Response:HeadBag')
AddEventHandler('Knox_HeadBag:Response:HeadBag', function (response)
    KnoxDev_HeadBag.Table = response
end)

Citizen.CreateThread(function ()
    KnoxDev_HeadBag_Config.Target()
end)

RegisterNetEvent('Knox_HeadBag:Put:HeadBag', function (target)
    if not KnoxDev_HeadBag.HeadBag then
        local t_server = GetPlayerServerId(NetworkGetPlayerIndexFromPed(target.entity))
        if t_server then
            ESX.TriggerServerCallback('Knox_HeadBag:Put:HeadBag', function (done)
            end,t_server)
        end
    end
end)

RegisterNetEvent('Knox_HeadBag:Remove:HeadBag', function (target)
    if not KnoxDev_HeadBag.HeadBag then
        local t_server = GetPlayerServerId(NetworkGetPlayerIndexFromPed(target.entity))
        if t_server then
            ESX.TriggerServerCallback('Knox_HeadBag:Remove:HeadBag', function (done)
            end,t_server)
        end
    end
end)

RegisterNetEvent('Knox_HeadBag:WITH:HeadBag', function ()
    if not KnoxDev_HeadBag.HeadBag then
        KnoxDev_HeadBag.HeadBag = true
        RequestModel(KnoxDev_HeadBag_Config.Model)
        while not HasModelLoaded(KnoxDev_HeadBag_Config.Model) do
          Citizen.Wait(0)
        end

        KnoxDev_HeadBag.IDHeadBag = CreateObject(GetHashKey(KnoxDev_HeadBag_Config.Model), 0, 0, 0, true, true, true)
        AttachEntityToEntity(KnoxDev_HeadBag.IDHeadBag, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
        SetModelAsNoLongerNeeded(KnoxDev_HeadBag.IDHeadBag)
        SendNUIMessage({
            func = "headbag",
            boolean = true
        })
    end
end)

RegisterNetEvent('Knox_HeadBag:WITHOUT:HeadBag', function ()
    if KnoxDev_HeadBag.HeadBag then
        if DoesEntityExist(KnoxDev_HeadBag.IDHeadBag) then
            DeleteEntity(KnoxDev_HeadBag.IDHeadBag)
            KnoxDev_HeadBag.IDHeadBag = nil
        end
        KnoxDev_HeadBag.HeadBag = false
        SendNUIMessage({
            func = "headbag",
            boolean = false
        })
    end
end)

RegisterNetEvent('Knox_HeadBag:NOTIFY:HeadBag', function (msg)
    KnoxDev_HeadBag_Config.Notify(msg)
end)