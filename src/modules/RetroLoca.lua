---
--- @module RetroLoca
--- @description Module for RetroFlow to handle Localization and Traduction
---
--- @field getLanguageId function Public Self. Get current chosen Language ID
--- @field loadLanguageWithId function Public Self. Change language for new Language ID
---
--- @field _loadFont function Private Self. Load Font from FontName
--- @field _loadLanguageFromFile function Private Self. Load Language Lines from Loca Filename
---
--- @field getFontForLangId function Public Static. TEMPORARY. Get associated FontName from Language ID
--- @field getLanguageFromVita function Public Static. Get Language ID based on Vita's Language
---
--- @field chosenLanguageId number Language ID of the chosen Language
--- @field fontIdSmall number Font ID of the small font
--- @field fontIdMedium number Font ID of the medium font
--- @field fontIdLarge number Font ID of the large font
--- @field loadedFontName string Font currently loaded
--- @field langLines any Map<string, string> All the localization currently set
---

local CONSTANTS = require("modules/internal/RetroLoca_Const")

local TRANSLATION_DIR = "app0:/translations/"
local FONT_DIR = "app0:/DATA/"
local FONT_SMALL_SIZE = 20
local FONT_MEDIUM_SIZE = 22
local FONT_LARGE_SIZE = 25

local RetroLoca =
{
    chosenLanguageId = 0,
    
    fontIdSmall  = 0,
    fontIdMedium = 0,
    fontIdLarge  = 0,
    
    loadedFontName = CONSTANTS.FONTS.DEFAULT,
    langLines = CONSTANTS.LANG_DEFAULT
}

---
--- @function Get Language Id
--- @return number Current Language ID 
---
function RetroLoca:getLanguageId()
    return self.chosenLanguageId
end

---
--- @function Get Font for Language ID
--- @description Retrieve the Font name of the file associated with a Language ID
--- @param _languageId number Language ID from which we want to retrieve the Fontname
---
function RetroLoca.getFontForLangId(_languageId)
    return CONSTANTS.getFontForLangId(_languageId)
end

---
--- @function Load Language With ID
--- @description Load the lines and font for a language ID
--- @param _languageId number Language ID from which we want to load the Localization
---
function RetroLoca:loadLanguageWithId(_languageId)
    local langFile = CONSTANTS.getLangFileFromId(_languageId)
    local fontName = CONSTANTS.getFontForLangId(_languageId)

    self:_loadLanguageFromFile(langFile)
    self:_loadFont(fontName)
end

---
--- @function Load Font
--- @description Load the Font into the three different sized Fonts
--- @param _newFontName string Name of the Font to be loaded
---
function RetroLoca:_loadFont(_newFontName)
    if self.loadedFontName ~= _newFontName then
        -- Unload old font if some is already loaded -> TODO: why does this cause Crash?
        -- if not (self.loadedFontName == nil or self.loadedFontName == "") then
        --     Font.unload(self.fontIdSmall)
        --     Font.unload(self.fontIdMedium)
        --     Font.unload(self.fontIdLarge)
        -- end

        -- Load fonts
        self.fontIdSmall = Font.load(FONT_DIR .. _newFontName)
        self.fontIdMedium = Font.load(FONT_DIR .. _newFontName)
        self.fontIdLarge = Font.load(FONT_DIR .. _newFontName)

        -- Set fonts size
        Font.setPixelSizes(self.fontIdSmall, FONT_SMALL_SIZE)
        Font.setPixelSizes(self.fontIdMedium, FONT_MEDIUM_SIZE)
        Font.setPixelSizes(self.fontIdLarge, FONT_LARGE_SIZE)

        -- Cache loaded font name
        self.loadedFontName = _newFontName
    end
end

---
--- @function Load Language From File
--- @description Load the lang lines from a file
--- @param _langFilename string Filename of the translation file to load
---
function RetroLoca:_loadLanguageFromFile(_langFilename)
    if System.doesFileExist(TRANSLATION_DIR .. _langFilename) then
        langFilePath = TRANSLATION_DIR .. _langFilename
        self.langLines = dofile(langFilePath)
    else
        self.langLines = CONSTANTS.LANG_DEFAULT
    end
end

---
--- @function Get Language from Vita
--- @description Retrieve Retro Language ID from the Vita system's language
--- @return number Language ID
---
function RetroLoca.getLanguageFromVita()
    local vitaLanguage = System.getLanguage()
    local chosenLanguage = CONSTANTS.LANGUAGE_IDS.DEFAULT
    
    if     vitaLanguage == 0  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.JAPANESE
    elseif vitaLanguage == 1  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.ENGLISH_US
    elseif vitaLanguage == 2  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.FRENCH
    elseif vitaLanguage == 3  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.SPANISH
    elseif vitaLanguage == 4  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.GERMAN
    elseif vitaLanguage == 5  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.ITALIAN
    elseif vitaLanguage == 6  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.DUTCH
    elseif vitaLanguage == 7  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.PORTUGUESE
    elseif vitaLanguage == 8  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.RUSSIAN
    elseif vitaLanguage == 9  then chosenLanguage = CONSTANTS.LANGUAGE_IDS.KOREAN
    elseif vitaLanguage == 10 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.CHINESE_TRADI
    elseif vitaLanguage == 11 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.CHINESE
    elseif vitaLanguage == 12 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.FINNISH
    elseif vitaLanguage == 13 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.SWEDISH
    elseif vitaLanguage == 14 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.DANISH
    elseif vitaLanguage == 15 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.ENGLISH_UK
    elseif vitaLanguage == 16 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.NORWEGIAN
    elseif vitaLanguage == 17 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.POLSKI
    elseif vitaLanguage == 18 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.PORTUGUESE_BRA
    elseif vitaLanguage == 19 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.TURKISH
    elseif vitaLanguage == 20 then chosenLanguage = CONSTANTS.LANGUAGE_IDS.SPANISH_LATIN
    end
    
    return chosenLanguage
end

return RetroLoca
