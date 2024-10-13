-- Gear Spawner Script
local Players = game:GetService("Players")

-- List of Admin and Builder tool asset IDs
local toolIds = {
    "12345678", -- Replace with your Admin tool asset IDs
    "23456789", -- Builder tool asset ID
    "34567890"  -- Add more tools as needed
}

local function giveTools(player)
    local character = player.Character or player.CharacterAdded:Wait()

    for _, toolId in ipairs(toolIds) do
        local tool = Instance.new("Tool")
        tool.Name = "SpawnedTool"
        tool.TextureId = "rbxassetid://" .. toolId -- Use the tool's asset ID for the texture
        tool.Parent = player.Backpack
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function()
        giveTools(player)
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

-- Give tools to players already in the game
for _, player in ipairs(Players:GetPlayers()) do
    giveTools(player)
end
