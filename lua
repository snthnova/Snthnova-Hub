-- ts file was generated at discord.gg/25ms


local v1 = debug.getupvalue(require(game.ReplicatedStorage.Fsys).load("RouterClient").init, 7)
local v2, v3, v4 = pairs(v1)
local vu5 = {}
while true do
    local v6
    v4, v6 = v2(v3, v4)
    if v4 == nil then
        break
    end
    v6.Name = v4
    vu5[v4] = v6
end
local v7 = require(game:GetService("ReplicatedStorage"):WaitForChild("Fsys"))
local vu8 = v7.load("UIManager")
local v9 = v7.load("ClientData").get("inventory").toys
local v10, v11, vu12 = pairs(v9)
local v13 = nil
while true do
    local v14
    vu12, v14 = v10(v11, vu12)
    if vu12 == nil then
        vu12 = v13
        break
    end
    if v14.id == "trade_license" then
        break
    end
end
local v19 = {
    ["ToolAPI/Equip"] = function(p15, p16, ...)
        if p16 == vu12 then
            vu8.set_app_visibility("TradeHistoryApp", true)
        end
        return vu5["ToolAPI/Equip"](p15, p16, ...)
    end,
    ["ToolAPI/Unequip"] = function(p17, p18)
        if p18 == vu12 then
            vu8.set_app_visibility("TradeHistoryApp", false)
        end
        return vu5["ToolAPI/Unequip"](p17, p18)
    end
}
debug.setupvalue(require(game.ReplicatedStorage.Fsys).load("RouterClient").init, 7, setmetatable(v19, {
    __index = vu5,
    __newindex = function(p20, p21, p22)
        if p21 == "ToolAPI/Equip" or p21 == "ToolAPI/Unequip" then
            rawset(p20, p21, p22)
        else
            vu5[p21] = p22
        end
    end
}))
local v23 = game:GetService("Players")
local v24 = game:GetService("ReplicatedStorage")
local v25 = require(v24:WaitForChild("Fsys")).load("UIManager")
local v26 = v25.apps.TradeHistoryApp
local vu27 = v25.apps.TradeApp
local vu28 = v23.LocalPlayer
if v26._ORIGINAL_create_trade_frame then
    v26._create_trade_frame = v26._ORIGINAL_create_trade_frame
end
if vu27._ORIGINAL_change_local_trade_state then
    vu27._change_local_trade_state = vu27._ORIGINAL_change_local_trade_state
end
if vu27._ORIGINAL_overwrite_local_trade_state then
    vu27._overwrite_local_trade_state = vu27._ORIGINAL_overwrite_local_trade_state
end
v26._ORIGINAL_create_trade_frame = v26._create_trade_frame
vu27._ORIGINAL_change_local_trade_state = vu27._change_local_trade_state
vu27._ORIGINAL_overwrite_local_trade_state = vu27._overwrite_local_trade_state
local vu29 = {}
function vu27._change_local_trade_state(p30, p31, ...)
    local v32 = p30:_get_local_trade_state()
    if v32 and v32.trade_id then
        if v32.sender ~= vu28 or not p31.sender_offer then
            if v32.recipient == vu28 and p31.recipient_offer then
                vu29[v32.trade_id] = {
                    items = table.clone(p31.recipient_offer.items),
                    isSender = false
                }
            end
        else
            vu29[v32.trade_id] = {
                items = table.clone(p31.sender_offer.items),
                isSender = true
            }
        end
    end
    return vu27._ORIGINAL_change_local_trade_state(p30, p31, ...)
end
function vu27._overwrite_local_trade_state(p33, p34, ...)
    if not p34 and vu27._last_trade_id then
        vu29[vu27._last_trade_id] = nil
    end
    return vu27._ORIGINAL_overwrite_local_trade_state(p33, p34, ...)
end
function v26._create_trade_frame(p35, p36, ...)
    if not (p36.trade_id and vu29[p36.trade_id]) then
        return p35:_ORIGINAL_create_trade_frame(p36, ...)
    end
    local v37 = vu29[p36.trade_id]
    local v38 = table.clone(p36)
    if v37.isSender then
        v38.sender_items = table.clone(v37.items)
    else
        v38.recipient_items = table.clone(v37.items)
    end
    return p35:_ORIGINAL_create_trade_frame(v38, ...)
