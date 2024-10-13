-- Custom Library for UI
local CustomUI = {}

function CustomUI:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Frame.Size = UDim2.new(0, 300, 0, 400)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.Parent = ScreenGui

    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Parent = Frame

    return Frame, ScreenGui
end

function CustomUI:CreateButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Parent = parent

    Button.MouseButton1Click:Connect(callback)

    return Button
end

function CustomUI:CreateSlider(parent, text, min, max, callback)
    local SliderFrame = Instance.new("Frame")
    local SliderLabel = Instance.new("TextLabel")
    local Slider = Instance.new("TextButton")
    
    SliderFrame.Size = UDim2.new(1, 0, 0, 50)
    SliderFrame.Parent = parent
    
    SliderLabel.Size = UDim2.new(1, 0, 0, 20)
    SliderLabel.Text = text
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Parent = SliderFrame

    Slider.Size = UDim2.new(1, 0, 0, 20)
    Slider.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    Slider.Parent = SliderFrame

    local Value = min
    Slider.Text = tostring(Value)

    Slider.MouseButton1Down:Connect(function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        while mouse.Button1Down do
            local position = mouse.X - SliderFrame.AbsolutePosition.X
            local percentage = math.clamp(position / SliderFrame.AbsoluteSize.X, 0, 1)
            Value = math.floor(min + (percentage * (max - min)))
            Slider.Text = tostring(Value)
            callback(Value)
            wait()
        end
    end)

    return SliderFrame
end

-- Create UI Window
local mainWindow, screenGui = CustomUI:CreateWindow("Custom Script")

-- Toggle variables
local noclipEnabled = false
local flyEnabled = false
local infiniteJumpEnabled = false
local playerSpeed = 16 -- Default walk speed
local jumpPower = 50 -- Default jump power

-- Create Noclip Button
CustomUI:CreateButton(mainWindow, "Toggle Noclip", function()
    noclipEnabled = not noclipEnabled
    if noclipEnabled then
        print("Noclip enabled")
    else
        print("Noclip disabled")
    end
end)

-- Create Fly Button
CustomUI:CreateButton(mainWindow, "Toggle Fly", function()
    flyEnabled = not flyEnabled
    if flyEnabled then
        print("Fly enabled")
    else
        print("Fly disabled")
    end
end)

-- Create Infinite Jump Button
CustomUI:CreateButton(mainWindow, "Toggle Infinite Jump", function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    if infiniteJumpEnabled then
        print("Infinite Jump enabled")
    else
        print("Infinite Jump disabled")
    end
end)

-- Create Speed Slider
CustomUI:CreateSlider(mainWindow, "Speed", 16, 100, function(value)
    playerSpeed = value
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = playerSpeed
    print("Speed set to:", playerSpeed)
end)

-- Create Jump Power Slider
CustomUI:CreateSlider(mainWindow, "Jump Power", 50, 200, function(value)
    jumpPower = value
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpPower
    print("Jump Power set to:", jumpPower)
end)

-- Setup Infinite Jump functionality
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Enable noclip functionality
game:GetService("RunService").RenderStepped:Connect(function()
    if noclipEnabled and game.Players.LocalPlayer.Character then
        for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Enable fly functionality
-- (Add your fly implementation here)
