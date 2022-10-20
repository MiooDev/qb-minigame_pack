RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    cb('ok')
end)

function OpenVaultGame(callback, lenght, time)
  Callbackk = callback
	SetNuiFocus(true, true)
	SendNUIMessage({type = "open", lenght = lenght, time = time})
end

RegisterCommand("vaultgame",function(source, args, raw)
    exports['qb-vaultgame']:OpenVaultGame(function(success)
        if success then
            print("success")
        else
            print("failed")
        end
    end, 5, 10)
    -- [lenght] [full time]
end)