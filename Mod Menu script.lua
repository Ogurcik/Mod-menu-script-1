-- UI Creation Module
local function createUI()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local ToggleButton = Instance.new("TextButton")
    local CloseButton = Instance.new("TextButton")
    local FreezeButton = Instance.new("TextButton")
    local SpeedLabel = Instance.new("TextLabel")
    local SpeedInput = Instance.new("TextBox")
    local LocalItemsButton = Instance.new("TextButton")
    local ESPButton = Instance.new("TextButton")
    local VersionLabel = Instance.new("TextLabel")

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
    ToggleButton.Size = UDim2.new(0, 80, 0, 40)
    ToggleButton.Text = "Menu"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.TextSize = 20

    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
    CloseButton.Position = UDim2.new(0.5, -50, 1, -40)
    CloseButton.Size = UDim2.new(0, 80, 0, 30)
    CloseButton.Text = "Close"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 20

    FreezeButton.Parent = MainFrame
    FreezeButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    FreezeButton.Position = UDim2.new(0.5, -50, 0, 20)
    FreezeButton.Size = UDim2.new(0, 80, 0, 40)
    FreezeButton.Text = "Freeze"
    FreezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    FreezeButton.Font = Enum.Font.GothamBold
    FreezeButton.TextSize = 20

    SpeedLabel.Parent = MainFrame
    SpeedLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SpeedLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
    SpeedLabel.Size = UDim2.new(0.8, 0, 0, 30)
    SpeedLabel.Text = "Speed:"
    SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedLabel.Font = Enum.Font.GothamBold
    SpeedLabel.TextSize = 20
    SpeedLabel.Visible = false

    SpeedInput.Parent = MainFrame
    SpeedInput.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    SpeedInput.Position = UDim2.new(0.1, 0, 0.6, 0)
    SpeedInput.Size = UDim2.new(0.8, 0, 0, 30)
    SpeedInput.Text = "16"
    SpeedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedInput.Font = Enum.Font.GothamBold
    SpeedInput.TextSize = 20
    SpeedInput.Visible = false

    LocalItemsButton.Parent = MainFrame
    LocalItemsButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    LocalItemsButton.Position = UDim2.new(0.5, -50, 0, 80)
    LocalItemsButton.Size = UDim2.new(0, 80, 0, 40)
    LocalItemsButton.Text = "Local Items"
    LocalItemsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    LocalItemsButton.Font = Enum.Font.GothamBold
    LocalItemsButton.TextSize = 20

    ESPButton.Parent = MainFrame
    ESPButton.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    ESPButton.Position = UDim2.new(0.5, -50, 0, 140)
    ESPButton.Size = UDim2.new(0, 80, 0, 40)
    ESPButton.Text = "ESP"
    ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ESPButton.Font = Enum.Font.GothamBold
    ESPButton.TextSize = 20

    VersionLabel.Parent = MainFrame
    VersionLabel.BackgroundTransparency = 1
    VersionLabel.Position = UDim2.new(1, -100, 1, -20)
    VersionLabel.Size = UDim2.new(0, 100, 0, 20)
    VersionLabel.Text = "Version 1.1"
    VersionLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    VersionLabel.Font = Enum.Font.GothamBold
    VersionLabel.TextSize = 18

    local versionGradient = Instance.new("UIGradient")
    versionGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0))
    }
    versionGradient.Parent = VersionLabel

    return {
        ScreenGui = ScreenGui,
        MainFrame = MainFrame,
        ToggleButton = ToggleButton,
        CloseButton = CloseButton,
        FreezeButton = FreezeButton,
        SpeedLabel = SpeedLabel,
        SpeedInput = SpeedInput,
        LocalItemsButton = LocalItemsButton,
        ESPButton = ESPButton,
        VersionLabel = VersionLabel
    }
end

return {
    createUI = createUI
}
-- Styling Module
local function setupElement(element)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = element
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 0, 0)
    stroke.Thickness = 2
    stroke.Parent = element
end

local function applyStyling(elements)
    setupElement(elements.ToggleButton)
    setupElement(elements.CloseButton)
    setupElement(elements.FreezeButton)
    setupElement(elements.SpeedInput)
    setupElement(elements.LocalItemsButton)
    setupElement(elements.ESPButton)
end

return {
    applyStyling = applyStyling
}
-- Functionality Module
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function setupToggleButton(toggleButton, mainFrame)
    toggleButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
    end)
end

local function setupCloseButton(closeButton, mainFrame)
    closeButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = false
    end)
end

local function setupFreezeButton(freezeButton, speedLabel, speedInput)
    local isSpeeding = false
    local originalWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed

    freezeButton.MouseButton1Click:Connect(function()
        isSpeeding = not isSpeeding
        if isSpeeding then
            speedLabel.Visible = true
            speedInput.Visible = true
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speedInput.Text) or originalWalkSpeed
        else
            speedLabel.Visible = false
            speedInput.Visible = false
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = originalWalkSpeed
        end
    end)

    speedInput.FocusLost:Connect(function(enterPressed)
        if enterPressed and isSpeeding then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(speedInput.Text) or originalWalkSpeed
        end
    end)
end

local function setupESPButton(espButton)
    local espEnabled = false

    local function toggleESP()
        espEnabled = not espEnabled
        if espEnabled then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    local espBox = Instance.new("BoxHandleAdornment")
                    espBox.Size = player.Character.HumanoidRootPart.Size
                    espBox.Adornee = player.Character.HumanoidRootPart
                    espBox.ZIndex = 10
                    espBox.AlwaysOnTop = true
                    espBox.Color3 = Color3.fromRGB(255, 0, 0)
                    espBox.Parent = player.Character
                end
            end
        else
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character:FindFirstChildOfClass("BoxHandleAdornment") then
                    player.Character:FindFirstChildOfClass("BoxHandleAdornment"):Destroy()
                end
            end
        end
    end

    espButton.MouseButton1Click:Connect(toggleESP)
end

return {
    setupToggleButton = setupToggleButton,
    setupCloseButton = setupCloseButton,
    setupFreezeButton = setupFreezeButton,
    setupESPButton = setupESPButton
}
-- Draggable Module
local function makeDraggable(frame)
    local UserInputService = game:GetService("UserInputService")
    local dragging, dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

return {
    makeDraggable = makeDraggable
}
-- Initialization
local UI = require(script.UI)
local Styling = require(script.Styling)
local Functionality = require(script.Functionality)
local Draggable = require(script.Draggable)

-- Создаем UI элементы
local elements = UI.createUI()

-- Применяем стили
Styling.applyStyling(elements)

-- Настраиваем кнопки
Functionality.setupToggleButton(elements.ToggleButton, elements.MainFrame)
Functionality.setupCloseButton(elements.CloseButton, elements.MainFrame)
Functionality.setupFreezeButton(elements.FreezeButton, elements.SpeedLabel, elements.SpeedInput)
Functionality.setupESPButton(elements.ESPButton)

-- Делаем окно перетаскиваемым
Draggable.makeDraggable(elements.MainFrame)
