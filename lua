
local larry0_0 = {}
for larry5_0, larry6_0 in pairs(debug.getupvalue(require(game.ReplicatedStorage.Fsys).load("RouterClient").init, 7)) do
  larry6_0.Name = larry5_0
  larry0_0[larry5_0] = larry6_0
end
local larry2_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Fsys"))
local larry3_0 = larry2_0.load("UIManager")
local larry5_0 = nil
for larry9_0, larry10_0 in pairs(larry2_0.load("ClientData").get("inventory").toys) do
  if larry10_0.id == "trade_license" then
    larry5_0 = larry9_0
    break
  end
end
debug.setupvalue(require(game.ReplicatedStorage.Fsys).load("RouterClient").init, 7, setmetatable({
  ["ToolAPI/Equip"] = function(larry0_1, larry1_1, ...)
    if larry1_1 == larry5_0 then
      larry3_0.set_app_visibility("TradeHistoryApp", true)
    end
    return larry0_0["ToolAPI/Equip"](larry0_1, larry1_1, ...)
  end,
  ["ToolAPI/Unequip"] = function(larry0_3, larry1_3)
    if larry1_3 == larry5_0 then
      larry3_0.set_app_visibility("TradeHistoryApp", false)
    end
    return larry0_0["ToolAPI/Unequip"](larry0_3, larry1_3)
  end,
}, {
  __index = larry0_0,
  __newindex = function(larry0_5, larry1_5, larry2_5)
    if larry1_5 == "ToolAPI/Equip" or larry1_5 == "ToolAPI/Unequip" then
      rawset(larry0_5, larry1_5, larry2_5)
    else
      larry0_0[larry1_5] = larry2_5
    end
  end,
}))
local larry8_0 = game:GetService("Players")
local larry11_0 = require(game:GetService("ReplicatedStorage"):WaitForChild("Fsys")).load("UIManager")
local larry12_0 = larry11_0.apps.TradeHistoryApp
local larry13_0 = larry11_0.apps.TradeApp
local larry14_0 = larry8_0.LocalPlayer
if larry12_0._ORIGINAL_create_trade_frame then
  larry12_0._create_trade_frame = larry12_0._ORIGINAL_create_trade_frame
end
if larry13_0._ORIGINAL_change_local_trade_state then
  larry13_0._change_local_trade_state = larry13_0._ORIGINAL_change_local_trade_state
end
if larry13_0._ORIGINAL_overwrite_local_trade_state then
  larry13_0._overwrite_local_trade_state = larry13_0._ORIGINAL_overwrite_local_trade_state
end
larry12_0._ORIGINAL_create_trade_frame = larry12_0._create_trade_frame
larry13_0._ORIGINAL_change_local_trade_state = larry13_0._change_local_trade_state
larry13_0._ORIGINAL_overwrite_local_trade_state = larry13_0._overwrite_local_trade_state
local larry15_0 = {}
function larry13_0._change_local_trade_state(larry0_7, larry1_7, ...)
  local larry3_7 = larry0_7:_get_local_trade_state()
  if larry3_7 and larry3_7.trade_id then
    if larry3_7.sender == larry14_0 and larry1_7.sender_offer then
      larry15_0[larry3_7.trade_id] = {
        items = table.clone(larry1_7.sender_offer.items),
        isSender = true,
      }
    elseif larry3_7.recipient == larry14_0 and larry1_7.recipient_offer then
      larry15_0[larry3_7.trade_id] = {
        items = table.clone(larry1_7.recipient_offer.items),
        isSender = false,
      }
    end
  end
  return larry13_0._ORIGINAL_change_local_trade_state(larry0_7, larry1_7, ...)
end
function larry13_0._overwrite_local_trade_state(larry0_88, larry1_88, ...)
  if not larry1_88 and larry13_0._last_trade_id then
    larry15_0[larry13_0._last_trade_id] = nil
  end
  return larry13_0._ORIGINAL_overwrite_local_trade_state(larry0_88, larry1_88, ...)
end
function larry12_0._create_trade_frame(larry0_4, larry1_4, ...)
  if larry1_4.trade_id and larry15_0[larry1_4.trade_id] then
    local larry3_4 = larry15_0[larry1_4.trade_id]
    local larry4_4 = table.clone(larry1_4)
    if larry3_4.isSender then
      larry4_4.sender_items = table.clone(larry3_4.items)
    else
      larry4_4.recipient_items = table.clone(larry3_4.items)
    end
    return larry0_4._ORIGINAL_create_trade_frame(larry0_4, larry4_4, ...)
  end
  return larry0_4._ORIGINAL_create_trade_frame(larry0_4, larry1_4, ...)
