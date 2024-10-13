-- Gear Spawner Script for Script Injector

-- Function to give admin and builder tools
local function giveTools()
    -- Create and give admin tools
    local adminTool = Instance.new("Tool")
    adminTool.Name = "Admin Tool"
    adminTool.RequiresHandle = true
    local adminHandle = Instance.new("Part")
    adminHandle.Size = Vector3.new(1, 1, 1)
    adminHandle.Anchored = false
    adminHandle.CanCollide = false
    adminHandle.BrickColor = BrickColor.new("Bright red")
    adminHandle.Parent = adminTool
    adminTool.Handle = adminHandle

    -- Optionally add some script functionality to the admin tool here

    -- Create and give builder tools
    local builderTool = Instance.new("Tool")
    builderTool.Name = "Builder Tool"
    builderTool.RequiresHandle = true
    local builderHandle = Instance.new("Part")
    builderHandle.Size = Vector3.new(1, 1, 1)
    builderHandle.Anchored = false
    builderHandle.CanCollide = false
    builderHandle.BrickColor = BrickColor.new("Bright blue")
    builderHandle.Parent = builderTool
    builderTool.Handle = builderHandle

    -- Add tools to player's backpack
    game.Players.LocalPlayer.Backpack:WaitForChild("Backpack"):AddItem(adminTool)
    game.Players.LocalPlayer.Backpack:WaitForChild("Backpack"):AddItem(builderTool)
end

-- Run the function to give tools
giveTools()
