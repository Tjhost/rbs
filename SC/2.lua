local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TJ",
   LoadingTitle = "TJ Interface",
   LoadingSubtitle = "by TJALTF4",
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

-- ESP Functionality
local ESPEnabled = false

local function toggleESP(state)
    ESPEnabled = state
    while ESPEnabled do
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not player.Character:FindFirstChild("ESPBox") then
                    local espBox = Instance.new("BoxHandleAdornment")
                    espBox.Name = "ESPBox"
                    espBox.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                    espBox.AlwaysOnTop = true
                    espBox.ZIndex = 10
                    espBox.Size = Vector3.new(4, 6, 0)
                    espBox.Transparency = 0.5
                    espBox.Color3 = Color3.new(1, 0, 0) -- Red color for the ESP box
                    espBox.Parent = player.Character
                end
            end
        end
        wait(0.1) -- Updates ESP every 0.1 seconds
    end

    -- Remove ESP when turned off
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("ESPBox") then
            player.Character:FindFirstChild("ESPBox"):Destroy()
        end
    end
end

local MainTab = Window:CreateTab("Main", 4483362458)
local Section = MainTab:CreateSection("Main")

-- Add ESP Toggle
MainTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Callback = function(state)
        toggleESP(state)
    end,
})

-- The rest of your code remains unchanged
local Button = MainTab:CreateButton({
   Name = "Fly",
   Callback = function()
      loadstring(game:HttpGet('https://pastebin.com/raw/MsL78SwX'))()
   end,
})

-- Function to get the player's humanoid
local function getHumanoid()
   local player = game.Players.LocalPlayer
   local character = player.Character or player.CharacterAdded:Wait()
   return character:FindFirstChildOfClass("Humanoid")
end

-- Walk Speed Slider
MainTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 500},
    Increment = 1,
    Suffix = "Walk Speed",
    CurrentValue = 16,
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
    Range = {50, 500},
    Increment = 1,
    Suffix = "Jump Power",
    CurrentValue = 50,
    Callback = function(value)
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.JumpPower = value
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
            else
                humanoid.WalkSpeed = 16
                humanoid.JumpPower = 50
            end
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "spectate player",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/zjAa6w2c'))()
    end,
 })

local AdminTab = Window:CreateTab("Admin", 4483362458)
local Section = AdminTab:CreateSection("Admin")

local Button = AdminTab:CreateButton({
   Name = "Admin",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

-- Load configuration
Rayfield:LoadConfiguration()
