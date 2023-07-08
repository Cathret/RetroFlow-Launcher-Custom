---
--- @module RetroConst
--- @description Submodule for all RetroFlow modules to handle const and common information
---
--- @field getDefaultRomsPaths function Public Self. Retrieve the Default Roms Paths for all the consoles
---
--- @field RomsMainDir string Path to the main ROMS directory
--- @field CoversDir string Path to the COVERS directory
--- @field BackgroundDir string Path to the BACKGROUND directory
--- @field IconsDir string Path to the ICONS directory
--- @field ConsoleFolderNames any Map<ConsoleKey, String> Name of all the Console folders
---
local RetroConst =
{
    RomsMainDir        = nil,
    CoversDir          = nil,
    BackgroundsDir     = nil,
    IconsDir           = nil,
    ConsoleFolderNames = nil,
}

---
--- @class INVARIABLE_CONSTANTS
--- @description Contains invariable values which are set directly in this file
---
local INVARIABLE_CONSTANTS =
{
    AppDirectory  = "app0:", -- Equivalent to "ux0:/app/RETROFLOW/"
    DataDirectory = "ux0:/data/RetroFlow/",
    AppVersion    = "0.2"
}

RetroConst.RomsMainDir    = INVARIABLE_CONSTANTS.DataDirectory .. "ROMS/"
RetroConst.CoversDir      = INVARIABLE_CONSTANTS.DataDirectory .. "COVERS/"
RetroConst.BackgroundsDir = INVARIABLE_CONSTANTS.DataDirectory .. "BACKGROUNDS/"
RetroConst.IconsDir       = INVARIABLE_CONSTANTS.DataDirectory .. "ICONS/"

RetroConst.ConsoleFolderNames = require("modules/common/const/RetroConst_ConsoleFolderNames")

---
--- @function Get Default Roms Paths
--- @description Retrieve the Default Roms Paths for all the consoles
--- @return any Map<ConsoleKey, String> Path of all the Default Console Folders 
---
function RetroConst:getDefaultRomsPaths()
    local defaultConsoleFolders = {}
    for key,value in pairs(self.ConsoleFolderNames) do
        defaultConsoleFolders[key] = self.RomsMainDir .. value -- Concatenate RomsMainDir and name of the Folders
    end
    return defaultConsoleFolders
end

return RetroConst
