while true do
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    if humanoid.WalkSpeed > 40 then
        humanoid.WalkSpeed = 40
    else
        humanoid.WalkSpeed = humanoid.WalkSpeed + 30
    end
    
    wait(1)
end
