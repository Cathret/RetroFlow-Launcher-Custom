---
--- @module RetroConst
--- @description Submodule for all RetroFlow modules to handle const and common information
---
--- @field getDefaultRomsPaths function Public Self. Retrieve the Default Roms Paths for all the consoles
---
--- @field getAppVersion function Public Static. Get the current version of the Application
---
--- @field CONSOLE_KEYS any Every key as number for each console
--- @field RomsMainDir string Path to the main ROMS directory
--- @field CoversDir string Path to the COVERS directory
--- @field BackgroundsDir string Path to the BACKGROUND directory
--- @field IconsDir string Path to the ICONS directory
--- @field WallpapersDir string Path to the WALLPAPER directory
--- @field MusicDir string Path to the MUSIC directory
--- @field UserDatabaseDir string Path to the TITLES directory
--- @field DatabaseDir string Path to the DATABASES directory
--- @field ConsoleFolderNames any Map<ConsoleKey, String> Name of all the Console folders
---
local RetroConst =
{
    CONSOLE_KEYS       = require("modules/common/const/RetroConst_ConsoleKeys"),
    
    RomsMainDir        = nil, -- Contains list of game Roms
    CoversDir          = nil, -- Contains list of game Covers
    BackgroundsDir     = nil, -- Contains list of game Backgrounds
    IconsDir           = nil, -- Contains list of ?
    WallpapersDir      = nil, -- Contains list of application Wallpapers
    MusicDir           = nil, -- Contains list of application music (TODO: for now)
    UserDatabaseDir    = nil, -- Contains list of ?Titles? TODO
    DatabaseDir        = nil, -- Contains list of ? TODO
    ConsoleFolderNames = nil, -- Contains list of all the directories name for each console
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

RetroConst.RomsMainDir     = INVARIABLE_CONSTANTS.DataDirectory .. "ROMS/"
RetroConst.CoversDir       = INVARIABLE_CONSTANTS.DataDirectory .. "COVERS/"
RetroConst.BackgroundsDir  = INVARIABLE_CONSTANTS.DataDirectory .. "BACKGROUNDS/"
RetroConst.IconsDir        = INVARIABLE_CONSTANTS.DataDirectory .. "ICONS/"
RetroConst.WallpapersDir   = INVARIABLE_CONSTANTS.DataDirectory .. "WALLPAPER/"
RetroConst.MusicDir        = INVARIABLE_CONSTANTS.DataDirectory .. "MUSIC/"
RetroConst.UserDatabaseDir = INVARIABLE_CONSTANTS.DataDirectory .. "TITLES/"
RetroConst.DatabaseDir     = INVARIABLE_CONSTANTS.DataDirectory .. "DATABASES/"

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

---
--- @function Get Application Version
--- @return string The current version of the Application
---
function RetroConst.getAppVersion()
    return INVARIABLE_CONSTANTS.AppVersion
end

return RetroConst
