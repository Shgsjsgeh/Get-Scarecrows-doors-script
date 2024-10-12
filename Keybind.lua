local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TopFrame = Instance.new("Frame")
local TopTextLabel = Instance.new("TextLabel")
local BottomFrame = Instance.new("Frame")
local BottomTextLabel = Instance.new("TextLabel")
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

TopFrame.Parent = ScreenGui
TopFrame.AnchorPoint = Vector2.new(1, 0.5)
TopFrame.Position = UDim2.new(1, -20, 0.5, -60)
TopFrame.Size = UDim2.new(0, 50, 0, 50)
TopFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TopFrame.BorderSizePixel = 0

TopTextLabel.Parent = TopFrame
TopTextLabel.Size = UDim2.new(1, 0, 1, 0)
TopTextLabel.BackgroundTransparency = 1
TopTextLabel.Text = "C"
TopTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TopTextLabel.TextScaled = true

BottomFrame.Parent = ScreenGui
BottomFrame.AnchorPoint = Vector2.new(1, 0.5)
BottomFrame.Position = UDim2.new(1, -20, 0.5, 60)
BottomFrame.Size = UDim2.new(0, 50, 0, 50)
BottomFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BottomFrame.BorderSizePixel = 0

BottomTextLabel.Parent = BottomFrame
BottomTextLabel.Size = UDim2.new(1, 0, 1, 0)
BottomTextLabel.BackgroundTransparency = 1
BottomTextLabel.Text = "M"
BottomTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BottomTextLabel.TextScaled = true

UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.S then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Shgsjsgeh/Get-Scarecrows-doors-script/refs/heads/main/Star%20jug%20by%20upio.lua"))()
    elseif input.KeyCode == Enum.KeyCode.C then
        _G.Uses = 414141414141
        _G.Range = 30
        _G.OnAnything = true
        _G.Fail = false
        _G.Variant = "Electric"
        loadstring(game:HttpGet('https://raw.githubusercontent.com/PenguinManiack/Crucifix/main/Crucifix.lua'))()
    elseif input.KeyCode == Enum.KeyCode.M then
        loadstring(game:HttpGet("https://rawscripts.net/raw/FLOOR-2-DOORS-mspaint-script-19890"))()
    end
end)
