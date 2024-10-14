local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TJ",
   LoadingTitle = "TJ Interface",
   LoadingSubtitle = "by TJ",
   ConfigurationSaving = {
      Enabled = true,
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

-- Main Tab for functions
local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image

-- Infinite Jump Toggle
_G.infinjump = false

local function toggleInfiniteJump()
    _G.infinjump = not _G.infinjump

    if _G.infinJumpStarted == nil then
        _G.infinJumpStarted = true

        game.StarterGui:SetCore("SendNotification", {
            Title = "Infinite Jump",
            Text = "Infinite Jump Activated!",
            Duration = 5,
        })

        local plr = game:GetService('Players').LocalPlayer
        local humanoid = plr.Character:WaitForChild('Humanoid')

        local function onJumpRequest()
            if _G.infinjump then
                humanoid:ChangeState('Jumping')
            end
        end

        game:GetService("UserInputService").JumpRequest:Connect(onJumpRequest)
    end
end

-- Infinite Jump Button
MainTab:CreateButton({
   Name = "Toggle Infinite Jump",
   Callback = function()
       toggleInfiniteJump()
   end,
})

-- ESP Toggle
local espEnabled = false
local espConnections = {}

local function applyESP(player)
    if player.Character and not player.Character:FindFirstChildOfClass("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = player.Character
        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color for ESP
        highlight.OutlineColor = Color3.fromRGB(0, 0, 0) -- Black outline
        highlight.Parent = player.Character
    end
end

local function removeESP(player)
    if player.Character then
        local highlight = player.Character:FindFirstChildOfClass("Highlight")
        if highlight then
            highlight:Destroy()
        end
    end
end

local function onCharacterAdded(player)
    if espEnabled then
        applyESP(player)
    end
end

MainTab:CreateToggle({
    Name = "ESP Toggle",
    CurrentValue = false,
    Callback = function(state)
        espEnabled = state
        if state then
            -- Enable ESP
            for _, player in ipairs(game.Players:GetPlayers()) do
                applyESP(player)
                espConnections[player.UserId] = player.CharacterAdded:Connect(function() onCharacterAdded(player) end)
            end
            
            -- Listen for new players joining
            game.Players.PlayerAdded:Connect(function(player)
                espConnections[player.UserId] = player.CharacterAdded:Connect(function() onCharacterAdded(player) end)
            end)
            print("ESP enabled")
        else
            -- Disable ESP
            for _, player in ipairs(game.Players:GetPlayers()) do
                removeESP(player)
                if espConnections[player.UserId] then
                    espConnections[player.UserId]:Disconnect() -- Disconnect the connection
                    espConnections[player.UserId] = nil
                end
            end
            print("ESP disabled")
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
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = value
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
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        humanoid.JumpPower = value
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
                    local target = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if target then
                        local ray = Ray.new(mouse.UnitRay.Origin, mouse.UnitRay.Direction * 1000)
                        local hit, position = workspace:FindPartOnRay(ray)
                        if hit and hit:IsDescendantOf(targetPlayer.Character) then
                            local textToCopy = "bang " .. targetPlayer.DisplayName
                            copyToClipboard(textToCopy)
                            print("Copied '" .. textToCopy .. "' to clipboard!")
                            break
                        end
                    end
                end
            end
        end
    end)
end

setupClickToCopy()

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
