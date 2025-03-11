-- Gun Script for Roblox

local tool = script.Parent
local handle = tool:WaitForChild("Handle")  -- The part that the player holds (make sure this part exists)
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()  -- The player's mouse for clicking

-- Settings for the gun
local bulletSpeed = 100  -- The speed of the bullet
local bulletSize = Vector3.new(0.2, 0.2, 1)  -- The size of the bullet
local reloadTime = 0.5  -- Time between shots (in seconds)

local canShoot = true  -- Flag to control shooting state

-- Function to create and shoot the bullet
local function shootBullet()
    if not canShoot then return end  -- If the gun is reloading, don't shoot

    canShoot = false  -- Prevent shooting until reload is done
    
    -- Create the bullet
    local bullet = Instance.new("Part")
    bullet.Size = bulletSize
    bullet.Position = handle.Position  -- Bullet starts at the gun's position
    bullet.Anchored = false
    bullet.CanCollide = true
    bullet.Shape = Enum.PartType.Cylinder
    bullet.BrickColor = BrickColor.new("Bright red")
    bullet.Parent = game.Workspace

    -- Add a BodyVelocity to the bullet for speed
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)  -- Ensuring the bullet moves
    bodyVelocity.Velocity = (mouse.Hit.p - handle.Position).unit * bulletSpeed  -- Velocity towards mouse
    bodyVelocity.Parent = bullet

    -- Cleanup bullet after 5 seconds to prevent clutter
    game.Debris:AddItem(bullet, 5)

    -- Reload the gun after the specified time
    wait(reloadTime)
    canShoot = true
end

-- Detecting the mouse click to shoot
tool.Activated:Connect(shootBullet)
