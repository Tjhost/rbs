-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlyGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
frame.Parent = screenGui

-- Create a TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.Text = "Click to Start Flying"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.BackgroundTransparency = 1
textLabel.Parent = frame

-- Variables
local flying = false

-- Function to toggle flying
local function toggleFly()
    flying = not flying
    if flying then
        -- Call the flying function from the script loaded below
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tjhost/rbs/refs/heads/main/function/fly.lua"))()
    else
        -- Stop flying (you might need to implement this in your fly.lua)
        print("Stopped flying")  -- Replace with actual stop flying logic
    end
end

-- Make the Frame clickable
frame.MouseButton1Click:Connect(toggleFly)

-- Key press detection
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.Equals then -- '+' key is represented as Equals
            toggleFly()
        end
    end
end)

-- Function to clean up when the script ends
local function onDestroy()
    screenGui:Destroy()
end

-- Connect the cleanup function to the PlayerRemoving event
game.Players.LocalPlayer.PlayerRemoving:Connect(onDestroy)
