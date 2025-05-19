local Settings = getgenv()._Settings

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Character = Player.Character
local ScriptName = Settings.ScriptName
local notif = true
local notifvolume = 3
local espfadetime = 0.5
local pingid = "4590657391"
local scriptlink = "loadstring(game:HttpGet('https://raw.githubusercontent.com/bocaj111004/ScriptHub/refs/heads/main/Loader.lua'))()"
local OtherLinora = false
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

local repo = 'https://raw.githubusercontent.com/bocaj111004/Linora/refs/heads/main/'
local ESPLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/ESPLibrary/refs/heads/main/main.lua"))()
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local NotificationCustom1 = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

if getgenv().Library == nil then
	local LibraryLoadstring = loadstring(game:HttpGet(repo .. "Library.lua"))()
end
local NotifyType = "Linora"
local Library = getgenv().Library
local function Notify(notifytable)
	local reason = nil
	if notifytable.Reason then
		reason = " "..notifytable.Reason
	else
		reason = ""
	end
	if NotifyType == "Linora" then
		if Library.NotifySide == "Left" then
			Library:Notify(notifytable.Title .. " | "..notifytable.Description .. reason,10)
		else
			Library:Notify(notifytable.Description .. reason .. " | "..notifytable.Title,10)
		end


	elseif NotifyType == "STX" then
		NotificationCustom1:Notify(
			{Title = string.upper(notifytable.Title), Description = notifytable.Description.."\n"..reason},
			{OutlineColor = Color3.fromRGB(80, 80, 80),Time = 12, Type = "default"}
		)
	end
end
local function Sound()
	if notif == true then
		local sound = Instance.new("Sound")
		sound.Volume = notifvolume
		sound.Parent = game.ReplicatedStorage
		sound:Play()
		sound.SoundId = "rbxassetid://"..pingid
		sound.Ended:Wait()
		sound:Destroy()
	end
end
if getgenv()[Settings.genvAddress] ~= true then

	


		getgenv()[Settings.genvAddress] = true
	
local Characters = {}
local num = 0
for i,child in pairs(game.Workspace:GetChildren()) do
	if game.Players:GetPlayerFromCharacter(child) then
		table.insert(Characters,child)
		child:SetAttribute("CharNum",num)
		num = num + 1
		child.Destroying:Connect(function()			
			table.remove(Characters, child:GetAttribute("CharNum"))
			child:SetAttribute("ESP",false)
		end)
	end
end 
game.Workspace.ChildAdded:Connect(function(child)
	wait(0.1)
	if game.Players:GetPlayerFromCharacter(child) then
		table.insert(Characters,child)
		child:SetAttribute("CharNum",num)
		num = num + 1
		child.Destroying:Connect(function()

			table.remove(Characters, child:GetAttribute("CharNum"))
			child:SetAttribute("ESP",false)
		end)		
	end

end)
local flyspeed = 3
local noclip = false
local fly = {
	enabled = false,
	flyBody = Instance.new("BodyVelocity"),
	flygyro = Instance.new("BodyGyro"),

}

fly.flyBody.Velocity = Vector3.zero
fly.flyBody.Name = "FlyVelocity"
fly.flyBody.MaxForce = Vector3.one * 9e9
fly.flygyro.P = 30000
fly.flygyro.MaxTorque = Vector3.one * 9e9


local function u2()
	local Camera = game.Workspace.CurrentCamera
	local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

	if Humanoid.MoveDirection == Vector3.new(0, 0, 0) then

		return Humanoid.MoveDirection

	else


	end
	local v12 = (Camera.CFrame * CFrame.new((CFrame.new(Camera.CFrame.p, Camera.CFrame.p + Vector3.new(Camera.CFrame.lookVector.x, 0, Camera.CFrame.lookVector.z)):VectorToObjectSpace(Humanoid.MoveDirection)))).p - Camera.CFrame.p;
	if v12 == Vector3.new() then
		return v12
	end
	return v12.unit
end
		local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
		local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local sp = 16
local fb = false
local jp = 50
local NoAcceleration = false
local jumpheight = false
local FlyMethod = "Normal"
local AntiRagdoll = false
local ot = 0
local AntiBan = false
ESPLibrary:SetFillTransparency(0.75)
	ESPLibrary:SetTextSize(20)
