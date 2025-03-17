local tool = script.Parent 
local player = game.Players.LocalPlayer 
local mouse = player:GetMouse() 
local shooting = false  
local damage = 20 
local cooldown = 0.5 

local function fireBullet()
    if shooting then
        return 
    end
    
    shooting = true
    
    local bullet = Instance.new("Part")
    bullet.Size = Vector3.new(0.2, 0.2, 2) 
    bullet.Shape = Enum.PartType.Ball
    bullet.Color = Color3.fromRGB(255, 0, 0) 
    bullet.Anchored = false
    bullet.CanCollide = true
    bullet.Position = tool.Handle.Position + tool.Handle.CFrame.LookVector
    
    bullet.Parent = game.Workspace

    local velocity = (mouse.Hit.p - bullet.Position).unit * 100 
    bullet.Velocity = velocity
    
    bullet.Touched:Connect(function(hit)
        
        if hit.Parent:FindFirstChild("Humanoid") then
            local humanoid = hit.Parent:FindFirstChild("Humanoid")
            if humanoid then
                humanoid:TakeDamage(damage) 
            end
        end
        bullet:Destroy()
    end)

    wait(cooldown)
    shooting = false
end

tool.Activated:Connect(fireBullet)
