---
--- @module RetroFont
--- @description Submodule for RetroText to handle Font-related stuff
---
--- @field changeFont function Public Self. Load Font from FontName and manage old Font's unload
---
--- @field _loadFont function Private Self. Loads Font from FontName
---
--- @field fontIdSmall number Font ID of the small font
--- @field fontIdMedium number Font ID of the medium font
--- @field fontIdLarge number Font ID of the large font
--- @field loadedFontName string Font currently loaded
---
local RetroFont =
{
    fontIdSmall  = 0,
    fontIdMedium = 0,
    fontIdLarge  = 0,

    loadedFontName = ""
}

local CONSTANTS = require("modules/text/RetroText_Const")

---
--- @class FONT_CONSTANTS
--- @description Contains all the const information for Fonts
---
--- @field FONT_DIR string Folder containing the Font files
--- @field FONT_SMALL_SIZE number Size of the Small Font
--- @field FONT_MEDIUM_SIZE number Size of the Medium Font
--- @field FONT_LARGE_SIZE number Size of the Large Font
---
local FONT_CONSTANTS =
{
    FONT_DIR = "app0:/DATA/",
    
    FONT_SMALL_SIZE  = 20,
    FONT_MEDIUM_SIZE = 22,
    FONT_LARGE_SIZE  = 25
}

---
--- @function Change Font
--- @description Load the Font into the three different sized Fonts and Unload old Font
--- @param _newFontName string Name of the Font to be loaded
---
function RetroFont:changeFont(_newFontName)
    if self.loadedFontName ~= _newFontName then
        -- Keep old FontIds for unloading once new Font is loaded
        local oldFontSmall = self.fontIdSmall
        local oldFontMedium = self.fontIdMedium
        local oldFontLarge = self.fontIdLarge

        self:_loadFont(_newFontName)

        -- TODO: Find a way to unload Font correctly without crashing
        -- Unload old font if some is already loaded
        -- Font.unload(oldFontSmall)
        -- Font.unload(oldFontMedium)
        -- Font.unload(oldFontLarge)
    end
end

---
--- @function Load Font
--- @description Load the Font into the three different sized Fonts
--- @param _newFontName string Name of the Font to be loaded
---
function RetroFont:_loadFont(_newFontName)
    -- Load fonts
    self.fontIdSmall = Font.load(FONT_CONSTANTS.FONT_DIR .. _newFontName)
    self.fontIdMedium = Font.load(FONT_CONSTANTS.FONT_DIR .. _newFontName)
    self.fontIdLarge = Font.load(FONT_CONSTANTS.FONT_DIR .. _newFontName)

    -- Set fonts size
    Font.setPixelSizes(self.fontIdSmall, FONT_CONSTANTS.FONT_SMALL_SIZE)
    Font.setPixelSizes(self.fontIdMedium, FONT_CONSTANTS.FONT_MEDIUM_SIZE)
    Font.setPixelSizes(self.fontIdLarge, FONT_CONSTANTS.FONT_LARGE_SIZE)

    -- Cache loaded font name
    self.loadedFontName = _newFontName
end

-- ON FILE LOAD
RetroFont:_loadFont(CONSTANTS.getDefaultFont())

return RetroFont