local textweight = ""
local View = false
local ViewPlayer = ""
local rainbow = false
local dist = false
local players = false
local Color = Color3.fromRGB(255,255,255)
local highlight = true
local tracers = false
local tt = 0
local oc = Color3.fromRGB(222,222,222)
local flex = false
local flexspeed = 0.25
local textfont = "RobotoCondensed"
local function esp(Target,TracerTarget,Text, ColorText, shoulddestroy, ismonster)


			ESPLibrary:AddESP({
				Object = Target,
				Text = Text,
				Color = ColorText
			})
			
			Target.Destroying:Connect(function()
				ESPLibrary:RemoveObject(Target)
			end)


end
		local CommandInProgress = false
		Player.CharacterAdded:Connect(function(char)
			task.wait()
			Character = char
			Humanoid = char:WaitForChild("Humanoid")
			CommandInProgress = false
		end)


local infjump = false
local Window = Library:CreateWindow({
	Title = ScriptName.." - Universal",
	Center = true,
	AutoShow = true,
	TabPadding = 3,
	MenuFadeTime = 0
})
local Tabs = {
	-- Creates a new tab titled Main
	Main = Window:AddTab('Main'),
Visuals = Window:AddTab('Visuals'),
['UI Settings'] = Window:AddTab('Configs'),
}
local ESP = Tabs.Visuals:AddLeftGroupbox('ESP')
local LeftGroupBox6 = Tabs.Visuals:AddRightGroupbox('Notifactions')


local LeftGroupBox2 = Tabs.Main:AddLeftGroupbox('General')
local Visual = Tabs.Main:AddRightGroupbox('Visual')
		local Anti = Tabs.Main:AddRightGroupbox('Disallow')
		LeftGroupBox6:AddToggle('PlayerAdded', {
			Text = 'Player Join',
			Default = false, -- Default value (true / false)
			Tooltip = nil, -- Information shown when you hover over the toggle

			
		});
		LeftGroupBox6:AddToggle('PlayerRemoved', {
			Text = 'Player Leave',
			Default = false, -- Default value (true / false)
			Tooltip = nil, -- Information shown when you hover over the toggle

			
		});
		LeftGroupBox6:AddDivider()
		LeftGroupBox6:AddToggle('notif', {
			Text = 'Play Sound',
			Default = true, -- Default value (true / false)
			Tooltip = 'Play a ping sound, alerting you to notifications', -- Information shown when you hover over the toggle

			Callback = function(Value)
				notif = Value
			end
		});
		local pingtype = "New"

		LeftGroupBox6:AddDropdown('Dropdown9', {
			Values = {'New','Old','Custom'},
			Default = 2, -- number index of the value / string
			Multi = false, -- true / false, allows multiple choices to be selected

			Text = 'Ping Sound',
			Tooltip = nil, -- Information shown when you hover over the dropdown

			Callback = function(Value)
				pingtype = Value
				if Value == "New" then
					pingid = 4590662766
				elseif Value == "Old" then
					pingid = 4590657391
				else
					pingid = pingidcustom
				end
			end
		})
		
		LeftGroupBox6:AddDivider()
		LeftGroupBox6:AddInput('PingID', {
			Default = '',
			Numeric = true, -- true / false, only allows numbers
			Finished = false, -- true / false, only calls callback when you press enter

			Text = 'Custom Sound ID',
			Tooltip = nil, -- Information shown when you hover over the textbox

			Placeholder = 'Enter Sound ID Here', -- placeholder text when the box is empty
			-- MaxLength is also an option which is the max length of the text

			Callback = function(Value)
				pingidcustom = Value
				if pingtype == "Custom" then
					pingid = pingidcustom
				end
			end
		})
		LeftGroupBox6:AddSlider('AlertVolume', {
			Text = 'Sound Volume',
			Default = 3.0,
			Min = 0.5,
			Max = 5.0,
			Rounding = 1,
			Compact = false,

			Callback = function(Value)
				notifvolume = Value

			end
		})

		LeftGroupBox6:AddDropdown('Dropdown1', {
			Values = {'Linora','STX'},
			Default = 1, -- number index of the value / string
			Multi = false, -- true / false, allows multiple choices to be selected

			Text = 'Notification Style',
			Tooltip = nil, -- Information shown when you hover over the dropdown

			Callback = function(Value)
				NotifyType = Value
			end
		})
		LeftGroupBox6:AddDropdown('Dropdown2', {
			Values = {'Left','Right'},
			Default = (if Library.IsMobile then 2 else 1), -- number index of the value / string
			Multi = false, -- true / false, allows multiple choices to be selected

			Text = 'Linora Notification Side',
			Tooltip = nil, -- Information shown when you hover over the dropdown

			Callback = function(Value)
				Library.NotifySide = Value
			end
		})
		LeftGroupBox6:AddButton({
			Text = 'Test Notification',
			Func = function()
				Notify({Title = "Test Notification",Description = "This is a test notification."})
				Sound()
			end,
			DoubleClick = false,
			Tooltip = nil
		})

