local searched = {3423423424}
local canSearch = true
local searchTime = 14000

RegisterNetEvent('pixellife:removeDumpster')
AddEventHandler('pixellife:removeDumpster', function(object)
    for i = 1, #searched do
        if searched[i] == object then
            table.remove(searched, i)
        end
    end
end)

RegisterNetEvent('qb-dumpster:client:eye')
AddEventHandler('qb-dumpster:client:eye', function(data)
    local dumpsterFound = false
    if canSearch then
        for i = 1, #searched do 
            if searched[i] == data.entity then 
                dumpsterFound = true 
            end 
            if i == #searched and dumpsterFound then 
                QBCore.Functions.Notify('This dumpster has already been searched..', "error") 
            elseif i == #searched and not dumpsterFound then 
                QBCore.Functions.Notify('You begin to search the dumpster..', "success") 
                startSearching(searchTime, 'pixellife:giveDumpsterReward') 
                TriggerServerEvent('pixellife:startDumpsterTimer', data.entity) 
                table.insert(searched, data.entity) 
            end 
        end
    end
end)

-- Functions
function startSearching(time,cb)
    canSearch = false
    TriggerEvent('animations:client:EmoteCommandStart', {Config.CollectingEmoteName})
    exports.rprogress:Start('Checking Dumpster..', 8000)
    TriggerEvent('animations:client:EmoteCommandStart', {"C"}) 
    ClearPedTasks(PlayerPedId())
    canSearch = true
    TriggerServerEvent(cb)
end
