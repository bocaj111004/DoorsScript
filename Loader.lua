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





local repo = "https://raw.githubusercontent.com/bocaj111004/ScriptHub/refs/heads/main/Games/"

local SupportedGames = {
	[0] = {
		GameName = "Doors Lobby",
		Script = "Doors/Lobby.lua"
	}
}

if SupportedGames[game.PlaceId] then

	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = ScriptSettings.ScriptName,
		Text = "Loading script for: " .. SupportedGames[game.PlaceId].GameName .. ".",

	})
	loadstring(game:HttpGet(repo .. SupportedGames[game.PlaceId].Script))
else
	
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = ScriptSettings.ScriptName,
		Text = "The current game is not supported. Loading universal script..",

	})
	loadstring(game:HttpGet(repo .. 'Universal.lua'))
end

