
local wins = 0
local minNumber = 1
local maxNumber = 100
local targetNumber = math.random(minNumber, 
local function handleGuess(input)
    local playerGuess = tonumber(input)
    if playerGuess then
        if playerGuess == targetNumber then
            wins = wins + 1
            print("Correct! You have " .. wins .. " wins.")
       
            targetNumber = math.random(minNumber, maxNumber)
        else
            print("Wrong! The correct number was " .. targetNumber)
  
            targetNumber = math.random(minNumber, maxNumber)
        end
    else
        print("Please enter a valid number.")
    end
end

script.Parent.MouseButton1Click:Connect(function()
    local playerInput = script.Parent.Parent:FindFirstChild("TextBox").Text
    handleGuess(playerInput)
end)

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0.5, -100, 0.5, -25)
textBox.Parent = script.Parent.Parent
