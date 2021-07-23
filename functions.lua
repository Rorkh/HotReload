function CheckFiles(path, name, noReload)
	lastUpdates[path] = lastUpdates[path] or {}
	
	local files = cFile:GetFolderContents(path)
	for _, filename in ipairs(files) do
		local last_update = cFile:GetLastModificationTime(path .. "/" .. filename)
		local recorded_update = lastUpdates[path][filename]

		if (last_update and recorded_update) and (last_update > recorded_update) and (not noReload) then
			LOG("Reloading " .. name)

			lastUpdates[path][filename] = last_update
			cPluginManager:Get():ReloadPlugin(name)
			
			return
		end 		

		lastUpdates[path][filename] = last_update
	end
end

function CheckPlugins(noReload)
	cPluginManager:ForEachPlugin(function(plugin)
		local path = "./" .. plugin:GetLocalFolder()
		local name = plugin:GetName()

		if plugin:GetStatus() == cPluginManager.psLoaded then
			CheckFiles(path, name, noReload)			
		end
	end)
end
