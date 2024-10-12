-- Load Fluent Framework and Addons
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Create Screen GUI for the Main Frame (TJ GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TJGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")  -- Attach to Player GUI
ScreenGui.ResetOnSpawn = false

-- Create the Main Frame (Phantom Black background, larger size)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)  -- Larger GUI size
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)  -- Center the GUI
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Phantom black
MainFrame.BackgroundTransparency = 0.4  -- Semi-transparent
MainFrame.BorderSizePixel = 0  -- No border
MainFrame.Active = true
MainFrame.Draggable = true  -- Movable GUI
MainFrame.Parent = ScreenGui

-- Create the Title Label for the GUI
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 30)  -- Full width, 30px height
TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Phantom black background
TitleLabel.BackgroundTransparency = 0.4  -- Semi-transparent
TitleLabel.Text = "TJ GUI"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
TitleLabel.TextSize = 20
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
local AdminTabButton = createTabButton("Admin", UDim2.new(0, 0, 0, 80))

-- Create Main Tab Content
local MainTabContent = Instance.new("Frame")
MainTabContent.Size = UDim2.new(1, -80, 1, -30)  -- Remaining space after title and tabs
MainTabContent.Position = UDim2.new(0, 80, 0, 30)
MainTabContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainTabContent.BackgroundTransparency = 0.4
MainTabContent.Parent = MainFrame

-- Add the image from the provided URL
local ImageUrl = "https://raw.githubusercontent.com/Tjhost/rbs/main/pngtree-letter-t-cork-transparent-background-png-image_5963257.jpg"
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Size = UDim2.new(0, 200, 0, 200)  -- Adjust the size of the image
ImageLabel.Position = UDim2.new(0.5, -100, 0.5, -100)  -- Center the image
ImageLabel.BackgroundTransparency = 1  -- Make background transparent
ImageLabel.Image = ImageUrl  -- Set image from GitHub URL
ImageLabel.Parent = MainTabContent  -- Add image to Main Tab

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

-- Create Player Tab Content (with Walk and Jump Speed Controls)
local PlayerTabContent = Instance.new("Frame")
PlayerTabContent.Size = UDim2.new(1, -80, 1, -30)
PlayerTabContent.Position = UDim2.new(0, 80, 0, 30)
PlayerTabContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
PlayerTabContent.BackgroundTransparency = 0.4
PlayerTabContent.Visible = false  -- Initially hidden
PlayerTabContent.Parent = MainFrame

-- Walkspeed Control
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

-- JumpPower Control
local JumpPowerLabel = Instance.new("TextLabel")
JumpPowerLabel.Size = UDim2.new(0, 120, 0, 40)
JumpPowerLabel.Position = UDim2.new(0.5, -60, 0, 130)
JumpPowerLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
JumpPowerLabel.BackgroundTransparency = 0.4
JumpPowerLabel.Text = "Jump Power: 50"
JumpPowerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpPowerLabel.Parent = PlayerTabContent

local JumpPowerInput = Instance.new("TextBox")
JumpPowerInput.Size = UDim2.new(0, 60, 0, 40)
JumpPowerInput.Position = UDim2.new(0.5, 70, 0, 130)
JumpPowerInput.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
JumpPowerInput.BackgroundTransparency = 0.4
JumpPowerInput.Text = "50"
JumpPowerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpPowerInput.Parent = PlayerTabContent

local JumpPowerButton = Instance.new("TextButton")
JumpPowerButton.Size = UDim2.new(0, 120, 0, 40)
JumpPowerButton.Position = UDim2.new(0.5, -60, 0, 180)
JumpPowerButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
JumpPowerButton.BackgroundTransparency = 0.4
JumpPowerButton.Text = "Set Jump Power"
JumpPowerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpPowerButton.Parent = PlayerTabContent

JumpPowerButton.MouseButton1Click:Connect(function()
    local jumpPower = tonumber(JumpPowerInput.Text)
    if jumpPower then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpPower
        JumpPowerLabel.Text = "Jump Power: " .. jumpPower
    end
end)

-- Create Admin Tab Content (No separate panel)
local AdminTabContent = Instance.new("Frame")
AdminTabContent.Size = UDim2.new(1, -80, 1, -30)
AdminTabContent.Position = UDim2.new(0, 80, 0, 30)
AdminTabContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AdminTabContent.BackgroundTransparency = 0.4
AdminTabContent.Visible = false  -- Initially hidden
AdminTabContent.Parent = MainFrame

-- Admin Button that executes the specified Lua script
local AdminButton = Instance.new("TextButton")
AdminButton.Size = UDim2.new(0, 120, 0, 40)
AdminButton.Position = UDim2.new(0.5, -60, 0, 20)
AdminButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AdminButton.BackgroundTransparency = 0.4
AdminButton.Text = "Execute Admin Script"
AdminButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AdminButton.Parent = AdminTabContent

AdminButton.MouseButton1Click:Connect(function()
    -- Execute the admin script here
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tjhost/rbs/refs/heads/main/SC/1.lua", true))()
end)

-- Tab Button Click Handlers
MainTabButton.MouseButton1Click:Connect(function()
    MainTabContent.Visible = true
    PlayerTabContent.Visible = false
    AdminTabContent.Visible = false
end)

PlayerTabButton.MouseButton1Click:Connect(function()
    MainTabContent.Visible = false
    PlayerTabContent.Visible = true
    AdminTabContent.Visible = false
end)

AdminTabButton.MouseButton1Click:Connect(function()
    MainTabContent.Visible = false
    PlayerTabContent.Visible = false
    AdminTabContent.Visible = true
end)

-- Show Main Tab by default
MainTabContent.Visible = true
