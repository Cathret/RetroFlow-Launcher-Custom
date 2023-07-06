﻿---
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
--- @field getSmallTextWidth function Public Static. Get the Width of some Small-sized Text from its Localized String
--- @field getMediumTextWidth function Public Static. Get the Width of some Medium-sized Text from its Localized String
--- @field getLargeTextWidth function Public Static. Get the Width of some Large-sized Text from its Localized String
--- @field getSmallNonLocaTextWidth function Public Static. Get the Width of some Small-sized String
--- @field getMediumNonLocaTextWidth function Public Static. Get the Width of some Medium-sized String
--- @field getLargeNonLocaTextWidth function Public Static. Get the Width of some Large-sized String
--- @field printSmall function Public Static. Print some small-sized Text to the screen from its Localized String
--- @field printMedium function Public Static. Print some medium-sized Text to the screen from its Localized String
--- @field printLarge function Public Static. Print some large-sized Text to the screen from its Localized String
--- @field printNonLocaSmall function Public Static. Print some small-sized String to the screen
--- @field printNonLocaMedium function Public Static. Print some medium-sized String to the screen
--- @field printNonLocaLarge function Public Static. Print some large-sized String to the screen
---
--- @field _getTextWidth function Private Static. Get the Width of some Text from its Localized String
--- @field _getNonLocalizedTextWidth function Private Static. Get the Width of some String
--- @field _print function Private Static. Print some Text to the screen from its Localized String
--- @field _printNonLocalized function Private Static. Print some String to the screen
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

---
--- @function Get Small Text Width
--- @description Get the width of a Small-sized Localized String 
--- @param _localizedString string Localized String of the Text
--- @return number Width of the Localized Text
---
function RetroText.getSmallTextWidth(_localizedString)
    return RetroText._getTextWidth(RetroFont.fontIdSmall, _localizedString)
end

---
--- @function Get Medium Text Width
--- @description Get the width of a Medium-sized Localized String 
--- @param _localizedString string Localized String of the Text
--- @return number Width of the Localized Text
---
function RetroText.getMediumTextWidth(_localizedString)
    return RetroText._getTextWidth(RetroFont.fontIdMedium, _localizedString)
end

---
--- @function Get Large Text Width
--- @description Get the width of a Large-sized Localized String 
--- @param _localizedString string Localized String of the Text
--- @return number Width of the Localized Text
---
function RetroText.getLargeTextWidth(_localizedString)
    return RetroText._getTextWidth(RetroFont.fontIdLarge, _localizedString)
end

---
--- @function Get Small Non Loca Text Width
--- @description Get the width of a Small-sized Text 
--- @param _string string String we want to get the size of
--- @return number Width of the Localized Text
---
function RetroText.getSmallNonLocaTextWidth(_string)
    return RetroText._getNonLocalizedTextWidth(RetroFont.fontIdSmall, _string)
end

---
--- @function Get Medium Non Loca Text Width
--- @description Get the width of a Medium-sized Text 
--- @param _string string String we want to get the size of
--- @return number Width of the Localized Text
---
function RetroText.getMediumNonLocaTextWidth(_string)
    return RetroText._getNonLocalizedTextWidth(RetroFont.fontIdMedium, _string)
end

---
--- @function Get Large Non Loca Text Width
--- @description Get the width of a Large-sized Text 
--- @param _string string String we want to get the size of
--- @return number Width of the Localized Text
---
function RetroText.getLargeNonLocaTextWidth(_string)
    return RetroText._getNonLocalizedTextWidth(RetroFont.fontIdLarge, _string)
end

---
--- @function Print Small
--- @description Print a Small-sized Localized String on the screen 
--- @param _posX number PositionX of the printed text
--- @param _posY number PositionY of the printed text
--- @param _localizedString string Localized String of the Text we want to retrieve
--- @param _color number Color of the printed text
---
function RetroText.printSmall(_posX, _posY, _localizedString, _color)
    RetroText._print(RetroFont.fontIdSmall, _posX, _posY, _localizedString, _color)
end

