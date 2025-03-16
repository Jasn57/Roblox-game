local gun = script.Parent
local bulletSpeed = 100
local damage = 25

local function onActivated()
    local player = game.Players:GetPlayerFromCharacter(gun.Parent)
    local mouse = player:GetMouse()
    
    local bullet = Instance.new("Part")
    bullet.Size = Vector3.new(0.2, 0.2, 0.2)
    bullet.Shape = Enum.PartType.Ball
    bullet.Material = Enum.Material.Neon
    bullet.BrickColor = BrickColor.new("Bright yellow")
    bullet.CFrame = gun.CFrame
    bullet.Velocity = (mouse.Hit.p - gun.Position).unit * bulletSpeed
    bullet.CanCollide = false
    bullet.Parent = workspace
    
    bullet.Touched:Connect(function(hit)
        if hit.Parent:FindFirstChild("Humanoid") then
            hit.Parent.Humanoid:TakeDamage(damage)
            bullet:Destroy()
        end
    end)
end

gun.Activated:Connect(onActivated)