Visual:AddToggle('View', {
	Text = 'View Player',
	Default = false, -- Default value (true / false)
	Tooltip = "Spectate", -- Information shown when you hover over the toggle

	Callback = function(Value)
		View = Value
		if Value == false then
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
		end
	end
})
Visual:AddDropdown('ViewPlayerSelector', {
	SpecialType = 'Player',
	Default = 0, -- number index of the value / string\
	Multi = false, -- true / false, allows multiple choices to be selected

	Text = 'Select Player',
	Tooltip = nil, -- Information shown when you hover over the dropdown

	Callback = function(Value)
		ViewPlayer = Value
	end
})
		for i,part in pairs(game.Workspace:GetDescendants()) do
			if part:IsA("BasePart") then

				part:SetAttribute("OriginalTouch",part.CanTouch)
			end
		end
Anti:AddToggle('DisallowTouching', {
	Text = 'Disallow Touching',
	Default = false, -- Default value (true / false)
	Tooltip = "Prevents your Character from triggering .Touched events", -- Information shown when you hover over the toggle

	Callback = function(Value)
		AntiBan = Value
	
			for i,part in pairs(game.Workspace:GetDescendants()) do
						if part:IsA("BasePart") then
							
						if Value == true then
							part.CanTouch = false
						else
							part.CanTouch = part:GetAttribute("OriginalTouch") or true
						end
						end
			end
		end
		
		}):AddKeyPicker('DisallowTouchingKeybind', {


	Default = 'V', -- String as the name of the keybind (MB1, MB2 for mouse buttons)
	SyncToggleState = true,


	-- You can define custom Modes but I have never had a use for it.
	Mode = 'Toggle', -- Modes: Always, Toggle, Hold

	Text = 'Disallow Touching', -- Text to display in the keybind menu
	NoUI = false, -- Set to true if you want to hide from the Keybind menu,

	-- Occurs when the keybind is clicked, Value is `true`/`false`
	Callback = function(Value)
		Value = Value

	end,

	-- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
	ChangedCallback = function(New)
	end
})
	Anti:AddToggle('AntiSit', {
					Text = 'Disallow Sitting',
					Default = false, -- Default value (true / false)
					Tooltip = "Prevents you from sitting.", -- Information shown when you hover over the toggle

					
				})

LeftGroupBox2:AddSlider('WS', {
	Text = 'Walkspeed',
	Default = 16,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		sp = Value

	end
})
LeftGroupBox2:AddToggle('WalkSpeed', {
	Text = 'Enable Walkspeed',
	Default = false, -- Default value (true / false)
	Tooltip = "Enable Speed Hack", -- Information shown when you hover over the toggle

	Callback = function(Value)
		walkspeed = Value
		if Value == false then
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
		end
	end
})

LeftGroupBox2:AddSlider('WS', {
	Text = 'Jump Power',
	Default = 50,
	Min = 0,
	Max = 500,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
		jp = Value

	end
})
LeftGroupBox2:AddToggle('Jump Power', {
	Text = 'Enable Jump Power',
	Default = false, -- Default value (true / false)
	Tooltip = "Enable Jump Hack", -- Information shown when you hover over the toggle

	Callback = function(Value)
		jumppower = Value
		if Value == false then
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = 50
		end
	end
})LeftGroupBox2:AddDivider()

local Ambient = game:GetService("Lighting").Ambient

LeftGroupBox2:AddToggle('Toggle1', {
	Text = 'Fullbright',
	Default = false, -- Default value (true / false)
	Tooltip = 'See in the dark', -- Information shown when you hover over the toggle

	Callback = function(Value)
		fb = Value
	end
})
AnimationId = "179224234"
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://"..AnimationId
local v = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
	v = char.Humanoid:LoadAnimation(Anim)
