local _, ns = ...
ns.L = {}

local L = ns.L

-- Default EN
L["TITLE"]       = "AutoBlockBoost"
L["DESC"]        = "Automatically blocks and ignores boost spammers.\nAdd keywords (one per line) in the box below."
L["DISABLE_CMD"] = "Type /abb toggle to enable/disable AutoBlockBoost."
L["ENABLE"]      = "Enable addon"
L["SILENT"]      = "Ignore silently (do not add players to ignore list)"
L["SAVE"]        = "Save"
L["CREATOR"]     = "Creator"
L["LINK"]        = "Link"

-- FR
if GetLocale() == "frFR" then
    L["TITLE"]       = "AutoBlockBoost"
    L["DESC"]        = "Bloque automatiquement les spammeurs de boost.\nAjoutez des mots-clés (un par ligne) dans la boîte ci-dessous."
    L["DISABLE_CMD"] = "Tapez /abb toggle pour activer/désactiver AutoBlockBoost."
    L["ENABLE"]      = "Activer l'addon"
    L["SILENT"]      = "Ignorer silencieusement (ne pas ajouter les joueurs à la liste d'ignorés)"
    L["SAVE"]        = "Enregistrer"
    L["CREATOR"]     = "Créateur"
    L["LINK"]        = "Lien"
end

-- DE
if GetLocale() == "deDE" then
    L["TITLE"]       = "AutoBlockBoost"
    L["DESC"]        = "Blockiert automatisch Boost-Spammer.\nFügen Sie unten Schlüsselwörter hinzu (ein Wort pro Zeile)."
    L["DISABLE_CMD"] = "Geben Sie /abb toggle ein, um AutoBlockBoost zu aktivieren/deaktivieren."
    L["ENABLE"]      = "Addon aktivieren"
    L["SILENT"]      = "Stumm schalten (Spieler nicht auf Ignorierliste setzen)"
    L["SAVE"]        = "Speichern"
    L["CREATOR"]     = "Ersteller"
    L["LINK"]        = "Link"
end

-- IT
if GetLocale() == "itIT" then
    L["TITLE"]       = "AutoBlockBoost"
    L["DESC"]        = "Blocca automaticamente gli spammer di boost.\nAggiungi parole chiave (una per riga) nella casella qui sotto."
    L["DISABLE_CMD"] = "Digita /abb toggle per abilitare/disabilitare AutoBlockBoost."
    L["ENABLE"]      = "Abilita addon"
    L["SILENT"]      = "Ignora silenziosamente (non aggiungere i giocatori alla lista ignorati)"
    L["SAVE"]        = "Salva"
    L["CREATOR"]     = "Creatore"
    L["LINK"]        = "Link"
end
