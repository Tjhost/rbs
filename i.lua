-- Create Screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PhantomBlackGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") -- Attach to player's GUI

-- Create a Main Frame (Phantom Black background)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 400)  -- Size (Width, Height)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)  -- Center position
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black background
MainFrame.BackgroundTransparency = 0.4  -- Phantom transparency
MainFrame.BorderSizePixel = 0  -- No borders
MainFrame.Parent = ScreenGui

-- Add a Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 50)  -- Full width, 50 height
TitleLabel.Position = UDim2.new(0, 0, 0, 0)  -- Top of the frame
TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black background
TitleLabel.BackgroundTransparency = 0.4  -- Phantom transparency
TitleLabel.Text = "Phantom Black GUI"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
TitleLabel.TextSize = 24  -- Text size
TitleLabel.Parent = MainFrame

-- Create Tabs (Main, Player)
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(1, 0, 0, 30)  -- Tabs area height 30
TabFrame.Position = UDim2.new(0, 0, 0, 50)  -- Below title
TabFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TabFrame.BackgroundTransparency = 0.4
TabFrame.Parent = MainFrame

local MainTabButton = Instance.new("TextButton")
MainTabButton.Size = UDim2.new(0, 100, 0, 30)
MainTabButton.Position = UDim2.new(0, 0, 0, 0)
MainTabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainTabButton.BackgroundTransparency = 0.4
MainTabButton.Text = "Main"
MainTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTabButton.Parent = TabFrame

local PlayerTabButton = Instance.new("TextButton")
PlayerTabButton.Size = UDim2.new(0, 100, 0, 30)
PlayerTabButton.Position = UDim2.new(0, 100, 0, 0)
PlayerTabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlayerTabButton.BackgroundTransparency = 0.4
PlayerTabButton.Text = "Player"
PlayerTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerTabButton.Parent = TabFrame

-- Create Main Tab Content
local MainTabContent = Instance.new("Frame")
MainTabContent.Size = UDim2.new(1, 0, 1, -80)  -- Remaining space after tabs and title
MainTabContent.Position = UDim2.new(0, 0, 0, 80)
MainTabContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainTabContent.BackgroundTransparency = 0.4
MainTabContent.Parent = MainFrame

-- Button: Fly
local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0, 200, 0, 50)
FlyButton.Position = UDim2.new(0.5, -100, 0, 20)
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FlyButton.BackgroundTransparency = 0.4
FlyButton.Text = "Fly"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.Parent = MainTabContent

FlyButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/MsL78SwX'))()  -- Fly script
end)

-- Button: Admin
local AdminButton = Instance.new("TextButton")
AdminButton.Size = UDim2.new(0, 200, 0, 50)
AdminButton.Position = UDim2.new(0.5, -100, 0, 80)
AdminButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AdminButton.BackgroundTransparency = 0.4
AdminButton.Text = "Admin"
AdminButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AdminButton.Parent = MainTabContent

AdminButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()  -- Admin commands
end)

-- Create Player Tab Content
local PlayerTabContent = Instance.new("Frame")
PlayerTabContent.Size = UDim2.new(1, 0, 1, -80)
PlayerTabContent.Position = UDim2.new(0, 0, 0, 80)
PlayerTabContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlayerTabContent.BackgroundTransparency = 0.4
PlayerTabContent.Visible = false  -- Initially hidden
PlayerTabContent.Parent = MainFrame

-- Slider: Walkspeed Control
local WalkSpeedSlider = Instance.new("TextLabel")
WalkSpeedSlider.Size = UDim2.new(0, 200, 0, 50)
WalkSpeedSlider.Position = UDim2.new(0.5, -100, 0, 20)
WalkSpeedSlider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeedSlider.BackgroundTransparency = 0.4
WalkSpeedSlider.Text = "Walkspeed: 16"
WalkSpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedSlider.Parent = PlayerTabContent

local sliderValue = 16
WalkSpeedSlider.MouseButton1Click:Connect(function()
    sliderValue = sliderValue + 10  -- Increment walkspeed
    if sliderValue > 100 then sliderValue = 16 end
    WalkSpeedSlider.Text = "Walkspeed: " .. sliderValue
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = sliderValue
end)

-- Tab Switching Logic
MainTabButton.MouseButton1Click:Connect(function()
    MainTabContent.Visible = true
    PlayerTabContent.Visible = false
end)

PlayerTabButton.MouseButton1Click:Connect(function()
    MainTabContent.Visible = false
    PlayerTabContent.Visible = true
end)

-- Create an "X" Button to Minimize (Bottom Right)
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 50, 0, 50)
CloseButton.Position = UDim2.new(1, -55, 1, -55)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.BackgroundTransparency = 0.4
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.Parent = MainFrame

-- Minimize function
local ReopenButton = nil

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false  -- Hide the GUI when "X" is clicked

    -- Create the Reopen Button (Small box on screen)
    ReopenButton = Instance.new("TextButton")
    ReopenButton.Size = UDim2.new(0, 100, 0, 50)  -- Size for reopen button
    ReopenButton.Position = UDim2.new(0, 10, 1, -60)  -- Bottom left of screen
    ReopenButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black with phantom transparency
    ReopenButton.BackgroundTransparency = 0.4
    ReopenButton.Text = "Reopen GUI"
    ReopenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ReopenButton.TextSize = 14
    ReopenButton.Parent = ScreenGui

    -- Reopen the GUI when Reopen Button is clicked
    ReopenButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true  -- Show the GUI again
        ReopenButton:Destroy()  -- Remove the reopen button
    end)
end)
