local lowGravity = 50 
local normalGravity = 196.2 

game.Players.PlayerAdded:Connect(function(player)
	
	player.CharacterAdded:Connect(function(character)
		
		game.Workspace.Gravity = lowGravity
	end)
end)

wait(600)  
game.Workspace.Gravity = normalGravity
