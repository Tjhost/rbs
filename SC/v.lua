local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "VOID BETA MENU",
    SubTitle = "by Mr.Time",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Player = Window:AddTab({ Title = "Player", Icon = "rbxassetid://10747384395" }),
    Ability = Window:AddTab({ Title = "Ability", Icon = "rbxassetid://10709818534" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options
local Players, UserInputService, RunService = game:GetService("Players"), game:GetService("UserInputService"), game:GetService("RunService")
local LocalPlayer, Mouse = Players.LocalPlayer, LocalPlayer:GetMouse()

local selectedPlayer, flySpeed, flyEnabled, noclipEnabled = nil, 1, false, false

-- Update Player List
local function UpdatePlayerList()
    local playerList = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

-- UI Toggle Functionality
local uiOpen = true
local function ToggleUI()
    uiOpen = not uiOpen
    Window.Visible = uiOpen
end

-- Initialize Player Dropdown
local playerDropdown = Tabs.Player:AddDropdown("PlayerSelect", {
    Title = "Select Player",
    Values = UpdatePlayerList(),
    Multi = false,
})

Options.PlayerSelect:OnChanged(function()
    selectedPlayer = Players:FindFirstChild(Options.PlayerSelect.Value)
end)

-- Refresh Player List Button
Tabs.Player:AddButton({
    Title = "Refresh Player List",
    Callback = function() Options.PlayerSelect:SetValues(UpdatePlayerList()) end,
})

-- Teleport and Bring Player Functions
local function TeleportToPlayer()
    if selectedPlayer and LocalPlayer.Character then
        local targetPart = selectedPlayer.Character:FindFirstChild("HumanoidRootPart") or selectedPlayer.Character:FindFirstChild("Torso") or selectedPlayer.Character:FindFirstChild("UpperTorso")
        if targetPart then
            LocalPlayer.Character.HumanoidRootPart.CFrame = targetPart.CFrame * CFrame.new(0, 0, 3)
            Fluent:Notify({ Title = "Teleport Successful", Content = "Teleported to " .. selectedPlayer.Name, Duration = 5 })
        else
            Fluent:Notify({ Title = "Teleport Failed", Content = "Unable to find a valid part to teleport to.", Duration = 5 })
        end
    else
        Fluent:Notify({ Title = "Teleport Failed", Content = "Select a valid player first.", Duration = 5 })
    end
end

Tabs.Player:AddButton({ Title = "Teleport to Player", Callback = TeleportToPlayer })
Tabs.Player:AddButton({
    Title = "Bring Player",
    Callback = function()
        if selectedPlayer and selectedPlayer.Character and LocalPlayer.Character then
            selectedPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end
})

-- ESP Toggle
Tabs.Ability:AddToggle("ESP", { Title = "ESP", Default = false })
Options.ESP:OnChanged(function()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local highlight = player.Character:FindFirstChild("ESPHighlight") or Instance.new("Highlight", player.Character)
            highlight.Name, highlight.FillColor, highlight.OutlineColor, highlight.FillTransparency, highlight.OutlineTransparency = "ESPHighlight", player.TeamColor.Color, Color3.new(1, 1, 1), Options.ESP.Value and 0.5 or 0, 0
        end
    end
end)

-- Flight and Noclip Functions
local function UpdateFly()
    local flyPart = Instance.new("Part")
    flyPart.Size, flyPart.Transparency, flyPart.Anchored = Vector3.new(5, 1, 5), 1, true
    flyPart.Parent = workspace

    RunService:BindToRenderStep("Fly", Enum.RenderPriority.Character.Value, function()
        if flyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = LocalPlayer.Character.HumanoidRootPart
            flyPart.CFrame = rootPart.CFrame * CFrame.new(0, -3.5, 0)
            rootPart.Velocity = Vector3.new(0, 0, 0)

            local moveDirection = Vector3.new(
                UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or (UserInputService:IsKeyDown(Enum.KeyCode.A) and -1 or 0),
                UserInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and -1 or 0),
                UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or (UserInputService:IsKeyDown(Enum.KeyCode.W) and -1 or 0)
            )

            rootPart.CFrame = rootPart.CFrame + (rootPart.CFrame:VectorToWorldSpace(moveDirection) * (0.5 * flySpeed))
        end
    end)

    return flyPart
end

Tabs.Ability:AddToggle("Fly", { Title = "Fly", Default = false })
Options.Fly:OnChanged(function()
    flyEnabled = Options.Fly.Value
    if flyEnabled then
        UpdateFly()
    else
        RunService:UnbindFromRenderStep("Fly")
    end
end)

-- Noclip Functionality
local function UpdateNoclip()
    RunService:BindToRenderStep("Noclip", Enum.RenderPriority.Character.Value, function()
        if noclipEnabled and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        else
            RunService:UnbindFromRenderStep("Noclip")
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = true end
                end
            end
        end
    end)
end

Tabs.Ability:AddToggle("Noclip", { Title = "Noclip", Default = false })
Options.Noclip:OnChanged(function() noclipEnabled = Options.Noclip.Value UpdateNoclip() end)

-- UI Toggle Button
local uiToggleButton = Instance.new("TextButton", Window)
uiToggleButton.Text = "Toggle UI"
uiToggleButton.Size = UDim2.new(0, 100, 0, 50)
uiToggleButton.Position = UDim2.new(0.5, -50, 0, -30)
uiToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
uiToggleButton.MouseButton1Click:Connect(ToggleUI)

-- Player List Update
Players.PlayerAdded:Connect(function() Options.PlayerSelect:SetValues(UpdatePlayerList()) end)
Players.PlayerRemoving:Connect(function() Options.PlayerSelect:SetValues(UpdatePlayerList()) end)

-- Setup SaveManager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({ Title = "Script Loaded", Content = "Made by mr.time", Duration = 5 })
SaveManager:LoadAutoloadConfig()
