-- localization.lua

AutoBlockBoost_L = AutoBlockBoost_L or {}

-- English
AutoBlockBoost_L["LOADED"] = "Loaded and active"
AutoBlockBoost_L["ENABLED"] = "AutoBlockBoost enabled"
AutoBlockBoost_L["DISABLED"] = "AutoBlockBoost disabled"
AutoBlockBoost_L["IGNORED"] = "Player %s ignored (matched: %s)"
AutoBlockBoost_L["Enable AutoBlockBoost"] = "Enable AutoBlockBoost"
AutoBlockBoost_L["Print alerts in chat"] = "Print alerts in chat"
AutoBlockBoost_L["EDITBOX_HELP"] = "Enter keywords to block (one per line). Default list is already included."
AutoBlockBoost_L["TIP_TOGGLE"] = "Tip: use /abb toggle in chat to enable/disable the addon."

-- French
if GetLocale() == "frFR" then
    AutoBlockBoost_L["LOADED"] = "Chargé et actif"
    AutoBlockBoost_L["ENABLED"] = "AutoBlockBoost activé"
    AutoBlockBoost_L["DISABLED"] = "AutoBlockBoost désactivé"
    AutoBlockBoost_L["IGNORED"] = "Joueur %s ignoré (mot détecté : %s)"
    AutoBlockBoost_L["Enable AutoBlockBoost"] = "Activer AutoBlockBoost"
    AutoBlockBoost_L["Print alerts in chat"] = "Afficher les alertes dans le chat"
    AutoBlockBoost_L["EDITBOX_HELP"] = "Entrez les mots à bloquer (un par ligne). La liste par défaut est déjà incluse."
    AutoBlockBoost_L["TIP_TOGGLE"] = "Astuce : utilisez /abb toggle pour activer/désactiver l'addon."
end

-- German
if GetLocale() == "deDE" then
    AutoBlockBoost_L["LOADED"] = "Geladen und aktiv"
    AutoBlockBoost_L["ENABLED"] = "AutoBlockBoost aktiviert"
    AutoBlockBoost_L["DISABLED"] = "AutoBlockBoost deaktiviert"
    AutoBlockBoost_L["IGNORED"] = "Spieler %s ignoriert (gefunden: %s)"
    AutoBlockBoost_L["Enable AutoBlockBoost"] = "AutoBlockBoost aktivieren"
    AutoBlockBoost_L["Print alerts in chat"] = "Warnungen im Chat anzeigen"
    AutoBlockBoost_L["EDITBOX_HELP"] = "Geben Sie Schlüsselwörter ein, die blockiert werden sollen (eine pro Zeile). Standardliste ist bereits enthalten."
    AutoBlockBoost_L["TIP_TOGGLE"] = "Tipp: Mit /abb toggle das Addon aktivieren/deaktivieren."
end

-- Italian
if GetLocale() == "itIT" then
    AutoBlockBoost_L["LOADED"] = "Caricato e attivo"
    AutoBlockBoost_L["ENABLED"] = "AutoBlockBoost abilitato"
    AutoBlockBoost_L["DISABLED"] = "AutoBlockBoost disabilitato"
    AutoBlockBoost_L["IGNORED"] = "Giocatore %s ignorato (trovato: %s)"
    AutoBlockBoost_L["Enable AutoBlockBoost"] = "Abilita AutoBlockBoost"
    AutoBlockBoost_L["Print alerts in chat"] = "Mostra avvisi in chat"
    AutoBlockBoost_L["EDITBOX_HELP"] = "Inserisci le parole da bloccare (una per riga). La lista predefinita è già inclusa."
    AutoBlockBoost_L["TIP_TOGGLE"] = "Suggerimento: usa /abb toggle per abilitare/disabilitare l'addon."
end
