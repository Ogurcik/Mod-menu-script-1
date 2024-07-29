local function createUI()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local ToggleButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local FreezeButton = Instance.new("TextButton")
    local SpeedLabel = Instance.new("TextLabel")
    local SpeedInput = Instance.new("TextBox")
    local LocalItemsButton = Instance.new("TextButton")
    local ESPButton = Instance.new("TextButton")
    local VersionLabel = Instance.new("TextLabel")

    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.Name = "MainMenuGui"

    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
    MainFrame.Size = UDim2.new(0, 400, 0, 400)
    MainFrame.Visible = false
    MainFrame.BorderSizePixel = 0

    ToggleButton.Parent = ScreenGui
    ToggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    ToggleButton.Position = UDim2.new(0, 0, 0, 0)
    ToggleButton.Size = UDim2.new(0, 80, 0, 40)
    ToggleButton.Text = "Menu"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.TextSize = 20

    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    CloseButton.Position = UDim2.new(0.5, -50, 1, -40)
    CloseButton.Size = UDim2.new(0, 100, 0, 30)
    CloseButton.Text = "Close"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 24

    ESPButton.Parent = MainFrame
    ESPButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    ESPButton.Position = UDim2.new(0.1, 0, 0.8, 0)
    ESPButton.Size = UDim2.new(0, 120, 0, 40)
    ESPButton.Text = "ESP"
    ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ESPButton.Font = Enum.Font.GothamBold
    ESPButton.TextSize = 20

    VersionLabel.Parent = MainFrame
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Position = UDim2.new(1, -100, 1, -20)
    VersionLabel.Size = UDim2.new(0, 100, 0, 20)
    VersionLabel.Text = "Version 1.1"
    VersionLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    VersionLabel.Font = Enum.Font.GothamBold
    VersionLabel.TextSize = 18

    local versionGradient = Instance.new("UIGradient")
    versionGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0))
    }
    versionGradient.Parent = VersionLabel

    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        ToggleButton = ToggleButton,
        CloseButton = CloseButton,
        FreezeButton = FreezeButton,
        SpeedLabel = SpeedLabel,
        SpeedInput = SpeedInput,
        LocalItemsButton = LocalItemsButton,
        ESPButton = ESPButton,
        VersionLabel = VersionLabel
    }
end
local function setupElement(element)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = element
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = 2
    stroke.Parent = element
end

local function applyStyling(elements)
    setupElement(elements.ToggleButton)
    setupElement(elements.CloseButton)
    setupElement(elements.FreezeButton)
    setupElement(elements.SpeedInput)
    setupElement(elements.LocalItemsButton)
    setupElement(elements.ESPButton)
end
local function updateSpeedFromInput(SpeedInput, SpeedLabel, currentSpeed)
    local inputSpeed = tonumber(SpeedInput.Text)
    if inputSpeed and inputSpeed > 0 then
        SpeedLabel.Text = "Speed: " .. tostring(inputSpeed)
        return inputSpeed
    else
        SpeedInput.Text = tostring(currentSpeed)
        return currentSpeed
    end
end

local function setupFreezeButton(FreezeButton, SpeedLabel, SpeedInput)
    local isFrozen = false
    local currentSpeed = 16
    local connection

    local function toggleFreeze()
        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            if not isFrozen then
                character.HumanoidRootPart.Anchored = true
                connection = game:GetService("RunService").RenderStepped:Connect(function()
                    if isFrozen then
                        local moveDirection = humanoid.MoveDirection
                        local delta = moveDirection * currentSpeed / 60
                        character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + delta
                    end
                end)
                isFrozen = true
                FreezeButton.Text = "Unfreeze"
                SpeedLabel.Visible = true
                SpeedInput.Visible = true
            else
                character.HumanoidRootPart.Anchored = false
                humanoid.WalkSpeed = 16
                isFrozen = false
                FreezeButton.Text = "Freeze"
                if connection then connection:Disconnect() end
                SpeedLabel.Visible = false
                SpeedInput.Visible = false
            end
        end
    end

    FreezeButton.MouseButton1Click:Connect(function()
        toggleFreeze()
    end)

    SpeedInput.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            currentSpeed = updateSpeedFromInput(SpeedInput, SpeedLabel, currentSpeed)
        end
    end)
end

local function setupLocalItemsButton(LocalItemsButton)
    LocalItemsButton.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        for _, item in pairs(player.Backpack:GetChildren()) do
            item.Parent = player.Character
        end
    end)
end

local function setupToggleButton(ToggleButton, MainFrame)
    ToggleButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)
end

local function setupCloseButton(CloseButton, MainFrame)
    CloseButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
    end)
end
local function makeDraggable(gui)
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position 
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

local function main()
    local elements = createUI()
    applyStyling(elements)
    setupFreezeButton(elements.FreezeButton, elements.SpeedLabel, elements.SpeedInput)
    setupLocalItemsButton(elements.LocalItemsButton)
    setupESPButton(elements.ESPButton)
    setupToggleButton(elements.ToggleButton, elements.MainFrame)
    setupCloseButton(elements.CloseButton, elements.MainFrame)
    makeDraggable(elements.MainFrame)
end

main()
