---
--- @module RetroSettings
--- @description Module for RetroFlow to handle applications settings
---
--- @field CATEGORIES any All settings located in the Categories menu
--- @field THEME any All settings located in the Theme menu
--- @field AUDIO any All settings located in the Audio menu
--- @field ARTWORK any All settings located in the Artwork menu
--- @field SCAN any All settings located in the Scan Settings menu
--- @field OTHER any All settings located in the Other Settings menu
---
local RetroSettings =
{
    -- TODO: Chosen Language is located in RetroText module for now

    CATEGORIES =
    {
        startupCategory              = {}, 
        enableHomebrewCategory       = true,
        enableRecentlyPlayedCategory = true,
        enableDisplayAllCategory     = true,
        showHiddenGames              = false,
        showCollections              = true
    },
    
    THEME =
    {
        themeColor             = {},
        enableReflectionEffet  = true,
        defaultBackgroundName  = "",
        enableSmoothScrolling  = true,
        enable2dView           = true,
        enableChangeViews      = true
    },
    
    AUDIO =
    {
        enableSounds = true,
        enableMusic = true,
        shuffleMusic = true,
        enableCustomMusic = true -- TODO: new feature to implement, permit to set and use custom music for each game when hovering
    },
    
    ARTWORK =
    {
        enableDownloadCover = {},
        enableDownloadBackground = {},
        enableGameDetailsBackground = true,
        enableCustomBackground = true, -- TODO: new feature to implement, use game background even if not in Details menu
    },
    
    SCAN =
    {
        gameDirectories = nil,
        enableStartupScan = false,
        adrenalineGamesToScanFolder = ""
    },
    
    OTHER =
    {
        enableSwapXandO = false, -- Base setting is X to confirm
        adrenalinePsButtonBehaviour = {},
        enableShowMissingCovers = true,
        
        customCollections = {}
    }
}

local RetroConst = require("modules/common/RetroConst")

RetroSettings.gameDirectories = RetroConst:getDefaultRomsPaths()

return RetroSettings