end)


LeftGroupBox2:AddToggle('Toggle25', {
	Text = 'Noclip',
	Default = false, -- Default value (true / false)
	Tooltip = 'Walk though walls', -- Information shown when you hover over the toggle

	Callback = function(Value)
		noclip = Value
		
	end
}):AddKeyPicker('Keybind3', {


	Default = 'N', -- String as the name of the keybind (MB1, MB2 for mouse buttons)
	SyncToggleState = true,


	-- You can define custom Modes but I have never had a use for it.
	Mode = 'Toggle', -- Modes: Always, Toggle, Hold

	Text = 'Noclip', -- Text to display in the keybind menu
	NoUI = false, -- Set to true if you want to hide from the Keybind menu,

	-- Occurs when the keybind is clicked, Value is `true`/`false`
	Callback = function(Value)

	end,

	-- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
	ChangedCallback = function(New)
	end
})
LeftGroupBox2:AddToggle('Toggle999999', {
	Text = 'Infinite Jump',
	Default = false, -- Default value (true / false)
	Tooltip = 'Infinite Jumps', -- Information shown when you hover over the toggle

	Callback = function(Value)
		infjump = Value
	end
})
LeftGroupBox2:AddToggle('ToggleNoAcceleration', {
	Text = 'No Acceleration',
	Default = false, -- Default value (true / false)
	Tooltip = 'No sliding at high speeds', -- Information shown when you hover over the toggle

	Cllback = function(Value)
	NoAcceleration = Value
	if Value == true then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = nil
		end
	end
})
LeftGroupBox2:AddDivider()
local AntiFallPart = nil
local AntiFallConnection = nil
Anti:AddToggle('Togglenf', {
	Text = 'No Falling',
	Default = false, -- Default value (true / false)
	Tooltip = 'Never be able to fall lower than the set position', -- Information shown when you hover over the toggle

	Callback = function(Value)

		if Value == true then

			local Part = Instance.new("Part")
			Part.Size = Vector3.new(10,1,10)
			Part.Transparency = 1
			Part.Parent = game.Workspace
			Part.Anchored = true
			AntiFallPart = Part
			local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			AntiFallConnection = game["Run Service"].RenderStepped:Connect(function()
				Part.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,(pos.Y - 3.5),game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
			end)
		else
			if AntiFallPart ~= nil then
				AntiFallPart:Destroy()
			end
			if AntiFallConnection ~= nil then
				AntiFallConnection:Disconnect()
			end

		end
	end
}):AddKeyPicker('Keybind8', {


	Default = 'X', -- String as the name of the keybind (MB1, MB2 for mouse buttons)
	SyncToggleState = true,


	-- You can define custom Modes but I have never had a use for it.
	Mode = 'Toggle', -- Modes: Always, Toggle, Hold

	Text = 'Anti Fall', -- Text to display in the keybind menu
	NoUI = false, -- Set to true if you want to hide from the Keybind menu,

	-- Occurs when the keybind is clicked, Value is `true`/`false`
	Callback = function(Value)
		Value = Value

	end,

	-- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
	ChangedCallback = function(New)
	end
})

LeftGroupBox2:AddDivider()
LeftGroupBox2:AddToggle('Toggle111', {
	Text = 'Fly',
	Default = false, -- Default value (true / false)
	Tooltip = 'Fly freely around the map', -- Information shown when you hover over the toggle

	Callback = function(Value)
		fly.enabled = Value
		if Value == true then

			fly.flyBody.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
			fly.flygyro.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		else
			fly.flyBody.Parent = nil
			fly.flygyro.Parent = nil
			if FlyMethod == "Normal" then
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
			wait(0.1)
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.GettingUp)

end

		end
	end
}):AddKeyPicker('Keybind9', {


	Default = 'F', -- String as the name of the keybind (MB1, MB2 for mouse buttons)
	SyncToggleState = true,


	-- You can define custom Modes but I have never had a use for it.
	Mode = 'Toggle', -- Modes: Always, Toggle, Hold

	Text = 'Fly', -- Text to display in the keybind menu
	NoUI = false, -- Set to true if you want to hide from the Keybind menu,

	-- Occurs when the keybind is clicked, Value is `true`/`false`
	Callback = function(Value)
		Value = Value

	end,

	-- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
	ChangedCallback = function(New)
	end
})
LeftGroupBox2:AddSlider('Slider9', {
	Text = 'Fly Speed',
	Default = 3,
	Min = 1,
	Max = 50,
	Rounding = 1,
	Compact = false,

	Callback = function(Value)
		flyspeed = Value

	end
})



