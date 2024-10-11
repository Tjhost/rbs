-- Create Screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PhantomBlackGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") -- Attach to player's GUI

-- Create a Main Frame (Phantom Black background)
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 300)  -- Size (Width, Height)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)  -- Center position
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

-- Create a Button (Phantom Black)
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 200, 0, 50)  -- Width 200, Height 50
Button.Position = UDim2.new(0.5, -100, 0.5, -25)  -- Centered in the frame
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black background
Button.BackgroundTransparency = 0.4  -- Phantom transparency
Button.BorderSizePixel = 0  -- No borders
Button.Text = "Click Me"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
Button.TextSize = 18
Button.Parent = MainFrame

-- Add functionality to the button
Button.MouseButton1Click:Connect(function()
    Button.Text = "Clicked!"
end)

-- Create a Slider (Custom Walkspeed Control)
local WalkSpeedSlider = Instance.new("TextLabel")
WalkSpeedSlider.Size = UDim2.new(0, 200, 0, 50)
WalkSpeedSlider.Position = UDim2.new(0.5, -100, 0.5, 75)
WalkSpeedSlider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeedSlider.BackgroundTransparency = 0.4
WalkSpeedSlider.BorderSizePixel = 0
WalkSpeedSlider.Text = "Walkspeed: 16"
WalkSpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
WalkSpeedSlider.TextSize = 18
WalkSpeedSlider.Parent = MainFrame

-- Create a Slider Functionality
local sliderValue = 16  -- Initial walkspeed value
Button.MouseButton1Click:Connect(function()
    sliderValue = sliderValue + 10  -- Increment walkspeed
    if sliderValue > 100 then sliderValue = 16 end  -- Reset if above 100
    WalkSpeedSlider.Text = "Walkspeed: " .. sliderValue
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = sliderValue
end)

-- Create an "X" Button to Minimize (Bottom Right)
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 50, 0, 50)  -- Small square for "X" button
CloseButton.Position = UDim2.new(1, -55, 1, -55)  -- Bottom right corner
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red for emphasis
CloseButton.BackgroundTransparency = 0.4
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.Parent = MainFrame

-- Minimize function
local ReopenButton = nil  -- Define variable for reopening button

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false  -- Hide the GUI when "X" is clicked

    -- Create the Reopen Button (Small box on screen)
    ReopenButton = Instance.new("TextButton")
    ReopenButton.Size = UDim2.new(0, 100, 0, 50)  -- Size for reopen button
    ReopenButton.Position = UDim2.new(0, 10, 1, -60)  -- Bottom left of screen
    ReopenButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Black with phantom transparency
    ReopenButton.BackgroundTransparency = 0.4
    ReopenButton.Text = "Reopen GUI"
    ReopenButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
    ReopenButton.TextSize = 14
    ReopenButton.Parent = ScreenGui

    -- Reopen the GUI when Reopen Button is clicked
    ReopenButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = true  -- Show the GUI again
        ReopenButton:Destroy()  -- Remove the reopen button
    end)
end)
