-- CustomUILibrary.lua

local CustomUI = {}
local Player = game.Players.LocalPlayer
local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
local UserInputService = game:GetService("UserInputService")

-- Function to create the main container
function CustomUI:CreateMainContainer(options)
    local mainContainer = Instance.new("Frame")
    mainContainer.Size = options.Size or UDim2.new(0, 400, 0, 300)
    mainContainer.Position = options.Position or UDim2.new(0.5, -200, 0.5, -150)
    mainContainer.BackgroundColor3 = options.BackgroundColor or Color3.new(0.2, 0.2, 0.2)
    mainContainer.BorderSizePixel = options.BorderSize or 0
    mainContainer.Parent = ScreenGui

    return mainContainer
end

-- Function to create a draggable tabbed interface
function CustomUI:CreateTabbedInterface(tabs)
    local container = self:CreateMainContainer({BackgroundColor = Color3.new(0.3, 0.3, 0.3)})

    local tabContainer = Instance.new("Frame")
    tabContainer.Size = UDim2.new(0, 100, 1, 0)
    tabContainer.Position = UDim2.new(0, 0, 0, 0)
    tabContainer.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    tabContainer.Parent = container

    local contentContainer = Instance.new("Frame")
    contentContainer.Size = UDim2.new(1, -100, 1, 0)
    contentContainer.Position = UDim2.new(0, 100, 0, 0)
    contentContainer.BackgroundColor3 = Color3.new(0.25, 0.25, 0.25)
    contentContainer.Parent = container

    local currentTab

    -- Create tabs
    for tabName, tabContent in pairs(tabs) do
        local tabButton = Instance.new("TextButton")
        tabButton.Size = UDim2.new(1, 0, 0, 40)
        tabButton.Text = tabName
        tabButton.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
        tabButton.Parent = tabContainer

        tabButton.MouseButton1Click:Connect(function()
            if currentTab then
                currentTab.Visible = false
            end
            tabContent.Visible = true
            currentTab = tabContent
        end)

        -- Create tab content
        tabContent.Visible = false
        tabContent.Parent = contentContainer
    end

    -- Set the first tab as visible
    if next(tabs) then
        currentTab = tabs[next(tabs)]
        currentTab.Visible = true
    end
end

-- Function to create a draggable frame
function CustomUI:CreateDraggableFrame(options)
    local frame = Instance.new("Frame")
    frame.Size = options.Size or UDim2.new(0, 300, 0, 200)
    frame.Position = options.Position or UDim2.new(0.5, -150, 0.5, -100)
    frame.BackgroundColor3 = options.BackgroundColor or Color3.new(1, 1, 1)
    frame.BorderSizePixel = options.BorderSize or 0
    frame.Parent = ScreenGui

    local titleBar = Instance.new("TextLabel")
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = options.TitleBarColor or Color3.new(0, 0.5, 0)
    titleBar.Text = options.Title or "Draggable Frame"
    titleBar.Parent = frame

    -- Make frame draggable
    local dragging
    local dragInput
    local dragStart
    local startPos

    titleBar.InputBegan:Connect(function(input)
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

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    return frame
end

-- Function to create a button
function CustomUI:CreateButton(options)
    local button = Instance.new("TextButton")
    button.Size = options.Size or UDim2.new(0, 200, 0, 50)
    button.Position = options.Position or UDim2.new(0.5, -100, 0, 0)
    button.Text = options.Text or "Button"
    button.BackgroundColor3 = options.BackgroundColor or Color3.new(0, 0.7, 0.7)
    button.Parent = ScreenGui

    button.MouseButton1Click:Connect(function()
        if options.Callback then
            options.Callback()
        end
    end)

    return button
end

-- Function to create a slider
function CustomUI:CreateSlider(options)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(0, 200, 0, 50)
    sliderFrame.Position = options.Position or UDim2.new(0.5, -100, 0, 0)
    sliderFrame.Parent = ScreenGui

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, 0, 0, 10)
    sliderBar.Position = UDim2.new(0, 0, 0.5, -5)
    sliderBar.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
    sliderBar.Parent = sliderFrame

    local sliderButton = Instance.new("TextButton")
    sliderButton.Size = UDim2.new(0, 10, 0, 30)
    sliderButton.BackgroundColor3 = Color3.new(1, 1, 1)
    sliderButton.Position = UDim2.new(0, 0, 0, 10)
    sliderButton.Parent = sliderFrame

    local value = options.Default or 0
    local min = options.Min or 0
    local max = options.Max or 100

    sliderButton.MouseButton1Down:Connect(function()
        local dragging
        local mouse = game.Players.LocalPlayer:GetMouse()
        
        dragging = true
        while dragging do
            local newPos = math.clamp(mouse.X - sliderBar.AbsolutePosition.X, 0, sliderBar.AbsoluteSize.X)
            sliderButton.Position = UDim2.new(0, newPos, 0, 10)
            value = math.round((newPos / sliderBar.AbsoluteSize.X) * (max - min) + min)
            if options.Callback then
                options.Callback(value)
            end
            wait()
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return sliderFrame
end

return CustomUI
