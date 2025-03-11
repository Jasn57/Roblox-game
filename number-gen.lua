local Players = game:GetService("Players")
local secretNumber = math.random(1, 100)
local rewardAmount = 100

print("Guess a number between 1 and 100:")

local function onPlayerAdded(player)
    player.Chatted:Connect(function(message)
        local guess = tonumber(message)

        if guess then
            if guess == secretNumber then
                print("You guessed it!")
                player.leaderstats.Cash.Value = player.leaderstats.Cash.Value + rewardAmount
            else
                print("Wrong! The number was", secretNumber)
            end
 
            secretNumber = math.random(1, 100)
        else
            print("Please enter a valid number.")
        end
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)
