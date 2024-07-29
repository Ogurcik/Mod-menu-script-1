Antik:
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
    local ESPButton = Instance.new("TextButton")

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
    ToggleButton.Size = UDim2.new(0, 80, 0, 40)  -- Уменьшенный размер
    ToggleButton.Text = "Menu"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.TextSize = 20  -- Уменьшенный размер текста

    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    CloseButton.Position = UDim2.new(0.5, -40, 1, -30)
    CloseButton.Size = UDim2.new(0, 80, 0, 25)  -- Уменьшенный размер
    CloseButton.Text = "Close"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 20  -- Уменьшенный размер текста

    FreezeButton.Parent = MainFrame
    FreezeButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    FreezeButton.Position = UDim2.new(0.5, -40, 0, 20)
    FreezeButton.Size = UDim2.new(0, 80, 0, 40)  -- Уменьшенный размер
    FreezeButton.Text = "Freeze"
    FreezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    FreezeButton.Font = Enum.Font.GothamBold
    FreezeButton.TextSize = 20  -- Уменьшенный размер текста

    SpeedLabel.Parent = MainFrame
    SpeedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SpeedLabel.Position = UDim2.new(0.5, 0, 0, 70)
    SpeedLabel.Size = UDim2.new(0, 80, 0, 25)
    SpeedLabel.Text = "Speed:"
    SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedLabel.Font = Enum.Font.GothamBold
    SpeedLabel.TextSize = 20
    SpeedLabel.Visible = false

    SpeedInput.Parent = MainFrame
    SpeedInput.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    SpeedInput.Position = UDim2.new(0.5, 0, 0, 100)
    SpeedInput.Size = UDim2.new(0, 80, 0, 25)
    SpeedInput.Text = "16"
    SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedInput.Font = Enum.Font.GothamBold
    SpeedInput.TextSize = 20
    SpeedInput.Visible = false

    LocalItemsButton.Parent = MainFrame
    LocalItemsButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    LocalItemsButton.Position = UDim2.new(0.5, -40, 0, 150)
    LocalItemsButton.Size = UDim2.new(0, 80, 0, 40)  -- Уменьшенный размер
    LocalItemsButton.Text = "Local Items"
    LocalItemsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    LocalItemsButton.Font = Enum.Font.GothamBold
    LocalItemsButton.TextSize = 20  -- Уменьшенный размер текста

    VersionLabel.Parent = MainFrame
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Position = UDim2.new(1, -80, 1, -20)
    VersionLabel.Size = UDim2.new(0, 80, 0, 20)
    VersionLabel.Text = "Version 1.0"  -- Обновленная версия
    VersionLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    VersionLabel.Font = Enum.Font.GothamBold
    VersionLabel.TextSize = 16

    local versionGradient = Instance.new("UIGradient")
    versionGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0))
    }
    versionGradient.Parent = VersionLabel

ESPButton.Parent = MainFrame
    ESPButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    ESPButton.Position = UDim2.new(0.5, -40, 0, 200)
    ESPButton.Size = UDim2.new(0, 80, 0, 40)  -- Уменьшенный размер
    ESPButton.Text = "ESP"
    ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ESPButton.Font = Enum.Font.GothamBold
    ESPButton.TextSize = 20  -- Уменьшенный размер текста

    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        ToggleButton = ToggleButton,
        CloseButton = CloseButton,
        FreezeButton = FreezeButton,
        SpeedLabel = SpeedLabel,
        SpeedInput = SpeedInput,
        LocalItemsButton = LocalItemsButton,
        VersionLabel = VersionLabel,
        ESPButton = ESPButton
    }
end
local function setupElement(element)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)  -- Уменьшенный радиус скругления
    corner.Parent = element

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = 1  -- Уменьшенная толщина обводки
    stroke.Parent = element
end

local function applyStyling(elements)
    setupElement(elements.ToggleButton)
    setupElement(elements.CloseButton)
    setupElement(elements.FreezeButton)
    setupElement(elements.SpeedInput)
    setupElement(elements.LocalItemsButton)
    setupElement(elements.ESPButton)  -- Добавлено оформление для кнопки ESP
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

    FreezeButton.MouseButton1Click:Connect(toggleFreeze)
    SpeedInput.FocusLost:Connect(function()
        if isFrozen then
            currentSpeed = updateSpeedFromInput(SpeedInput, SpeedLabel, currentSpeed)
        end
    end)
end

local function setupToggleButton(ToggleButton, MainFrame)
    local isVisible = false
    ToggleButton.MouseButton1Click:Connect(function()
        isVisible = not isVisible
        MainFrame.Visible = isVisible
    end)
end

local function setupCloseButton(CloseButton, MainFrame)
    CloseButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
    end)
end

local function setupLocalItemsButton(LocalItemsButton)
    LocalItemsButton.MouseButton1Click:Connect(function()
        -- Ваш код для управления предметами здесь
    end)
end

local function setupESPButton(ESPButton)
    local espEnabled = false

    ESPButton.MouseButton1Click:Connect(function()
        espEnabled = not espEnabled
        if espEnabled then
            ESPButton.Text = "Disable ESP"
            -- Ваш код для включения ESP здесь
        else
            ESPButton.Text = "Enable ESP"
            -- Ваш код для отключения ESP здесь
        end
    end)
end
local function initializeMenu()
    local elements = createUI()
    applyStyling(elements)
    setupFreezeButton(elements.FreezeButton, elements.SpeedLabel, elements.SpeedInput)
    setupToggleButton(elements.ToggleButton, elements.MainFrame)
    setupCloseButton(elements.CloseButton, elements.MainFrame)
    setupLocalItemsButton(elements.LocalItemsButton)
    setupESPButton(elements.ESPButton)
end

initializeMenu()
