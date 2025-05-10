local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BuyItem = ReplicatedStorage:WaitForChild("BuyItem")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

mouse.Button1Down:Connect(function()
	if mouse.Target and mouse.Target.Name == "NitroX" then
		BuyItem:FireServer(mouse.Target)
	end
end)
