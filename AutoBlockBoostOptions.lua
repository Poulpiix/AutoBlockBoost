local _, ns = ...
local L = ns and ns.L or {}

-- Ensure SavedVariables
if not AutoBlockBoostDB then
    AutoBlockBoostDB = {
        enabled = true,
        silent  = false,
        keywords = { "boost", "carry", "wts", "mythic+", "curve", "gold only", "sale", "vip" },
    }
end

local panel = CreateFrame("Frame")
panel.name = "AutoBlockBoost"

local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText(L["TITLE"] or "AutoBlockBoost")

local desc = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
desc:SetWidth(520)
desc:SetJustifyH("LEFT")
desc:SetText((L["DESC"] or "Automatically blocks boost spam. Add keywords (one per line).")
             .. "\n\n" .. (L["DISABLE_CMD"] or "Type /abb toggle to enable/disable AutoBlockBoost."))

local enableCB = CreateFrame("CheckButton", nil, panel, "ChatConfigCheckButtonTemplate")
enableCB:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, -12)
enableCB.Text:SetText(L["ENABLE"] or "Enable addon")
enableCB:SetChecked(AutoBlockBoostDB.enabled)
enableCB:SetScript("OnClick", function(self)
    AutoBlockBoostDB.enabled = self:GetChecked()
end)

local silentCB = CreateFrame("CheckButton", nil, panel, "ChatConfigCheckButtonTemplate")
silentCB:SetPoint("TOPLEFT", enableCB, "BOTTOMLEFT", 0, -8)
silentCB.Text:SetText(L["SILENT"] or "Ignore silently")
silentCB:SetChecked(AutoBlockBoostDB.silent)
silentCB:SetScript("OnClick", function(self)
    AutoBlockBoostDB.silent = self:GetChecked()
end)

local scroll = CreateFrame("ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate")
scroll:SetPoint("TOPLEFT", silentCB, "BOTTOMLEFT", 0, -12)
scroll:SetSize(420, 200)

local boxBG = panel:CreateTexture(nil, "BACKGROUND")
boxBG:SetPoint("TOPLEFT", scroll, -6, 6)
boxBG:SetPoint("BOTTOMRIGHT", scroll, 26, -6)
boxBG:SetColorTexture(0, 0, 0, 0.25)

local editBox = CreateFrame("EditBox", nil, scroll)
editBox:SetMultiLine(true)
editBox:SetAutoFocus(false)
editBox:SetFontObject(ChatFontNormal)
editBox:SetWidth(400)
editBox:SetText(table.concat(AutoBlockBoostDB.keywords or {}, "\n"))
scroll:SetScrollChild(editBox)

local function SaveKeywords()
    local text = editBox:GetText() or ""
    local new, seen = {}, {}
    for line in string.gmatch(text, "([^\r\n]+)") do
        local w = (line:gsub("^%s+", ""):gsub("%s+$", "")):lower()
        if w ~= "" and not seen[w] then
            table.insert(new, w)
            seen[w] = true
        end
    end
    if #new == 0 then
        new = { "boost", "carry", "wts", "mythic+", "curve", "gold only", "sale", "vip" }
    end
    AutoBlockBoostDB.keywords = new
end

local saveBtn = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
saveBtn:SetPoint("TOPLEFT", scroll, "BOTTOMLEFT", 0, -10)
saveBtn:SetSize(120, 24)
saveBtn:SetText(L["SAVE"] or "Save")
saveBtn:SetScript("OnClick", function()
    SaveKeywords()
    editBox:ClearFocus()
end)

editBox:SetScript("OnEditFocusLost", SaveKeywords)
editBox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)

panel:SetScript("OnShow", function()
    enableCB:SetChecked(AutoBlockBoostDB.enabled)
    silentCB:SetChecked(AutoBlockBoostDB.silent)
    local list = AutoBlockBoostDB.keywords
    if not list or #list == 0 then
        list = { "boost", "carry", "wts", "mythic+", "curve", "gold only", "sale", "vip" }
    end
    editBox:SetText(table.concat(list, "\n"))
    saveBtn:SetText(L["SAVE"] or "Save")
end)

local creator = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
creator:SetPoint("BOTTOMLEFT", 16, 30)
creator:SetText((L["CREATOR"] or "Creator") .. ": Poulpix")

local link = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
link:SetPoint("BOTTOMLEFT", creator, "TOPLEFT", 0, 14)
link:SetText((L["LINK"] or "Link") .. ": twitch.tv/poulpi_x")

local category = Settings.RegisterCanvasLayoutCategory(panel, L["TITLE"] or "AutoBlockBoost")
Settings.RegisterAddOnCategory(category)
