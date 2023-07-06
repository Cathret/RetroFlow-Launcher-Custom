---
--- @module RetroLoca
--- @description Submodule for RetroText to handle Localization-related stuff
---
--- @field loadLocalizationFromFile function Public Self. Load Localization from File
---
--- @field langLines any Map<string, string> All the localization lines currently set
---
local RetroLoca =
{
    langLines = {}
}

local CONSTANTS = require("modules/text/RetroText_Const")

---
--- @class LOCA_CONSTANTS
--- @description Contains all the const information for Localization
---
--- @field TRANSLATION_DIR string Folder containing the Localization/Translation files
---
local LOCA_CONSTANTS =
{
    TRANSLATION_DIR = "app0:/translations/"
}

---
--- @function Get Loca Text from Str
--- @description Get the Localized Text from a Localizable String
--- @param _locaStr string Localized String of the Text we want to retrieve
--- @return string Localized String
---
function RetroLoca:getLocaTextFromStr(_locaStr)
    local localizedString = self.langLines[_locaStr]

    -- If can't find in current loaded language, fallback on Default Text
    if localizedString == nil then
        localizedString = CONSTANTS.getDefaultLangLines()[_locaStr]
    end
    
    return localizedString
end

---
--- @function Load Localization From File
--- @description Load the lang lines from a file
--- @param _langFilename string Filename of the translation file to load
---
function RetroLoca:loadLocalizationFromFile(_langFilename)
    local langFilePath = LOCA_CONSTANTS.TRANSLATION_DIR .. _langFilename
    if System.doesFileExist(langFilePath) then
        self.langLines = dofile(langFilePath)
    else
        self.langLines = CONSTANTS.getDefaultLangLines()
    end
end

-- ON FILE LOAD
RetroLoca.langLines = CONSTANTS.getDefaultLangLines()

return RetroLoca
