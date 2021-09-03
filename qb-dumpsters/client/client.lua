local searched = {3423423424}
local canSearch = true
local dumpsters = {218085040, 666561306, -58485588, -206690185, 1511880420, 682791951}
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
AddEventHandler('qb-dumpster:client:eye', function()
    local wait = 1000
    if canSearch then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dumpsterFound = false
        wait = 250
        for i = 1, #dumpsters do
            local dumpster = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, dumpsters[i], false, false, false)
            local dumpPos = GetEntityCoords(dumpster)
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true)


            if dist < 1.8 then
                wait = 1000
                for i = 1, #searched do
                    if searched[i] == dumpster then
                        dumpsterFound = true
                    end
                    if i == #searched and dumpsterFound then
                        QBCore.Functions.Notify('This dumpster has already been searched..', "error")
                    elseif i == #searched and not dumpsterFound then
                        QBCore.Functions.Notify('You begin to search the dumpster..', "success")
                        startSearching(searchTime, 'pixellife:giveDumpsterReward')
                        TriggerServerEvent('pixellife:startDumpsterTimer', dumpster)
                        table.insert(searched, dumpster)
                        Citizen.Wait(1000)
                    end
                end
            end
        end
    end
    Citizen.Wait(wait)
end)

-- Functions
function startSearching(time,cb)
    local ped = PlayerPedId()
    canSearch = false
    TriggerEvent('animations:client:EmoteCommandStart', {Config.CollectingEmoteName})
    exports.rprogress:Start('Checking Dumpster..', 8000)
    TriggerEvent('animations:client:EmoteCommandStart', {"C"}) 
    ClearPedTasks(ped)
    canSearch = true
    TriggerServerEvent(cb)
end