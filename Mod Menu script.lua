local function setupLocalItemsButton(LocalItemsButton)
    LocalItemsButton.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        for _, item in pairs(player.Backpack:GetChildren()) do
            item.Parent = player.Character
        end
    end)
end

local function setupToggleButton(ToggleButton, MainFrame)
    ToggleButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)
end

local function setupCloseButton(CloseButton, MainFrame)
    CloseButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
    end)
end

local function makeDraggable(gui)
    local UserInputService = game:GetService("UserInputService")
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

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

local function main()
    local elements = createUI()
    applyStyling(elements)
    setupFreezeButton(elements.FreezeButton, elements.SpeedLabel, elements.SpeedInput)
    setupLocalItemsButton(elements.LocalItemsButton)
    setupESPButton(elements.ESPButton)
    setupToggleButton(elements.ToggleButton, elements.MainFrame)
    setupCloseButton(elements.CloseButton, elements.MainFrame)
    makeDraggable(elements.MainFrame)
end

main()
