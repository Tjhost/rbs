local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "VAG Window",
    LoadingTitle = "VAG Interface Suite",
    LoadingSubtitle = "by VAG",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = VAGkeyforrf1, -- Create a custom folder for your hub/game
       FileName = "VAGkeyforrf1"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Key for VAG",
       Subtitle = "Key System",
       Note = "...",
       FileName = "VAGkeyforrf1", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"DJ"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local MainTab = Window:CreateTab("Main", nil) -- Title, Image
 local Section = MainTab:CreateSection("Main")

 local Button = MainTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "Fly",
    Callback = function()
            -- Load the fly script from the given URL
local flyScriptUrl = "https://raw.githubusercontent.com/Tjhost/rbs/refs/heads/main/function/fly.lua"

    -- Use pcall to handle any potential errors gracefully
    local success, err = pcall(function()
        local flyScript = loadstring(game:HttpGet(flyScriptUrl))()
    end)
    
    -- Check if there was an error
    if not success then
        warn("Failed to load fly script: " .. err)
    end
    end,
 })

 -- WalkSpeed Slider
local WalkSpeedSlider = MainTab:CreateSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 500,
    Default = 16,
    Increment = 1,
    ValueName = "Speed",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

-- JumpPower Slider
local JumpPowerSlider = MainTab:CreateSlider({
    Name = "Jump Power",
    Min = 50,
    Max = 500,
    Default = 50,
    Increment = 1,
    ValueName = "Power",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})

