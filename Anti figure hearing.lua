while true do
    local args = {
        [1] = true
    }

    game:GetService("ReplicatedStorage").RemotesFolder.Crouch:FireServer(unpack(args))
    
    wait(0.1)
end