---
--- @function Print Medium
--- @description Print a Medium-sized Localized String on the screen 
--- @param _posX number PositionX of the printed text
--- @param _posY number PositionY of the printed text
--- @param _localizedString string Localized String of the Text we want to retrieve
--- @param _color number Color of the printed text
---
function RetroText.printMedium(_posX, _posY, _localizedString, _color)
    RetroText._print(RetroFont.fontIdMedium, _posX, _posY, _localizedString, _color)
end

---
--- @function Print Large
--- @description Print a Large-sized Localized String on the screen 
--- @param _posX number PositionX of the printed text
--- @param _posY number PositionY of the printed text
--- @param _localizedString string Localized String of the Text we want to retrieve
--- @param _color number Color of the printed text
---
function RetroText.printLarge(_posX, _posY, _localizedString, _color)
    RetroText._print(RetroFont.fontIdLarge, _posX, _posY, _localizedString, _color)
end

---
--- @function Print NonLocalized Small
--- @description Print a Small-sized String on the screen 
--- @param _posX number PositionX of the printed text
--- @param _posY number PositionY of the printed text
--- @param _string string String to be printed
--- @param _color number Color of the printed text
---
function RetroText.printNonLocaSmall(_posX, _posY, _string, _color)
    RetroText._printNonLocalized(RetroFont.fontIdSmall, _posX, _posY, _string, _color)
end

---
--- @function Print NonLocalized Medium
--- @description Print a Medium-sized String on the screen 
--- @param _posX number PositionX of the printed text
--- @param _posY number PositionY of the printed text
--- @param _string string String to be printed
--- @param _color number Color of the printed text
---
function RetroText.printNonLocaMedium(_posX, _posY, _string, _color)
    RetroText._printNonLocalized(RetroFont.fontIdMedium, _posX, _posY, _string, _color)
end

---
--- @function Print NonLocalized Large
--- @description Print a Large-sized Localized String on the screen 
--- @param _posX number PositionX of the printed text
--- @param _posY number PositionY of the printed text
--- @param _string string String to be printed
--- @param _color number Color of the printed text
---
function RetroText.printNonLocaLarge(_posX, _posY, _string, _color)
    RetroText._printNonLocalized(RetroFont.fontIdLarge, _posX, _posY, _string, _color)
end

---
--- @function Get Text Width
--- @description Get the width of a Localized String with a specific Font 
--- @param _localizedString string Localized String of the Text
--- @return number Width of the Localized Text
---
function RetroText._getTextWidth(_fontId, _localizedString)
    return Font.getTextWidth(_fontId, RetroLoca:getLocaTextFromStr(_localizedString))
end

---
--- @function Get Text Width
--- @description Get the width of a Localized String with a specific Font 
--- @param _string string String we want to get the size of
--- @return number Width of the Localized Text
---
function RetroText._getNonLocalizedTextWidth(_fontId, _string)
    return Font.getTextWidth(_fontId, _string)
end

---
--- @function Print
--- @description Print a Localized String on the screen 
--- @param _fontId number ID of the Font to be used
--- @param _posX number PositionX of the printed text
--- @param _posY number PositionY of the printed text
--- @param _localizedString string Localized String of the Text we want to retrieve
--- @param _color number Color of the printed text
---
function RetroText._print(_fontId, _posX, _posY, _localizedString, _color)
    Font.print(_fontId, _posX, _posY, RetroLoca:getLocaTextFromStr(_localizedString), _color)
end

---
--- @function Print non-localized
--- @description Print the inputted string on the screen 
--- @param _fontId number ID of the Font to be used
--- @param _posX number PositionX of the printed text
--- @param _posY number PositionY of the printed text
--- @param _string string String containing the Text to display
--- @param _color number Color of the printed text
---
function RetroText._printNonLocalized(_fontId, _posX, _posY, _string, _color)
    Font.print(_fontId, _posX, _posY, _string, _color)
end

-- ON FILE LOAD
RetroText.chosenLanguageId = CONSTANTS.getDefaultLanguageId()

return RetroText
