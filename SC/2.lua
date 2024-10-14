local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "TJ Interface",
    LoadingTitle = "TJ Hub",
    LoadingSubtitle = "by TJ",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = "TJ_Config",
        FileName = "ConfigFile"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
})

local player = game.Players.LocalPlayer

-- Function to get the player's humanoid
local function getHumanoid()
    local character = player.Character or player.CharacterAdded:Wait()
    return character:FindFirstChildOfClass("Humanoid")
end

-- Function to create ESP with detailed character information
local function createESP(character)
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            -- Create a box for the character
            local boxSize = character:GetExtentsSize()
            local espBox = Instance.new("BoxHandleAdornment")
            espBox.Size = boxSize + Vector3.new(0.5, 0.5, 0.5) -- Slightly larger for visibility
            espBox.Color3 = Color3.fromRGB(255, 0, 0) -- Red color for the box
            espBox.AlwaysOnTop = true
            espBox.ZIndex = 10
            espBox.Adornee = humanoidRootPart
            espBox.Parent = humanoidRootPart
            
            -- Adding boxes for hair accessories
            for _, accessory in ipairs(character:GetChildren()) do
                if accessory:IsA("Accessory") and accessory.Name:lower():find("hair") then
                    local hairBox = Instance.new("BoxHandleAdornment")
                    hairBox.Size = accessory:GetExtentsSize() + Vector3.new(0.2, 0.2, 0.2) -- Slightly larger for visibility
                    hairBox.Color3 = Color3.fromRGB(0, 255, 0) -- Green color for hair
                    hairBox.AlwaysOnTop = true
                    hairBox.ZIndex = 10
                    hairBox.Adornee = accessory.Handle
                    hairBox.Parent = accessory.Handle
                end
            end
            
            -- Optional: Create a label above the character
            local label = Instance.new("BillboardGui")
            label.Size = UDim2.new(0, 100, 0, 50)
            label.StudsOffset = Vector3.new(0, 3, 0)
            label.Adornee = humanoidRootPart
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = character.Name
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White color for the text
            textLabel.Parent = label
            
            label.Parent = humanoidRootPart
        end
    end
end

-- ESP Toggle
local espEnabled = false
local espBoxes = {}

local function updateESP()
    for _, box in ipairs(espBoxes) do
        box:Destroy() -- Destroy old boxes
    end
    espBoxes = {}

    for _, targetPlayer in ipairs(game.Players:GetPlayers()) do
        if targetPlayer ~= player and targetPlayer.Character then
            createESP(targetPlayer.Character) -- Create new ESP boxes
        end
    end
end

-- Main Tab for core features
local MainTab = Window:CreateTab("Main", 4483362458)

-- Section for Buttons
MainTab:CreateSection("Buttons")

-- Admin Button
MainTab:CreateButton({
    Name = "Admin",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})

-- Fly Button
MainTab:CreateButton({
    Name = "Fly",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/MsL78SwX'))()
    end,
})

-- Spectate Player Button
MainTab:CreateButton({
    Name = "Spectate Player",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/zjAa6w2c'))()
    end,
})

-- Section for Toggles
MainTab:CreateSection("Toggles")

-- ESP Toggle
MainTab:CreateToggle({
    Name = "ESP Toggle",
    CurrentValue = false,
    Callback = function(state)
        espEnabled = state
        if state then
            print("ESP enabled.")
            updateESP() -- Call updateESP when enabled
        else
            print("ESP disabled.")
            for _, box in ipairs(espBoxes) do
                box:Destroy() -- Clear ESP boxes
            end
            espBoxes = {}
        end
    end,
})

-- Infinite Jump Toggle
MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        local userInputService = game:GetService("UserInputService")

        if state then
            userInputService.JumpRequest:Connect(function()
                if player.Character then
                    player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end)
            print("Infinite Jump enabled.")
        else
            print("Infinite Jump disabled.")
        end
    end,
})

-- Super-Human Toggle
MainTab:CreateToggle({
    Name = "Super-Human",
    CurrentValue = false,
    Callback = function(state)
        local humanoid = getHumanoid()
        if humanoid then
            if state then
                humanoid.WalkSpeed = 120
                humanoid.JumpPower = 120
                print("Super-Human mode enabled.")
            else
                humanoid.WalkSpeed = 16
                humanoid.JumpPower = 50
                print("Super-Human mode disabled.")
            end
        end
    end,
})

-- Section for Sliders
MainTab:CreateSection("Sliders")

-- Walk Speed Slider
MainTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 500}, -- Min and Max values
    Increment = 1, -- Increment value
    Suffix = "Walk Speed",
    CurrentValue = 16, -- Initial value
    Callback = function(value)
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end,
})

-- Jump Power Slider
MainTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 500}, -- Min and Max values
    Increment = 1, -- Increment value
    Suffix = "Jump Power",
    CurrentValue = 50, -- Initial value
    Callback = function(value)
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.JumpPower = value
        end
    end,
})

-- Section for Copy Feature
MainTab:CreateSection("Copy Feature")

-- Copy 'bang PlayerName' to clipboard toggle
local copyEnabled = false
MainTab:CreateToggle({
    Name = "Copy 'bang PlayerName' on click",
    CurrentValue = false, -- Default value (off)
    Callback = function(state)
        copyEnabled = state
        if state then
            print("Copy to clipboard enabled.")
        else
            print("Copy to clipboard disabled.")
        end
    end,
})

-- Function to copy name to clipboard
local function copyToClipboard(text)
    setclipboard(text)
end

-- Function to copy player name from any distance, no aiming required
local function setupClickToCopy()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

    mouse.Button1Down:Connect(function()
        if copyEnabled then -- Only run if toggle is enabled
            for _, targetPlayer in ipairs(game.Players:GetPlayers()) do
                if targetPlayer ~= player and targetPlayer.Character then
                    local distance = (player.Character.HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if distance < 1000 then -- Can set any max distance here
                        local textToCopy = "bang " .. targetPlayer.DisplayName
                        copyToClipboard(textToCopy)
                        print("Copied '" .. textToCopy .. "' to clipboard!")
                        break -- Copy only one player’s name
                    end
                end
            end
        end
    end)
end

-- Initialize click-to-copy functionality
setupClickToCopy()

-- Load configuration
Rayfield:LoadConfiguration()
