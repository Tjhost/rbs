-- Create Screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TJGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") -- Attach to player's GUI
ScreenGui.ResetOnSpawn = false

-- Create a Main Frame (Phantom Black background)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)  -- Reduced size of the GUI
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)  -- Center position
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black background
MainFrame.BackgroundTransparency = 0.4  -- Phantom transparency
MainFrame.BorderSizePixel = 0  -- No borders
MainFrame.Active = true
MainFrame.Draggable = true  -- Makes the GUI movable
MainFrame.Parent = ScreenGui

-- Add a Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 30)  -- Full width, 30 height
TitleLabel.Position = UDim2.new(0, 0, 0, 0)  -- Top of the frame
TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black background
TitleLabel.BackgroundTransparency = 0.4  -- Phantom transparency
TitleLabel.Text = "TJ GUI"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
TitleLabel.TextSize = 20  -- Text size
TitleLabel.Parent = MainFrame

-- Create Tabs (Side Tabs: Main, Player)
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(0, 80, 1, -50)  -- Tabs area height (full GUI minus title)
TabFrame.Position = UDim2.new(0, 0, 0, 30)  -- On the left side
TabFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TabFrame.BackgroundTransparency = 0.4
TabFrame.Parent = MainFrame

-- Tab Buttons
local function createTabButton(name, position)
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(1, 0, 0, 40)
    TabButton.Position = position
    TabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TabButton.BackgroundTransparency = 0.4
    TabButton.Text = name
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Parent = TabFrame
    return TabButton
end

local MainTabButton = createTabButton("Main", UDim2.new(0, 0, 0, 0))
local PlayerTabButton = createTabButton("Player", UDim2.new(0, 0, 0, 40))

-- Create Main Tab Content
local MainTabContent = Instance.new("Frame")
MainTabContent.Size = UDim2.new(1, -80, 1, -30)  -- Remaining space after title and tabs
MainTabContent.Position = UDim2.new(0, 80, 0, 30)
MainTabContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainTabContent.BackgroundTransparency = 0.4
MainTabContent.Parent = MainFrame

-- Button: Fly
local FlyButton = Instance.new("TextButton")
FlyButton.Size = UDim2.new(0, 120, 0, 40)
FlyButton.Position = UDim2.new(0.5, -60, 0, 20)
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
AdminButton.Size = UDim2.new(0, 120, 0, 40)
AdminButton.Position = UDim2.new(0.5, -60, 0, 70)
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
PlayerTabContent.Size = UDim2.new(1, -80, 1, -30)
PlayerTabContent.Position = UDim2.new(0, 80, 0, 30)
PlayerTabContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlayerTabContent.BackgroundTransparency = 0.4
PlayerTabContent.Visible = false  -- Initially hidden
PlayerTabContent.Parent = MainFrame

-- Slider: Walkspeed Control
local WalkSpeedLabel = Instance.new("TextLabel")
WalkSpeedLabel.Size = UDim2.new(0, 120, 0, 40)
WalkSpeedLabel.Position = UDim2.new(0.5, -60, 0, 20)
WalkSpeedLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeedLabel.BackgroundTransparency = 0.4
WalkSpeedLabel.Text = "Walkspeed: 16"
WalkSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedLabel.Parent = PlayerTabContent

local WalkSpeedInput = Instance.new("TextBox")
WalkSpeedInput.Size = UDim2.new(0, 60, 0, 40)
WalkSpeedInput.Position = UDim2.new(0.5, 70, 0, 20)
WalkSpeedInput.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeedInput.BackgroundTransparency = 0.4
WalkSpeedInput.Text = "16"
WalkSpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedInput.Parent = PlayerTabContent

local WalkSpeedButton = Instance.new("TextButton")
WalkSpeedButton.Size = UDim2.new(0, 120, 0, 40)
WalkSpeedButton.Position = UDim2.new(0.5, -60, 0, 70)
WalkSpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeedButton.BackgroundTransparency = 0.4
WalkSpeedButton.Text = "Set Walkspeed"
WalkSpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedButton.Parent = PlayerTabContent

WalkSpeedButton.MouseButton1Click:Connect(function()
    local speed = tonumber(WalkSpeedInput.Text)
    if speed then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
        WalkSpeedLabel.Text = "Walkspeed: " .. speed
    end
end)

-- Function to handle tab switching
local function switchTab(tab)
    MainTabContent.Visible = false
    PlayerTabContent.Visible = false

    if tab == "Main" then
        MainTabContent.Visible = true
    elseif tab == "Player" then
        PlayerTabContent.Visible = true
    end
end

-- Connect tab button clicks
MainTabButton.MouseButton1Click:Connect(function() switchTab("Main") end)
PlayerTabButton.MouseButton1Click:Connect(function() switchTab("Player") end)

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -40, 0, 10)  -- Positioning in the top-right corner
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red color
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
CloseButton.Parent = MainFrame

local guiVisible = true -- Track visibility of the GUI

CloseButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible  -- Toggle visibility
    MainFrame.Visible = guiVisible
end)

-- Reopen Button
local reopenButton = Instance.new("TextButton")
reopenButton.Size = UDim2.new(0, 60, 0, 60)  -- Size of the reopen button
reopenButton.Position = UDim2.new(0.5, -30, 1, -70)  -- Bottom center position, 3 inches above the bottom
reopenButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black background
reopenButton.Text = "A"  -- Text "A"
reopenButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
reopenButton.TextScaled = true  -- Scaled text
reopenButton.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Connect reopen button functionality
reopenButton.MouseButton1Click:Connect(function()
    guiVisible = true
    MainFrame.Visible = true
    reopenButton:Destroy()  -- Remove the reopen button after clicking
end)

-- Make the reopen button draggable
local dragging = false
reopenButton.MouseButton1Down:Connect(function()
    dragging = true
    local mouse = game.Players.LocalPlayer:GetMouse()
    while dragging do
        reopenButton.Position = UDim2.new(0, mouse.X - 30, 0, mouse.Y - 30) -- Center the button
        wait()
    end
end)

reopenButton.MouseButton1Up:Connect(function()
    dragging = false
end)

-- Initialize with Main tab
switchTab("Main")
