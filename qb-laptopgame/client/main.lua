local IsHacking = false

AddEventHandler('open:minigame', function(callback)
    Callbackk = callback
    openHack()
end)

function OpenHackingGame(callback)
    Callbackk = callback
    openHack()
end

RegisterNUICallback('callback', function(data, cb)
    closeHack()
    Callbackk(data.success)
    cb('ok')
end)

function openHack()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "open"
    })
    IsHacking = true
end

function closeHack()
    SetNuiFocus(false, false)
    IsHacking = false
end

function GetHackingStatus()
    return IsHacking
end

RegisterCommand("laptopgame",function()
    exports['qb-laptopgame']:OpenHackingGame(20, 5, 5, function(Success)
        print(Success)
        if Success then
            print("1")
        else
            print("2")
        end
    end)
end)
