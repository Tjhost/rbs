local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TJ",
   LoadingTitle = "TJ Interface",
   LoadingSubtitle = "by TJ",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "rghr7gh84h93utg8yhuefg87h4ebgf783hr88gry",
      FileName = "rghr7gh84h93utg8yhuefg87h4ebgf783hr88gry"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
})

-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)
local Section = MainTab:CreateSection("Main")

-- Function to get the player's humanoid
local function getHumanoid()
   local player = game.Players.LocalPlayer
   local character = player.Character or player.CharacterAdded:Wait()
   return character:FindFirstChildOfClass("Humanoid")
end

-- Infinite Jump functionality
local infiniteJumpEnabled = false
local function enableInfiniteJump()
    game.UserInputService.JumpRequest:Connect(function()
        if infiniteJumpEnabled then
            local humanoid = getHumanoid()
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end

MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(state)
        infiniteJumpEnabled = state
        if infiniteJumpEnabled then
            enableInfiniteJump()
            print("Infinite Jump Enabled")
        else
            print("Infinite Jump Disabled")
        end
    end,
})

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
local espInstances = {}

local function enableESP()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local espBox = Instance.new("BoxHandleAdornment")
            espBox.Size = Vector3.new(4, 6, 4)
            espBox.Adornee = player.Character.HumanoidRootPart
            espBox.AlwaysOnTop = true
            espBox.ZIndex = 5
            espBox.Color3 = Color3.new(1, 0, 0)
            espBox.Transparency = 0.5
            espBox.Parent = player.Character.HumanoidRootPart
            table.insert(espInstances, espBox)
        end
    end
end

local function disableESP()
    for _, espBox in pairs(espInstances) do
        if espBox and espBox.Parent then
            espBox:Destroy()
        end
    end
    espInstances = {}
end

MainTab:CreateToggle({
    Name = "ESP Toggle",
    CurrentValue = false,
    Callback = function(state)
        espEnabled = state
        if espEnabled then
            enableESP()
        else
            disableESP()
        end
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

-- Admin Tab
local AdminTab = Window:CreateTab("Admin", 4483362458)
local Section = AdminTab:CreateSection("Admin")

-- Admin Button
AdminTab:CreateButton({
   Name = "Admin",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

-- Teleport GUI Button (Executes the script you provided)
MainTab:CreateButton({
    Name = "Teleport GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tjhost/rbs/refs/heads/main/Sde.lua", true))()
    end,
})

-- Copy 'bang PlayerName' to clipboard toggle
local copyEnabled = false
MainTab:CreateToggle({
    Name = "Copy 'bang PlayerName' on click",
    CurrentValue = false,
    Callback = function(state)
        copyEnabled = state
        if state then
            print("Copy to clipboard enabled.")
        else
            print("Copy to clipboard disabled.")
        end
    end,
})

local function copyToClipboard(text)
    setclipboard(text)
end

local function setupClickToCopy()
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

    mouse.Button1Down:Connect(function()
        if copyEnabled then
            for _, targetPlayer in ipairs(game.Players:GetPlayers()) do
                if targetPlayer ~= player and targetPlayer.Character then
                    local distance = (player.Character.HumanoidRootPart.Position - targetPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if distance < 1000 then
                        local textToCopy = "bang " .. targetPlayer.DisplayName
                        copyToClipboard(textToCopy)
                        print("Copied '" .. textToCopy .. "' to clipboard!")
                        break
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
