local Players = game:GetService("Players")

local PlayerObject = {}
PlayerObject.__index = PlayerObject

-- Table to store player objects
local playerObjects = {}

function PlayerObject.new(player: Player)
	local self = setmetatable({}, PlayerObject)
	self.playerData = playerData.new(player)
	self.player = player
	return self
end

function PlayerObject:getPlayer()
	return self.player
end


-- Connect to PlayerAdded event to create a PlayerObject for each player
Players.PlayerAdded:Connect(function(player)
	playerObjects[player] = PlayerObject.new(player)
end)

-- Optionally, handle PlayerRemoving to clean up
Players.PlayerRemoving:Connect(function(player)
	playerObjects[player] = nil
end)

return PlayerObject
