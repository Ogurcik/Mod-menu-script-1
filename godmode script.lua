-- Создание интерфейса
local TweenService = game:GetService("TweenService")
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local FreezeButton = Instance.new("TextButton")
local SpeedLabel = Instance.new("TextLabel")
local SpeedInput = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local SettingsButton = Instance.new("TextButton")
local SettingsFrame = Instance.new("Frame")
local EnglishButton = Instance.new("TextButton")
local RussianButton = Instance.new("TextButton")
local VersionLabel = Instance.new("TextLabel")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "MainMenuGui"

-- Конфигурация основного фрейма
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Visible = false
MainFrame.BorderSizePixel = 0

-- Конфигурация кнопки переключения
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
ToggleButton.Position = UDim2.new(0, 0, 0, 0)
ToggleButton.Size = UDim2.new(0, 100, 0, 50)
ToggleButton.Text = "Menu"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 24

-- Конфигурация кнопки закрытия
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.new(0.7, 0.1, 0.1)
CloseButton.Position = UDim2.new(0.5, -50, 1, -40)
CloseButton.Size = UDim2.new(0, 100, 0, 30)
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.TextSize = 24

-- Конфигурация кнопки заморозки
FreezeButton.Parent = MainFrame
FreezeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
FreezeButton.Position = UDim2.new(0.5, -50, 0, 20)
FreezeButton.Size = UDim2.new(0, 100, 0, 50)
FreezeButton.Text = "Freeze"
FreezeButton.TextColor3 = Color3.new(1, 1, 1)
FreezeButton.Font = Enum.Font.SourceSans
FreezeButton.TextSize = 24

-- Конфигурация метки скорости
SpeedLabel.Parent = MainFrame
SpeedLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SpeedLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
SpeedLabel.Size = UDim2.new(0.8, 0, 0, 30)
SpeedLabel.Text = "Speed:"
SpeedLabel.TextColor3 = Color3.new(1, 1, 1)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.TextSize = 24

-- Конфигурация поля ввода скорости
SpeedInput.Parent = MainFrame
SpeedInput.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
SpeedInput.Position = UDim2.new(0.1, 0, 0.5, 0)
SpeedInput.Size = UDim2.new(0.8, 0, 0, 30)
SpeedInput.Text = "16"
SpeedInput.TextColor3 = Color3.new(1, 1, 1)
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.TextSize = 24

-- Конфигурация кнопки настроек
SettingsFrame.Parent = ScreenGui
SettingsFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
SettingsFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
SettingsFrame.Size = UDim2.new(0, 400, 0, 400)
SettingsFrame.Visible = false
SettingsFrame.BorderSizePixel = 0

SettingsButton.Parent = MainFrame
SettingsButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
SettingsButton.Position = UDim2.new(0.5, -50, 0, 80)
SettingsButton.Size = UDim2.new(0, 100, 0, 50)
SettingsButton.Text = "Settings"
SettingsButton.TextColor3 = Color3.new(1, 1, 1)
SettingsButton.Font = Enum.Font.SourceSans
SettingsButton.TextSize = 24

-- Конфигурация кнопок выбора языка
EnglishButton.Parent = SettingsFrame
EnglishButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
EnglishButton.Position = UDim2.new(0.1, 0, 0.3, 0)
EnglishButton.Size = UDim2.new(0.8, 0, 0, 50)
EnglishButton.Text = "English Language"
EnglishButton.TextColor3 = Color3.new(1, 1, 1)
EnglishButton.Font = Enum.Font.SourceSans
EnglishButton.TextSize = 24

RussianButton.Parent = SettingsFrame
RussianButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
RussianButton.Position = UDim2.new(0.1, 0, 0.4, 0)
RussianButton.Size = UDim2.new(0.8, 0, 0, 50)
RussianButton.Text = "Русский язык"
RussianButton.TextColor3 = Color3.new(1, 1, 1)
RussianButton.Font = Enum.Font.SourceSans
RussianButton.TextSize = 24

-- Конфигурация метки версии
VersionLabel.Parent = SettingsFrame
VersionLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
VersionLabel.Position = UDim2.new(0.5, -100, 0.9, 0)
VersionLabel.Size = UDim2.new(0, 200, 0, 30)
VersionLabel.Text = "Version: 1.0"
VersionLabel.TextColor3 = Color3.new(1, 1, 1)
VersionLabel.Font = Enum.Font.SourceSans
VersionLabel.TextSize = 24
RussianButton.TextColor3 = Color3.new(1, 1, 1)
    elseif language == "Russian" then
        SpeedLabel.Text = "Скорость:"
        FreezeButton.Text = "Заморозить"
        GiveItemsButton.Text = "Выдать предметы"
        SettingsButton.Text = "Настройки"
        VersionLabel.Text = "Версия: 1.0"
        EnglishButton.TextColor3 = Color3.new(1, 1, 1)
        RussianButton.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    end
