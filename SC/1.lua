-- Load the Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
getgenv().SecureMode = true -- Enable secure mode if needed

-- Create the main window
local Window = Rayfield:CreateWindow({
    Name = "Rayfield Fly Example",
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
        Note = "Key: DJ", -- Display the required key
        FileName = "KeyConfig", -- Unique config file for the key
        SaveKey = true, -- Save the user's key
        Key = {"DJ"} -- Accepted keys
    },
})

-- Create the main tab
local MainTab = Window:CreateTab("Main", 4483362458)

-- Variables for flying
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local userInputService = game:GetService("UserInputService")
local flying = false
local speed = 50 -- Default fly speed

-- Notification function
local function notify(message)
    local notification = Instance.new("TextLabel")
    notification.Parent = player.PlayerGui -- Parent to PlayerGui for visibility
    notification.Size = UDim2.new(0, 300, 0, 50)
    notification.Position = UDim2.new(0.5, -150, 0.1, 0)
    notification.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    notification.Text = message
    notification.TextColor3 = Color3.fromRGB(0, 0, 0)
    notification.TextScaled = true
    notification.AnchorPoint = Vector2.new(0.5, 0)

    wait(3) -- Show notification for 3 seconds
    notification:Destroy()
end

-- Notify that the script has been executed
notify("Script Executed")

-- Function to toggle flying
local function toggleFly()
    flying = not flying
    if flying then
        humanoid.PlatformStand = true
        fly()
    else
        humanoid.PlatformStand = false
        character.HumanoidRootPart.Anchored = false
    end
end

-- Fly Function
local function fly()
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Parent = character.HumanoidRootPart

    local camera = workspace.CurrentCamera

    while flying do
        local direction = Vector3.new(
            (userInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (userInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
            (userInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or 0) - (userInputService:IsKeyDown(Enum.KeyCode.LeftControl) and 1 or 0),
            (userInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (userInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0)
        )

        bodyVelocity.Velocity = camera.CFrame.LookVector * direction.Z * speed + Vector3.new(0, direction.Y * speed, 0)
        wait(0.1)
    end

    bodyVelocity:Destroy()
end

-- Button to toggle flying
MainTab:CreateButton({
    Name = "Toggle Fly",
    Callback = function()
        toggleFly()
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

-- Admin Section
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