LeftGroupBox2:AddDropdown('FlyMethod', {
	Values = {'Normal','Vehicle'},
	Default = 1, -- number index of the value / string\
	Multi = false, -- true / false, allows multiple choices to be selected

	Text = 'Fly Type',
	Tooltip = nil, -- Information shown when you hover over the dropdown

	Callback = function(Value)
		FlyMethod = Value
	end
})
ESP:AddToggle('Toggle125', {
	Text = 'Players',
	Default = false, -- Default value (true / false)
	Tooltip = nil, -- Information shown when you hover over the toggle

	Callback = function(Value)
		players = Value
		for i,char in pairs(game.Workspace:GetChildren()) do
			if game.Players:GetPlayerFromCharacter(char) then
				if char:FindFirstChild("HumanoidRootPart") and game.Players:GetPlayerFromCharacter(char) ~= game.Players.LocalPlayer then
					if players == true then

						esp(char, char.HumanoidRootPart, game.Players:GetPlayerFromCharacter(char).DisplayName .. " [@"..game.Players:GetPlayerFromCharacter(char).Name.."]",playercolor,false,false)


					else
						char:SetAttribute("ESP",false)
					end
				end
			end
		end

	end
})
		
		

Toggles.Toggle125:AddColorPicker('ColorPicker1', {
	Default = Color3.new(1, 1, 1), -- Bright green
	Title = 'Players', -- Optional. Allows you to have a custom color picker title (when you open it)
	Transparency = 0, -- Optional. Enables transparency changing for this color picker (leave as nil to disable)

	Callback = function(Value)
		playercolor = Value
	end
})
		
ESP:AddDivider()
ESP:AddSlider('Slider3', {
	Text = 'Fill Transparency',
	Default = 0.75,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
		ESPLibrary:SetFillTransparency(Value)

	end
})
ESP:AddSlider('Slider4', {
	Text = 'Outline Transparency',
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
			ESPLibrary:SetOutlineTransparency(Value)

	end
})
ESP:AddSlider('Slider5', {
	Text = 'Text Transparency',
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Compact = false,

	Callback = function(Value)
			ESPLibrary:SetTextTransparency(Value)

	end
})
ESP:AddSlider('Slider5', {
	Text = 'Text Size',
	Default = 18,
	Min = 10,
	Max = 100,
	Rounding = 0,
	Compact = false,

	Callback = function(Value)
			ESPLibrary:SetTextSize(Value)

	end
})
	ESP:AddDropdown("ESPFont", { Values = { "Arial", "SourceSans", "Highway","FredokaOne", "Fantasy", "Gotham", "DenkOne", "JosefinSans", "Nunito", "Oswald", "RobotoCondensed", "Sarpanch", "Ubuntu" }, Default = 10, Multi = false, Text = "Text Font", Callback = function(Value) ESPLibrary:SetFont(Value) end})
ESP:AddDivider()
ESP:AddToggle('Toggle21', {
	Text = 'Rainbow ESP',
	Default = false, -- Default value (true / false)
	Tooltip = nil, -- Information shown when you hover over the toggle

	Callback = function(Value)
			ESPLibrary:SetRainbow(Value)
	end
})
ESP:AddDivider()
ESP:AddToggle('Toggle778', {
	Text = 'Match Colors',
	Default = true, -- Default value (true / false)
	Tooltip = nil, -- Information shown when you hover over the toggle

	Callback = function(Value)
		ESPLibrary:SetMatchColors(Value)
	end
})