end
local larry16_0 = game:GetService("ReplicatedStorage")
local larry17_0 = game:GetService("Players")
local larry19_0 = require(larry16_0:WaitForChild("Fsys")).load("UIManager")
local larry20_0 = nil
local larry21_0 = larry19_0.apps.TradeApp._overwrite_local_trade_state
function larry19_0.apps.TradeApp._overwrite_local_trade_state(larry0_86, larry1_86, ...)
  -- notice: unreachable block#6
  if larry1_86 then
    local larry3_86 = larry1_86.sender
    if larry3_86 == larry17_0.LocalPlayer then
      larry3_86 = larry1_86.sender_offer
      if not larry3_86 then
        
        larry3_86 = larry1_86.recipient
        if larry3_86 == larry17_0.LocalPlayer then
          larry3_86 = larry1_86.recipient_offer
        else
          larry3_86 = false
        end
      end
    else
      goto label_10	-- block#3 is visited secondly
    end
    if larry3_86 and larry20_0 then
      larry3_86.items = larry20_0
    end
  else
    larry20_0 = nil
  end
  return larry21_0(larry0_86, larry1_86, ...)
end
local larry22_0 = larry19_0.apps.TradeApp._change_local_trade_state
function larry19_0.apps.TradeApp._change_local_trade_state(larry0_6, larry1_6, ...)
  -- notice: unreachable block#6
  local larry3_6 = larry19_0.apps.TradeApp.local_trade_state
  if larry3_6 then
    local larry4_6 = larry3_6.sender
    if larry4_6 == larry17_0.LocalPlayer then
      larry4_6 = "sender_offer"
      if not larry4_6 then
        
        larry4_6 = larry3_6.recipient
        if larry4_6 == larry17_0.LocalPlayer then
          larry4_6 = "recipient_offer"
        else
          larry4_6 = false
        end
      end
    else
      goto label_14	-- block#3 is visited secondly
    end
    if larry4_6 then
      local larry5_6 = larry1_6[larry4_6]
      if larry5_6 and larry5_6.items then
        larry20_0 = larry5_6.items
      end
    end
  end
  return larry22_0(larry0_6, larry1_6, ...)
