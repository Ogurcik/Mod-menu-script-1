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
SettingsButton.Parent = MainFrame
SettingsButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
SettingsButton.Position = UDim2.new(0.5, -50, 0, 80)
SettingsButton.Size = UDim2.new(0, 100, 0, 50)
SettingsButton.Text = "Settings"
SettingsButton.TextColor3 = Color3.new(1, 1, 1)
SettingsButton.Font = Enum.Font.SourceSans
SettingsButton.TextSize = 24

-- Конфигурация фрейма настроек
SettingsFrame.Parent = ScreenGui
SettingsFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
SettingsFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
SettingsFrame.Size = UDim2.new(0, 400, 0, 400)
SettingsFrame.Visible = false
SettingsFrame.BorderSizePixel = 0

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
-- Функция для изменения языка
local function changeLanguage(language)
    if language == "English" then
        SpeedLabel.Text = "Speed:"
        FreezeButton.Text = "Freeze"
        SettingsButton.Text = "Settings"
        VersionLabel.Text = "Version: 1.0"
        EnglishButton.TextColor3 = Color3.new(0.8, 0.8, 0.8)
        RussianButton.TextColor3 = Color3.new(1, 1, 1)
    elseif language == "Russian" then
        SpeedLabel.Text = "Скорость:"
        FreezeButton.Text = "Заморозить"
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
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)
-- Логика для кнопок и функции заморозки скорости
local isFrozen = false
local currentSpeed = tonumber(SpeedInput.Text)

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    if MainFrame.Visible then
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local tween = TweenService:Create(MainFrame, tweenInfo, {Position = UDim2.new(0.5, -200, 0.5, -200)})
        tween:Play()
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(MainFrame, tweenInfo, {Position = UDim2.new(0.5, -200, 1, 0)})
    tween:Play()
    tween.Completed:Connect(function()
        MainFrame.Visible = false
    end)
end)

FreezeButton.MouseButton1Click:Connect(function()
    isFrozen = not isFrozen
    if isFrozen then
        FreezeButton.Text = "Unfreeze"
        RunService:BindToRenderStep("FreezeStep", Enum.RenderPriority.Character.Value, function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
        end)
    else
        FreezeButton.Text = "Freeze"
        RunService:UnbindFromRenderStep("FreezeStep")
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = currentSpeed
    end
end)

SpeedInput.FocusLost:Connect(updateSpeedFromInput)

SettingsButton.MouseButton1Click:Connect(function()
    SettingsFrame.Visible = not SettingsFrame.Visible
end)

EnglishButton.MouseButton1Click:Connect(function()
    changeLanguage("English")
end)

RussianButton.MouseButton1Click:Connect(function()
    changeLanguage("Russian")
end)

-- Первоначальная настройка языка
changeLanguage("English")
