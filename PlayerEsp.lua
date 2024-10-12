local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function highlightPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local character = player.Character or player.CharacterAdded:Wait()
            local highlight = Instance.new("Highlight")
            highlight.Adornee = character
            highlight.FillColor = Color3.fromRGB(0, 0, 255)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.OutlineTransparency = 0
            highlight.FillTransparency = 0.5
            highlight.Parent = character
        end
    end
end

LocalPlayer.CharacterAdded:Connect(highlightPlayers)
highlightPlayers()
