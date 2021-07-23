PLUGIN = nil

lastUpdates = {}

function Initialize(Plugin)
	Plugin:SetName("HotReload")
	Plugin:SetVersion(1)
	
	cPluginManager.AddHook(cPluginManager.HOOK_TICK, OnTick)

	LOG("HotReload plugin v." .. Plugin:GetVersion() .. " was loaded")
	CheckPlugins(true)

	return true
end

function OnDisable()
	LOG("Shutting down...")
end
