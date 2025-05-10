local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BuyItem = ReplicatedStorage:WaitForChild("BuyItem")

-- Prezzi degli oggetti acquistabili
local ItemPrices = {
	NitroX = 10 -- Il Part si deve chiamare esattamente "NitroX"
}

-- Gestione dell'acquisto
BuyItem.OnServerEvent:Connect(function(player, part)
	if not part or not part:IsA("BasePart") then return end

	local price = ItemPrices[part.Name]
	if not price then return end

	local stats = player:FindFirstChild("leaderstats")
	local coins = stats and stats:FindFirstChild("Hypecoin")
	if not coins then return end

	if coins.Value >= price then
		coins.Value = coins.Value - price
		part:Destroy()
		local char = player.Character
		char.Humanoid.WalkSpeed = char.Humanoid.WalkSpeed + 5
	end
end)
