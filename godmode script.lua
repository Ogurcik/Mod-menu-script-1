-- Часть 1: Создание и стилизация интерфейса

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local FreezeButton = Instance.new("TextButton")
local SpeedLabel = Instance.new("TextLabel")
local SpeedInput = Instance.new("TextBox")
local SettingsButton = Instance.new("TextButton")
local SettingsFrame = Instance.new("Frame")
local SettingsCloseButton = Instance.new("TextButton")
local DiscordLabel = Instance.new("TextLabel")
local VersionLabel = Instance.new("TextLabel")
local LanguageLabel = Instance.new("TextLabel")
local EnglishButton = Instance.new("TextButton")
local RussianButton = Instance.new("TextButton")

-- Основные элементы
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "MainMenuGui"

-- Основной фрейм
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Visible = false
MainFrame.BorderSizePixel = 0

-- Кнопка переключения меню
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
ToggleButton.Position = UDim2.new(0, 0, 0, 0)
ToggleButton.Size = UDim2.new(0, 100, 0, 50)
ToggleButton.Text = "Menu"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 24

-- Кнопка закрытия основного меню
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

-- Метка скорости
SpeedLabel.Parent = MainFrame
SpeedLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SpeedLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
SpeedLabel.Size = UDim2.new(0.8, 0, 0, 30)
SpeedLabel.Text = "Speed:"
SpeedLabel.TextColor3 = Color3.new(1, 1, 1)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.TextSize = 24

-- Поле ввода скорости
SpeedInput.Parent = MainFrame
SpeedInput.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
SpeedInput.Position = UDim2.new(0.1, 0, 0.5, 0)
SpeedInput.Size = UDim2.new(0.8, 0, 0, 30)
SpeedInput.Text = "16"
SpeedInput.TextColor3 = Color3.new(1, 1, 1)
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.TextSize = 24

-- Кнопка настроек
SettingsButton.Parent = MainFrame
SettingsButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
SettingsButton.Position = UDim2.new(0.5, -50, 1, -80)
SettingsButton.Size = UDim2.new(0, 100, 0, 30)
SettingsButton.Text = "Settings"
SettingsButton.TextColor3 = Color3.new(1, 1, 1)
SettingsButton.Font = Enum.Font.SourceSans
SettingsButton.TextSize = 24

-- Фрейм настроек
SettingsFrame.Parent = MainFrame
SettingsFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SettingsFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
SettingsFrame.Size = UDim2.new(0, 300, 0, 200)
SettingsFrame.Visible = false
SettingsFrame.BorderSizePixel = 0

-- Кнопка закрытия настроек
SettingsCloseButton.Parent = SettingsFrame
SettingsCloseButton.BackgroundColor3 = Color3.new(0.7, 0.1, 0.1)
SettingsCloseButton.Position = UDim2.new(1, -60, 0, 10)
SettingsCloseButton.Size = UDim2.new(0, 50, 0, 30)
SettingsCloseButton.Text = "Close"
SettingsCloseButton.TextColor3 = Color3.new(1, 1, 1)
SettingsCloseButton.Font = Enum.Font.SourceSans
SettingsCloseButton.TextSize = 20

-- Метка версии
VersionLabel.Parent = SettingsFrame
VersionLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
VersionLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
VersionLabel.Size = UDim2.new(0.8, 0, 0, 30)
VersionLabel.Text = "Version: 1.0"
VersionLabel.TextColor3 = Color3.new(1, 1, 1)
VersionLabel.Font = Enum.Font.SourceSans
VersionLabel.TextSize = 20

-- Метка Discord
DiscordLabel.Parent = SettingsFrame
DiscordLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
DiscordLabel.Position = UDim2.new(0.1, 0, 0.2, 0)
DiscordLabel.Size = UDim2.new(0.8, 0, 0, 30)
DiscordLabel.Text = "Discord: https://discord.com/invite/KRY2WQHP6z"
DiscordLabel.TextColor3 = Color3.new(1, 1, 1)
DiscordLabel.Font = Enum.Font.SourceSans
DiscordLabel.TextSize = 20

-- Метка выбора языка
LanguageLabel.Parent = SettingsFrame
LanguageLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
LanguageLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
LanguageLabel.Size = UDim2.new(0.8, 0, 0, 30)
LanguageLabel.Text = "Select Language:"
LanguageLabel.TextColor3 = Color3.new(1, 1, 1)
LanguageLabel.Font = Enum.Font.SourceSans
LanguageLabel.TextSize = 20

-- Кнопка выбора английского языка
EnglishButton.Parent = SettingsFrame
EnglishButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
EnglishButton.Position = UDim2.new(0.1, 0, 0.5, 0)
EnglishButton.Size = UDim2.new(0.35, 0, 0, 30)
EnglishButton.Text = "English"
EnglishButton.TextColor3 = Color3.new(1, 1, 1)
EnglishButton.Font = Enum.Font.SourceSans
EnglishButton.TextSize = 20

