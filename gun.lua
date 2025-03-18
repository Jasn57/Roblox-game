local tool = Instance.new("Tool")
tool.Name = "Gun"
tool.RequiresHandle = true

local handle = Instance.new("Part")
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 1)
handle.BrickColor = BrickColor.new("Black")
handle.Parent = tool

tool.Parent = game.Players.LocalPlayer.Backpack

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local shooting = false
local damage = 20
local cooldown = 0.3

local function fireBullet()
	if shooting then
		return
	end

	shooting = true

	local bullet = Instance.new("Part")
	bullet.Size = Vector3.new(0.2, 0.2, 2)
	bullet.Shape = Enum.PartType.Ball
	bullet.BrickColor = BrickColor.new("royal purple")
	bullet.Anchored = false
	bullet.CanCollide = true
	bullet.CFrame = tool.Handle.CFrame * CFrame.new(0, 0, -2)

	bullet.Parent = game.Workspace

	local velocity = Instance.new("BodyVelocity")
	velocity.Velocity = (mouse.Hit.p - bullet.Position).unit * 100
	velocity.Parent = bullet

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
