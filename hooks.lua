local countdown = UpdatePeriod

function OnTick()
	countdown = countdown - 1

	if countdown == 0 then
		countdown = UpdatePeriod
		CheckPlugins()

		return
	end
end
