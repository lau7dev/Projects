local replicatedStorage = game:GetService("ReplicatedStorage")
local spawnarea = workspace:WaitForChild("SpawnArea1")
local coinTemplate = replicatedStorage:WaitForChild("HypeCoin")

local hypecoin_num = 10 -- Quante monete spawnare

-- Rendi invisibile la parte visibile della SpawnArea
spawnarea.Transparency = 0
spawnarea.CanCollide = true -- La SpawnArea stessa avrà la collisione, per evitare errori nella posizione

-- Funzione per ottenere una posizione casuale dentro l'area
local function getRandomPosition()
	local size = spawnarea.Size
	local position = spawnarea.Position

	local x = position.X + math.random(-size.X/2, size.X/2)
	local y = position.Y + 3 -- sopra il suolo
	local z = position.Z + math.random(-size.Z/2, size.Z/2)

	return Vector3.new(x, y, z)
end

-- Funzione per creare una moneta
local function createCoin()
	local coin = coinTemplate:Clone()
	coin.Position = getRandomPosition()
	coin.Parent = workspace
	coin.CanCollide = false -- La moneta non deve collidere con i giocatori
	coin.Transparency = 0 -- La moneta è visibile

	-- Variabile per evitare il doppio tocco
	local canTouch = true

	coin.Touched:Connect(function(hit)
		if not canTouch then return end

		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		if player then
			local leaderstats = player:FindFirstChild("leaderstats")
			if leaderstats then
				local points = leaderstats:FindFirstChild("Hypecoin")
				if points then
					-- Aggiungi punti
					points.Value = points.Value + 1

					-- Disabilita temporaneamente il tocco e la visibilità della moneta
					canTouch = false
					coin.Transparency = 1
					coin.CanCollide = false

					-- Dopo un breve ritardo, distruggiamo la moneta
					wait(0.5)
					coin:Destroy()

					-- Respawn di una nuova moneta
					wait(0.1) -- Piccola pausa per evitare sovrapposizioni
					createCoin() -- Crea una nuova moneta
				end
			end
		end
	end)
end

-- Crea le monete iniziali
for i = 1, hypecoin_num do 
	createCoin() -- Spawn delle monete iniziali
end
