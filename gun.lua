-- GunScript inside the Gun tool

local tool = script.Parent
local handle = tool:WaitForChild("Handle")

-- Configuration
local fireRate = 0.2  -- Time between shots
local bulletSpeed = 100  -- Speed of the bullet
local bulletLifetime = 2  -- How long the bullet lasts
local bulletDamage = 10  -- Damage dealt by the bullet

-- Function to create a bullet
local function createBullet()
    local bullet = Instance.new("Part")
    bullet.Size = Vector3.new(0.2, 0.2, 2)
    bullet.BrickColor = BrickColor.new("Bright red")
    bullet.Material = Enum.Material.Neon
    bullet.Anchored = false
    bullet.CanCollide = false
    bullet.Parent = workspace
    return bullet
end

-- Function to fire a bullet
local function fireBullet()
    local bullet = createBullet()
    bullet.CFrame = handle.CFrame * CFrame.new(0, 0, -2)
    bullet.Velocity = handle.CFrame.lookVector * bulletSpeed

    -- Handle bullet collision and damage
    bullet.Touched:Connect(function(hit)
        local humanoid = hit.Parent:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:TakeDamage(bulletDamage)
        end
        bullet:Destroy()
    end)

    -- Destroy bullet after its lifetime
    game:GetService("Debris"):AddItem(bullet, bulletLifetime)
end

-- Fire bullets when the tool is activated
local canFire = true
tool.Activated:Connect(function()
    if canFire then
        canFire = false
        fireBullet()
        wait(fireRate)
        canFire = true
    end
end)
