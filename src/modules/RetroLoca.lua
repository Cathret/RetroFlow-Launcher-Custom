---
--- RetroLoca
--- Module for RetroFlow to handle Localization and Traduction
---

local CONSTANTS = require("modules/internal/RetroLoca_Const")

local RetroLoca = { chosenLanguageId = 0 }

function RetroLoca:getLanguageId()
    return self.chosenLanguageId
end

function RetroLoca:setLanguageId(_newChosenLanguageId)
    self.chosenLanguageId = _newChosenLanguageId
end

function RetroLoca:getDefaultLangLines()
    return CONSTANTS.LANG_DEFAULT
end

function RetroLoca:initLanguageFromVita()
    -- Get language number from Vita OS and to translation file number
    local vitaLanguage = System.getLanguage()
    
    if     vitaLanguage == 0  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.JAPANESE
    elseif vitaLanguage == 1  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.ENGLISH_US
    elseif vitaLanguage == 2  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.FRENCH
    elseif vitaLanguage == 3  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.SPANISH
    elseif vitaLanguage == 4  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.GERMAN
    elseif vitaLanguage == 5  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.ITALIAN
    elseif vitaLanguage == 6  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.DUTCH
    elseif vitaLanguage == 7  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.PORTUGUESE
    elseif vitaLanguage == 8  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.RUSSIAN
    elseif vitaLanguage == 9  then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.KOREAN
    elseif vitaLanguage == 10 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.CHINESE_TRADI
    elseif vitaLanguage == 11 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.CHINESE
    elseif vitaLanguage == 12 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.FINNISH
    elseif vitaLanguage == 13 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.SWEDISH
    elseif vitaLanguage == 14 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.DANISH
    elseif vitaLanguage == 15 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.ENGLISH_UK
    elseif vitaLanguage == 16 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.NORWEGIAN
    elseif vitaLanguage == 17 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.POLSKI
    elseif vitaLanguage == 18 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.PORTUGUESE_BRA
    elseif vitaLanguage == 19 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.TURKISH
    elseif vitaLanguage == 20 then self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.SPANISH_LATIN
    else                           self.chosenLanguageId = CONSTANTS.LANGUAGE_IDS.ENGLISH_UK
    end
    
end

return RetroLoca
