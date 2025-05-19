local Settings = {
 ScriptName = "Jacob's Epic Script",
 genvAddress = "JES"
}

if getgenv()[Settings.genvAddress] then
 game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = Settings.ScriptName,
		Text = "Script has already been executed.",

	})
 return

 getgenv()[Settings.genvAddress] = true


