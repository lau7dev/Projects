game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player	
	
	local points = Instance.new("IntValue")
	points.Name = "Monete"
	points.Value = 0
	points.Parent = leaderstats
end)