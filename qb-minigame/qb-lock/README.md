# qb-lock
 	QBCore Lockpick Minigame Nopixel Inspired

# Template
exports['qb-lock']:StartLockPickCircle(amount, time, function(success)

	local seconds = math.random(7,10)
	local circles = math.random(2,4)
    local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
    lockpickFinish(success)


# Example useage

RegisterCommand("lpgame", function()
	local time = math.random(7,10)
	local circles = math.random(2,4)
	local success = exports['qb-lock']:StartLockPickCircle(circles, time, success)
	print(success)
	if success then
		print("WIN")
	else
		print("FAIL")
	end
end)
	
# Amount of time to spin and amount of time to trigger are currently held within the js I am trying to export it to lua
# Amount and Time now work, but functioning success now doesn't go over to the export.
# Fixed the Lockpick now ready for use, enjoy!
