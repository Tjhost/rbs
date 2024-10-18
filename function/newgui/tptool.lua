-- Function to create a teleport tool

local function createTeleportTool()
    -- Create the tool
    local teleportTool = Instance.new("Tool")
    teleportTool.Name = "Teleport Tool"
    teleportTool.RequiresHandle = false
    teleportTool.Parent = game.Players.LocalPlayer.Backpack

    -- Tool activated event
    teleportTool.Activated:Connect(function()
        -- Get the player and character
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local mouse = player:GetMouse()

        -- Raycasting to find the click position
        local targetPos = mouse.Hit.p

        -- Teleport the player's HumanoidRootPart to the clicked position
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(targetPos + Vector3.new(0, 5, 0)) -- Teleport slightly above the ground
        end
    end)
end

-- Call the function to create the teleport tool
createTeleportTool()
