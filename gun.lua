local tool = script.Parent
local handle = tool:WaitForChild("Handle")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local bulletSpeed = 100
local bulletSize = Vector3.new(0.2, 0.2, 1)
local reloadTime = 0.5
local canShoot = true

local function onBulletTouch(hit)
    if hit:IsDescendantOf(player.Character) or hit:IsA("Part") then return end

    if hit.Parent:FindFirstChild("Humanoid") then
        hit.Parent.Humanoid:TakeDamage(10)
    end

    hit:Destroy()
end

local function shootBullet()
    if not canShoot then return end
    canShoot = false

    local bullet = Instance.new("Part")
    bullet.Size = bulletSize
    bullet.Position = handle.Position
    bullet.Shape = Enum.PartType.Cylinder
    bullet.BrickColor = BrickColor.new("Bright red")
    bullet.Anchored = false
    bullet.CanCollide = true
    bullet.Parent = game.Workspace

    bullet.Touched:Connect(onBulletTouch)

    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Velocity = (mouse.Hit.p - handle.Position).unit * bulletSpeed
    bodyVelocity.Parent = bullet

    game.Debris:AddItem(bullet, 5)

    wait(reloadTime)
    canShoot = true
end

tool.Activated:Connect(shootBullet)
