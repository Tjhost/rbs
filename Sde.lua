-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))

-- Create a Frame for the menu
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 250, 0, 250)
frame.Position = UDim2.new(0.5, -125, 0.5, -125)
frame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
frame.BorderSizePixel = 0

-- Add rounded corners to the frame
local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 10)

-- Create a title for the menu
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(0, 250, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Teleport Menu"
title.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true

-- Add rounded corners to the title
local uicorner2 = Instance.new("UICorner", title)
uicorner2.CornerRadius = UDim.new(0, 10)

-- Create a ScrollingFrame for player buttons
local scrollFrame = Instance.new("ScrollingFrame", frame)
scrollFrame.Size = UDim2.new(0, 230, 0, 150)
scrollFrame.Position = UDim2.new(0, 10, 0, 40)
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
scrollFrame.ScrollBarThickness = 6

-- Add rounded corners to the scrolling frame
local uicorner3 = Instance.new("UICorner", scrollFrame)
uicorner3.CornerRadius = UDim.new(0, 10)

-- Create minimize and close buttons
local minimizeButton = Instance.new("TextButton", frame)
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -70, 0, 5)
minimizeButton.Text = "-"
minimizeButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)

local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)

-- Create a refresh button
local refreshButton = Instance.new("TextButton", frame)
refreshButton.Size = UDim2.new(0, 80, 0, 30)
refreshButton.Position = UDim2.new(0.5, -40, 0, 200)
refreshButton.Text = "Refresh"
refreshButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)

-- Dragging functionality
local dragging = false
local dragInput, dragStart, startPos
local isMinimized = false

-- Function to update player list
local function updatePlayerList()
    scrollFrame:ClearAllChildren()
    local players = game.Players:GetPlayers()
    for i, p in pairs(players) do
        if p ~= game.Players.LocalPlayer then
            local playerButton = Instance.new("TextButton", scrollFrame)
            playerButton.Size = UDim2.new(0, 200, 0, 30)
            playerButton.Position = UDim2.new(0, 10, 0, (i - 1) * 35)
            playerButton.Text = p.Name
            playerButton.TextColor3 = Color3.new(1, 1, 1)
            playerButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)

            -- Teleport to player on button click
            playerButton.MouseButton1Click:Connect(function()
                if p.Character and p.Character.PrimaryPart then
                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(p.Character.PrimaryPart.CFrame)
                end
            end)
        end
    end
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, #players * 35)
end

-- Event connections for dragging
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Minimize button functionality
minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    frame.Size = isMinimized and UDim2.new(0, 250, 0, 30) or UDim2.new(0, 250, 0, 250)
    scrollFrame.Visible = not isMinimized
    title.Visible = not isMinimized
    minimizeButton.Text = isMinimized and "+" or "-"
end)

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Refresh button functionality
refreshButton.MouseButton1Click:Connect(function()
    updatePlayerList()
end)

-- Initial player list update
updatePlayerList()