end

-- Функция для обновления скорости
local function updateSpeedFromInput()
    local inputSpeed = tonumber(SpeedInput.Text)
    if inputSpeed and inputSpeed > 0 then
        currentSpeed = inputSpeed
        SpeedLabel.Text = "Speed: " .. tostring(currentSpeed)
    else
        SpeedInput.Text = tostring(currentSpeed)
    end
end

-- Функции для перетаскивания
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

-- Обработчики событий
ToggleButton.MouseButton1Click:Connect(toggleMainMenu)
CloseButton.MouseButton1Click:Connect(function()
    tweenFrame(MainFrame, UDim2.new(0, 0, 0, 0), MainFrame.Position, 0.5)
    wait(0.5)
    MainFrame.Visible = false
end)
SettingsButton.MouseButton1Click:Connect(toggleSettingsMenu)
CloseButton.MouseButton1Click:Connect(function()
    tweenFrame(SettingsFrame, UDim2.new(0, 0, 0, 0), SettingsFrame.Position, 0.5)
    wait(0.5)
    SettingsFrame.Visible = false
end)
FreezeButton.MouseButton1Click:Connect(function()
    toggleFreeze()
end)
SpeedInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        updateSpeedFromInput()
    end
end)

-- Функции для изменения языка
EnglishButton.MouseButton1Click:Connect(function()
    changeLanguage("English")
end)

RussianButton.MouseButton1Click:Connect(function()
    changeLanguage("Russian")
end)
-- Локальный скрипт для выдачи предметов и заморозки
task.wait(1)

-- Переменные
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer
local PlayerBackpack = LocalPlayer.Backpack

-- Функция, которая выдаёт все доступные для игрока предметы без повторяющихся эпизодов
local function GetAllAvailableItems()
    for _index, asset in game:GetDescendants() do
        if asset:IsA("Tool") and not PlayerBackpack:FindFirstChild(asset.Name) then
            asset:Clone().Parent = PlayerBackpack
        end
    end
end

-- Если игрок написал что-то
local function onPlayerChatted(textChatMessage)
    local context
    if typeof(textChatMessage) == "string" then
        context = textChatMessage
    else
        context = textChatMessage.Text
    end
    if string.find(context, ";give me all") then
        GetAllAvailableItems()
    end
end

-- Коннекты
TextChatService.MessageReceived:Connect(onPlayerChatted)
LocalPlayer.Chatted:Connect(onPlayerChatted)

-- Функции для заморозки
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
            -- Остановить персонажа для других игроков
            character.HumanoidRootPart.Anchored = true

            -- Событие для локального движения
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
-- Настройка плавной анимации для появления и исчезновения
local function tweenVisibility(frame, visible, duration)
    local goal = visible and {Size = UDim2.new(0, 400, 0, 400), Position = UDim2.new(0.5, -200, 0.5, -200)} or
                  {Size = UDim2.new(0, 0, 0, 0), Position = frame.Position}
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
    local tween = TweenService:Create(frame, tweenInfo, goal)
    tween:Play()
    tween.Completed:Connect(function()
        frame.Visible = visible
    end)
end

-- Анимация для открытия и закрытия меню
local function openMainMenu()
    MainFrame.Visible = true
    tweenVisibility(MainFrame, true, 0.5)
end

local function closeMainMenu()
    tweenVisibility(MainFrame, false, 0.5)
end

local function openSettingsMenu()
    SettingsFrame.Visible = true
    tweenVisibility(SettingsFrame, true, 0.5)
end

local function closeSettingsMenu()
    tweenVisibility(SettingsFrame, false, 0.5)
end
-- Обработчики для открытия и закрытия меню
ToggleButton.MouseButton1Click:Connect(function()
    if MainFrame.Visible then
        closeMainMenu()
    else
        openMainMenu()
    end
end)

SettingsButton.MouseButton1Click:Connect(function()
    if SettingsFrame.Visible then
        closeSettingsMenu()
    else
        openSettingsMenu()
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    closeMainMenu()
end)

CloseButton.MouseButton1Click:Connect(function()
    closeSettingsMenu()
end)

FreezeButton.MouseButton1Click:Connect(function()
    toggleFreeze()
end)