ESP:AddToggle('Toggle105', {
	Text = 'Show Distance',
	Default = false, -- Default value (true / false)
	Tooltip = nil, -- Information shown when you hover over the toggle

	Callback = function(Value)
		ESPLibrary:SetShowDistance(Value)
	end
})
ESP:AddDivider()
ESP:AddToggle('Toggle5', {
	Text = 'Tracers',
	Default = false, -- Default value (true / false)
	Tooltip = nil, -- Information shown when you hover over the toggle

	Callback = function(Value)
			ESPLibrary:SetTracers(Value)
	end
})
ESP:AddDropdown('Dropdown5', {
	Values = {'Bottom','Top','Center','Mouse'},
	Default = 1, -- number index of the value / string\
	Multi = false, -- true / false, allows multiple choices to be selected

	Text = 'Tracer Start Position',
	Tooltip = nil, -- Information shown when you hover over the dropdown

	Callback = function(Value)
			ESPLibrary:SetTracerOrigin(Value)
	end
})
local Trolling = Tabs.Main:AddRightGroupbox('Trolling')
Trolling:AddDropdown('FlingPlayer',{
	Default = 0,
	SpecialType = "Player",
	Multi = false,
	Text = "Select Player",
	Tooltip = 'Select the player to fling'
	
	
})
local Commands = {}
local flingDied = false
function Commands:Fling()
			local Connections = {}
			flinging = false
			for _, child in pairs(Character:GetDescendants()) do
				if child:IsA("BasePart") then
					child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
				end
			end
			
			wait(.1)
			local bambam = Instance.new("BodyAngularVelocity")
			bambam.Name = "test"
			bambam.Parent = Character.HumanoidRootPart
			bambam.AngularVelocity = Vector3.new(0,99999,0)
			bambam.MaxTorque = Vector3.new(0,math.huge,0)
			bambam.P = math.huge
			local Char = Character:GetChildren()
			for i, v in next, Char do
				if v:IsA("BasePart") then
					v.CanCollide = false
					v.Massless = true
					v.Velocity = Vector3.new(0, 0, 0)
				end
			end
			flinging = true
			local function flingDiedF()
				Commands:Unfling()
			end
			flingDied = Character:FindFirstChildOfClass('Humanoid').Died:Connect(flingDiedF)
		Connections.FlingConnection = RunService.RenderStepped:Connect(function()
				bambam.AngularVelocity = Vector3.new(0,99999,0)
				wait(.2)
				bambam.AngularVelocity = Vector3.new(0,0,0)
				wait(.1)
		if flinging == false then
			Connections.FlingConnection:Disconnect()
		end	
		end)
end
		function Commands:Unfling()

			if flingDied then
				flingDied:Disconnect()
			end
			flinging = false
			wait(.1)
			local speakerChar = Character
			if not Character then return end
			for i,v in pairs(Character:GetDescendants()) do
				if v:IsA("BodyAngularVelocity")then
					v:Destroy()
				end
			end
			for _, child in pairs(speakerChar:GetDescendants()) do
				if child.ClassName == "Part" or child.ClassName == "MeshPart" then
					child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
				
				end
			end
		end
Trolling:AddButton({
	Text = "Fling Selected Player",
	Tooltip = 'Flings the selected player, killing them',
	Doubleclick = false,
	Func = function()
		local oldcframe = Character.HumanoidRootPart.CFrame
local value = Toggles.Toggle25.Value
Toggles.Toggle25:SetValue(true)
Commands:Fling()
		for i = 1,150,1 do
			local TargetCharacter = game.Players:FindFirstChild(Options.FlingPlayer.Value).Character
			if TargetCharacter then
				
				Character.HumanoidRootPart.CFrame = TargetCharacter.HumanoidRootPart.CFrame
						
				
			end
			task.wait()
		end
				Commands:Unfling()
		task.wait(1)
				Toggles.Toggle25:SetValue(value)
		for i = 1,100,1 do
		Humanoid.PlatformStand = false
		Character.HumanoidRootPart.CFrame = oldcframe
		task.wait()
		end
		
		
	end,
	
})
Library:SetWatermarkVisibility(false)

-- Example of dynamically-updating watermark with common traits (fps and ping)
local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
	FrameCounter += 1;

	if (tick() - FrameTimer) >= 1 then
		FPS = FrameCounter;
		FrameTimer = tick();
		FrameCounter = 0;
	end;

	Library:SetWatermark((''..ScriptName..' | %s fps | %s ms'):format(
		math.floor(FPS),
		math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
		));
end);

Library.KeybindFrame.Visible = false; -- todo: add a function for this

