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
MainFrame.Visible = false  -- Initially hidden
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
local ClothesTabButton = createTabButton("Clothes", UDim2.new(0, 0, 0, 120))

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

-- Create Clothes Tab Content
local ClothesTabContent = Instance.new("Frame")
ClothesTabContent.Size = UDim2.new(1, -80, 1, -30)
ClothesTabContent.Position = UDim2.new(0, 80, 0, 30)
ClothesTabContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ClothesTabContent.BackgroundTransparency = 0.4
ClothesTabContent.Visible = false  -- Initially hidden
ClothesTabContent.Parent = MainFrame

-- Function to add clothing options
local function createClothesOptions()
    -- Shirt Options
    local ShirtLabel = Instance.new("TextLabel")
    ShirtLabel.Size = UDim2.new(1, 0, 0, 40)
    ShirtLabel.Position = UDim2.new(0, 0, 0, 20)
    ShirtLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ShirtLabel.BackgroundTransparency = 0.4
    ShirtLabel.Text = "Shirt ID:"
    ShirtLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ShirtLabel.Parent = ClothesTabContent

    local ShirtInput = Instance.new("TextBox")
    ShirtInput.Size = UDim2.new(0, 200, 0, 40)
    ShirtInput.Position = UDim2.new(0, 0, 0, 60)
    ShirtInput.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ShirtInput.BackgroundTransparency = 0.4
    ShirtInput.Text = ""
    ShirtInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    ShirtInput.Parent = ClothesTabContent

    local ShirtButton = Instance.new("TextButton")
    ShirtButton.Size = UDim2.new(0, 100, 0, 40)
    ShirtButton.Position = UDim2.new(0, 220, 0, 60)
    ShirtButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    ShirtButton.BackgroundTransparency = 0.4
    ShirtButton.Text = "Apply Shirt"
    ShirtButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ShirtButton.Parent = ClothesTabContent

    ShirtButton.MouseButton1Click:Connect(function()
        local shirtID = ShirtInput.Text
        if shirtID ~= "" then
            local shirt = Instance.new("Shirt")
            shirt.ShirtTemplate = "rbxassetid://" .. shirtID
            shirt.Parent = game.Players.LocalPlayer.Character
        end
    end)

    -- Pants Options
    local PantsLabel = Instance.new("TextLabel")
    PantsLabel.Size = UDim2.new(1, 0, 0, 40)
    PantsLabel.Position = UDim2.new(0, 0, 0, 120)
    PantsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    PantsLabel.BackgroundTransparency = 0.4
    PantsLabel.Text = "Pants ID:"
    PantsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    PantsLabel.Parent = ClothesTabContent

    local PantsInput = Instance.new("TextBox")
    PantsInput.Size = UDim2.new(0, 200, 0, 40)
    PantsInput.Position = UDim2.new(0, 0, 0, 160)
    PantsInput.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    PantsInput.BackgroundTransparency = 0.4
    PantsInput.Text = ""
    PantsInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    PantsInput.Parent = ClothesTabContent

    local PantsButton = Instance.new("TextButton")
    PantsButton.Size = UDim2.new(0, 100, 0, 40)
    PantsButton.Position = UDim2.new(0, 220, 0, 160)
    PantsButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    PantsButton.BackgroundTransparency = 0.4
    PantsButton.Text = "Apply Pants"
    PantsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    PantsButton.Parent = ClothesTabContent

    PantsButton.MouseButton1Click:Connect(function()
        local pantsID = PantsInput.Text
        if pantsID ~= "" then
            local pants = Instance.new("Pants")
            pants.PantsTemplate = "rbxassetid://" .. pantsID
            pants.Parent = game.Players.LocalPlayer.Character
        end
    end)
end

createClothesOptions()  -- Call the function to create clothing options

-- Show/Hide Tab Contents based on button clicks
local function switchTab(tab)
    MainTabContent.Visible = tab == "Main"
    PlayerTabContent.Visible = tab == "Player"
    ClothesTabContent.Visible = tab == "Clothes"
end

MainTabButton.MouseButton1Click:Connect(function() switchTab("Main") end)
PlayerTabButton.MouseButton1Click:Connect(function() switchTab("Player") end)
ClothesTabButton.MouseButton1Click:Connect(function() switchTab("Clothes") end)

-- Create Open/Close Button with Image
local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 40, 0, 40)
OpenButton.Position = UDim2.new(0.5, -20, 0, 10)
OpenButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- White background for the button
OpenButton.BackgroundTransparency = 1  -- Fully transparent to show image
OpenButton.Parent = ScreenGui

-- Add Image for Open/Close Button
local OpenCloseImage = Instance.new("ImageLabel")
OpenCloseImage.Size = UDim2.new(1, 0, 1, 0)
OpenCloseImage.Image = "https://tjhost.github.io/rbs/pngtree-letter-t-cork-transparent-background-png-image_5963257.jpg"  -- Replace with the provided image
OpenCloseImage.Parent = OpenButton

OpenButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible  -- Toggle visibility
end)

-- Show the GUI on startup
ScreenGui.Enabled = true
