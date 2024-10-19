local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local noclip = false
local fullbrightEnabled = false

local function toggleNoclip()
    noclip = not noclip
    if noclip then
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    else
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

local function makeInvisible()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.Transparency = 1
            if part:IsA("Decal") or part:IsA("SurfaceGui") or part:IsA("ParticleEmitter") then
                part.Enabled = false
            end
        elseif part:IsA("Accessory") then
            part.Handle.Transparency = 1
        end
    end
end

local function makeVisible()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            part.Transparency = 0
            if part:IsA("Decal") or part:IsA("SurfaceGui") or part:IsA("ParticleEmitter") then
                part.Enabled = true
            end
        elseif part:IsA("Accessory") then
            part.Handle.Transparency = 0
        end
    end
end

local function setMapColor(color)
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Color = color
        elseif part:IsA("MeshPart") then
            part.Color = color
        end
    end
end

local function highlightAllPlayers()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player then
            local char = plr.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        local highlight = Instance.new("SelectionBox")
                        highlight.Adornee = part
                        highlight.Parent = part
                    end
                end
            end
        end
    end
end

local function giveBTools()
    local backpack = player:WaitForChild("Backpack")

    local toolNames = {"Clone", "Delete", "Grab", "Move"}
    for _, toolName in ipairs(toolNames) do
        local tool = Instance.new("HopperBin")
        tool.BinType = Enum.BinType[toolName]
        tool.Name = toolName .. " Tool"
        tool.Parent = backpack
    end
end

local function toggleFullbright()
    fullbrightEnabled = not fullbrightEnabled
    for _, light in pairs(workspace:GetDescendants()) do
        if light:IsA("PointLight") or light:IsA("SpotLight") or light:IsA("SurfaceLight") then
            light.Enabled = not fullbrightEnabled
        end
    end
    if fullbrightEnabled then
        game.Lighting.Brightness = 50 -- Set brightness to 50
    else
        game.Lighting.Brightness = 1 -- Default brightness level
    end
end

local function onChatMessage(message)
    local lowerMessage = message:lower()
    if lowerMessage == ":noclip" then
        toggleNoclip()
    elseif lowerMessage == ":unnoclip" then
        if noclip then
            toggleNoclip()
        end
    elseif lowerMessage == ":fly" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    elseif lowerMessage == ":invisible" then
        makeInvisible()
    elseif lowerMessage == ":uninvisible" then
        makeVisible()
    elseif lowerMessage:sub(1, 12) == ":setmapcolor" then
        local colorName = message:sub(14):gsub("%s+", ""):lower()
        local color = BrickColor.new(colorName).Color
        setMapColor(color)
    elseif lowerMessage == ":esp" then
        highlightAllPlayers()
    elseif lowerMessage == ":btools" then
        giveBTools()
    elseif lowerMessage == ":doge" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/refs/heads/main/AutoAvoid-The-Strongest-Battlegrounds.lua"))()
    elseif lowerMessage == ":fullbright" then
        toggleFullbright()
    elseif lowerMessage == ":speed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shgsjsgeh/Get-Scarecrows-doors-script/refs/heads/main/SpeedBypass.lua"))()
    end
end

player.Chatted:Connect(onChatMessage)

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
