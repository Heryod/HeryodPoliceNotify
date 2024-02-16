local isNotify = false
local acctualTime = 0

--[[
    Jak wywołać:
    exports['HeryodPoliceNotify']:SendToNUI('TYTUŁ', 'Treść', 'Kod', { x, y, z}, czyPriorytet, czas w sekundach) przykład:
    exports['HeryodPoliceNotify']:SendToNUI('NAPAD W TOKU', 'Otrzymano zgłoszenie o napadzie na Salon Jubilerski', '10-90', { x = -628.2906, y = -235.1198, z = 38.0571 }, true, 27)
]]

RegisterNetEvent('HeryodPoliceNotify:sendNotification')
AddEventHandler('HeryodPoliceNotify:sendNotification', function(title, content, code, location, isPriority, time)
    isNotify = true
    local sendTitle = title
    local sendContent = content
    local sendCode = code
    local sendLocation = GetStreetNameAtCoord(location.x, location.y, location.z)
    sendLocation = GetStreetNameFromHashKey(sendLocation)
    local time = time * 1000
    acctualTime = time

    SendNUIMessage({
        action = 'update',
        sendTitle = title,
        sendContent = content,
        sendCode = code,
        sendLocation = sendLocation
    })
    
    if isPriority == true then
        PlaySoundFrontend(-1, "EVENT_START_TEXT", "GTAO_FM_Events_Soundset", 1)
        Citizen.Wait(100)
        PlaySoundFrontend(-1, "EVENT_START_TEXT", "GTAO_FM_Events_Soundset", 1)
        Citizen.Wait(100)
        PlaySoundFrontend(-1, "EVENT_START_TEXT", "GTAO_FM_Events_Soundset", 1)
        Citizen.Wait(1000)
        PlaySoundFrontend(-1, "EVENT_START_TEXT", "GTAO_FM_Events_Soundset", 1)
        Citizen.Wait(100)
        PlaySoundFrontend(-1, "EVENT_START_TEXT", "GTAO_FM_Events_Soundset", 1)
        Citizen.Wait(100)
        PlaySoundFrontend(-1, "EVENT_START_TEXT", "GTAO_FM_Events_Soundset", 1)
        Citizen.Wait(1000)
        StopSound(-1)
    end

    Citizen.Wait(time)
    isNotify = false
    isPriority = false 
end)

function SendToNUI(title, content, code, location, isPriority, time)
    if isNotify == false then
        TriggerServerEvent('HeryodPoliceNotify:CheckPolice', title, content, code, location, isPriority, time)
    else 
        Citizen.Wait(acctualTime)
        TriggerServerEvent('HeryodPoliceNotify:CheckPolice', title, content, code, location, isPriority, time)
    end
end
