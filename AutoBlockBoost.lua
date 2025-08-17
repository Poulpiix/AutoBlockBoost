-- AutoBlockBoost.lua
local ADDON_NAME, ns = ...
AutoBlockBoost = {}
AutoBlockBoost_L = AutoBlockBoost_L or {}

-- Default SavedVariables
AutoBlockBoostDB = AutoBlockBoostDB or {
    enabled = true,
    printAlerts = true,
    keywords = { "boost", "carry", "wts", "mythic+", "curve", "gold only", "sale", "vip" }
}

-- Localization fallback
local function L(key)
    return AutoBlockBoost_L[key] or key
end

-- Utility: normalize string
local function ABB_Normalize(str)
    return string.lower(str or "")
end

-- Add player to ignore
local function ABB_AddIgnore(player, word)
    if not player or player == "" then return end
    C_FriendList.AddIgnore(player)
    if AutoBlockBoostDB.printAlerts then
        print(string.format("[%s] " .. L("IGNORED"), ADDON_NAME, player, word))
    end
end

-- Chat Filter
local function ABB_ChatFilter(self, event, msg, author, ...)
    if not AutoBlockBoostDB.enabled then return false end
    if not msg or not author then return false end

    local lowerMsg = ABB_Normalize(msg)

    for _, word in ipairs(AutoBlockBoostDB.keywords or {}) do
        if lowerMsg:find(word, 1, true) then
            ABB_AddIgnore(author, word)
            return true -- hide the message
        end
    end
    return false
end

-- Register filters for relevant events
local function ABB_RegisterFilters()
    ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ABB_ChatFilter)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", ABB_ChatFilter)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", ABB_ChatFilter)
    ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", ABB_ChatFilter)
end

-- Slash command
SLASH_AUTOBLOCKBOOST1 = "/abb"
SlashCmdList["AUTOBLOCKBOOST"] = function(msg)
    msg = ABB_Normalize(msg)
    if msg == "toggle" then
        AutoBlockBoostDB.enabled = not AutoBlockBoostDB.enabled
        print("[" .. ADDON_NAME .. "] " .. (AutoBlockBoostDB.enabled and L("ENABLED") or L("DISABLED")))
    elseif msg == "list" then
        print("[" .. ADDON_NAME .. "] Keywords: " .. table.concat(AutoBlockBoostDB.keywords, ", "))
    else
        print("[" .. ADDON_NAME .. "] Commands: /abb toggle, /abb list")
    end
end

-- Event frame
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        ABB_RegisterFilters()

        if AutoBlockBoostDB.enabled then
            print("[" .. ADDON_NAME .. "] " .. L("LOADED") .. " - " .. L("TIP_TOGGLE"))
        else
            print("[" .. ADDON_NAME .. "] " .. L("DISABLED") .. " - " .. L("TIP_TOGGLE"))
        end
    end
end)
