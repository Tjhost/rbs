-- Load Rayfield GUI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create Window
local Window = Rayfield:CreateWindow({
   Name = "TJ",
   LoadingTitle = "TJ Interface",
   LoadingSubtitle = "by TJaltf4", 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "rghr7gh84h93utg8yhuefg87h4ebgf783hr88gry" 
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
   KeySystem = false, 
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "rghr7gh84h93utg8yhuefg87h4ebgf783hr88gry", 
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"Hello"} 
   }
})

-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458) 
local Section = MainTab:CreateSection("Main")

-- Quality of Life Features
local Player = game.Players.LocalPlayer

-- Auto-save function
local function saveSettings()
    -- Save Jump Power and Speed settings
    local jumpPower = Player.Character.Humanoid.JumpPower
    local walkspeed = Player.Character.Humanoid.WalkSpeed
    -- Here you can implement the actual saving method if needed.
    print("Settings saved: Jump Power = " .. jumpPower .. ", Speed = " .. walkspeed)
end

-- Reset function
local function resetSettings()
    Player.Character.Humanoid.JumpPower = 50 -- Default Jump Power
    Player.Character.Humanoid.WalkSpeed = 16 -- Default Speed
    print("Settings reset to default.")
end

-- Notification function
local function notify(message)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = message,
        Color = Color3.new(1, 1, 0), -- Yellow color
        Font = Enum.Font.SourceSans,
        TextSize = 20
    })
end

-- Send Chat Message Button
MainTab:CreateButton({
    Name = "Send Chat Message",
    Callback = function()
        local message = "Hello from TJ's script!"
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:Fire(message, "All")
        notify("Sent message: " .. message)
    end,
})

-- Toggle GUI Visibility
MainTab:CreateButton({
    Name = "Toggle GUI Visibility",
    Callback = function()
        Window:Toggle()
        notify("Toggled GUI visibility.")
    end,
})

-- Fly Button
MainTab:CreateButton({
   Name = "Fly",
   Callback = function()
      loadstring(game:HttpGet('https://pastebin.com/raw/MsL78SwX'))()
   end,
})

-- Infinite Yield Button
MainTab:CreateButton({
    Name = "IY",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})

-- Vehicle Session Reference
local vehicleSession = workspace:WaitForChild("SessionVehicles")

-- Vehicle Tuning Table
local VehicleTuning = {
    horsepower = 150, 
    turbochargers = 1, 
    superchargers = 0, 
    performanceGearboxEnabled = false, 
    brakeUpgradeEnabled = false, 
}

-- Car Settings Tab
local CarSettingsTab = Window:CreateTab("Car Settings", 4483362458) 
local Section = CarSettingsTab:CreateSection("Vehicle Tuning")

-- Horsepower Slider
CarSettingsTab:CreateSlider({
    Name = "Horsepower",
    Range = {50, 2500}, -- Set reasonable max value for gameplay balance
    Increment = 10,
    Suffix = "HP",
    CurrentValue = VehicleTuning.horsepower,
    Callback = function(value)
        VehicleTuning.horsepower = value 
        saveSettings()  -- Save settings on change
    end,
})

-- Jump Power Slider
CarSettingsTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 300}, -- Reasonable jump power range
    Increment = 5,
    Suffix = "Jump Power",
    CurrentValue = Player.Character.Humanoid.JumpPower,
    Callback = function(value)
        Player.Character.Humanoid.JumpPower = value 
        saveSettings()  -- Save settings on change
    end,
})

-- Speed Slider
CarSettingsTab:CreateSlider({
    Name = "Speed",
    Range = {16, 100}, -- Reasonable speed range
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = Player.Character.Humanoid.WalkSpeed,
    Callback = function(value)
        Player.Character.Humanoid.WalkSpeed = value 
        saveSettings()  -- Save settings on change
    end,
})

-- Reset Button
CarSettingsTab:CreateButton({
    Name = "Reset Settings",
    Callback = function()
        resetSettings()
        notify("Settings reset to default values.")
    end,
})

-- Update Vehicle Properties Loop
while wait(1) do -- Reasonable wait time
    pcall(function()
        local vehicle = vehicleSession:FindFirstChild(Player.Name.."-Car") 
        if vehicle then
            local tuningModule = require(vehicle:FindFirstChild("A-Chassis Tune")) 

            -- Update Vehicle Tuning Values with Limits
            tuningModule.Horsepower = math.clamp(VehicleTuning.horsepower, 50, 2500) 
            tuningModule.E_Horsepower = tuningModule.Horsepower 

            if VehicleTuning.performanceGearboxEnabled then
                tuningModule.FinalDrive = 2.5 
                tuningModule.Ratios = {3.7, 0, 2.84, 1.55, 1, 0.65} 
            else
                tuningModule.FinalDrive = 1.0 
                tuningModule.Ratios = {4.0, 0, 3.0, 2.0, 1.5, 1.0} 
            end

            tuningModule.ClutchTol = 5000 -- Manageable clutch tolerance
            tuningModule.Redline = 7000 -- Higher but manageable redline
            tuningModule.TurboEnabled = VehicleTuning.turbochargers > 0 
            tuningModule.Turbochargers = math.clamp(VehicleTuning.turbochargers, 0, 5) 
            tuningModule.Superchargers = math.clamp(VehicleTuning.superchargers, 0, 5) 
            tuningModule.Weight = 2.5 -- Adjusted weight for balance

            if VehicleTuning.brakeUpgradeEnabled then
                tuningModule.BrakeForce = 5000 -- Reasonable brake force
                tuningModule.PBrakeForce = 5000 
            end
        end
    end)
end

-- Load configuration
Rayfield:LoadConfiguration()
