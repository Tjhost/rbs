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

-- Fly Button
local Button = MainTab:CreateButton({
   Name = "Fly",
   Callback = function()
      loadstring(game:HttpGet('https://pastebin.com/raw/MsL78SwX'))()
   end,
})

local Button = MainTab:CreateButton({
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
    jumpPower = 50, -- Default jump power
    speed = 16, -- Default speed
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
    end,
})

-- Turbochargers Slider
CarSettingsTab:CreateSlider({
    Name = "Turbochargers",
    Range = {0, 5}, -- Limited max value for performance
    Increment = 1,
    Suffix = "Turbochargers",
    CurrentValue = VehicleTuning.turbochargers,
    Callback = function(value)
        VehicleTuning.turbochargers = value 
    end,
})

-- Superchargers Slider
CarSettingsTab:CreateSlider({
    Name = "Superchargers",
    Range = {0, 5}, -- Limited max value for performance
    Increment = 1,
    Suffix = "Superchargers",
    CurrentValue = VehicleTuning.superchargers,
    Callback = function(value)
        VehicleTuning.superchargers = value 
    end,
})

-- Performance Gearbox Toggle
CarSettingsTab:CreateToggle({
    Name = "Performance Gearbox",
    CurrentValue = VehicleTuning.performanceGearboxEnabled,
    Callback = function(state)
        VehicleTuning.performanceGearboxEnabled = state 
    end,
})

-- Brake Upgrade Toggle
CarSettingsTab:CreateToggle({
    Name = "Upgraded Brakes",
    CurrentValue = VehicleTuning.brakeUpgradeEnabled,
    Callback = function(state)
        VehicleTuning.brakeUpgradeEnabled = state 
    end,
})

-- Jump Power Slider
CarSettingsTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 150}, -- Reasonable range for jump power
    Increment = 5,
    Suffix = "Jump Power",
    CurrentValue = VehicleTuning.jumpPower,
    Callback = function(value)
        VehicleTuning.jumpPower = value
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value -- Update the player's jump power
    end,
})

-- Speed Slider
CarSettingsTab:CreateSlider({
    Name = "Speed",
    Range = {16, 100}, -- Reasonable range for speed
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = VehicleTuning.speed,
    Callback = function(value)
        VehicleTuning.speed = value
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value -- Update the player's speed
    end,
})

-- Function to kick the player
local function onKeyPress(input, gameProcessed)
    -- Check if the input was not processed by other UI elements
    if not gameProcessed then
        -- Check if the "9" key was pressed
        if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Nine then
            -- Kick the player from the game
            game.Players.LocalPlayer:Kick("You have been kicked for pressing 9!")
        end
    end
end

-- Connect the function to the InputBegan event
game:GetService("UserInputService").InputBegan:Connect(onKeyPress)

-- Update Vehicle Properties Loop
while wait(1) do -- Reasonable wait time
    pcall(function()
        local vehicle = vehicleSession:FindFirstChild(game.Players.LocalPlayer.Name.."-Car") 
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