-- Кнопка выбора русского языка
RussianButton.Parent = SettingsFrame
RussianButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
RussianButton.Position = UDim2.new(0.55, 0, 0.5, 0)
RussianButton.Size = UDim2.new(0.35, 0, 0, 30)
RussianButton.Text = "Русский"
RussianButton.TextColor3 = Color3.new(1, 1, 1)
RussianButton.Font = Enum.Font.SourceSans
RussianButton.TextSize = 20
-- Часть 2: Логика для обработки событий и настройки интерфейса

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
            -- Стоп-движение для других игроков
            character.HumanoidRootPart.Anchored = true

            -- Локальное движение
            connection = RunService.RenderStepped:Connect(function()
                if isFrozen then
                    local moveDirection = humanoid.MoveDirection
                    local delta = moveDirection * currentSpeed / 60
                    character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + delta
                end
            end)

            -- Включить заморозку
            isFrozen = true
            FreezeButton.Text = "Unfreeze"
        else
            -- Вернуться к нормальному состоянию
            character.HumanoidRootPart.Anchored = false
            humanoid.WalkSpeed = originalWalkSpeed

            -- Отключить заморозку
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

-- Обработка выбора языка
local function updateLanguage(language)
    if language == "English" then
        SpeedLabel.Text = "Speed:"
        FreezeButton.Text = "Freeze"
        SettingsButton.Text = "Settings"
        CloseButton.Text = "Close"
        VersionLabel.Text = "Version: 1.0"
        DiscordLabel.Text = "Discord: https://discord.com/invite/KRY2WQHP6z"
        LanguageLabel.Text = "Select Language:"
        EnglishButton.Text = "English"
        RussianButton.Text = "Русский"
    elseif language == "Russian" then
        SpeedLabel.Text = "Скорость:"
        FreezeButton.Text = "Заморозить"
        SettingsButton.Text = "Настройки"
        CloseButton.Text = "Закрыть"
        VersionLabel.Text = "Версия: 1.0"
        DiscordLabel.Text = "Discord: https://discord.com/invite/KRY2WQHP6z"
        LanguageLabel.Text = "Выберите язык:"
        EnglishButton.Text = "English"
        RussianButton.Text = "Русский"
    end
end

-- Обработчики событий
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

FreezeButton.MouseButton1Click:Connect(function()
    toggleFreeze()
end)

SettingsButton.MouseButton1Click:Connect(function()
    SettingsFrame.Visible = not SettingsFrame.Visible
end)

SettingsCloseButton.MouseButton1Click:Connect(function()
    SettingsFrame.Visible = false
end)

EnglishButton.MouseButton1Click:Connect(function()
    updateLanguage("English")
end)

RussianButton.MouseButton1Click:Connect(function()
    updateLanguage("Russian")
end)

-- Функция для плавного открытия и закрытия фрейма
local function tweenFrame(frame, goalSize, goalPosition, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local tween = game:GetService("TweenService"):Create(frame, tweenInfo, {Size = goalSize, Position = goalPosition})
    tween:Play()
end

local function showMainFrame()
    MainFrame.Visible = true
    tweenFrame(MainFrame, UDim2.new(0, 400, 0, 400), UDim2.new(0.5, -200, 0.5, -200), 0.5)
end

local function hideMainFrame()
    tweenFrame(MainFrame, UDim2.new(0, 0, 0, 0), UDim2.new(0.5, -200, 0.5, -200), 0.5)
    wait(0.5)
    MainFrame.Visible = false
end

-- Обновление состояния при запуске
ToggleButton.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        hideMainFrame()
    else
        showMainFrame()
    end
end)
-- Часть 3: Перетаскивание мод меню и дополнительные настройки

-- Перетаскивание меню
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

-- Плавное открытие и закрытие фрейма
local function tweenFrame(frame, goalSize, goalPosition, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local tween = game:GetService("TweenService"):Create(frame, tweenInfo, {Size = goalSize, Position = goalPosition})
    tween:Play()
end

local function showMainFrame()
    MainFrame.Visible = true
    tweenFrame(MainFrame, UDim2.new(0, 400, 0, 400), UDim2.new(0.5, -200, 0.5, -200), 0.5)
end

local function hideMainFrame()
    tweenFrame(MainFrame, UDim2.new(0, 0, 0, 0), UDim2.new(0.5, -200, 0.5, -200), 0.5)
    wait(0.5)
    MainFrame.Visible = false
end

-- Обновление состояния при запуске
ToggleButton.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        hideMainFrame()
    else
        showMainFrame()
    end
end)

-- Обновление версии и дискорда
local function updateSettings()
    VersionLabel.Text = "Version: 1.0"
    DiscordLabel.Text = "Discord: https://discord.com/invite/KRY2WQHP6z"
end

-- Кнопка настроек
SettingsButton.MouseButton1Click:Connect(function()
    SettingsFrame.Visible = true
end)

SettingsCloseButton.MouseButton1Click:Connect(function()
    SettingsFrame.Visible = false
end)

-- Инициализация
updateSettings()
