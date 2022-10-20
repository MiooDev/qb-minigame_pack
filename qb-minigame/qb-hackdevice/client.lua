RegisterNUICallback('callback', function(data, cb)
	SetNuiFocus(false, false)
    Callbackk(data.success)
    cb('ok')
end)

function OpenDevice(callback, target, time)
    Callbackk = callback
	SetNuiFocus(true, true)
	SendNUIMessage({type = "open", target = target, time = time})
end

-- /hack [target count] [seconds]
RegisterCommand("mio-hackdevice",function(source, args, raw)
    exports['qb-hackdevice']:OpenDevice(function(success)
        if success then
            print("success")
        else
            print("failed")
        end
    end, 'numberic', 40)
end)