local test = workspace.Tetsing
local test2 = workspace.Tetsing2
test2.Size = Vector3.new(5,5,5)


local co = coroutine.wrap(function()
	local i = 1
	while wait(1) do
		i += 1
		test2.CFrame = test2.CFrame * CFrame.new(-i,0,0)
		if (test.Position - test2.Position).Magnitude <= 4 then
			test2:Destroy()
		end
	end
end)()

gc = 9.8

m1 = 4
v1 = 4*4^3
d1 = m1/v1

m2 = 5
v2 = 5*5^3
d1 = m2/v2

local gravitationalpull = Instance.new("Part", test);gravitationalpull.Position = test.Position; gravitationalpull.Size = Vector3.new(m1*gc,m1*gc,m1*gc); gravitationalpull.Anchored = true
gravitationalpull.Shape = Enum.PartType.Ball; gravitationalpull.Transparency = 0.7
gravitationalpull.CanCollide = false
gravitationalpull.Color = Color3.fromRGB(85, 255, 127)



local function gravityFormula(o1, o2)
	local gravity = workspace.Gravity*(m1*m2/(o1.Position - o2.Position).magnitude)
	return gravity
end 

print(math.floor(gravityFormula(test, test2)))








