local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
local NotificationFrame = Instance.new("Frame")
local NotificationText = Instance.new("TextLabel")

ScreenGui.Parent = playerGui
NotificationFrame.Size = UDim2.new(0, 300, 0, 100)
NotificationFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NotificationFrame.BackgroundTransparency = 0.5
NotificationFrame.Parent = ScreenGui

NotificationText.Size = UDim2.new(1, 0, 1, 0)
NotificationText.Text = "Use :<the command> to use commands"
NotificationText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationText.BackgroundTransparency = 1
NotificationText.Parent = NotificationFrame

local normalBrightness = game.Lighting.Brightness

local function createBtools()
    local tools = {}

    local function createTool(name, action)
        local tool = Instance.new("Tool")
        tool.Name = name
        tool.RequiresHandle = false
        tool.CanBeDropped = false
        tool.Parent = player.Backpack

        tool.Activated:Connect(function()
            action()
        end)

        return tool
    end

    local function selectPart()
        local mouse = player:GetMouse()
        mouse.Button1Down:Connect(function()
            local target = mouse.Target
            if target and target:IsA("BasePart") then
                tools.selectedPart = target
                print("Selected: " .. target.Name)
            end
        end)
    end

    createTool("Select", selectPart)

    createTool("Move", function()
        if tools.selectedPart then
            local mouse = player:GetMouse()
            tools.selectedPart.Position = mouse.Hit.Position
        end
    end)

    createTool("Resize", function()
        if tools.selectedPart then
            tools.selectedPart.Size = tools.selectedPart.Size + Vector3.new(1, 1, 1)
        end
    end)

    createTool("Delete", function()
        if tools.selectedPart then
            tools.selectedPart:Destroy()
            tools.selectedPart = nil
        end
    end)

    return tools
end

local function toggleVisibility(command)
    if command == ":invisible" then
        player.Character.HumanoidRootPart.Transparency = 1
        for _, part in ipairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    elseif command == ":uninvisible" then
        player.Character.HumanoidRootPart.Transparency = 0
        for _, part in ipairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
            end
        end
    elseif command == ":speed" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shgsjsgeh/Get-Scarecrows-doors-script/refs/heads/main/SpeedBypass.lua"))()
    elseif command == ":fullbright" then
        game.Lighting.Brightness = 80
    elseif command == ":unfullbright" then
        game.Lighting.Brightness = normalBrightness
    elseif command == ":fly" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    elseif command == ":Btools" then
        createBtools()
    elseif command == ":noclip" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shgsjsgeh/Get-Scarecrows-doors-script/refs/heads/main/Noclip.lua"))()
    end
end

if not is_sirhurt_closure and not is_sirhurt then
    player.Chatted:Connect(function(message)
        toggleVisibility(message)
    end)
end

wait(3)
ScreenGui:Destroy()
