local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TJ",
   LoadingTitle = "TJ Interface",
   LoadingSubtitle = "by TJ",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "rghr7gh84h93utg8yhuefg87h4ebgf783hr88gry", -- Create a custom folder for your hub/game
      FileName = "rghr7gh84h93utg8yhuefg87h4ebgf783hr88gry" -- Unique FileName
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
})

-- Main Tab for functions
local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Section = MainTab:CreateSection("Main")

-- Function to get the player's humanoid
local function getHumanoid()
   local player = game.Players.LocalPlayer
   local character = player.Character or player.CharacterAdded:Wait()
   return character:FindFirstChildOfClass("Humanoid")
end

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

-- ESP Toggle
local espEnabled = false
MainTab:CreateToggle({
    Name = "ESP Toggle",
    CurrentValue = false,
    Callback = function(state)
        espEnabled = state
        if state then
            -- ESP script for displaying player names and hitboxes
            loadstring([[
                local Players = game:GetService("Players")
                local RunService = game:GetService("RunService")
                local ESP = {}

                function ESP:CreateESP(player)
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.Adornee = player.Character
                    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Color of the ESP
                    highlight.OutlineColor = Color3.fromRGB(0, 0, 0) -- Outline color
                end

                Players.PlayerAdded:Connect(function(player)
                    player.CharacterAdded:Connect(function(character)
                        ESP:CreateESP(player)
                    end)
                end)

                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer then
                        ESP:CreateESP(player)
                    end
                end

                RunService.Heartbeat:Connect(function()
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= Players.LocalPlayer and player.Character then
                            local highlight = player.Character:FindFirstChildOfClass("Highlight")
                            if highlight then
                                highlight.Adornee = player.Character
                            end
                        end
                    end
                end)
            ]])()
            print("ESP enabled")
        else
            -- Disable ESP by removing all highlights
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character then
                    local highlight = player.Character:FindFirstChildOfClass("Highlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
            print("ESP disabled")
        end
    end,
})

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

-- Admin Tab
local AdminTab = Window:CreateTab("Admin", 4483362458) -- Title, Image
local Section = AdminTab:CreateSection("Admin")

-- Admin Button
AdminTab:CreateButton({
   Name = "Admin",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

-- Teleport Tool Button
MainTab:CreateButton({
    Name = "Teleport Tool",
    Callback = function()
        local tool = Instance.new("Tool")
        tool.Name = "Teleport Tool"
        tool.RequiresHandle = false
        tool.Activated:Connect(function()
            local mouse = game.Players.LocalPlayer:GetMouse()
            local character = game.Players.LocalPlayer.Character
            if character and mouse then
                character:MoveTo(mouse.Hit.p)
            end
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
        print("Teleport Tool given.")
    end,
})

-- Load configuration
Rayfield:LoadConfiguration()
