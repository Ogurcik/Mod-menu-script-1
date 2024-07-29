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

local function setupESPButton(ESPButton)
    local function createESP(player)
        if player == game.Players.LocalPlayer then return end

        local function onCharacterAdded(character)
            local head = character:WaitForChild("Head", 10)
            if not head then return end

            -- Удаление старых ESP элементов, если они есть
            for _, child in pairs(head:GetChildren()) do
                if child:IsA("BillboardGui") then
                    child:Destroy()
                end
            end

            -- Создание надписей с именем и здоровьем
            local billboard = Instance.new("BillboardGui", head)
            billboard.Name = "ESP"
            billboard.AlwaysOnTop = true
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)

            local frame = Instance.new("Frame", billboard)
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 1

            local nameLabel = Instance.new("TextLabel", frame)
            nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = player.Name
            nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            nameLabel.TextStrokeTransparency = 0
            nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.TextSize = 10 -- Начальный размер текста для никнейма
            nameLabel.TextScaled = true
            nameLabel.TextWrapped = true

            -- Уменьшение размера текста, если никнейм слишком длинный
            nameLabel:GetPropertyChangedSignal("TextBounds"):Connect(function()
                if nameLabel.TextBounds.X > nameLabel.AbsoluteSize.X then
                    nameLabel.TextSize = 10 * (nameLabel.AbsoluteSize.X / nameLabel.TextBounds.X)
                end
            end)

            local healthLabel = Instance.new("TextLabel", frame)
            healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
            healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
            healthLabel.BackgroundTransparency = 1
            healthLabel.TextStrokeTransparency = 0
            healthLabel.Font = Enum.Font.SourceSansBold
            healthLabel.TextSize = 10 -- Размер текста для здоровья

            -- Локальная переменная для хранения предыдущего значения здоровья
            local lastHealth = -1

            local function updateESP()
                if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                    local health = humanoid.Health

                    -- Обновляем текст и цвет подсветки только при изменении здоровья
                    if math.floor(health) ~= lastHealth then
                        healthLabel.Text = "HP: " .. math.floor(health)
                        local color = createColorGradient(health)
                        healthLabel.TextColor3 = color
                        if character:FindFirstChild("Highlight") then
                            character.Highlight.FillColor = color
                        else
                            local highlight = Instance.new("Highlight", character)
                            highlight.Name = "Highlight"
                            highlight.FillColor = color
                            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            highlight.FillTransparency = 0.5
                            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                            highlight.OutlineTransparency = 0
                        end
                        lastHealth = math.floor(health)
                    end
                end
            end

            -- Обновляем текст и цвет с частотой 10 раз в секунду
            local updateConnection = RunService.RenderStepped:Connect(function(step)
                if step >= 0.1 then
                    updateESP()
                end
            end)

            -- Убедитесь, что соединение отключено при удалении персонажа
            player.CharacterRemoving:Connect(function()
                if updateConnection then
                    updateConnection:Disconnect()
                end
            end)

            updateESP()
        end

        if player.Character then
            onCharacterAdded(player.Character)
        end
        player.CharacterAdded:Connect(onCharacterAdded)
    end

    ESPButton.MouseButton1Click:Connect(function()
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                createESP(player)
            end
        end
        game.Players.PlayerAdded:Connect(createESP)
    end)
end
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

local function initializeUI()
    -- Создание элементов UI
    local elements = createUI()

    -- Применение стилей к элементам
    applyStyling(elements)

    -- Настройка функциональности
    setupFreezeButton(elements.FreezeButton, elements.SpeedLabel, elements.SpeedInput)
    setupLocalItemsButton(elements.LocalItemsButton)
    setupToggleButtons(elements.ToggleButton, elements.CloseButton, elements.MainFrame)
    setupESPButton(elements.ESPButton)  -- Настройка кнопки ESP

    -- Сделать MainFrame перетаскиваемым
    makeDraggable(elements.MainFrame)
end

-- Инициализация UI
initializeUI()
