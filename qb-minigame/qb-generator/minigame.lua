RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    cb('ok')
end)

function OpenHackingGame(speed, callback)
    Callbackk = callback
	SetNuiFocus(true, true)
	SendNUIMessage({
        action = "openminigame",
        speed = speed
    })
end

RegisterCommand('minigame2', function()
    exports['qb-generator']:OpenHackingGame(10000, function(success)
        if success then
            print("Success")
        else
            print("Failed")
        end
    end)
end)
