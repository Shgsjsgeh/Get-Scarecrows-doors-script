local function setClipboard(text)
    local success, result = pcall(function()
        setclipboard(text)
    end)
    
    if not success then
        print("Error setting clipboard: " .. result)
    end
end

local placeId = tostring(game.PlaceId)

setClipboard(placeId)

local function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration;
    })
end

notify("Notification", "Place ID has been set to your clipboard", 5)
