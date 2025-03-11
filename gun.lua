local tool = script.Parent
local handle = tool:WaitForChild("Handle")


local fireRate = 0.2  
local bulletSpeed = 100
local bulletLifetime = 2  
local bulletDamage = 10  


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
local function fireBullet()
	local bullet = createBullet()
	bullet.CFrame = handle.CFrame * CFrame.new(0, 0, -2)
	bullet.Velocity = handle.CFrame.lookVector * bulletSpeed

	
	bullet.Touched:Connect(function(hit)
		local humanoid = hit.Parent:FindFirstChild("Humanoid")
		if humanoid then
			humanoid:TakeDamage(bulletDamage)
		end
		bullet:Destroy()
	end)

	
	game:GetService("Debris"):AddItem(bullet, bulletLifetime)
end


local canFire = true
tool.Activated:Connect(function()
	if canFire then
		canFire = false
		fireBullet()
		wait(fireRate)
		canFire = true
	end
end)
