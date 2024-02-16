ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('HeryodPoliceNotify:CheckPolice')
AddEventHandler('HeryodPoliceNotify:CheckPolice', function(title, content, code, location, isPriority, time)
    local players = ESX.GetPlayers()
    print('test')

    for i=1, #players do
        local player = players[i]
        local xPlayer = ESX.GetPlayerFromId(player)

        if xPlayer.job.name == 'police' then
            local sendTitle = title
            local sendContent = content
            local sendCode = code
            

            TriggerClientEvent('HeryodPoliceNotify:sendNotification', player, sendTitle, sendContent, sendCode, location, isPriority, time)

            if priority then
                TriggerClientEvent('HeryodPoliceNotify:playPrioritySound', player)
            end
        end
    end
end)