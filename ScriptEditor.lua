local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "MobileScriptEditor"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(340, 390)
frame.Position = UDim2.new(0.5, -170, 0.5, -195)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 45)
title.Position = UDim2.fromOffset(10, 5)
title.BackgroundTransparency = 1
title.Text = "MOBILE SCRIPT EDITOR"
title.TextColor3 = Color3.fromRGB(255, 70, 170)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.Parent = frame

local box = Instance.new("TextBox")
box.Size = UDim2.new(1, -30, 0, 230)
box.Position = UDim2.fromOffset(15, 55)
box.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
box.TextColor3 = Color3.fromRGB(235, 235, 235)
box.PlaceholderText = "Type /run hello, /run speed 30, or /run jump 75"
box.Text = ""
box.TextSize = 14
box.Font = Enum.Font.Code
box.TextXAlignment = Enum.TextXAlignment.Left
box.TextYAlignment = Enum.TextYAlignment.Top
box.MultiLine = true
box.ClearTextOnFocus = false
box.Parent = frame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 10)
boxCorner.Parent = box

local run = Instance.new("TextButton")
run.Size = UDim2.fromOffset(145, 45)
run.Position = UDim2.fromOffset(15, 300)
run.Text = "▶ RUN"
run.TextSize = 16
run.Font = Enum.Font.GothamBold
run.TextColor3 = Color3.new(1, 1, 1)
run.BackgroundColor3 = Color3.fromRGB(35, 170, 95)
run.Parent = frame

local clear = Instance.new("TextButton")
clear.Size = UDim2.fromOffset(145, 45)
clear.Position = UDim2.fromOffset(180, 300)
clear.Text = "CLEAR"
clear.TextSize = 16
clear.Font = Enum.Font.GothamBold
clear.TextColor3 = Color3.new(1, 1, 1)
clear.BackgroundColor3 = Color3.fromRGB(170, 55, 70)
clear.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -30, 0, 30)
status.Position = UDim2.fromOffset(15, 350)
status.BackgroundTransparency = 1
status.Text = "Ready"
status.TextColor3 = Color3.fromRGB(120, 220, 150)
status.TextSize = 13
status.Font = Enum.Font.Gotham
status.Parent = frame

local function runCommand(command)
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")

	if command == "/run hello" then
		print("Hello from my Roblox game!")
		status.Text = "Hello executed!"

	elseif command:sub(1, 11) == "/run speed " then
		local value = tonumber(command:sub(12))

		if value and humanoid then
			humanoid.WalkSpeed = math.clamp(value, 0, 100)
			status.Text = "Speed set to " .. value
		else
			status.Text = "Invalid speed"
		end

	elseif command:sub(1, 10) == "/run jump " then
		local value = tonumber(command:sub(11))

		if value and humanoid then
			humanoid.JumpPower = math.clamp(value, 0, 150)
			status.Text = "Jump set to " .. value
		else
			status.Text = "Invalid jump"
		end

	else
		status.Text = "Unknown command"
	end
end

run.MouseButton1Click:Connect(function()
	runCommand(box.Text)
end)

clear.MouseButton1Click:Connect(function()
	box.Text = ""
	status.Text = "Cleared"
end)