Library:OnUnload(function()
	WatermarkConnection:Disconnect()

	print('Unloaded!')
	Library.Unloaded = true
end)

-- UI Settings
		local MenuGroup = Tabs["UI Settings"]:AddRightTabbox('Menu')
		local MenuSettings = MenuGroup:AddTab("Settings")
		local Contributors = MenuGroup:AddTab('Developers')

		-- I set NoUI so it does not show up in the keybinds menu

		MenuSettings:AddToggle('KeybindMenu', {
			Text = 'Show Keybind Menu',
			Default = false, -- Default value (true / false)
			Tooltip = nil, -- Information shown when you hover over the toggle

			Callback = function(Value)
				Library.KeybindFrame.Visible = Value
			end

		})
		MenuSettings:AddToggle('KeepOnTeleport', {
			Text = 'Auto Execute',
			Default = false, -- Default value (true / false)
			Tooltip = nil, -- Information shown when you hover over the toggle,
			Callback = function(Value)
				if Value == true then
					queue_on_teleport(scriptlink)
				else
					queue_on_teleport("print('Auto Execute Cancelled')")
				end
			end,



		})
		Library.ShowCustomCursor = false

		MenuSettings:AddToggle("ShowStats", {
			Text = "Show Performance Stats",
			Default = false,
			Callback = function(value) Library:SetWatermarkVisibility(value) end
		})
		MenuSettings:AddToggle("CustomCursor", {
			Text = "Show Custom Cursor",
			Default = false,
			Callback = function(value) Library.ShowCustomCursor = value end
		})
		
		MenuSettings:AddLabel('Menu Keybind'):AddKeyPicker('MenuKeybind', { Default = 'RightControl', NoUI = true, Text = 'Menu Keybind'})


		Contributors:AddLabel('Developers:',true)
		Contributors:AddLabel("Jacob Irish - Creator",true)
		
		

		Library.ToggleKeybind = Options.MenuKeybind
		

		NotifyType = "Linora"

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()



