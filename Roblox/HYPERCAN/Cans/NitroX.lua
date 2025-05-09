local prompt = script.parent:FindFirstChild("ProximityPrompt")

prompt.Triggered:Connect(function(player)
	local leaderstats = player:FindFirstChild("leaderstats")
	if not leaderstats then return end
	local points = leaderstats:FindFirstChild("Monete")
	if not points then return end
	
	if points.Value >= 5 then
		points.Value = points.Value - 5
		local char = player.Character
		if char and char:FindFirstChild("Humanoid") then
			char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed + 5
			
			local obj = script.Parent
			obj.Transparency = 1
			obj.CanCollide = false
			prompt:Destroy()
		end
	else
		warn(player.Name .. " non hai abbastanza monete")
	end
end)