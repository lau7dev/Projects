local coin = script.Parent
local canTouch = true

coin.Touched:Connect(function(hit)
	if not canTouch then return end
	
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		local leaderstats = player:FindFirstChild("leaderstats")
		if leaderstats then
			local points = leaderstats:FindFirstChild("Monete")
			if points then
				points.Value = points.Value + 1
			end
		end
		-- despawn e respawn della moneta
		canTouch = false
		coin.Transparency = 1
		coin.CanCollide = false
		wait(2)
		coin.Transparency = 0
		coin.CanCollide = true
		canTouch = true
	end
end)