---
--- @module RetroText
--- @description Module for RetroFlow to handle Text-related stuff (Fonts, Localization/Traduction)
---
--- @field getLoadedFontName function TEMP Public Static. Get current laoded Font Name
--- @field getLoadedLangLines function TEMP Public Static. Get current loaded Lang Lines
---
--- @field getLanguageId function Public Self. Get current chosen Language ID
--- @field changeTextForLanguageId function Public Self. Change language for new Language ID. Loads Language and associated Font
---
--- @field getTextForLocalizedString function Public Static. Retrieve the Text to be displayed from its Localized String
---
--- @field chosenLanguageId number Language ID of the chosen Language
---
---
local RetroText =
{
    chosenLanguageId = 0,
}

local CONSTANTS = require("modules/text/RetroText_Const")
local RetroFont = require("modules/text/RetroFont")
local RetroLoca = require("modules/text/RetroLoca")

---
--- @function Get Loaded Font Name
--- @return string Current Loaded Font Name 
---
function RetroText.getLoadedFontName()
    return RetroFont.loadedFontName
end

---
--- @function Get Loaded Lang Lines
--- @return any Current Lang Lines 
---
function RetroText.getLoadedLangLines()
    return RetroLoca.langLines
end

---
--- @function Get Language Id
--- @return number Current Language ID 
---
function RetroText:getLanguageId()
    return self.chosenLanguageId
end

---
--- @function Load Language With ID
--- @description Load the lines and font for a language ID
--- @param _languageId number Language ID from which we want to load the Localization
---
function RetroText:changeTextForLanguageId(_languageId)
    local langFile = CONSTANTS.getLangFileFromId(_languageId)
    local fontName = CONSTANTS.getFontForLangId(_languageId)

    RetroFont:changeFont(fontName)
    RetroLoca:loadLocalizationFromFile(langFile)
    
    self.chosenLanguageId = _languageId
end

---
--- @function Get Text for Localized String
--- @description Get the Localized Text from a Localizable String
--- @param _localizedString string Localized String of the Text we want to retrieve
--- @return string Localized String
---
function RetroText.getTextForLocalizedString(_localizedString)
    return RetroLoca:getLocaTextFromStr(_localizedString)
end

-- ON FILE LOAD
RetroText.chosenLanguageId = CONSTANTS.getDefaultLanguageId()

return RetroText
