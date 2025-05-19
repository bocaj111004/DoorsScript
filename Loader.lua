local ScriptSettings = {
	ScriptName = "Jacob's Epic Script",
	genvAddress = "JES"
}

getgenv()["_Settings"] = ScriptSettings

if getgenv()[ScriptSettings.genvAddress] then


	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = ScriptSettings.ScriptName,
		Text = "Script has already been executed.",

	})
	return
		
end

		getgenv()[ScriptSettings.genvAddress] = true

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	if LocalPlayer.Character == nil then
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = ScriptSettings.ScriptName,
			Text = "Script is waiting for the game to load.",

		})
		while LocalPlayer.Character == nil do
			task.wait()
		end
	task.wait(1)	
	end
	

	
		game:GetService("StarterGui"):SetCore("SendNotification",{
			Title = ScriptSettings.ScriptName,
			Text = "Script is now loading.",

		})
		
local repo = "https://raw.githubusercontent.com/bocaj111004/ScriptHub/refs/heads/main/Games/Universal.lua"

local SupportedGames = {
	[0] = {
		GameName = "Doors Lobby",
		Script = "Doors/Lobby.lua"
	}
}

if not SupportedGames[game.PlaceId] then
	loadstring(game:HttpGet(repo .. 'Universal.lua'))
end
	


