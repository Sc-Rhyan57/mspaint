--// Linoria \\--
local Toggles = shared.Toggles
local Options = shared.Options

--// Variables \\--
local Script = shared.Script
local Tabs = Script.Tabs

Script.LastVoidValue = workspace.FallenPartsDestroyHeight
Script.LastSpeed = if shared.Humanoid then shared.Humanoid.WalkSpeed else 16

--// Main \\--
local PlayerGroupBox = Tabs.Main:AddLeftGroupbox("Player") do
    PlayerGroupBox:AddToggle("SpeedHack", {
        Text = "Speed Hack",
        Default = false
    })

    PlayerGroupBox:AddSlider("WalkSpeed", {
        Text = "Walk Speed",
        Default = 16,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Compact = true
    })

    PlayerGroupBox:AddToggle("JumpPowerHack", {
        Text = "Jump Power Hack",
        Default = false
    })

    PlayerGroupBox:AddSlider("JumpPower", {
        Text = "Jump Power",
        Default = 50,
        Min = 0,
        Max = 200,
        Rounding = 0,
        Compact = true
    })

    PlayerGroupBox:AddDivider()

    PlayerGroupBox:AddToggle("Noclip", {
        Text = "Noclip",
        Default = false
    }):AddKeyPicker("NoclipKey", {
        Mode = "Toggle",
        Default = "N",
        Text = "Noclip",
        SyncToggleState = true
    })

    PlayerGroupBox:AddToggle("Fly", {
        Text = "Fly",
        Default = false
    }):AddKeyPicker("FlyKey", {
        Mode = "Toggle",
        Default = "F",
        Text = "Fly",
        SyncToggleState = true
    })
    
    PlayerGroupBox:AddSlider("FlySpeed", {
        Text = "Fly Speed",
        Default = 16,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Compact = true
    })

    PlayerGroupBox:AddToggle("Twerk", {
        Text = "Twerk",
        Default = false
    })
end

local AutomationGroupBox = Tabs.Main:AddRightGroupbox("Automation") do
    AutomationGroupBox:AddToggle("AutoFarm", {
        Text = "Auto Farm",
        Default = false
    })

    AutomationGroupBox:AddSlider("AutoFarmSpeed", {
        Text = "Auto Farm Speed",
        Default = 5,
        Min = 1,
        Max = 6,
        Rounding = 1,
        Compact = true
    })

    AutomationGroupBox:AddDropdown("AutoFarmPriority", {
        Text = "Auto Farm Priority",
        AllowNull = false,
        Values = {"Gold Blocks", "Gold"},
        Default = "Gold Blocks",
        Multi = false,
    })
end

--// Player \\--
Toggles.SpeedHack:OnChanged(function(value)
    if not shared.Humanoid then return end

    if value then
        Script.LastSpeed = shared.Humanoid.WalkSpeed
    end

    shared.Humanoid.WalkSpeed = if value then Options.WalkSpeed.Value else Script.LastSpeed
end)

Toggles.JumpPowerHack:OnChanged(function(value)
    if not shared.Humanoid then return end

    if value then
        Script.LastJumpPower = if shared.Humanoid.UseJumpPower then shared.Humanoid.JumpPower else shared.Humanoid.JumpHeight
    end

    if shared.Humanoid.UseJumpPower then
        shared.Humanoid.JumpPower = if value then Options.JumpPower.Value else Script.LastJumpPower
    else
        shared.Humanoid.JumpHeight = if value then Options.JumpPower.Value else Script.LastJumpPower
    end
end)

Toggles.Noclip:OnChanged(function(value)
    if not shared.Character then return end

    for _, part in pairs(shared.Character:GetDescendants()) do
        if not part:IsA("BasePart") then continue end
        part.CanCollide = value
    end
end)

Toggles.Fly:OnChanged(function(value)
    if not shared.Fly.FlyBody then shared.Fly:Setup() end

    shared.Fly:Set(value)
end)

Options.FlySpeed:OnChanged(function(value)
    shared.Fly:SetSpeed(value)
end)

Toggles.Twerk:OnChanged(function(value)
    shared.Twerk:Set(value)
end)

--// Automation \\--
Toggles.AutoFarm:OnChanged(function(value)
    if value then
        Script.Functions.AutoFarm()
    end
end)