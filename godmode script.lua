-- Часть 1: Создание интерфейса

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
local LanguageLabel = Instance.new("TextLabel")
local EnglishButton = Instance.new("TextButton")
local RussianButton = Instance.new("TextButton")
local VersionLabel = Instance.new("TextLabel")
local DiscordLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Настройки ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "MainMenuGui"

-- Настройки MainFrame
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Visible = false
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- Настройки кнопки Toggle
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
ToggleButton.Position = UDim2.new(0, 0, 0, 0)
ToggleButton.Size = UDim2.new(0, 100, 0, 50)
ToggleButton.Text = "Menu"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 24
-- Часть 2: Настройки элементов интерфейса

-- Настройки кнопки Close
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.new(0.7, 0.1, 0.1)
CloseButton.Position = UDim2.new(0.5, -50, 1, -40)
CloseButton.Size = UDim2.new(0, 100, 0, 30)
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.TextSize = 24

-- Настройки кнопки Freeze
FreezeButton.Parent = MainFrame
FreezeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
FreezeButton.Position = UDim2.new(0.5, -50, 0, 20)
FreezeButton.Size = UDim2.new(0, 100, 0, 50)
FreezeButton.Text = "Freeze"
FreezeButton.TextColor3 = Color3.new(1, 1, 1)
FreezeButton.Font = Enum.Font.SourceSans
FreezeButton.TextSize = 24

-- Настройки SpeedLabel
SpeedLabel.Parent = MainFrame
SpeedLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SpeedLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
SpeedLabel.Size = UDim2.new(0.8, 0, 0, 30)
SpeedLabel.Text = "Speed:"
SpeedLabel.TextColor3 = Color3.new(1, 1, 1)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.TextSize = 24

-- Настройки SpeedInput
SpeedInput.Parent = MainFrame
SpeedInput.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
SpeedInput.Position = UDim2.new(0.1, 0, 0.5, 0)
SpeedInput.Size = UDim2.new(0.8, 0, 0, 30)
SpeedInput.Text = "16"
SpeedInput.TextColor3 = Color3.new(1, 1, 1)
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.TextSize = 24

-- Настройки кнопки Settings
SettingsButton.Parent = MainFrame
SettingsButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SettingsButton.Position = UDim2.new(0.5, -50, 0, 80)
SettingsButton.Size = UDim2.new(0, 100, 0, 50)
SettingsButton.Text = "Settings"
SettingsButton.TextColor3 = Color3.new(1, 1, 1)
SettingsButton.Font = Enum.Font.SourceSans
SettingsButton.TextSize = 24
-- Часть 3: Настройки раздела "Settings"

-- Настройки SettingsFrame
SettingsFrame.Parent = MainFrame
SettingsFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
SettingsFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
SettingsFrame.Size = UDim2.new(0, 300, 0, 200)
SettingsFrame.Visible = false
SettingsFrame.BorderSizePixel = 0

-- Настройки кнопки SettingsClose
SettingsCloseButton.Parent = SettingsFrame
SettingsCloseButton.BackgroundColor3 = Color3.new(0.7, 0.1, 0.1)
SettingsCloseButton.Position = UDim2.new(0.5, -50, 1, -40)
SettingsCloseButton.Size = UDim2.new(0, 100, 0, 30)
SettingsCloseButton.Text = "Close"
SettingsCloseButton.TextColor3 = Color3.new(1, 1, 1)
SettingsCloseButton.Font = Enum.Font.SourceSans
SettingsCloseButton.TextSize = 24

-- Настройки LanguageLabel
LanguageLabel.Parent = SettingsFrame
LanguageLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
LanguageLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
LanguageLabel.Size = UDim2.new(0.8, 0, 0, 30)
LanguageLabel.Text = "Select Language:"
LanguageLabel.TextColor3 = Color3.new(1, 1, 1)
LanguageLabel.Font = Enum.Font.SourceSans
LanguageLabel.TextSize = 24

-- Настройки кнопки English
EnglishButton.Parent = SettingsFrame
EnglishButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
EnglishButton.Position = UDim2.new(0.1, 0, 0.2, 0)
EnglishButton.Size = UDim2.new(0.8, 0, 0, 50)
EnglishButton.Text = "English"
EnglishButton.TextColor3 = Color3.new(1, 1, 1)
EnglishButton.Font = Enum.Font.SourceSans
EnglishButton.TextSize = 24

