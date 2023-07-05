---
--- RetroLoca
--- Module for RetroFlow to handle Localization and Traduction
---

local RetroLoca = { chosenLanguageId = 0 }

local LANGUAGE_IDS =
{
    ENGLISH_UK     = 0,  -- English (United Kingdom)
    ENGLISH_US     = 1,  -- English (United States)
    GERMAN         = 2,  -- German
    FRENCH         = 3,  -- French
    ITALIAN        = 4,  -- Italian
    SPANISH        = 5,  -- Spanish
    SPANISH_LATIN  = 5,  -- Spanish (Latin America)
    PORTUGUESE     = 6,  -- Portuguese (Portugal)
    SWEDISH        = 7,  -- Swedish
    RUSSIAN        = 8,  -- Russian
    JAPANESE       = 9,  -- Japanese
    CHINESE_TRADI  = 10, -- Chinese (Traditional)
    POLSKI         = 11, -- Polski
    DUTCH          = 12, -- Dutch
    DANISH         = 13, -- Danish
    NORWEGIAN      = 14, -- Norwegian
    FINNISH        = 15, -- Finnish
    TURKISH        = 16, -- Turkish
    KOREAN         = 17, -- Korean
    CHINESE        = 18, -- Chinese (Simplified)
    PORTUGUESE_BRA = 21, -- Portuguese (Brasil)
}

function RetroLoca:getLanguageId()
    return self.chosenLanguageId
end

function RetroLoca:setLanguageId(_newChosenLanguageId)
    self.chosenLanguageId = _newChosenLanguageId
end

function RetroLoca:initLanguageFromVita()
    -- Get language number from Vita OS and to translation file number
    local vitaLanguage = System.getLanguage()
    
    if     vitaLanguage == 0  then self.chosenLanguageId = LANGUAGE_IDS.JAPANESE
    elseif vitaLanguage == 1  then self.chosenLanguageId = LANGUAGE_IDS.ENGLISH_US
    elseif vitaLanguage == 2  then self.chosenLanguageId = LANGUAGE_IDS.FRENCH
    elseif vitaLanguage == 3  then self.chosenLanguageId = LANGUAGE_IDS.SPANISH
    elseif vitaLanguage == 4  then self.chosenLanguageId = LANGUAGE_IDS.GERMAN
    elseif vitaLanguage == 5  then self.chosenLanguageId = LANGUAGE_IDS.ITALIAN
    elseif vitaLanguage == 6  then self.chosenLanguageId = LANGUAGE_IDS.DUTCH
    elseif vitaLanguage == 7  then self.chosenLanguageId = LANGUAGE_IDS.PORTUGUESE
    elseif vitaLanguage == 8  then self.chosenLanguageId = LANGUAGE_IDS.RUSSIAN
    elseif vitaLanguage == 9  then self.chosenLanguageId = LANGUAGE_IDS.KOREAN
    elseif vitaLanguage == 10 then self.chosenLanguageId = LANGUAGE_IDS.CHINESE_TRADI
    elseif vitaLanguage == 11 then self.chosenLanguageId = LANGUAGE_IDS.CHINESE
    elseif vitaLanguage == 12 then self.chosenLanguageId = LANGUAGE_IDS.FINNISH
    elseif vitaLanguage == 13 then self.chosenLanguageId = LANGUAGE_IDS.SWEDISH
    elseif vitaLanguage == 14 then self.chosenLanguageId = LANGUAGE_IDS.DANISH
    elseif vitaLanguage == 15 then self.chosenLanguageId = LANGUAGE_IDS.ENGLISH_UK
    elseif vitaLanguage == 16 then self.chosenLanguageId = LANGUAGE_IDS.NORWEGIAN
    elseif vitaLanguage == 17 then self.chosenLanguageId = LANGUAGE_IDS.POLSKI
    elseif vitaLanguage == 18 then self.chosenLanguageId = LANGUAGE_IDS.PORTUGUESE_BRA
    elseif vitaLanguage == 19 then self.chosenLanguageId = LANGUAGE_IDS.TURKISH
    elseif vitaLanguage == 20 then self.chosenLanguageId = LANGUAGE_IDS.SPANISH_LATIN
    else                           self.chosenLanguageId = LANGUAGE_IDS.ENGLISH_UK
    end
    
end

return RetroLoca
