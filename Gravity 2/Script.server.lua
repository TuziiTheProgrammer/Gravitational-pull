local mov = workspace.MOving_P
local E = workspace.End

local ran = math.random(1, 10)

E.Size = Vector3.new(ran, ran, ran); E.Transparency = 0.7

local function ymxb(x, o2p, o1p)
	return (o2p - o1p)*x + o1p
end

local function gravitationalPull(o1, o2)
	return 9.8* ((o1.Mass*o2.Mass)/ (o1.Position - o2.Position).Magnitude)
end



local co = coroutine.wrap(function()
	while wait() do
		print(math.floor(gravitationalPull(E, mov)))
	end
end)()

for i = 0, 1, 0.01 do
	task.wait()
	local po = ymxb(i, E.Position, mov.Position)
	mov.Position = po
end


