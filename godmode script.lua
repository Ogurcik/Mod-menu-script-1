-- Часть 1: Создание базового интерфейса
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local FreezeButton = Instance.new("TextButton")
local LocalItemsButton = Instance.new("TextButton")
local SettingsButton = Instance.new("TextButton")
local VersionLabel = Instance.new("TextLabel")
local SettingsFrame = Instance.new("Frame")
local LanguageLabel = Instance.new("TextLabel")
local EnglishButton = Instance.new("TextButton")
local RussianButton = Instance.new("TextButton")
local DiscordLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "MainMenuGui"

-- Основной фрейм
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Visible = false
MainFrame.BorderSizePixel = 0

-- Кнопка переключения
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
ToggleButton.Position = UDim2.new(0, 0, 0, 0)
ToggleButton.Size = UDim2.new(0, 100, 0, 50)
ToggleButton.Text = "Menu"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 24

-- Кнопка закрытия
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.new(0.7, 0.1, 0.1)
CloseButton.Position = UDim2.new(0.5, -50, 1, -40)
CloseButton.Size = UDim2.new(0, 100, 0, 30)
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.TextSize = 24

-- Кнопка заморозки
FreezeButton.Parent = MainFrame
FreezeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
FreezeButton.Position = UDim2.new(0.5, -50, 0, 20)
FreezeButton.Size = UDim2.new(0, 100, 0, 50)
FreezeButton.Text = "Freeze"
FreezeButton.TextColor3 = Color3.new(1, 1, 1)
FreezeButton.Font = Enum.Font.SourceSans
FreezeButton.TextSize = 24

-- Кнопка Local Items Giver
LocalItemsButton.Parent = MainFrame
LocalItemsButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
LocalItemsButton.Position = UDim2.new(0.5, -100, 0, 80)
LocalItemsButton.Size = UDim2.new(0, 200, 0, 50)
LocalItemsButton.Text = "Local Items Giver (Beta-Test)"
LocalItemsButton.TextColor3 = Color3.new(1, 1, 1)
LocalItemsButton.Font = Enum.Font.SourceSans
LocalItemsButton.TextSize = 24

-- Кнопка настроек
SettingsButton.Parent = MainFrame
SettingsButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
SettingsButton.Position = UDim2.new(0.5, -50, 0.9, -30)
SettingsButton.Size = UDim2.new(0, 100, 0, 30)
SettingsButton.Text = "Settings"
SettingsButton.TextColor3 = Color3.new(1, 1, 1)
SettingsButton.Font = Enum.Font.SourceSans
SettingsButton.TextSize = 24
-- Часть 2: Настройка меток и стилей

-- Метка версии
VersionLabel.Parent = ScreenGui
VersionLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
VersionLabel.Position = UDim2.new(1, -120, 1, -30)
VersionLabel.Size = UDim2.new(0, 100, 0, 30)
VersionLabel.Text = "Version 1.0"
VersionLabel.TextColor3 = Color3.new(1, 1, 1)
VersionLabel.Font = Enum.Font.SourceSans
VersionLabel.TextSize = 14
VersionLabel.TextStrokeTransparency = 0.8

-- Фрейм настроек
SettingsFrame.Parent = MainFrame
SettingsFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SettingsFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
SettingsFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
SettingsFrame.Visible = false

-- Метка выбора языка
LanguageLabel.Parent = SettingsFrame
LanguageLabel.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
LanguageLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
LanguageLabel.Size = UDim2.new(0.8, 0, 0, 30)
LanguageLabel.Text = "Select Language:"
LanguageLabel.TextColor3 = Color3.new(1, 1, 1)
LanguageLabel.Font = Enum.Font.SourceSans
LanguageLabel.TextSize = 24

-- Кнопка выбора английского языка
EnglishButton.Parent = SettingsFrame
EnglishButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
EnglishButton.Position = UDim2.new(0.1, 0, 0.2, 0)
EnglishButton.Size = UDim2.new(0.35, 0, 0, 50)
EnglishButton.Text = "English"
EnglishButton.TextColor3 = Color3.new(1, 1, 1)
EnglishButton.Font = Enum.Font.SourceSans
EnglishButton.TextSize = 24

-- Кнопка выбора русского языка
RussianButton.Parent = SettingsFrame
RussianButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
RussianButton.Position = UDim2.new(0.55, 0, 0.2, 0)
RussianButton.Size = UDim2.new(0.35, 0, 0, 50)
RussianButton.Text = "Russian"
RussianButton.TextColor3 = Color3.new(1, 1, 1)
RussianButton.Font = Enum.Font.SourceSans
RussianButton.TextSize = 24