-- Настройки кнопки Russian
RussianButton.Parent = SettingsFrame
RussianButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
RussianButton.Position = UDim2.new(0.1, 0, 0.35, 0)
RussianButton.Size = UDim2.new(0.8, 0, 0, 50)
RussianButton.Text = "Русский"
RussianButton.TextColor3 = Color3.new(1, 1, 1)
RussianButton.Font = Enum.Font.SourceSans
RussianButton.TextSize = 24

-- Настройки VersionLabel
VersionLabel.Parent = SettingsFrame
VersionLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
VersionLabel.Position = UDim2.new(0.1, 0, 0.6, 0)
VersionLabel.Size = UDim2.new(0.8, 0, 0, 30)
VersionLabel.Text = "Version: 1.0"
VersionLabel.TextColor3 = Color3.new(1, 1, 1)
VersionLabel.Font = Enum.Font.SourceSans
VersionLabel.TextSize = 24

-- Настройки DiscordLabel
DiscordLabel.Parent = SettingsFrame
DiscordLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
DiscordLabel.Position = UDim2.new(0.1, 0, 0.7, 0)
DiscordLabel.Size = UDim2.new(0.8, 0, 0, 30)
DiscordLabel.Text = "Discord: https://discord.com/invite/KRY2WQHP6z"
DiscordLabel.TextColor3 = Color3.new(1, 1, 1)
DiscordLabel.Font = Enum.Font.SourceSans
DiscordLabel.TextSize = 24
-- Часть 4: Настройки для элементов UICorner и UIStroke

-- Настройки UICorner
local function addCorners(element)
    local corner = Instance.new("UICorner")
    corner.Parent = element
end

-- Настройки UIStroke
local function addStroke(element)
    local stroke = Instance.new("UIStroke")
    stroke.Parent = element
    stroke.Thickness = 2
    stroke.Color = Color3.new(1, 1, 1)
end

-- Добавление углов и обводок для всех кнопок и рамок
local elements = {
    MainFrame, ToggleButton, CloseButton, FreezeButton, SpeedInput, SettingsButton,
    SettingsFrame, SettingsCloseButton, EnglishButton, RussianButton, SpeedLabel,
    LanguageLabel, VersionLabel, DiscordLabel
}

for _, element in pairs(elements) do
    addCorners(element)
    addStroke(element)
end
-- Часть 5: Логика интерфейса и функционал кнопок

local isMenuVisible = false
local isSettingsVisible = false

ToggleButton.MouseButton1Click:Connect(function()
    isMenuVisible = not isMenuVisible
    MainFrame.Visible = isMenuVisible
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    isMenuVisible = false
end)

SettingsButton.MouseButton1Click:Connect(function()
    isSettingsVisible = true
    SettingsFrame.Visible = true
end)

SettingsCloseButton.MouseButton1Click:Connect(function()
    isSettingsVisible = false
    SettingsFrame.Visible = false
end)

FreezeButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        if humanoid.WalkSpeed > 0 then
            humanoid.WalkSpeed = 0
            FreezeButton.Text = "Unfreeze"
        else
            humanoid.WalkSpeed = tonumber(SpeedInput.Text) or 16
            FreezeButton.Text = "Freeze"
        end
    end
end)

SpeedInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = tonumber(SpeedInput.Text) or 16
        end
    end
end)

EnglishButton.MouseButton1Click:Connect(function()
    SpeedLabel.Text = "Speed:"
    SettingsButton.Text = "Settings"
    CloseButton.Text = "Close"
    FreezeButton.Text = "Freeze"
    SettingsCloseButton.Text = "Close"
    LanguageLabel.Text = "Select Language:"
    VersionLabel.Text = "Version: 1.0"
end)

RussianButton.MouseButton1Click:Connect(function()
    SpeedLabel.Text = "Скорость:"
    SettingsButton.Text = "Настройки"
    CloseButton.Text = "Закрыть"
    FreezeButton.Text = "Заморозить"
    SettingsCloseButton.Text = "Закрыть"
    LanguageLabel.Text = "Выберите язык:"
    VersionLabel.Text = "Версия: 1.0"
end)
