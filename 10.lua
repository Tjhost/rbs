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

-- Create Tabs (Side Tabs: Main, Player, Admin)
local TabFrame = Instance.new("Frame")
TabFrame.Size = UDim2.new(0, 80, 1, -50)  -- Tabs area height (full GUI minus title)
TabFrame.Position = UDim2.new(0, 0, 0, 30)  -- On the left side
TabFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TabFrame.BackgroundTransparency = 0.4
TabFrame.Parent = MainFrame

-- Function to create tab buttons
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

-- Create Tab Buttons
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

-- Function to create controls for speed and jump power
local function createSpeedAndJumpControls()
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
        local power = tonumber(JumpPowerInput.Text)
        if power then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = power
            JumpPowerLabel.Text = "Jump Power: " .. power
        end
    end)
end

createSpeedAndJumpControls()  -- Call the function to create controls

-- Show/Hide Tab Contents based on button clicks
local function switchTab(tab)
    MainTabContent.Visible = tab == "Main"
    PlayerTabContent.Visible = tab == "Player"
    -- You can add AdminTabContent handling here if needed
end

MainTabButton.MouseButton1Click:Connect(function() switchTab("Main") end)
PlayerTabButton.MouseButton1Click:Connect(function() switchTab("Player") end)
AdminTabButton.MouseButton1Click:Connect(function() switchTab("Admin") end)

-- Show the GUI on startup
ScreenGui.Enabled = true