-- Ссылка на Discord
DiscordLabel.Parent = ScreenGui
DiscordLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
DiscordLabel.Position = UDim2.new(1, -200, 1, -30)
DiscordLabel.Size = UDim2.new(0, 180, 0, 30)
DiscordLabel.Text = "Discord: https://discord.com/invite/KRY2WQHP6z"
DiscordLabel.TextColor3 = Color3.new(0.3, 0.7, 1)
DiscordLabel.Font = Enum.Font.SourceSans
DiscordLabel.TextSize = 14
DiscordLabel.TextWrapped = true
DiscordLabel.TextXAlignment = Enum.TextXAlignment.Left
-- Часть 3: Применение стилей и углов

local function applyStyle(element)
    local corner = UICorner:Clone()
    corner.Parent = element

    local stroke = UIStroke:Clone()
    stroke.Parent = element
end

-- Применение стилей ко всем кнопкам и меткам
applyStyle(ToggleButton)
applyStyle(CloseButton)
applyStyle(FreezeButton)
applyStyle(LocalItemsButton)
applyStyle(SettingsButton)
applyStyle(EnglishButton)
applyStyle(RussianButton)
applyStyle(VersionLabel)
applyStyle(DiscordLabel)

-- Установка стиля для фрейма настроек
SettingsFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SettingsFrame.BorderSizePixel = 0
-- Часть 4: Обработка событий для кнопок

-- Переключение видимости мод меню
ToggleButton.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        closeMenu()
    else
        openMenu()
    end
end)

-- Закрытие мод меню
CloseButton.MouseButton1Click:Connect(function()
    closeMenu()
end)

-- Пример обработки события заморозки
FreezeButton.MouseButton1Click:Connect(function()
    toggleFreeze()
end)

-- Пример обработки события для Local Items Giver
LocalItemsButton.MouseButton1Click:Connect(function()
    print("Local Items Giver button clicked")
    -- Логика для получения всех доступных предметов
end)

-- Открытие и закрытие фрейма настроек
SettingsButton.MouseButton1Click:Connect(function()
    SettingsFrame.Visible = not SettingsFrame.Visible
end)

-- Выбор языка
EnglishButton.MouseButton1Click:Connect(function()
    print("English selected")
    -- Логика для переключения на английский язык
end)

RussianButton.MouseButton1Click:Connect(function()
    print("Russian selected")
    -- Логика для переключения на русский язык
end)
-- Часть 5: Плавное открытие и закрытие мод меню

local TweenService = game:GetService("TweenService")

local function openMenu()
    MainFrame.Visible = true
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local goal = {Size = UDim2.new(0, 400, 0, 400)}
    local tween = TweenService:Create(MainFrame, tweenInfo, goal)
    tween:Play()
end

local function closeMenu()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local goal = {Size = UDim2.new(0, 0, 0, 0)}
    local tween = TweenService:Create(MainFrame, tweenInfo, goal)
    tween.Completed:Connect(function()
        MainFrame.Visible = false
    end)
    tween:Play()
end

ToggleButton.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        closeMenu()
    else
        openMenu()
    end
end)
-- Часть 6: Перетаскивание мод меню

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        update(input)
    end
end)
-- Часть 7: Логика для заморозки и управления скоростью

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local isFrozen = false
local originalWalkSpeed = 16
local currentSpeed = originalWalkSpeed
local connection

local function toggleFreeze()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        if not isFrozen then
            -- Остановка движения персонажа
            character.HumanoidRootPart.Anchored = true

            -- Локальное движение
            connection = RunService.RenderStepped:Connect(function()
                if isFrozen then
                    local moveDirection = humanoid.MoveDirection
                    local delta = moveDirection * currentSpeed / 60
                    character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + delta
                end
            end)

            -- Включение заморозки
            isFrozen = true
            FreezeButton.Text = "Unfreeze"
        else
            -- Возвращение в нормальное состояние
            character.HumanoidRootPart.Anchored = false
            humanoid.WalkSpeed = originalWalkSpeed

            -- Выключение заморозки
            isFrozen = false
            FreezeButton.Text = "Freeze"
            if connection then connection:Disconnect() end
        end
    end
end

-- Обновление скорости из ввода
local function updateSpeedFromInput()
    local inputSpeed = tonumber(SpeedInput.Text)
    if inputSpeed and inputSpeed > 0 then
        currentSpeed = inputSpeed
        SpeedLabel.Text = "Speed: " .. tostring(currentSpeed)
    else
        SpeedInput.Text = tostring(currentSpeed)
    end
end

SpeedInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        updateSpeedFromInput()
    end
end)

-- Обработка события заморозки
FreezeButton.MouseButton1Click:Connect(function()
    toggleFreeze()
end)
