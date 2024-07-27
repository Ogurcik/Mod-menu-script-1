-- UI Creation Module
local function createUI()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local ToggleButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local FreezeButton = Instance.new("TextButton")
    local SpeedLabel = Instance.new("TextLabel")
    local SpeedInput = Instance.new("TextBox")
    local LocalItemsButton = Instance.new("TextButton")
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
    ToggleButton.Size = UDim2.new(0, 100, 0, 50)
    ToggleButton.Text = "Menu"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.TextSize = 24

    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    CloseButton.Position = UDim2.new(0.5, -50, 1, -40)
    CloseButton.Size = UDim2.new(0, 100, 0, 30)
    CloseButton.Text = "Close"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 24

    FreezeButton.Parent = MainFrame
    FreezeButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    FreezeButton.Position = UDim2.new(0.5, -50, 0, 20)
    FreezeButton.Size = UDim2.new(0, 100, 0, 50)
    FreezeButton.Text = "Freeze"
    FreezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    FreezeButton.Font = Enum.Font.GothamBold
    FreezeButton.TextSize = 24

    SpeedLabel.Parent = MainFrame
    SpeedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SpeedLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
    SpeedLabel.Size = UDim2.new(0.8, 0, 0, 30)
    SpeedLabel.Text = "Speed:"
    SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedLabel.Font = Enum.Font.GothamBold
    SpeedLabel.TextSize = 24
    SpeedLabel.Visible = false

    SpeedInput.Parent = MainFrame
    SpeedInput.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    SpeedInput.Position = UDim2.new(0.1, 0, 0.5, 0)
    SpeedInput.Size = UDim2.new(0.8, 0, 0, 30)
    SpeedInput.Text = "16"
    SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedInput.Font = Enum.Font.GothamBold
    SpeedInput.TextSize = 24
    SpeedInput.Visible = false

    LocalItemsButton.Parent = MainFrame
    LocalItemsButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    LocalItemsButton.Position = UDim2.new(0.5, -50, 0, 100)
    LocalItemsButton.Size = UDim2.new(0, 100, 0, 50)
    LocalItemsButton.Text = "Local Items"
    LocalItemsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    LocalItemsButton.Font = Enum.Font.GothamBold
    LocalItemsButton.TextSize = 24

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
        VersionLabel = VersionLabel
    }
end
-- Styling Module
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
end
-- Functionality Module
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

local function giveAllItems()
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack
    for _, asset in ipairs(game:GetDescendants()) do
        if asset:IsA("Tool") and not backpack:FindFirstChild(asset.Name) then
            asset:Clone().Parent = backpack
        end
    end
end

local function setupLocalItemsButton(LocalItemsButton)
    LocalItemsButton.MouseButton1Click:Connect(giveAllItems)
end

local function setupToggleButtons(ToggleButton, CloseButton, MainFrame)
    ToggleButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)

    CloseButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
    end)
end
-- Draggable Module
local function makeDraggable(gui)
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

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end
-- Initialization Module
local function initializeUI()
    -- Create UI elements
    local elements = createUI()

    -- Apply styling to elements
    applyStyling(elements)

    -- Setup functionality
    setupFreezeButton(elements.FreezeButton, elements.SpeedLabel, elements.SpeedInput)
    setupLocalItemsButton(elements.LocalItemsButton)
    setupToggleButtons(elements.ToggleButton, elements.CloseButton, elements.MainFrame)

    -- Make the MainFrame draggable
    makeDraggable(elements.MainFrame)
end

-- Initialize the UI
initializeUI()
