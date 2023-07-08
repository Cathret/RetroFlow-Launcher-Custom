---
--- @module RetroConst
--- @description Submodule for all RetroFlow modules to handle const and common information
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

local INVARIABLE_CONSTANTS =
{
    AppDirectory  = "app0:", -- Equivalent to "ux0:/app/RETROFLOW/"
    DataDirectory = "ux0:/data/RetroFlow/",
    AppVersion    = "0.2"
}

RetroConst.RomsMainDir = INVARIABLE_CONSTANTS.DataDirectory .. "ROMS/"
RetroConst.CoversDir = INVARIABLE_CONSTANTS.DataDirectory .. "COVERS/"
RetroConst.BackgroundsDir = INVARIABLE_CONSTANTS.DataDirectory .. "BACKGROUNDS/"
RetroConst.IconsDir = INVARIABLE_CONSTANTS.DataDirectory .. "ICONS/"

-- We retrieve only relative path, so we need to add DataDirectory to values
RetroConst.ConsoleFolderNames = require("modules/common/const/RetroConst_RomFolders.lua")

return RetroConst
