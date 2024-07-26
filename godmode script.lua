-- Создание интерфейса
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local GodModeButton = Instance.new("TextButton")
local LocalItemsGiverButton = Instance.new("TextButton")
local SpeedLabel = Instance.new("TextLabel")
local SpeedInput = Instance.new("TextBox")
local VersionLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local TweenService = game:GetService("TweenService")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "MainMenuGui"

-- Настройка главной панели
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Visible = false
MainFrame.BorderSizePixel = 0

-- Настройка кнопки открытия/закрытия меню
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
ToggleButton.Position = UDim2.new(0, 0, 0, 0)
ToggleButton.Size = UDim2.new(0, 100, 0, 50)
ToggleButton.Text = "Menu"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 24

-- Настройка кнопки закрытия меню
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.new(0.7, 0.1, 0.1)
CloseButton.Position = UDim2.new(0.5, -50, 1, -40)
CloseButton.Size = UDim2.new(0, 100, 0, 30)
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.TextSize = 24

-- Настройка кнопки GodMode
GodModeButton.Parent = MainFrame
GodModeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
GodModeButton.Position = UDim2.new(0.5, -50, 0, 20)
GodModeButton.Size = UDim2.new(0, 100, 0, 50)
GodModeButton.Text = "GodMode"
GodModeButton.TextColor3 = Color3.new(1, 1, 1)
GodModeButton.Font = Enum.Font.SourceSans
GodModeButton.TextSize = 24

-- Настройка кнопки Local Items Giver
LocalItemsGiverButton.Parent = MainFrame
LocalItemsGiverButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
LocalItemsGiverButton.Position = UDim2.new(0.5, -50, 0, 90)
LocalItemsGiverButton.Size = UDim2.new(0, 200, 0, 50)
LocalItemsGiverButton.Text = "Local Items Giver (Beta-test)"
LocalItemsGiverButton.TextColor3 = Color3.new(1, 1, 1)
LocalItemsGiverButton.Font = Enum.Font.SourceSans
LocalItemsGiverButton.TextSize = 20

-- Настройка метки скорости
SpeedLabel.Parent = MainFrame
SpeedLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SpeedLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
SpeedLabel.Size = UDim2.new(0.8, 0, 0, 30)
SpeedLabel.Text = "Speed:"
SpeedLabel.TextColor3 = Color3.new(1, 1, 1)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.TextSize = 24

-- Настройка ввода скорости
SpeedInput.Parent = MainFrame
SpeedInput.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
SpeedInput.Position = UDim2.new(0.1, 0, 0.5, 0)
SpeedInput.Size = UDim2.new(0.8, 0, 0, 30)
SpeedInput.Text = "16"
SpeedInput.TextColor3 = Color3.new(1, 1, 1)
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.TextSize = 24

-- Настройка метки версии
VersionLabel.Parent = MainFrame
VersionLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
VersionLabel.Position = UDim2.new(1, -80, 1, -20)
VersionLabel.Size = UDim2.new(0, 80, 0, 20)
VersionLabel.Text = "Version 1.0"
VersionLabel.TextColor3 = Color3.new(1, 1, 1)
VersionLabel.Font = Enum.Font.SourceSans
VersionLabel.TextSize = 14
VersionLabel.TextXAlignment = Enum.TextXAlignment.Right

-- Настройка углов для кнопок
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ToggleButton

local UICornerClose = UICorner:Clone()
UICornerClose.Parent = CloseButton

local UICornerGodMode = UICorner:Clone()
UICornerGodMode.Parent = GodModeButton

local UICornerLocalItemsGiver = UICorner:Clone()
UICornerLocalItemsGiver.Parent = LocalItemsGiverButton

local UICornerSpeedInput = UICorner:Clone()
UICornerSpeedInput.Parent = SpeedInput

-- Настройка обводки для кнопок
UIStroke.Parent = ToggleButton
UIStroke.Color = Color3.new(0, 0, 0)
UIStroke.Thickness = 2

local UIStrokeClose = UIStroke:Clone()
UIStrokeClose.Parent = CloseButton

local UIStrokeGodMode = UIStroke:Clone()
UIStrokeGodMode.Parent = GodModeButton

local UIStrokeLocalItemsGiver = UIStroke:Clone()
UIStrokeLocalItemsGiver.Parent = LocalItemsGiverButton

local UIStrokeSpeedInput = UIStroke:Clone()
UIStrokeSpeedInput.Parent = SpeedInput
local isGodMode = false
local originalWalkSpeed = 16
local currentSpeed = originalWalkSpeed
local connection

-- Функция включения/выключения GodMode
local function toggleGodMode()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        if not isGodMode then
            character.HumanoidRootPart.Anchored = true

            connection = RunService.RenderStepped:Connect(function()
                if isGodMode then
                    local moveDirection = humanoid.MoveDirection
                    local delta = moveDirection * currentSpeed / 60
                    character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + delta
                end
            end)

            isGodMode = true
            GodModeButton.Text = "Disable GodMode"
        else
            character.HumanoidRootPart.Anchored = false
            humanoid.WalkSpeed = originalWalkSpeed

            isGodMode = false
            GodModeButton.Text = "GodMode"
            if connection then connection:Disconnect() end
        end
    end
end

-- Функция выдачи всех доступных предметов
local function giveAllItems()
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack

    for _, item in pairs(game:GetDescendants()) do
        if item:IsA("Tool") and not backpack:FindFirstChild(item.Name) then
            item:Clone().Parent = backpack
        end
    end
end

-- Обновление скорости по вводу
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

GodModeButton.MouseButton1Click:Connect(toggleGodMode)
LocalItemsGiverButton.MouseButton1Click:Connect(giveAllItems)
local function tweenMenuVisibility(visible)
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local goal = {Position = visible and UDim2.new(0.5, -200, 0.5, -250) or UDim2.new(0.5, -200, 0.5, -400)}
    local tween = TweenService:Create(MainFrame, tweenInfo, goal)
    tween:Play()
    
    if not visible then
        tween.Completed:Connect(function()
            MainFrame.Visible = false
        end)
    else
        MainFrame.Visible = true
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    tweenMenuVisibility(not MainFrame.Visible)
end)

CloseButton.MouseButton1Click:Connect(function()
    tweenMenuVisibility(false)
end)
