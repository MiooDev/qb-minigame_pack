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

-- example using

RegisterCommand('minigame1', function()
    exports['qb-computer']:OpenHackingGame(10000, function(success)
        if success then
            print("Success")
        else
            print("Failed")
        end
    end)
end)
