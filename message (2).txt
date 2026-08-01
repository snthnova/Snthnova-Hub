local function SpawnGingerscope()
    local guns = {
        Gingerscope = {
            MeshId = "rbxassetid://15374602183",
            Offset = Vector3.zero,
            Scale = Vector3.new(0.084, 0.084, 0.084),
            TextureId = "rbxassetid://15409041564",
            VertexColor = Vector3.new(1, 1, 1),
            CFrame = CFrame.new(0.129999995, 0, 0.075000003, 1, 0, 0, 0, 0.707388222, 0.706825197, 0, -0.706825197, 0.707388222),
            Grip = CFrame.new(0, -0.400000006, 0.899999976, 1, 0, 0, 0, 1, 0, 0, 0, 1),
            Image = "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=15666596216",
            GuiColor = Color3.new(0.39215686274509803, 0.0392156862745098, 1)
        }
    }
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local CoreGui = game:GetService("CoreGui")
    
    local ChosenGun = "Gingerscope"
    local Equipped = false
    local BackpackImageConnection = nil
    local GunVisualConnection = nil
    local AutoEquipGunConnection = nil
    local ClickConnection = nil
    
    local function Disconnect()
        if BackpackImageConnection then
            BackpackImageConnection:Disconnect()
            BackpackImageConnection = nil
        end
        if GunVisualConnection then
            GunVisualConnection:Disconnect()
            GunVisualConnection = nil
        end
        if AutoEquipGunConnection then
            AutoEquipGunConnection:Disconnect()
            AutoEquipGunConnection = nil
        end
    end
    
    local function EquipGun(GunName)
        if Equipped ~= false then
            Disconnect()
            local Character = LocalPlayer.Character
            repeat
                task.wait()
            until Character:FindFirstChild("HumanoidRootPart")
            
            local GunModel = nil
            local KnifeModel = nil
            
            repeat
                for _, Child in pairs(workspace.WeaponDisplays:GetChildren()) do
                    local AttachmentA = Child.RigidConstraint.Attachment0
                    local AttachmentB = Child.RigidConstraint.Attachment0
                    
                    if AttachmentA == Character:FindFirstChild("GunBelt", true) then
                        GunModel = Child
                    end
                    if AttachmentB == Character:FindFirstChild("KnifeBack", true) then
                        KnifeModel = Child
                    end
                end
                task.wait(0.1)
            until GunModel and KnifeModel
            
            repeat
                task.wait()
            until GunModel:FindFirstChild("Attachment")
            
            GunModel.Attachment.CFrame = guns[GunName].CFrame
            
            for Key, Value in pairs(guns[GunName]) do
                if Key ~= "CFrame" and Key ~= "Grip" and Key ~= "Image" and Key ~= "GuiColor" then
                    GunModel.Mesh[Key] = Value
                end
            end
            
            BackpackImageConnection = LocalPlayer.Backpack.DescendantAdded:Connect(function()
                if guns[GunName] then
                    for _, Child in pairs(CoreGui.RobloxGui.Backpack.Hotbar:GetChildren()) do
                        if Child.Icon.Image ~= "" and GetSheriff() == LocalPlayer then
                            Child.Icon.Image = guns[GunName].Image
                        end
                    end
                end
            end)
            
            GunVisualConnection = LocalPlayer.Backpack.DescendantAdded:Connect(function(Descendant)
                if tostring(Descendant) == "Gun" then
                    task.wait()
                    local UsableGun = LocalPlayer.Backpack.Gun.Handle
                    for Key, Value in pairs(guns[GunName]) do
                        if Key ~= "CFrame" and Key ~= "Grip" and Key ~= "Image" and Key ~= "GuiColor" then
                            UsableGun.Mesh[Key] = Value
                        end
                    end
                    UsableGun.Parent.Grip = guns[GunName].Grip
                end
            end)
            
            return
        end
    end
    
    local function SpawnItem()
        local MainGUI = LocalPlayer.PlayerGui.MainGUI
        local Inventory = MainGUI.Game.Inventory
        local Weapons = Inventory.Main.Weapons
        local Items = Weapons.Items
        
        for _, Child in pairs(Items.Container:GetChildren()) do
            for _, Child3 in pairs(Child:GetChildren()) do
                Child.ChildAdded:Connect(function(Child4)
                    if Child4.Name == "NewItem" then
                        Child4.Container.ActionButton.MouseButton1Click:Connect(function()
                            Disconnect()
                            Equipped = false
                        end)
                    end
                end)
                
                for _, Child5 in pairs(Child3:GetChildren()) do
                    if Child5.Name == "NewItem" then
                        Child5.Container.ActionButton.MouseButton1Click:Connect(function()
                            Disconnect()
                            Equipped = false
                        end)
                    end
                end
            end
        end
        
        local ChristmasContainer = nil
        local HalloweenContainer = nil
        
        for _, Child in pairs(Items.Container:GetChildren()) do
            if Child.Name == "Holiday" then
                ChristmasContainer = Child.Container.Christmas
                HalloweenContainer = Child.Container.Halloween
            end
        end
        
        for _, Child in pairs(ChristmasContainer.Container:GetChildren()) do
            if Child.Name == "NewItem" then
                Child.Container.ActionButton.MouseButton1Click:Connect(function()
                    Disconnect()
                    Equipped = false
                end)
            end
        end
        
        ChristmasContainer.Container.ChildAdded:Connect(function(Child)
            if Child.Name == "NewItem" then
                Child.Container.ActionButton.MouseButton1Click:Connect(function()
                    Disconnect()
                    Equipped = false
                end)
            end
        end)
        
        for _, Child in pairs(HalloweenContainer.Container:GetChildren()) do
            if Child.Name == "NewItem" then
                Child.Container.ActionButton.MouseButton1Click:Connect(function()
                    Disconnect()
                    Equipped = false
                end)
            end
        end
        
        HalloweenContainer.Container.ChildAdded:Connect(function(Child)
            if Child.Name == "NewItem" then
                Child.Container.ActionButton.MouseButton1Click:Connect(function()
                    Disconnect()
                    Equipped = false
                end)
            end
        end)
        
        local NewItem = ReplicatedStorage.Modules.InventoryModule.NewItem:Clone()
        NewItem.Name = "FakeItem"
        NewItem.Parent = Weapons.Items.Container.Holiday.Container.Christmas.Container
        NewItem.ItemName.Label.Text = ChosenGun
        NewItem.Tags.Evo.Visible = false
        NewItem.Container.Icon.Image = guns[ChosenGun].Image
        NewItem.Container.Amount.Text = ""
        NewItem.ItemName.BackgroundColor3 = guns[ChosenGun].GuiColor
        
        local function Click()
            Equipped = true
            local EquippedGun = Weapons.Equipped.Container.Gun.Container
            EquippedGun.ItemName.BackgroundColor3 = guns[ChosenGun].GuiColor
            EquippedGun.ItemName.Label.Text = ChosenGun
            EquippedGun.Container.Icon.Image = guns[ChosenGun].Image
            EquipGun(ChosenGun)
            AutoEquipGunConnection = LocalPlayer.CharacterAdded:Connect(function()
                EquipGun(ChosenGun)
            end)
        end
        
        ClickConnection = NewItem.Container.ActionButton.MouseButton1Click:Connect(function()
            Click()
        end)
        
        if Equipped == true then
            task.wait()
            Click()
        end
    end
    
    LocalPlayer.CharacterAdded:Connect(function()
        SpawnItem()
    end)
    
    SpawnItem()
end

SpawnGingerscope()