ThemeManager:SetFolder("JSHubThemes")
SaveManager:SetFolder("JSHubBrookhavenConfigs")

ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:BuildConfigSection(Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()
local PlayerConnection1 = Players.PlayerAdded:Connect(function(NewPlayer)
	if Toggles.PlayerAdded.Value then
		Notify({Title = "Players",Description = NewPlayer.Name .. " has joined the server."})
		Sound()
	end
end)
		local PlayerConnection2 = Players.PlayerRemoving:Connect(function(NewPlayer)
			if Toggles.PlayerRemoved.Value then
				Notify({Title = "Players",Description = NewPlayer.Name .. " has left the server."})
				Sound()
			end
		end)
local Connection4 = game:GetService("UserInputService").JumpRequest:Connect(function()
	if infjump == true then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)
local Connection3 = game.Workspace.ChildAdded:Connect(function(char)
	wait(0.1)
	if game.Players:GetPlayerFromCharacter(char) then
		if char:FindFirstChild("HumanoidRootPart") and players == true and game.Players:GetPlayerFromCharacter(char) ~= game.Players.LocalPlayer then

			esp(char, char.HumanoidRootPart, game.Players:GetPlayerFromCharacter(char).DisplayName .. " [@"..game.Players:GetPlayerFromCharacter(char).Name.."]",playercolor,false,false)

		end
	end
end)
local Connection2 = game.Workspace.DescendantAdded:Connect(function(part)
	if part:IsA("BasePart") and Toggles.DisallowTouching.Value then
	
		part.CanTouch = false
	end
	
end)
local Connection1 = game["Run Service"].RenderStepped:Connect(function()
	local v
	local camera = game.Workspace.CurrentCamera
	local userInputService = game:GetService("UserInputService")

	if noclip == true then
		 for i,part in pairs(Character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
		 end
	else
		Character.HumanoidRootPart.CanCollide = true
	end
	if Toggles.AntiSit.Value then
		Humanoid.Sit = false
	end
	if fly.enabled == true then
		local velocity = Vector3.zero

		velocity = u2()
	if FlyMethod == "Normal" then
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
	else
			game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
	end
		fly.flyBody.Velocity = velocity * (flyspeed * 10)


	else



	end
if View == true then
		if game.Players:FindFirstChild(ViewPlayer).Character then
	game.Workspace.CurrentCamera.CameraSubject = game.Players:FindFirstChild(ViewPlayer).Character.Humanoid
	end
else
	game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end
	if AntiRagdoll == true and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")

		if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") then


			if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") ~= fly.flyBody then

				for i,part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if part:IsA("Part") and part.Name ~= "HumanoidRootPart" then
						part.Anchored = true

					end
				end

			end		
		end

		if hum:GetState() == Enum.HumanoidStateType.FallingDown or hum.Sit == true then

			for i,part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if part:IsA("Part") and part.Name ~= "HumanoidRootPart" then
					part.Anchored = true
				end
			end


		end	



		if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity") and hum.Sit == false and hum:GetState() ~= Enum.HumanoidStateType.FallingDown then


			for i,part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if part:IsA("Part") and part.Name ~= "HumanoidRootPart" then
					task.wait(1)
					part.Anchored = false

				end
			end


		end
	end
	if AntiRagdoll == false then

		for i,part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if part:IsA("Part") and part.Name ~= "HumanoidRootPart" then
				part.Anchored = false

			end
		end


	end
	if NoAcceleration == true then
		for i,part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if part:IsA("Part") then
				part.CustomPhysicalProperties = nil
			end
		end
	
	end
	if walkspeed == true then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = sp
	end
	if jumppower == true then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = jp
	end
	fly.flygyro.CFrame = game.Workspace.Camera.CFrame
	if fb == true  then
		local lighting = game:GetService("Lighting")
		lighting.Ambient = Color3.fromRGB(255, 255, 255)
	elseif fb == false then
		local lighting = game:GetService("Lighting")
		lighting.Ambient = Ambient
	end
end)

		RainbowTable = {
			HueSetup = 0,
			Hue = 0,
			Step = 0,
			Color = Color3.new(),
			Enabled = false,


		}
		game["Run Service"].RenderStepped:Connect(function(Delta)
			
			RainbowTable.Step = RainbowTable.Step + Delta

			if RainbowTable.Step >= (1 / 60) then
				RainbowTable.Step = 0

				RainbowTable.HueSetup = RainbowTable.HueSetup + (1 / 400);
				if RainbowTable.HueSetup > 1 then RainbowTable.HueSetup = 0; end;
				RainbowTable.Hue = RainbowTable.HueSetup;
				RainbowTable.Color = Color3.fromHSV(RainbowTable.Hue, 0.8, 1);
				Color = RainbowTable.Color

			end
		end)
		local Unloading = false
		function Unload()
			if Unloading == false then
				Unloading = true

				Notify({Title = "Info",Description = "Unloading "..ScriptName.."..."})
				Sound()
				Connection1:Disconnect()
				Connection2:Disconnect()
				Connection3:Disconnect()
			
				Connection4:Disconnect()
				PlayerConnection1:Disconnect()
				PlayerConnection2:Disconnect()
				fly.flyBody:Destroy()
				fly.flygyro:Destroy()
				if AntiFallConnection then
				AntiFallConnection:Disconnect()
				if AntiFallPart then
				AntiFallPart:Destroy()
				end
				end
				

				game.Lighting.Ambient = Ambient
				for i,ui in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
					if ui.Name == "Tracers" then
						ui:Destroy()
					end

				end
				for i,inst in pairs(game.Workspace:GetDescendants()) do
					inst:SetAttribute("ESP",false)
					game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
					if inst:GetAttribute("OriginalTouch") then
						inst.CanTouch = inst:GetAttribute("OriginalTouch")
					end



				end
				
				
				task.wait(3)
				Notify({Title = "Info",Description = "Unloading complete.",Reason = "The GUI will terminate momentarily."})
				Sound()
				task.wait(3)
				Humanoid.WalkSpeed = 15
				Library:Unload()
				Library = nil
				getgenv().Library = nil
				getgenv().Toggles = nil
				getgenv().Options = nil
				getgenv().JSHUB = false

			else
				Notify({Title = "Error",Description = ScriptName .. " is already unloading."})	
				Sound()
			end
		end	
		MenuSettings:AddDivider()
		MenuSettings:AddButton('Unload', function() Unload() end)
	


else
	getgenv().Library:Notify(ScriptName .. " Initialisation | ".."Another script using Linora has been detected. Please unload it to use "..ScriptName..".")
	Sound()
		getgenv()[Settings.genvAddress] = false
end