end
local v39 = game:GetService("ReplicatedStorage")
local vu40 = game:GetService("Players")
local vu41 = require(v39:WaitForChild("Fsys")).load("UIManager")
local vu42 = nil
local vu43 = vu41.apps.TradeApp._overwrite_local_trade_state
function vu41.apps.TradeApp._overwrite_local_trade_state(p44, p45, ...)
    if p45 then
        local v46 = p45.sender == vu40.LocalPlayer and p45.sender_offer
        if not v46 then
            if p45.recipient ~= vu40.LocalPlayer then
                v46 = false
            else
                v46 = p45.recipient_offer
            end
        end
        if v46 and vu42 then
            v46.items = vu42
        end
    else
        vu42 = nil
    end
    return vu43(p44, p45, ...)
end
local vu47 = vu41.apps.TradeApp._change_local_trade_state
function vu41.apps.TradeApp._change_local_trade_state(p48, p49, ...)
    local v50 = vu41.apps.TradeApp.local_trade_state
    local v51 = v50 and (v50.sender == vu40.LocalPlayer and "sender_offer" or (v50.recipient == vu40.LocalPlayer and "recipient_offer" or false))
    if v51 then
        local v52 = p49[v51]
        if v52 and v52.items then
            vu42 = v52.items
        end
    end
    return vu47(p48, p49, ...)
