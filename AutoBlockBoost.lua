local ADDON_NAME, ns = ...
local L = ns.L

AutoBlockBoostDB = AutoBlockBoostDB or {
    enabled = true,
    silent = false,
    keywords = { "boost", "carry", "wts", "mythic+", "curve", "gold only", "sale", "VIP" }
}

local function Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00[ABB]|r " .. msg)
end

SLASH_AUTOBLOCKBOOST1 = "/abb"
SlashCmdList["AUTOBLOCKBOOST"] = function(msg)
    msg = msg:lower()
    if msg == "toggle" then
        AutoBlockBoostDB.enabled = not AutoBlockBoostDB.enabled
        Print((AutoBlockBoostDB.enabled and "|cff00ff00Enabled|r" or "|cffff0000Disabled|r"))
    elseif msg == "list" then
        Print("Blocked keywords: " .. table.concat(AutoBlockBoostDB.keywords, ", "))
    else
        Print("Usage: /abb toggle | list")
    end
end

local lastIgnore = {}

local function IsIgnored(playerName)
    for i = 1, C_FriendList.GetNumIgnores() do
        if C_FriendList.GetIgnoreName(i) == playerName then
            return true
        end
    end
    return false
end

local function SafeIgnore(sender)
    if AutoBlockBoostDB.silent then return end
    local now = time()
    if not lastIgnore[sender] or (now - lastIgnore[sender] > 30) then
        if not IsIgnored(sender) then
            C_FriendList.AddIgnore(sender)
            lastIgnore[sender] = now
        end
    end
end

local function ChatFilter(self, event, msg, sender, ...)
    if not AutoBlockBoostDB.enabled then return false end
    for _, word in ipairs(AutoBlockBoostDB.keywords) do
        if msg:lower():find(word:lower()) then
            SafeIgnore(sender)
            return true
        end
    end
    return false
end

for _, e in ipairs({ "CHAT_MSG_CHANNEL", "CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_WHISPER" }) do
    ChatFrame_AddMessageEventFilter(e, ChatFilter)
end

-- On login message
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    Print(L["DISABLE_CMD"])
end)
