local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UIS = game:GetService("UserInputService")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "ExecuteScriptGui"

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(1, 0.5)
Frame.Position = UDim2.new(1, -20, 0.5, 0)
Frame.Size = UDim2.new(0, 50, 0, 50)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.BorderSizePixel = 0

TextLabel.Parent = Frame
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "S"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.S then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shgsjsgeh/Get-Scarecrows-doors-script/refs/heads/main/Star%20jug%20by%20upio.lua"))()
    end
end)