end
local vu53 = game:GetService("TweenService")
local vu54 = game:GetService("Players").LocalPlayer
local vu55 = game:GetService("RunService")
local vu56 = {
    F = false,
    R = false,
    N = false,
    M = false
}
local _ = {
    Color3.fromRGB(170, 0, 255),
    Color3.fromRGB(0, 255, 100),
    Color3.fromRGB(0, 200, 255),
    Color3.fromRGB(255, 50, 150)
}
task.spawn(function()
    local v57 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
    set_thread_identity(2)
    local vu58 = v57("ClientData")
    local vu59 = v57("KindDB")
    local v60 = v57("RouterClient")
    local vu61 = v57("DownloadClient")
    local vu62 = v57("AnimationManager")
    local vu63 = v57("new:PetRigs")
    set_thread_identity(8)
    local vu64 = {}
    local vu65 = {}
    local vu66 = nil
    local vu67 = nil
    local vu68 = nil
    local function vu73(p69, p70)
        local v71 = vu58.get(p69)
        local v72 = table.clone(v71)
        vu58.predict(p69, p70(v72))
    end
    local function vu74()
        return game:GetService("HttpService"):GenerateGUID(false)
    end
    local function vu77(p75)
        if vu64[p75] then
            return vu64[p75]
        end
        local v76 = vu61.promise_download_copy("Pets", p75):expect()
        vu64[p75] = v76
        return v76
    end
    local function vu83(p78, p79)
        local v80 = vu74()
        local v81 = vu59[p78]
        if not v81 then
            warn("Pet ID not found: " .. p78)
            return nil
        end
        set_thread_identity(2)
        local v82 = {
            unique = v80,
            category = "pets",
            id = p78,
            kind = v81.kind,
            newness_order = math.random(1, 900000),
            properties = p79 or {}
        }
        vu58.get("inventory").pets[v80] = v82
        set_thread_identity(8)
        vu65[v80] = {
            data = v82,
            model = nil
        }
        return v82
    end
    local function vu88(p84)
        local v85 = vu74()
        local v86 = vu59[p84]
        if not v86 then
            warn("Toy ID not found: " .. p84)
            return nil
        end
        set_thread_identity(2)
        local v87 = {
            unique = v85,
            category = "toys",
            id = p84,
            kind = v86.kind,
            newness_order = math.random(1, 900000),
            properties = {}
        }
        vu58.get("inventory").toys[v85] = v87
        set_thread_identity(8)
        return v87
    end
    local function vu97(p89, p90)
        local v91 = p89:FindFirstChild("PetModel")
        if v91 then
            local v92, v93, v94 = pairs(p90.neon_parts)
            while true do
                local v95
                v94, v95 = v92(v93, v94)
                if v94 == nil then
                    break
                end
                local v96 = vu63.get(v91).get_geo_part(v91, v94)
                v96.Material = v95.Material
                v96.Color = v95.Color
            end
        end
    end
    local function vu100(pu98)
        vu73("pet_char_wrappers", function(p99)
            pu98.unique = # p99 + 1
            pu98.index = # p99 + 1
            p99[# p99 + 1] = pu98
            return p99
        end)
    end
    local function vu103(pu101)
        vu73("pet_state_managers", function(p102)
            p102[# p102 + 1] = pu101
            return p102
        end)
    end
    local function vu110(p104, p105)
        local v106, v107, v108 = pairs(p104)
        while true do
            local v109
            v108, v109 = v106(v107, v108)
            if v108 == nil then
                break
            end
            if p105(v109, v108) then
                return v108
            end
        end
        return nil
    end
    local function vu119(pu111)
        vu73("pet_char_wrappers", function(p112)
            local v114 = vu110(p112, function(p113)
                return p113.pet_unique == pu111
            end)
            if not v114 then
                return p112
            end
            table.remove(p112, v114)
            local v115, v116, v117 = pairs(p112)
            while true do
                local v118
                v117, v118 = v115(v116, v117)
                if v117 == nil then
                    break
                end
                v118.unique = v117
                v118.index = v117
            end
            return p112
        end)
    end
    local function vu126(p120)
        local vu121 = vu65[p120]
        if vu121 then
            if vu121.model then
                vu73("pet_state_managers", function(p122)
                    local v124 = vu110(p122, function(p123)
                        return p123.char == vu121.model
                    end)
                    if not v124 then
                        return p122
                    end
                    local v125 = table.clone(p122)
                    v125[v124] = table.clone(v125[v124])
                    v125[v124].states = {}
                    return v125
                end)
            end
        else
            return
        end
    end
    local function vu135(p127, pu128)
        local vu129 = vu65[p127]
        if vu129 then
            if vu129.model then
                vu73("pet_state_managers", function(p130)
                    local v132 = vu110(p130, function(p131)
                        return p131.char == vu129.model
                    end)
                    if not v132 then
                        return p130
                    end
                    local v133 = table.clone(p130)
                    v133[v132] = table.clone(v133[v132])
                    local v134 = {
                        {
                            id = pu128
                        }
                    }
                    v133[v132].states = v134
                    return v133
                end)
            end
        else
            return
        end
    end
    local function vu141(p136)
        local v137 = game.Players.LocalPlayer.Character
        if not v137 then
            return false
        end
        if not v137.PrimaryPart then
            return false
        end
        local v138 = p136:FindFirstChild("RidePosition", true)
        if not v138 then
            return false
        end
        local v139 = Instance.new("Attachment")
        v139.Parent = v138
        v139.Position = Vector3.new(0, 1.237, 0)
        v139.Name = "SourceAttachment"
        local v140 = Instance.new("RigidConstraint")
        v140.Name = "StateConnection"
        v140.Attachment0 = v139
        v140.Attachment1 = v137.PrimaryPart.RootAttachment
        v140.Parent = v137
        return true
    end
    local function vu144()
        vu73("state_manager", function(p142)
            local v143 = table.clone(p142)
            v143.states = {}
            v143.is_sitting = false
            return v143
        end)
    end
    local function vu148(pu145)
        vu73("state_manager", function(p146)
            local v147 = table.clone(p146)
            v147.states = {
                {
                    id = pu145
                }
            }
            v147.is_sitting = true
            return v147
        end)
    end
    local function vu154(p149)
        local vu150 = vu65[p149]
        if vu150 then
            if vu150.model then
                vu73("pet_state_managers", function(p151)
                    local v153 = vu110(p151, function(p152)
                        return p152.char == vu150.model
                    end)
                    if not v153 then
                        return p151
                    end
                    table.remove(p151, v153)
                    return p151
                end)
            end
        else
            return
        end
    end
    local function vu162(p155)
        local v156 = vu65[p155]
        if v156 then
            if v156.model then
                if vu68 then
                    vu68:Stop()
                    vu68:Destroy()
                end
                local v157 = v156.model:FindFirstChild("SourceAttachment", true)
                if v157 then
                    v157:Destroy()
                end
                if game.Players.LocalPlayer.Character then
                    local v158, v159, v160 = pairs(game.Players.LocalPlayer.Character:GetDescendants())
                    while true do
                        local v161
                        v160, v161 = v158(v159, v160)
                        if v160 == nil then
                            break
                        end
                        if v161:IsA("BasePart") and v161:GetAttribute("HaveMass") then
                            v161.Massless = false
                        end
                    end
                end
                vu126(p155)
                vu144()
                v156.model:ScaleTo(1)
                vu67 = nil
            end
        else
            return
        end
    end
    local function vu172(p163, p164, p165)
        local v166 = vu65[p163]
        if v166 then
            if v166.model then
                local v167 = game.Players.LocalPlayer
                if v167.Character then
                    if v167.Character.PrimaryPart then
                        vu67 = p163
                        vu135(p163, p165)
                        vu148(p164)
                        v166.model:ScaleTo(2)
                        vu141(v166.model)
                        vu68 = v167.Character.Humanoid.Animator:LoadAnimation(vu62.get_track("PlayerRidingPet"))
                        v167.Character.Humanoid.Sit = true
                        local v168, v169, v170 = pairs(v167.Character:GetDescendants())
                        while true do
                            local v171
                            v170, v171 = v168(v169, v170)
                            if v170 == nil then
                                break
                            end
                            if v171:IsA("BasePart") and v171.Massless == false then
                                v171.Massless = true
                                v171:SetAttribute("HaveMass", true)
                            end
                        end
                        vu68:Play()
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    end
    local function vu174(p173)
        vu172(p173, "PlayerFlyingPet", "PetBeingFlown")
    end
    local function vu176(p175)
        vu172(p175, "PlayerRidingPet", "PetBeingRidden")
    end
    local function vu179(p177)
        local v178 = vu65[p177.unique]
        if v178 then
            if v178.model then
                vu162(p177.unique)
                vu119(p177.unique)
                vu154(p177.unique)
                v178.model:Destroy()
                v178.model = nil
                vu66 = nil
            end
        else
            return
        end
    end
    local function vu182(p180)
        if p180.category ~= "pets" then
            local _ = oldGet("ToolAPI/Equip").InvokeServer
            local _ = p180.unique
        else
            if vu66 then
                vu179(vu66)
            end
            local v181 = vu77(p180.kind):Clone()
            v181.Parent = workspace
            vu65[p180.unique].model = v181
            if p180.properties.neon or p180.properties.mega_neon then
                vu97(v181, vu59[p180.kind])
            end
            vu66 = p180
            vu100({
                char = v181,
                mega_neon = p180.properties.mega_neon,
                neon = p180.properties.neon,
                player = game.Players.LocalPlayer,
                entity_controller = game.Players.LocalPlayer,
                controller = game.Players.LocalPlayer,
                rp_name = p180.properties.rp_name or "",
                pet_trick_level = p180.properties.pet_trick_level,
                pet_unique = p180.unique,
                pet_id = p180.id,
                location = {
                    full_destination_id = "housing",
                    destination_id = "housing",
                    house_owner = game.Players.LocalPlayer
                },
                pet_progression = {
                    age = math.random(1, 900000),
                    percentage = math.random(0.01, 0.99)
                },
                are_colors_sealed = false,
                is_pet = true
            })
            vu103({
                char = v181,
                player = game.Players.LocalPlayer,
                store_key = "pet_state_managers",
                is_sitting = false,
                chars_connected_to_me = {},
                states = {}
            })
        end
    end
    local vu183 = v60.get
    local function v185(pu184)
        return {
            InvokeServer = function(_, ...)
                return pu184(...)
            end
        }
    end
    local vu189 = v185(function(p186, p187)
        local v188 = vu65[p186]
        if not v188 then
            return vu183("ToolAPI/Equip"):InvokeServer(p186, p187)
        end
        vu182(v188.data)
        return true, {
            action = "equip",
            is_server = true
        }
    end)
    local vu192 = v185(function(p190)
        local v191 = vu65[p190]
        if not v191 then
            return vu183("ToolAPI/Unequip"):InvokeServer(p190)
        end
        vu179(v191.data)
        return true, {
            action = "unequip",
            is_server = true
        }
    end)
    local vu194 = v185(function(p193)
        vu176(p193.pet_unique)
    end)
    local vu196 = v185(function(p195)
        vu174(p195.pet_unique)
    end)
    local vu197 = v185(function()
        vu162(vu67)
    end)
    local vu199 = (function(pu198)
        return {
            FireServer = function(_, ...)
                return pu198(...)
            end
        }
    end)(function()
        vu162(vu67)
    end)
    function v60.get(p200)
        if p200 == "ToolAPI/Equip" then
            return vu189
        elseif p200 == "ToolAPI/Unequip" then
            return vu192
        elseif p200 == "AdoptAPI/RidePet" then
            return vu194
        elseif p200 == "AdoptAPI/FlyPet" then
            return vu196
        elseif p200 == "AdoptAPI/ExitSeatStatesYield" then
            return vu197
        elseif p200 == "AdoptAPI/ExitSeatStates" then
            return vu199
        else
            return vu183(p200)
        end
    end
    local v201, v202, v203 = pairs(vu58.get("pet_char_wrappers"))
    local v204 = vu183
    while true do
        local v205
        v203, v205 = v201(v202, v203)
        if v203 == nil then
            break
        end
        v204("ToolAPI/Unequip"):InvokeServer(v205.pet_unique)
    end
    local vu206 = require(game.ReplicatedStorage.Fsys).load("InventoryDB")
    function GetPetByName(p207)
        local v208, v209, v210 = pairs(vu206.pets)
        while true do
            local v211
            v
