-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the Main Window
local Window = Rayfield:CreateWindow({
   Name = "TJ Interface", -- Window title
   LoadingTitle = "TJ Interface", -- Loading screen title
   LoadingSubtitle = "by TJALTF4", -- Loading screen subtitle
   ConfigurationSaving = {
      Enabled = true, -- Enable saving configurations
      FolderName = nil, -- Optional: custom folder to save configurations
      FileName = "aB12cD34Ef56Gh7", -- Randomly generated, hardcoded filename
   },
   Discord = {
      Enabled = false, -- Disable Discord integration
      Invite = "noinvitelink", -- Discord invite code (if enabled)
      RememberJoins = true -- If true, remember user's Discord join status
   },
   KeySystem = false, -- No key system enabled
   KeySettings = {
      Title = "Untitled", -- Key system title (if used)
      Subtitle = "Key System", -- Key system subtitle (if used)
      Note = "No method of obtaining the key is provided", -- Additional note
      FileName = "aB12cD34Ef56Gh7", -- Key configuration filename (same random string)
      SaveKey = true, -- Save key for future sessions
      GrabKeyFromSite = false, -- No external site for key grabbing
      Key = {"Hello"} -- List of accepted keys (if enabled)
   }
})

-- Main Tab: Player controls
local MainTab = Window:CreateTab("Main", 4483362458) -- Main tab with title and image

-- Section: Main player actions
local Section = MainTab:CreateSection("Main")

-- Button: Fly Script
local Button = MainTab:CreateButton({
   Name = "Fly", -- Button label
   Callback = function()
      loadstring(game:HttpGet('https://pastebin.com/raw/MsL78SwX'))() -- Load fly script from Pastebin
   end,
})

-- Function to get the player's Humanoid (for Walkspeed and Jump Power)
local function getHumanoid()
   local player = game.Players.LocalPlayer -- Get local player
   local character = player.Character or player.CharacterAdded:Wait() -- Get player's character
   return character:FindFirstChildOfClass("Humanoid") -- Find the Humanoid object
end

-- Slider: Walkspeed
MainTab:CreateSlider({
    Name = "Walkspeed", -- Slider label
    Range = {16, 500}, -- Min and Max walk speed values
    Increment = 1, -- Change speed by increments of 1
    Suffix = "Walk Speed", -- Label displayed next to the slider
    CurrentValue = 16, -- Default walkspeed value
    Callback = function(value)
        local humanoid = getHumanoid() -- Get the player's humanoid
        if humanoid then
            humanoid.WalkSpeed = value -- Set walkspeed to slider value
        end
    end,
})

-- Slider: Jump Power
MainTab:CreateSlider({
    Name = "Jump Power", -- Slider label
    Range = {50, 500}, -- Min and Max jump power values
    Increment = 1, -- Change jump power by increments of 1
    Suffix = "Jump Power", -- Label displayed next to the slider
    CurrentValue = 50, -- Default jump power value
    Callback = function(value)
        local humanoid = getHumanoid() -- Get the player's humanoid
        if humanoid then
            humanoid.JumpPower = value -- Set jump power to slider value
        end
    end,
})

-- Toggle: Super-Human Mode (High walk speed and jump power)
MainTab:CreateToggle({
    Name = "Super-Human", -- Toggle label
    CurrentValue = false, -- Default is off
    Callback = function(state)
        local humanoid = getHumanoid() -- Get the player's humanoid
        if humanoid then
            if state then -- If toggle is ON
                humanoid.WalkSpeed = 120 -- Set high walkspeed
                humanoid.JumpPower = 120 -- Set high jump power
            else -- If toggle is OFF
                humanoid.WalkSpeed = 16 -- Reset walkspeed
                humanoid.JumpPower = 50 -- Reset jump power
            end
        end
    end,
})

-- Admin Tab: Admin-related actions
local AdminTab = Window:CreateTab("Admin", 4483362458) -- Admin tab with title and image

-- Section: Admin controls
local Section = AdminTab:CreateSection("Admin")

-- Button: Infinite Yield Admin Script
local Button = AdminTab:CreateButton({
   Name = "Admin", -- Button label
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() -- Load Infinite Yield script
   end,
})

-- Load the saved configuration
Rayfield:LoadConfiguration()
