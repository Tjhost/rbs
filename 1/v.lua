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
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local selectedPlayer = nil
local flyEnabled = false
local flySpeed = 1
local noclipEnabled = false

local function UpdatePlayerList()
    local playerList = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

local function TeleportToPlayer()
    if selectedPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetCFrame
        if selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            targetCFrame = selectedPlayer.Character.HumanoidRootPart.CFrame
        else
            Fluent:Notify({ Title = "Teleport Failed", Content = "Target player not found.", Duration = 5 })
            return
        end
        
        LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame * CFrame.new(0, 0, 3)
        Fluent:Notify({ Title = "Teleport Successful", Content = "Teleported to " .. selectedPlayer.Name, Duration = 5 })
    else
        Fluent:Notify({ Title = "Teleport Failed", Content = "Please select a valid player first.", Duration = 5 })
    end
end

local function UpdateNoclip()
    if noclipEnabled then
        RunService:BindToRenderStep("Noclip", Enum.RenderPriority.Character.Value, function()
            if LocalPlayer.Character then
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        RunService:UnbindFromRenderStep("Noclip")
        if LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
        end
    end
end

local function UpdateFly()
    local flyPart
    if flyEnabled then
        if not flyPart then
            flyPart = Instance.new("Part")
            flyPart.Size = Vector3.new(5, 1, 5)
            flyPart.Transparency = 1
            flyPart.Anchored = true
            flyPart.Parent = workspace
        end

        RunService:BindToRenderStep("Fly", Enum.RenderPriority.Character.Value, function()
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local rootPart = character.HumanoidRootPart
                rootPart.Velocity = Vector3.new(0, 0, 0)

                local moveDirection = Vector3.new(
                    UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or (UserInputService:IsKeyDown(Enum.KeyCode.A) and -1 or 0),
                    UserInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and -1 or 0),
                    UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or (UserInputService:IsKeyDown(Enum.KeyCode.W) and -1 or 0)
                )

                rootPart.CFrame = rootPart.CFrame + (rootPart.CFrame:VectorToWorldSpace(moveDirection) * (0.5 * flySpeed))
            end
        end)
    else
        RunService:UnbindFromRenderStep("Fly")
        if flyPart then
            flyPart:Destroy()
            flyPart = nil
        end
    end
end

Tabs.Player:AddDropdown("PlayerSelect", {
    Title = "Select Player",
    Values = UpdatePlayerList(),
    Multi = false,
})

Options.PlayerSelect:OnChanged(function()
    selectedPlayer = Players:FindFirstChild(Options.PlayerSelect.Value)
end)

Tabs.Player:AddButton({
    Title = "Refresh Player List",
    Callback = function()
        Options.PlayerSelect:SetValues(UpdatePlayerList())
    end
})

Tabs.Player:AddButton({
    Title = "Teleport to Player",
    Callback = TeleportToPlayer
})

Tabs.Player:AddButton({
    Title = "Bring Player",
    Callback = function()
        if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            selectedPlayer.Character.HumanoidRootPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
            Fluent:Notify({ Title = "Success", Content = selectedPlayer.Name .. " has been brought to you.", Duration = 5 })
        else
            Fluent:Notify({ Title = "Error", Content = "Unable to bring player.", Duration = 5 })
        end
    end
})

Tabs.Player:AddButton({
    Title = "Freeze Player",
    Callback = function()
        if selectedPlayer and selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            selectedPlayer.Character.HumanoidRootPart.Anchored = true
            Fluent:Notify({ Title = "Player Frozen", Content = selectedPlayer.Name .. " has been frozen.", Duration = 5 })
        else
            Fluent:Notify({ Title = "Error", Content = "Unable to freeze player.", Duration = 5 })
        end
    end
})

Tabs.Ability:AddToggle("ESP", { Title = "ESP", Default = false })
Options.ESP:OnChanged(function()
    if Options.ESP.Value then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local highlight = Instance.new("Highlight")
                highlight.Name = "ESPHighlight"
                highlight.FillColor = player.TeamColor.Color
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
                highlight.Adornee = player.Character
                highlight.Parent = player.Character
            end
        end
    else
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local highlight = player.Character:FindFirstChild("ESPHighlight")
                if highlight then
                    highlight:Destroy()
                end
            end
        end
    end
end)

Tabs.Ability:AddToggle("Fly", { Title = "Fly", Default = false })
Options.Fly:OnChanged(function()
    flyEnabled = Options.Fly.Value
    UpdateFly()
end)

Tabs.Ability:AddSlider("FlySpeed", {
    Title = "Fly Speed",
    Default = 1,
    Min = 1,
    Max = 10,
    Rounding = 0,
    Callback = function(Value)
        flySpeed = Value
    end
})

Tabs.Ability:AddToggle("Noclip", { Title = "Noclip", Default = false })
Options.Noclip:OnChanged(function()
    noclipEnabled = Options.Noclip.Value
    UpdateNoclip()
end)

Tabs.Ability:AddToggle("Infinite Jump", { Title = "Infinite Jump", Default = false })
Options["Infinite Jump"]:OnChanged(function()
    if Options["Infinite Jump"].Value then
        UserInputService.JumpRequest:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    end
end)

-- Configuration saving
local saveManager = SaveManager.new("VOID_CONFIG")
saveManager:Load({
    ESP = false,
    Fly = false,
    FlySpeed = 1,
    Noclip = false,
    ["Infinite Jump"] = false,
})

for option, value in pairs(saveManager:GetAll()) do
    Options[option]:SetValue(value)
end

Window:OnClose(function()
    saveManager:Save({
        ESP = Options.ESP.Value,
        Fly = Options.Fly.Value,
        FlySpeed = flySpeed,
        Noclip = Options.Noclip.Value,
        ["Infinite Jump"] = Options["Infinite Jump"].Value,
    })
end)

Window:Show()
