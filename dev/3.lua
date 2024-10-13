-- Gear Spawner Script for Script Injector

-- Function to give admin, builder tools, and a sword
local function giveTools()
    local player = game.Players.LocalPlayer

    -- Create and give admin tool
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

    -- Create and give builder tool
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

    -- Create and give sword tool
    local swordTool = Instance.new("Tool")
    swordTool.Name = "Sword"
    swordTool.RequiresHandle = true
    local swordHandle = Instance.new("Part")
    swordHandle.Size = Vector3.new(1, 4, 0.2) -- Size of the sword
    swordHandle.Anchored = false
    swordHandle.CanCollide = false
    swordHandle.BrickColor = BrickColor.new("Bright yellow")
    swordHandle.Parent = swordTool
    swordTool.Handle = swordHandle

    -- Script to handle sword damage (basic example)
    local swordScript = Instance.new("Script")
    swordScript.Source = [[
        local tool = script.Parent
        local function onHit(hit)
            if hit and hit:IsA("Player") then
                local character = hit
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:TakeDamage(10) -- Damage amount
                end
            end
        end
        tool.Touched:Connect(onHit)
    ]]
    swordScript.Parent = swordTool

    -- Add tools to player's backpack
    player.Backpack:WaitForChild("Backpack"):AddItem(adminTool)
    player.Backpack:WaitForChild("Backpack"):AddItem(builderTool)
    player.Backpack:WaitForChild("Backpack"):AddItem(swordTool)
end

-- Run the function to give tools
giveTools()
