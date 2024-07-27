-- Создание интерфейса
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

-- Настройка главной рамки
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
MainFrame.Size = UDim2.new(0, 400, 0, 400)
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

-- Настройка кнопки заморозки
FreezeButton.Parent = MainFrame
FreezeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
FreezeButton.Position = UDim2.new(0.5, -50, 0, 20)
FreezeButton.Size = UDim2.new(0, 100, 0, 50)
FreezeButton.Text = "Freeze"
FreezeButton.TextColor3 = Color3.new(1, 1, 1)
FreezeButton.Font = Enum.Font.SourceSans
FreezeButton.TextSize = 24

-- Настройка метки скорости
SpeedLabel.Parent = MainFrame
SpeedLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
SpeedLabel.Position = UDim2.new(0.1, 0, 0.4, 0)
SpeedLabel.Size = UDim2.new(0.8, 0, 0, 30)
SpeedLabel.Text = "Speed:"
SpeedLabel.TextColor3 = Color3.new(1, 1, 1)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.TextSize = 24
SpeedLabel.Visible = false

-- Настройка поля ввода скорости
SpeedInput.Parent = MainFrame
SpeedInput.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
SpeedInput.Position = UDim2.new(0.1, 0, 0.5, 0)
SpeedInput.Size = UDim2.new(0.8, 0, 0, 30)
SpeedInput.Text = "16"
SpeedInput.TextColor3 = Color3.new(1, 1, 1)
SpeedInput.Font = Enum.Font.SourceSans
SpeedInput.TextSize = 24
SpeedInput.Visible = false

-- Настройка кнопки выдачи предметов
LocalItemsButton.Parent = MainFrame
LocalItemsButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
LocalItemsButton.Position = UDim2.new(0.5, -50, 0, 100)
LocalItemsButton.Size = UDim2.new(0, 100, 0, 50)
LocalItemsButton.Text = "Local Items"
LocalItemsButton.TextColor3 = Color3.new(1, 1, 1)
LocalItemsButton.Font = Enum.Font.SourceSans
LocalItemsButton.TextSize = 24

-- Настройка метки версии
VersionLabel.Parent = MainFrame
VersionLabel.BackgroundTransparency = 1
VersionLabel.Position = UDim2.new(1, -100, 1, -20)
VersionLabel.Size = UDim2.new(0, 100, 0, 20)
VersionLabel.Text = "Version 1.0"
VersionLabel.TextColor3 = Color3.new(1, 1, 1)
VersionLabel.Font = Enum.Font.SourceSans
VersionLabel.TextSize = 18
-- Функция для настройки углов и обводок элементов
local function setupElement(element)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = element
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.new(0, 0, 0)
    stroke.Thickness = 2
    stroke.Parent = element
end

setupElement(ToggleButton)
setupElement(CloseButton)
setupElement(FreezeButton)
setupElement(SpeedInput)
setupElement(LocalItemsButton)

local isFrozen = false
local originalWalkSpeed = 16
local currentSpeed = originalWalkSpeed
local connection

-- Функция для переключения заморозки персонажа
local function toggleFreeze()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        if not isFrozen then
            -- Остановка персонажа
            character.HumanoidRootPart.Anchored = true

            -- Локальная функция для обновления позиции
            connection = game:GetService("RunService").RenderStepped:Connect(function()
                if isFrozen then
                    local moveDirection = humanoid.MoveDirection
                    local delta = moveDirection * currentSpeed / 60
                    character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + delta
                end
            end)

            -- Включение заморозки
            isFrozen = true
            FreezeButton.Text = "Unfreeze"
            SpeedLabel.Visible = true
            SpeedInput.Visible = true
        else
            -- Возвращение к обычному состоянию
            character.HumanoidRootPart.Anchored = false
            humanoid.WalkSpeed = originalWalkSpeed

            -- Отключение заморозки
            isFrozen = false
            FreezeButton.Text = "Freeze"
            if connection then connection:Disconnect() end
            SpeedLabel.Visible = false
            SpeedInput.Visible = false
        end
    end
end

FreezeButton.MouseButton1Click:Connect(toggleFreeze)

-- Функция для обновления скорости из текстового поля
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

-- Функция для выдачи всех доступных предметов
local function giveAllItems()
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack
    for _, asset in ipairs(game:GetDescendants()) do
        if asset:IsA("Tool") and not backpack:FindFirstChild(asset.Name) then
            asset:Clone().Parent = backpack
        end
    end
end

LocalItemsButton.MouseButton1Click:Connect(giveAllItems)
local TweenService = game:GetService("TweenService")

-- Анимация открытия и закрытия меню
local function toggleMenuVisibility()
    local goalOpen = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    local goalClose = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

    local tweenOpen = TweenService:Create(MainFrame, goalOpen, {Size = UDim2.new(0, 400, 0, 400)})
    local tweenClose = TweenService:Create(MainFrame, goalClose, {Size = UDim2.new(0, 400, 0, 0)})

    if MainFrame.Visible then
        tweenClose:Play()
        tweenClose.Completed:Connect(function()
MainFrame.Visible = false
        end)
    else
        MainFrame.Visible = true
        tweenOpen:Play()
    end
end

ToggleButton.MouseButton1Click:Connect(toggleMenuVisibility)
CloseButton.MouseButton1Click:Connect(toggleMenuVisibility)
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

local function endDrag()
    dragging = false
    dragInput.Changed:Disconnect()
end

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        dragInput = input
        dragInput.Changed:Connect(function()
            if dragging then
                update(dragInput)
            end
        end)

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                endDrag()
            end
        end)
    end
end)

CloseButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        dragInput = input
        dragInput.Changed:Connect(function()
            if dragging then
                update(dragInput)
            end
        end)

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                endDrag()
            end
        end)
    end
end)
