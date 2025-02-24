local isNotify = false
local actualTime = 0

--[[
    Jak wywołać:
    exports['HeryodPoliceNotify']:SendToNUI('TYTUŁ', 'Treść', 'Kod', { x, y, z}, czyPriorytet, czas w sekundach)
    Przykład:
    exports['HeryodPoliceNotify']:SendToNUI('NAPAD W TOKU', 'Otrzymano zgłoszenie o napadzie na Salon Jubilerski', '10-90', { x = -628.2906, y = -235.1198, z = 38.0571 }, true, 27)
]]

RegisterNetEvent('HeryodPoliceNotify:sendNotification')
AddEventHandler('HeryodPoliceNotify:sendNotification', function(title, content, code, location, isPriority, time)
    isNotify = true
    actualTime = time * 1000
    
    local sendLocation = GetStreetNameFromHashKey(GetStreetNameAtCoord(location.x, location.y, location.z))
    
    SendNUIMessage({
        action = 'update',
        sendTitle = title,
        sendContent = content,
        sendCode = code,
        sendLocation = sendLocation
    })
    
    if isPriority then
        PlayPriorityNotificationSound()
    end
    
    Citizen.Wait(actualTime)
    isNotify = false
end)

function SendToNUI(title, content, code, location, isPriority, time)
    if not isNotify then
        TriggerServerEvent('HeryodPoliceNotify:CheckPolice', title, content, code, location, isPriority, time)
    else
        Citizen.Wait(actualTime)
        TriggerServerEvent('HeryodPoliceNotify:CheckPolice', title, content, code, location, isPriority, time)
    end
end

function PlayPriorityNotificationSound()
    local soundSet = "GTAO_FM_Events_Soundset"
    local sound = "EVENT_START_TEXT"
    
    for _ = 1, 3 do
        PlaySoundFrontend(-1, sound, soundSet, 1)
        Citizen.Wait(100)
    end
    
    Citizen.Wait(1000)
    
    for _ = 1, 3 do
        PlaySoundFrontend(-1, sound, soundSet, 1)
        Citizen.Wait(100)
    end
    
    Citizen.Wait(1000)
    StopSound(-1)
end
