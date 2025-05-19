local ScriptSettings = {
 ScriptName = "Jacob's Epic Script",
 genvAddress = "JES"
}

getgenv()["_Settings"] = Settings

if getgenv()[ScriptSettings.genvAddress] == true then
 
	
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = ScriptSettings.ScriptName,
		Text = "Script has already been executed.",

	})
 return

 getgenv()[ScriptSettings.genvAddress] = true

	local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer.Character then
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = ScriptSettings.ScriptName,
		Text = "Script is waiting for the game to load.",

	})
		while not LocalPlayer.Character do
		task.wait()
	end
		game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = ScriptSettings.ScriptName,
		Text = "Script is now loading.",

	})
	end


