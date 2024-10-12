-- Load the Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
getgenv().SecureMode = true -- Enable secure mode if needed

-- Create the main window
local Window = Rayfield:CreateWindow({
    Name = "TJ's Script Executor",
    LoadingTitle = "Loading Rayfield Interface",
    LoadingSubtitle = "by Sirius",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, -- Custom folder for saving configurations
        FileName = "RayfieldConfig" -- Name of the config file
    },
    KeySystem = true, -- Enable key system
    KeySettings = {
        Title = "Key Required",
        Subtitle = "Enter the key to access the script",
        Note = "Key is DJ", -- Display the required key
        FileName = "KeyConfig", -- Unique config file for the key
        SaveKey = true, -- Save the user's key
        Key = {"DJ"} -- Accepted keys
    },
})

-- Create the main tab
local MainTab = Window:CreateTab("Main", 4483362458)

-- Variables for player
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Function to toggle no clip
local noClipEnabled = false

local function toggleNoClip()
    noClipEnabled = not noClipEnabled
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = not noClipEnabled
        end
    end
end

-- Button to enable Fly
MainTab:CreateButton({
    Name = "Fly",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/MsL78SwX'))()
    end,
})

-- Button to toggle No Clip
MainTab:CreateToggle({
    Name = "No Clip",
    CurrentValue = false,
    Callback = function(state)
        toggleNoClip()
    end,
})

-- Walk Speed Control
MainTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 500}, -- Min and Max values
    Increment = 1, -- Increment value
    Suffix = "Walk Speed",
    CurrentValue = 16, -- Initial value
    Callback = function(value)
        humanoid.WalkSpeed = value
    end,
})

-- Jump Power Control
MainTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 500}, -- Min and Max values
    Increment = 1, -- Increment value
    Suffix = "Jump Power",
    CurrentValue = 50, -- Initial value
    Callback = function(value)
        humanoid.JumpPower = value
    end,
})

-- Superhuman Toggle
MainTab:CreateToggle({
    Name = "Super-Human",
    CurrentValue = false,
    Callback = function(state)
        if state then
            humanoid.WalkSpeed = 120
            humanoid.JumpPower = 120
        else
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
        end
    end,
})

-- Teleport to Player Feature
MainTab:CreateDropdown({
    Name = "Teleport to Player",
    Options = function()
        local players = {}
        for _, v in ipairs(game.Players:GetPlayers()) do
            if v ~= player then
                table.insert(players, v.Name)
            end
        end
        return players
    end,
    Callback = function(selectedPlayer)
        local targetPlayer = game.Players:FindFirstChild(selectedPlayer)
        if targetPlayer and targetPlayer.Character then
            character:SetPrimaryPartCFrame(targetPlayer.Character.PrimaryPart.CFrame)
        end
    end,
})

-- Create the Admin tab
local AdminTab = Window:CreateTab("Admin", 4483362458)

-- Admin Button to execute Admin script
AdminTab:CreateButton({
    Name = "Admin Command",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() -- Admin script
    end,
})

-- Load configuration
Rayfield:LoadConfiguration()
