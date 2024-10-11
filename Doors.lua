local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "ScareCrow | Doors", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local VisualsTab = Window:MakeTab({
	Name = "Visuals",
	Icon = "nil",
	PremiumOnly = false
})


local CF = CFrame.new
local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart

local KeyChams = {}
VisualsTab:AddToggle({
	Name = "Key Chams",
	Default = false,
    Flag = "KeyToggle",
    Save = true,
	Callback = function(Value)
		for i,v in pairs(KeyChams) do
            v.Enabled = Value
        end
	end    
})

local function ApplyKeyChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
    Cham.Parent = game:GetService("CoreGui")
    Cham.Adornee = inst
    Cham.Enabled = OrionLib.Flags["KeyToggle"].Value
    Cham.RobloxLocked = true
    return Cham
end

local KeyCoroutine = coroutine.create(function()
    workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
        if inst.Name == "KeyObtain" then
            table.insert(KeyChams,ApplyKeyChams(inst))
        end
    end)
end)
for i,v in ipairs(workspace:GetDescendants()) do
    if v.Name == "KeyObtain" then
        table.insert(KeyChams,ApplyKeyChams(v))
    end
end
coroutine.resume(KeyCoroutine)
local Tab = Window:MakeTab({
	Name = "player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "give crucifix",
	Callback = function()
      		print("button pressed")


_G.Uses = 414141414141
_G.Range = 30
_G.OnAnything = true
_G.Fail = false
_G.Variant = "Electric"
loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
  	end    
})
Tab:AddButton({
	Name = "third person",
	Callback = function()
      		print("button pressed")

loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/refs/heads/main/ThirdPersonHatFix.lua"))()
end    
})
Tab:AddButton({
	Name = "scanner",
	Callback = function()
      		print("button pressed")

loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/refs/heads/main/Scanner.lua"))()
end    
})
Tab:AddButton({
	Name = "seek gun",
	Callback = function()
      		print("button pressed")

loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/refs/heads/main/seekgun.lua"))()
end    
})
Tab:AddButton({
	Name = "RocketLuancher",
	Callback = function()
      		print("button pressed")

loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/rocketLauncher.lua"))()
end    
})
