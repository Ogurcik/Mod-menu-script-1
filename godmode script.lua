-- Создание интерфейса и элементов
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local FreezeButton = Instance.new("TextButton")
local SpeedLabel = Instance.new("TextLabel")
local SpeedInput = Instance.new("TextBox")
local LocalItemsButton = Instance.new("TextButton")
local VersionLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")

-- Настройка родительских элементов
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "MainMenuGui"

-- Настройка основного фрейма
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
MainFrame.Visible = false
MainFrame.BorderSizePixel = 0

-- Настройка кнопки переключения
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
ToggleButton.Position = UDim2.new(0, 0, 0, 0)
ToggleButton.Size = UDim2.new(0, 100, 0, 50)
ToggleButton.Text = "Menu"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 24

-- Настройка кнопки закрытия
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.new(0.7, 0.1, 0.1)
CloseButton.Position = UDim2.new(0.5, -50, 1, -40)
CloseButton.Size = UDim2.new(0, 100, 0, 30)
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.TextSize = 24

-- Настройка кнопки заморозки
FreezeButton.Parent = MainFrame
FreezeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
FreezeButton.Position = UDim2.new(0.5, -50, 0, 20)
FreezeButton.Size = UDim2.new(0, 100, 0, 50)
FreezeButton.Text = "Freeze"
FreezeButton.TextColor3 = Color3.new(1, 1, 1)
FreezeButton.Font = Enum.Font.SourceSans
FreezeButton.TextSize = 24

-- Настройка кнопки Local Items Giver
LocalItemsButton.Parent = MainFrame
LocalItemsButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
LocalItemsButton.Position = UDim2.new(0.5, -100, 0, 80)
LocalItemsButton.Size = UDim2.new(0, 200, 0, 50)
LocalItemsButton.Text = "Local Items Giver (Beta-Test)"
LocalItemsButton.TextColor3 = Color3.new(1, 1, 1)
LocalItemsButton.Font = Enum.Font.SourceSans
LocalItemsButton.TextSize = 24

-- Настройка текстового лейбла скорости
SpeedLabel.Parent = MainFrame
SpeedLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SpeedLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
SpeedLabel.Size = UDim2.new(0.8, 0, 0, 30)
SpeedLabel.Text = "Speed:"
SpeedLabel.TextColor3 = Color3.new(1, 1, 1)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.TextSize = 24
SpeedLabel.Visible = false

-- Настройка текстового ввода скорости
SpeedInput.Parent = MainFrame
SpeedInput.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
SpeedInput.Position = UDim2.new(0.1, 0, 0.5, 0)
SpeedInput.Size = UDim2.new(0.8, 0, 0, 30)
SpeedInput.Text = "16"
SpeedInput.TextColor3 = Color3.new(1, 1, 1)
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.TextSize = 24
SpeedInput.Visible = false

-- Настройка углов кнопок
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = ToggleButton

local UICornerClose = UICorner:Clone()
UICornerClose.Parent = CloseButton

local UICornerFreeze = UICorner:Clone()
UICornerFreeze.Parent = FreezeButton

local UICornerSpeedInput = UICorner:Clone()
UICornerSpeedInput.Parent = SpeedInput

local UICornerLocalItemsButton = UICorner:Clone()
UICornerLocalItemsButton.Parent = LocalItemsButton

-- Настройка обводки кнопок
UIStroke.Parent = ToggleButton
UIStroke.Color = Color3.new(0, 0, 0)
UIStroke.Thickness = 2

local UIStrokeClose = UIStroke:Clone()
UIStrokeClose.Parent = CloseButton

local UIStrokeFreeze = UIStroke:Clone()
UIStrokeFreeze.Parent = FreezeButton

local UIStrokeSpeedInput = UIStroke:Clone()
UIStrokeSpeedInput.Parent = SpeedInput

local UIStrokeLocalItemsButton = UIStroke:Clone()
UIStrokeLocalItemsButton.Parent = LocalItemsButton

-- Настройка лейбла версии
VersionLabel.Parent = ScreenGui
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(1, -100, 1, -20)
VersionLabel.Size = UDim2.new(0, 100, 0, 20)
VersionLabel.Text = "Version 1.0"
VersionLabel.TextColor3 = Color3.new(1, 1, 1)
VersionLabel.Font = Enum.Font.SourceSans
VersionLabel.TextSize = 14
local TweenService = game:GetService("TweenService")
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
            character.HumanoidRootPart.Anchored = true
            connection = RunService.RenderStepped:Connect(function()
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
            humanoid.WalkSpeed = originalWalkSpeed

            isFrozen = false
            FreezeButton.Text = "Freeze"
            SpeedLabel.Visible = false
            SpeedInput.Visible = false
            if connection then connection:Disconnect() end
        end
    end
end

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

local function giveAllAvailableItems()
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack

    for _, asset in ipairs(game:GetDescendants()) do
        if asset:IsA("Tool") and not backpack:FindFirstChild(asset.Name) then
            asset:Clone().Parent = backpack
        end
    end
end

LocalItemsButton.MouseButton1Click:Connect(function()
    giveAllAvailableItems()
end)
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

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

-- Плавное открывание и закрывание меню
local function toggleMenu()
    if MainFrame.Visible then
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -200, 0.5, -800)})
        tween:Play()
        tween.Completed:Connect(function()
            MainFrame.Visible = false
        end)
    else
        MainFrame.Visible = true
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -200, 0.5, -200)})
        tween:Play()
    end
end

ToggleButton.MouseButton1Click:Connect(function()
    toggleMenu()
end)

CloseButton.MouseButton1Click:Connect(function()
    toggleMenu()
end)

FreezeButton.MouseButton1Click:Connect(function()
    toggleFreeze()
end)

LocalItemsButton.MouseButton1Click:Connect(function()
    giveAllAvailableItems()
end)