end
local larry23_0 = game:GetService("TweenService")
local larry25_0 = game:GetService("Players").LocalPlayer
local larry26_0 = game:GetService("RunService")
local larry27_0 = {
  F = false,
  R = false,
  N = false,
  M = false,
}
local larry28_0 = {
  Color3.fromRGB(170, 0, 255),
  Color3.fromRGB(0, 255, 100),
  Color3.fromRGB(0, 200, 255),
  Color3.fromRGB(255, 50, 150)
}
task.spawn(function()
  local larry0_8 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
  set_thread_identity(2)
  local larry1_8 = larry0_8("ClientData")
  local larry2_8 = larry0_8("KindDB")
  local larry3_8 = larry0_8("RouterClient")
  local larry4_8 = larry0_8("DownloadClient")
  local larry5_8 = larry0_8("AnimationManager")
  local larry6_8 = larry0_8("new:PetRigs")
  set_thread_identity(8)
  local larry7_8 = {}
  local larry8_8 = {}
  local larry9_8 = nil
  local larry10_8 = nil
  local larry11_8 = nil
  local function larry12_8(larry0_69, larry1_69)
    larry1_8.predict(larry0_69, larry1_69(table.clone(larry1_8.get(larry0_69))))
  end
  local function larry13_8()
    return game:GetService("HttpService"):GenerateGUID(false)
  end
  local function larry14_8(larry0_23)
    if larry7_8[larry0_23] then
      return larry7_8[larry0_23]
    end
    local larry1_23 = larry4_8.promise_download_copy("Pets", larry0_23):expect()
    larry7_8[larry0_23] = larry1_23
    return larry1_23
  end
  local function larry15_8(larry0_53, larry1_53)
    local larry2_53 = larry13_8()
    local larry3_53 = larry2_8[larry0_53]
    if not larry3_53 then
      warn("Pet ID not found: " .. larry0_53)
      return nil
    end
    set_thread_identity(2)
    local larry4_53 = {
      unique = larry2_53,
      category = "pets",
      id = larry0_53,
      kind = larry3_53.kind,
      newness_order = math.random(1, 900000),
      properties = larry1_53 or {},
    }
    larry1_8.get("inventory").pets[larry2_53] = larry4_53
    set_thread_identity(8)
    larry8_8[larry2_53] = {
      data = larry4_53,
      model = nil,
    }
    return larry4_53
  end
  local function larry16_8(larry0_74)
    local larry1_74 = larry13_8()
    local larry2_74 = larry2_8[larry0_74]
    if not larry2_74 then
      warn("Toy ID not found: " .. larry0_74)
      return nil
    end
    set_thread_identity(2)
    local larry3_74 = {
      unique = larry1_74,
      category = "toys",
      id = larry0_74,
      kind = larry2_74.kind,
      newness_order = math.random(1, 900000),
      properties = {},
    }
    larry1_8.get("inventory").toys[larry1_74] = larry3_74
    set_thread_identity(8)
    return larry3_74
  end
  local function larry17_8(larry0_80, larry1_80)
    local larry2_80 = larry0_80:FindFirstChild("PetModel")
    if not larry2_80 then
      return 
    end
    for larry6_80, larry7_80 in pairs(larry1_80.neon_parts) do
      local larry8_80 = larry6_8.get(larry2_80).get_geo_part(larry2_80, larry6_80)
      larry8_80.Material = larry7_80.Material
      larry8_80.Color = larry7_80.Color
    end
  end
  local function larry18_8(larry0_32)
    larry12_8("pet_char_wrappers", function(larry0_33)
      larry0_32.unique = #larry0_33 + 1
      larry0_32.index = #larry0_33 + 1
      larry0_33[#larry0_33 + 1] = larry0_32
      return larry0_33
    end)
  end
  local function larry19_8(larry0_16)
    larry12_8("pet_state_managers", function(larry0_17)
      larry0_17[#larry0_17 + 1] = larry0_16
      return larry0_17
    end)
  end
  local function larry20_8(larry0_63, larry1_63)
    for larry5_63, larry6_63 in pairs(larry0_63) do
      if larry1_63(larry6_63, larry5_63) then
        return larry5_63
      end
    end
    return nil
  end
  local function larry21_8(larry0_57)
    larry12_8("pet_char_wrappers", function(larry0_58)
      local larry1_58 = larry20_8(larry0_58, function(larry0_59)
        return larry0_59.pet_unique == larry0_57
      end)
      if not larry1_58 then
        return larry0_58
      end
      table.remove(larry0_58, larry1_58)
      for larry5_58, larry6_58 in pairs(larry0_58) do
        larry6_58.unique = larry5_58
        larry6_58.index = larry5_58
      end
      return larry0_58
    end)
  end
  local function larry22_8(larry0_46)
    local larry1_46 = larry8_8[larry0_46]
    if not larry1_46 then
      return 
    end
    if not larry1_46.model then
      return 
    end
    larry12_8("pet_state_managers", function(larry0_47)
      local larry1_47 = larry20_8(larry0_47, function(larry0_48)
        return larry0_48.char == larry1_46.model
      end)
      if not larry1_47 then
        return larry0_47
      end
      local larry2_47 = table.clone(larry0_47)
      larry2_47[larry1_47] = table.clone(larry2_47[larry1_47])
      larry2_47[larry1_47].states = {}
      return larry2_47
    end)
  end
  local function larry23_8(larry0_40, larry1_40)
    local larry2_40 = larry8_8[larry0_40]
    if not larry2_40 then
      return 
    end
    if not larry2_40.model then
      return 
    end
    larry12_8("pet_state_managers", function(larry0_41)
      local larry1_41 = larry20_8(larry0_41, function(larry0_42)
        return larry0_42.char == larry2_40.model
      end)
      if not larry1_41 then
        return larry0_41
      end
      local larry2_41 = table.clone(larry0_41)
      larry2_41[larry1_41] = table.clone(larry2_41[larry1_41])
      larry2_41[larry1_41].states = {
        {
          id = larry1_40,
        }
      }
      return larry2_41
    end)
  end
  local function larry24_8(larry0_27)
    local larry1_27 = game.Players.LocalPlayer.Character
    if not larry1_27 then
      return false
    end
    if not larry1_27.PrimaryPart then
      return false
    end
    local larry2_27 = larry0_27:FindFirstChild("RidePosition", true)
    if not larry2_27 then
      return false
    end
    local larry3_27 = Instance.new("Attachment")
    larry3_27.Parent = larry2_27
    larry3_27.Position = Vector3.new(0, 1.237, 0)
    larry3_27.Name = "SourceAttachment"
    local larry4_27 = Instance.new("RigidConstraint")
    larry4_27.Name = "StateConnection"
    larry4_27.Attachment0 = larry3_27
    larry4_27.Attachment1 = larry1_27.PrimaryPart.RootAttachment
    larry4_27.Parent = larry1_27
    return true
  end
  local function larry25_8()
    larry12_8("state_manager", function(larry0_30)
      local larry1_30 = table.clone(larry0_30)
      larry1_30.states = {}
      larry1_30.is_sitting = false
      return larry1_30
    end)
  end
  local function larry26_8(larry0_36)
    larry12_8("state_manager", function(larry0_37)
      local larry1_37 = table.clone(larry0_37)
      larry1_37.states = {
        {
          id = larry0_36,
        }
      }
      larry1_37.is_sitting = true
      return larry1_37
    end)
  end
  local function larry27_8(larry0_9)
    local larry1_9 = larry8_8[larry0_9]
    if not larry1_9 then
      return 
    end
    if not larry1_9.model then
      return 
    end
    larry12_8("pet_state_managers", function(larry0_10)
      local larry1_10 = larry20_8(larry0_10, function(larry0_11)
        return larry0_11.char == larry1_9.model
      end)
      if not larry1_10 then
        return larry0_10
      end
      table.remove(larry0_10, larry1_10)
      return larry0_10
    end)
  end
  local function larry28_8(larry0_44)
    local larry1_44 = larry8_8[larry0_44]
    if not larry1_44 then
      return 
    end
    if not larry1_44.model then
      return 
    end
    if larry11_8 then
      larry11_8:Stop()
      larry11_8:Destroy()
    end
    local larry2_44 = larry1_44.model:FindFirstChild("SourceAttachment", true)
    if larry2_44 then
      larry2_44:Destroy()
    end
    if game.Players.LocalPlayer.Character then
      for larry6_44, larry7_44 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if larry7_44:IsA("BasePart") and larry7_44:GetAttribute("HaveMass") then
          larry7_44.Massless = false
        end
      end
    end
    larry22_8(larry0_44)
    larry25_8()
    larry1_44.model:ScaleTo(1)
    larry10_8 = nil
  end
  local function larry29_8(larry0_68, larry1_68, larry2_68)
    local larry3_68 = larry8_8[larry0_68]
    if not larry3_68 then
      return 
    end
    if not larry3_68.model then
      return 
    end
    local larry4_68 = game.Players.LocalPlayer
    if not larry4_68.Character then
      return 
    end
    if not larry4_68.Character.PrimaryPart then
      return 
    end
    larry10_8 = larry0_68
    larry23_8(larry0_68, larry2_68)
    larry26_8(larry1_68)
    larry3_68.model:ScaleTo(2)
    larry24_8(larry3_68.model)
    larry11_8 = larry4_68.Character.Humanoid.Animator:LoadAnimation(larry5_8.get_track("PlayerRidingPet"))
    larry4_68.Character.Humanoid.Sit = true
    for larry8_68, larry9_68 in pairs(larry4_68.Character:GetDescendants()) do
      if larry9_68:IsA("BasePart") and larry9_68.Massless == false then
        larry9_68.Massless = true
        larry9_68:SetAttribute("HaveMass", true)
      end
    end
    larry11_8:Play()
  end
  local function larry30_8(larry0_85)
    larry29_8(larry0_85, "PlayerFlyingPet", "PetBeingFlown")
  end
  local function larry31_8(larry0_64)
    larry29_8(larry0_64, "PlayerRidingPet", "PetBeingRidden")
  end
  local function larry32_8(larry0_39)
    local larry1_39 = larry8_8[larry0_39.unique]
    if not larry1_39 then
      return 
    end
    if not larry1_39.model then
      return 
    end
    larry28_8(larry0_39.unique)
    larry21_8(larry0_39.unique)
    larry27_8(larry0_39.unique)
    larry1_39.model:Destroy()
    larry1_39.model = nil
    larry9_8 = nil
  end
  local function larry33_8(larry0_73)
    if larry0_73.category == "pets" then
      if larry9_8 then
        larry32_8(larry9_8)
      end
      local larry1_73 = larry14_8(larry0_73.kind):Clone()
      larry1_73.Parent = workspace
      larry8_8[larry0_73.unique].model = larry1_73
      if larry0_73.properties.neon or larry0_73.properties.mega_neon then
        larry17_8(larry1_73, larry2_8[larry0_73.kind])
      end
      larry9_8 = larry0_73
      local larry2_73 = larry18_8
      local larry3_73 = {
        char = larry1_73,
        mega_neon = larry0_73.properties.mega_neon,
        neon = larry0_73.properties.neon,
        player = game.Players.LocalPlayer,
        entity_controller = game.Players.LocalPlayer,
        controller = game.Players.LocalPlayer,
        rp_name = larry0_73.properties.rp_name or "",
        pet_trick_level = larry0_73.properties.pet_trick_level,
        pet_unique = larry0_73.unique,
        pet_id = larry0_73.id,
        location = {
          full_destination_id = "housing",
          destination_id = "housing",
          house_owner = game.Players.LocalPlayer,
        },
        pet_progression = {
          age = math.random(1, 900000),
          percentage = math.random(0.01, 0.99),
        },
        are_colors_sealed = false,
        is_pet = true,
      }
      larry2_73(larry3_73)
      larry19_8({
        char = larry1_73,
        player = game.Players.LocalPlayer,
        store_key = "pet_state_managers",
        is_sitting = false,
        chars_connected_to_me = {},
        states = {},
      })
    else
      local larry1_73 = oldGet("ToolAPI/Equip")
      local larry3_73 = larry0_73.unique
      ... = larry1_73:InvokeServer(larry3_73) -- error: untaken top expr
    end
  end
  local larry34_8 = larry3_8.get
  local function larry35_8(larry0_24)
    return {
      InvokeServer = function(larry0_25, ...)
        return larry0_24(...)
      end,
    }
  end
  local larry37_8 = larry35_8(function(larry0_49, larry1_49)
    local larry2_49 = larry8_8[larry0_49]
    if larry2_49 then
      larry33_8(larry2_49.data)
      return true, {
        action = "equip",
        is_server = true,
      }
    end
    return larry34_8("ToolAPI/Equip"):InvokeServer(larry0_49, larry1_49)
  end)
  local larry38_8 = larry35_8(function(larry0_43)
    local larry1_43 = larry8_8[larry0_43]
    if larry1_43 then
      larry32_8(larry1_43.data)
      return true, {
        action = "unequip",
        is_server = true,
      }
    end
    return larry34_8("ToolAPI/Unequip"):InvokeServer(larry0_43)
  end)
  local larry39_8 = larry35_8(function(larry0_72)
    larry31_8(larry0_72.pet_unique)
  end)
  local larry40_8 = larry35_8(function(larry0_45)
    larry30_8(larry0_45.pet_unique)
  end)
  local larry41_8 = larry35_8(function()
    larry28_8(larry10_8)
  end)
  local larry42_8 = (function(larry0_66)
    return {
      FireServer = function(larry0_67, ...)
        return larry0_66(...)
      end,
    }
  end)(function()
    larry28_8(larry10_8)
  end)
  function larry3_8.get(larry0_38)
    if larry0_38 == "ToolAPI/Equip" then
      return larry37_8
    end
    if larry0_38 == "ToolAPI/Unequip" then
      return larry38_8
    end
    if larry0_38 == "AdoptAPI/RidePet" then
      return larry39_8
    end
    if larry0_38 == "AdoptAPI/FlyPet" then
      return larry40_8
    end
    if larry0_38 == "AdoptAPI/ExitSeatStatesYield" then
      return larry41_8
    end
    if larry0_38 == "AdoptAPI/ExitSeatStates" then
      return larry42_8
    end
    return larry34_8(larry0_38)
  end
  for larry46_8, larry47_8 in pairs(larry1_8.get("pet_char_wrappers")) do
    larry34_8("ToolAPI/Unequip"):InvokeServer(larry47_8.pet_unique)
  end
  local larry44_8 = require(game.ReplicatedStorage.Fsys).load("InventoryDB")
  function GetPetByName(larry0_70)
    for larry4_70, larry5_70 in pairs(larry44_8.pets) do
      if larry5_70.name:lower() == larry0_70:lower() then
        return larry5_70.id
      end
    end
    return false
  end
  function GetToyByName(larry0_71)
    for larry4_71, larry5_71 in pairs(larry44_8.toys) do
      if larry5_71.name:lower() == larry0_71:lower() then
        return larry5_71.id
      end
    end
    return false
  end
  local larry45_8 = Instance.new("ScreenGui")
  larry45_8.Name = "SkaiAdmSpawner"
  larry45_8.Parent = larry25_0:WaitForChild("PlayerGui")
  local larry46_8 = Instance.new("Frame")
  larry46_8.Size = UDim2.new(0, 320, 0, 300)
  larry46_8.Position = UDim2.new(0.5, -160, 0.4, -150)
  larry46_8.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
  larry46_8.BackgroundTransparency = 1
  larry46_8.BorderSizePixel = 0
  larry46_8.ZIndex = 1
  larry46_8.Parent = larry45_8
  local larry47_8 = Instance.new("UICorner")
  larry47_8.CornerRadius = UDim.new(0, 10)
  larry47_8.Parent = larry46_8
  local larry48_8 = I
