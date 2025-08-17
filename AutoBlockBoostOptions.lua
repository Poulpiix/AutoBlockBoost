-- AutoBlockBoostOptions.lua
local ADDON_NAME, ns = ...
local L = function(key) return AutoBlockBoost_L[key] or key end

local panel = CreateFrame("Frame")
panel.name = ADDON_NAME

-- Enable checkbox
local enableCheck = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate")
enableCheck:SetPoint("TOPLEFT", 16, -16)
enableCheck.Text:SetText(L("Enable AutoBlockBoost"))

-- Alert checkbox
local alertCheck = CreateFrame("CheckButton", nil, panel, "InterfaceOptionsCheckButtonTemplate")
alertCheck:SetPoint("TOPLEFT", enableCheck, "BOTTOMLEFT", 0, -8)
alertCheck.Text:SetText(L("Print alerts in chat"))

-- Help text
local helpText = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
helpText:SetPoint("TOPLEFT", alertCheck, "BOTTOMLEFT", 0, -8)
helpText:SetText(L("EDITBOX_HELP"))

-- Keywords EditBox
local editBox = CreateFrame("EditBox", nil, panel, "InputBoxTemplate")
editBox:SetPoint("TOPLEFT", helpText, "BOTTOMLEFT", 0, -4)
editBox:SetSize(300, 100)
editBox:SetMultiLine(true)
editBox:SetAutoFocus(false)
editBox:SetFontObject(ChatFontNormal)

editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
editBox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
editBox:SetScript("OnEditFocusLost", function(self)
    local text = self:GetText()
    AutoBlockBoostDB.keywords = {}
    for word in string.gmatch(text, "[^\n]+") do
        table.insert(AutoBlockBoostDB.keywords, word:lower())
    end
end)

-- Tip text
local tipText = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
tipText:SetPoint("TOPLEFT", editBox, "BOTTOMLEFT", 0, -8)
tipText:SetText(L("TIP_TOGGLE"))

-- Default values
panel.default = function()
    AutoBlockBoostDB.enabled = true
    AutoBlockBoostDB.printAlerts = true
    AutoBlockBoostDB.keywords = { "boost", "carry", "wts", "mythic+", "curve", "gold only", "sale", "vip" }
end

-- Refresh panel
panel.refresh = function()
    enableCheck:SetChecked(AutoBlockBoostDB.enabled)
    alertCheck:SetChecked(AutoBlockBoostDB.printAlerts)
    if AutoBlockBoostDB.keywords and #AutoBlockBoostDB.keywords > 0 then
        editBox:SetText(table.concat(AutoBlockBoostDB.keywords, "\n"))
    else
        editBox:SetText(table.concat({ "boost", "carry", "wts", "mythic+", "curve", "gold only", "sale", "vip" }, "\n"))
    end
end

-- Apply
enableCheck:SetScript("OnClick", function(self)
    AutoBlockBoostDB.enabled = self:GetChecked()
end)

alertCheck:SetScript("OnClick", function(self)
    AutoBlockBoostDB.printAlerts = self:GetChecked()
end)

-- Register panel
local category = Settings.RegisterCanvasLayoutCategory(panel, ADDON_NAME)
category.ID = ADDON_NAME
Settings.RegisterAddOnCategory(category)