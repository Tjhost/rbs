-- Custom Script for Roblox with GUI
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local noclipButton = Instance.new("TextButton")
local flyButton = Instance.new("TextButton")
local infiniteJumpButton = Instance.new("TextButton")
local espButton = Instance.new("TextButton")
local teleportButton = Instance.new("TextButton")
local speedSlider = Instance.new("Slider")
local jumpSlider = Instance.new("Slider")
local updateStatsButton = Instance.new("TextButton")

-- GUI Properties
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.Text = "Custom Script"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Parent = mainFrame

local function createButton(name, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.Text = name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Parent = mainFrame
    button.MouseButton1Click:Connect(callback)
    return button
end

noclipButton = createButton("Toggle Noclip", UDim2.new(0, 0, 0.1, 0), function()
    noclipEnabled = not noclipEnabled
    UpdateNoclip()
end)

flyButton = createButton("Toggle Fly", UDim2.new(0, 0, 0.2, 0), function()
    flyEnabled = not flyEnabled
    UpdateFly()
end)

infiniteJumpButton = createButton("Toggle Infinite Jump", UDim2.new(0, 0, 0.3, 0), function()
    infiniteJumpEnabled = not infiniteJumpEnabled
end)

espButton = createButton("Toggle ESP", UDim2.new(0, 0, 0.4, 0), function()
    ToggleESP()
end)

teleportButton = createButton("Teleport to Game", UDim2.new(0, 0, 0.5, 0), function()
    JoinGame()
end)

-- Speed Slider
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 30)
speedLabel.Position = UDim2.new(0, 0, 0.6, 0)
speedLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
speedLabel.Text = "Speed: " .. tostring(speed)
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.Parent = mainFrame

speedSlider = Instance.new("Slider")
speedSlider.Size = UDim2.new(1, 0, 0, 30)
speedSlider.Position = UDim2.new(0, 0, 0.65, 0)
speedSlider.MinValue = 0
speedSlider.MaxValue = 100
speedSlider.Value = speed
speedSlider.Parent = mainFrame
speedSlider.Changed:Connect(function()
    speed = speedSlider.Value
    speedLabel.Text = "Speed: " .. tostring(speed)
end)

-- Jump Power Slider
local jumpLabel = Instance.new("TextLabel")
jumpLabel.Size = UDim2.new(1, 0, 0, 30)
jumpLabel.Position = UDim2.new(0, 0, 0.75, 0)
jumpLabel.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
jumpLabel.Text = "Jump Power: " .. tostring(jumpPower)
jumpLabel.TextColor3 = Color3.new(1, 1, 1)
jumpLabel.Parent = mainFrame

jumpSlider = Instance.new("Slider")
jumpSlider.Size = UDim2.new(1, 0, 0, 30)
jumpSlider.Position = UDim2.new(0, 0, 0.8, 0)
jumpSlider.MinValue = 0
jumpSlider.MaxValue = 100
jumpSlider.Value = jumpPower
jumpSlider.Parent = mainFrame
jumpSlider.Changed:Connect(function()
    jumpPower = jumpSlider.Value
    jumpLabel.Text = "Jump Power: " .. tostring(jumpPower)
end)

-- Print on Load
print("Custom script with GUI loaded successfully!")

-- Feature Variables
local noclipEnabled = false
local flyEnabled = false
local infiniteJumpEnabled = false
local speed = 16
local jumpPower = 50
local flySpeed = 50

-- Noclip Function
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

-- Fly Function
local function UpdateFly()
    if flyEnabled then
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
                rootPart.CFrame = rootPart.CFrame + (rootPart.CFrame:VectorToWorldSpace(moveDirection) * (flySpeed * 0.1))
            end
        end)
    else
        RunService:UnbindFromRenderStep("Fly")
    end
end

-- Infinite Jump Function
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        if LocalPlayer.Character then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- Join Game Function
local function JoinGame()
    local gameID = "4937130168"
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(gameID, LocalPlayer)
end

-- Toggle ESP Function
local function ToggleESP()
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
end

-- Print on Load
print("Custom script with GUI loaded successfully!")
