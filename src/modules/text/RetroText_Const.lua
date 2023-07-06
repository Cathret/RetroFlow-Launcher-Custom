---
--- @module RetroText_Const
--- @description Contains const information to be used by RetroLoca Module
---
--- @field getDefaultLanguageId function Public Static. Get Default Language ID
--- @field getDefaultFont function Public Static. Get Default Font Name
--- @field getDefaultLangLines function Public Static. Get Default Localization Lines
--- @field getLangFileFromId function Public Static. Get Language Filename From Language ID
--- @field getFontForLangId function Public Static. Get Font Name From Language ID
--- @field getLanguageFromVita function Public Static. Get Language ID from Vita Language
---
local RetroText_Const = {}

---
--- @class TEXT_CONSTANTS
--- @description Contains all the const information for Text
---
--- @field LANGUAGE_IDS any List<number> All the IDs for each supported language
--- @field LANG_FILE any List<string> All the file names for each supported language
--- @field FONTS any List<string> All the fonts used for default or specific languages
--- @field LANG_DEFAULT any Map<string, string> All the default localization for each localized string
---
local TEXT_CONSTANTS =
{
    LANGUAGE_IDS =
    {
        ENGLISH_UK     = 0,  -- English (United Kingdom)
        ENGLISH_US     = 1,  -- English (United States)
        GERMAN         = 2,  -- German
        FRENCH         = 3,  -- French
        ITALIAN        = 4,  -- Italian
        SPANISH        = 5,  -- Spanish
        SPANISH_LATIN  = 5,  -- Spanish (Latin America) (= SPANISH)
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
        JAPANESE_RYU   = 19, -- Japanese (Ryu)
        HUNGARIAN      = 20, -- Hungarian
        PORTUGUESE_BRA = 21, -- Portuguese (Brasil)

        DEFAULT = 0 -- (= ENGLISH_UK)
    },

    LANG_FILE =
    {
        ENGLISH_UK     = "EN.lua",     -- English (United Kingdom)
        ENGLISH_US     = "EN_USA.lua", -- English (United States)
        GERMAN         = "DE.lua",     -- German
        FRENCH         = "FR.lua",     -- French
        ITALIAN        = "IT.lua",     -- Italian
        SPANISH        = "SP.lua",     -- Spanish
        SPANISH_LATIN  = "SP.lua",     -- Spanish (Latin America) (= SPANISH)
        PORTUGUESE     = "PT.lua",     -- Portuguese (Portugal)
        SWEDISH        = "SW.lua",     -- Swedish
        RUSSIAN        = "RU.lua",     -- Russian
        JAPANESE       = "JA.lua",     -- Japanese
        CHINESE_TRADI  = "CN_T.lua",   -- Chinese (Traditional)
        POLSKI         = "PL.lua",     -- Polski
        DUTCH          = "NL.lua",     -- Dutch
        DANISH         = "DA.lua",     -- Danish
        NORWEGIAN      = "NO.lua",     -- Norwegian
        FINNISH        = "FI.lua",     -- Finnish
        TURKISH        = "TR.lua",     -- Turkish
        KOREAN         = "KO.lua",     -- Korean
        CHINESE        = "CN_S.lua",   -- Chinese (Simplified)
        JAPANESE_RYU   = "JA_ryu.lua", -- Japanese (Ryu)
        HUNGARIAN      = "HU.lua",     -- Hungarian
        PORTUGUESE_BRA = "PT_BR.lua",  -- Portuguese (Brasil)

        DEFAULT = "EN.lua" -- (= ENGLISH UK)
    },

    FONTS =
    {
        DEFAULT       = "font-SawarabiGothic-Regular.woff",
        KOREAN        = "font-NotoSansCJKkr-Regular-Slim.otf",
        CHINESE       = "font-NotoSansCJKsc-Regular-Slim.otf",
        CHINESE_TRADI = "font-NotoSansCJKtc-Regular.otf"
    },

    LANG_DEFAULT =
    {
        -- Footer
        ["Settings"] = "Settings",
        ["Launch"] = "Launch",
        ["Details"] = "Details",
        ["Category"] = "Category",
        ["View"] = "View",
        ["Close"] = "Close",
        ["Select"] = "Select",
        ["About"] = "About",

        -- General settings
        ["Language_colon"] = "Language: ",
        ["Homebrews_Category_colon"] = "Homebrews Category: ",
        ["Recently_Played_colon"] = "Recently Played: ",
        ["Startup_scan_colon"] = "Startup scan: ",
        ["On"] = "On",
        ["Off"] = "Off",

        -- Appearance
        ["Custom_Background_colon"] = "Custom Background: ",
        ["Reflection_Effect_colon"] = "Reflection Effect: ",
        ["Smooth_Scrolling_colon"] = "Smooth Scrolling: ",
        ["Theme_Color_colon"] = "Theme Color: ",
        ["Red"] = "Red",
        ["Yellow"] = "Yellow",
        ["Green"] = "Green",
        ["Grey"] = "Grey",
        ["Dark_Grey"] = "Dark Grey",
        ["Black"] = "Black",
        ["Purple"] = "Purple",
        ["Dark_Purple"] = "Dark Purple",
        ["Orange"] = "Orange",
        ["Blue"] = "Blue",
        ["Views_2D_colon"] = "2D Views: ",
        ["Change_Views_colon"] = "Change Views: ",

        -- Audio
        ["Audio"] = "Audio",
        ["Sounds_colon"] = "Sounds: ",
        ["Music_colon"] = "Music: ",
        ["Shuffle_music_colon"] = "Shuffle music: ",
        ["Skip_track"] = "Skip track",

        -- Startup Categories
        ["Startup_Category_colon"] = "Startup Category: ",
        ["Favorites"] = "Favorites",
        ["Recently_Played"] = "Recently Played",
        ["PS_Vita"] = "PS Vita",
        ["Homebrews"] = "Homebrews",
        ["PSP"] = "PSP",
        ["PlayStation"] = "PlayStation",
        ["Nintendo_64"] = "Nintendo 64",
        ["Super_Nintendo"] = "Super Nintendo",
        ["Nintendo_Entertainment_System"] = "Nintendo Entertainment System",
        ["Game_Boy_Advance"] = "Game Boy Advance",
        ["Game_Boy_Color"] = "Game Boy Color",
        ["Game_Boy"] = "Game Boy",
        ["Sega_Dreamcast"] = "Sega Dreamcast",
        ["Sega_Mega_Drive"] = "Sega Mega Drive",
        ["Sega_Master_System"] = "Sega Master System",
        ["Sega_Game_Gear"] = "Sega Game Gear",
        ["MAME_2000"] = "MAME 2000",
        ["Amiga"] = "Amiga",
        ["TurboGrafx_16"] = "TurboGrafx-16",
        ["TurboGrafx_CD"] = "TurboGrafx-CD",
        ["PC_Engine"] = "PC Engine",
        ["PC_Engine_CD"] = "PC Engine CD",
        ["Neo_Geo_Pocket_Color"] = "Neo Geo Pocket Color",
        ["Playstation_Mobile"] = "Playstation Mobile",
        ["Sega_CD"] = "Sega CD",
        ["Sega_32X"] = "Sega 32X",
        ["Commodore_64"] = "Commodore 64",
        ["WonderSwan_Color"] = "WonderSwan Color",
        ["WonderSwan"] = "WonderSwan",
        ["MSX2"] = "MSX2",
        ["MSX"] = "MSX",
        ["ZX_Spectrum"] = "ZX Spectrum",
        ["Atari_7800"] = "Atari 7800",
        ["Atari_5200"] = "Atari 5200",
        ["Atari_2600"] = "Atari 2600",
        ["Atari_Lynx"] = "Atari Lynx",
        ["ColecoVision"] = "ColecoVision",
        ["Vectrex"] = "Vectrex",
        ["FBA_2012"] = "FBA 2012",
        ["MAME_2003Plus"] = "MAME 2003 Plus",
        ["Neo_Geo"] = "Neo Geo",
        ["ScummVM"] = "ScummVM",
        ["PICO8"] = "PICO-8",

        -- Download
        ["Download_Covers_colon"] = "Download Covers: ",
        ["Download_Covers"] = "Download Covers",
        ["Download_Backgrounds_colon"] = "Download Backgrounds: ",
        ["Extract_PS_Vita_backgrounds"] = "Extract PS Vita backgrounds",
        ["Extract_PSP_backgrounds"] = "Extract PSP backgrounds",
        ["Extract_PICO8_backgrounds"] = "Extract PICO-8 backgrounds",

        ["All"] = "All",
        ["Reload_Covers_Database"] = "Reload Covers Database",
        ["Reload_Backgound_Database"] = "Reload Background Database",
        ["Internet_Connection_Required"] = "Internet Connection Required",
        ["Cover"] = "Cover",
        ["Background"] = "Background",
        ["Found"] = "Found",
        ["found_exclamation"] = "found!",
        ["Cover_not_found"] = "Cover not found",
        ["Background_not_found"] = "Background not found",
        ["of"] = " of ",

        ["Downloading_covers"] = "Downloading covers",
        ["Downloading_all_covers"] = "Downloading all covers",
        ["Downloading_PS_Vita_covers"] = "Downloading PS Vita covers",
        ["Downloading_PSP_covers"] = "Downloading PSP covers",
        ["Downloading_PS1_covers"] = "Downloading PS1 covers",
        ["Downloading_N64_covers"] = "Downloading N64 covers",
        ["Downloading_SNES_covers"] = "Downloading SNES covers",
        ["Downloading_NES_covers"] = "Downloading NES covers",
        ["Downloading_GBA_covers"] = "Downloading GBA covers",
        ["Downloading_GBC_covers"] = "Downloading GBC covers",
        ["Downloading_GB_covers"] = "Downloading GB covers",
        ["Downloading_DC_covers"] = "Downloading DC covers",
        ["Downloading_MD_covers"] = "Downloading MD covers",
        ["Downloading_SMS_covers"] = "Downloading SMS covers",
        ["Downloading_GG_covers"] = "Downloading GG covers",
        ["Downloading_MAME_2000_covers"] = "Downloading MAME 2000 covers",
        ["Downloading_AMIGA_covers"] = "Downloading AMIGA covers",
        ["Downloading_TG_16_covers"] = "Downloading TG-16 covers",
        ["Downloading_TG_CD_covers"] = "Downloading TG-CD covers",
        ["Downloading_PCE_covers"] = "Downloading PCE covers",
        ["Downloading_PCE_CD_covers"] = "Downloading PCE-CD covers",
        ["Downloading_NG_PC_covers"] = "Downloading NG-PC covers",
        ["Downloading_SCD_covers"] = "Downloading SCD covers",
        ["Downloading_32X_covers"] = "Downloading 32X covers",
        ["Downloading_C64_covers"] = "Downloading C64 covers",
        ["Downloading_WSWANCOL_covers"] = "Downloading WSWANCOL covers",
        ["Downloading_WSWAN_covers"] = "Downloading WSWAN covers",
        ["Downloading_MSX2_covers"] = "Downloading MSX2 covers",
        ["Downloading_MSX_covers"] = "Downloading MSX covers",
        ["Downloading_ZXS_covers"] = "Downloading ZXS covers",
        ["Downloading_A7800_covers"] = "Downloading A7800 covers",
        ["Downloading_A5200_covers"] = "Downloading A5200 covers",
        ["Downloading_A600_covers"] = "Downloading A600 covers",
        ["Downloading_LYNX_covers"] = "Downloading LYNX covers",
        ["Downloading_COLECO_covers"] = "Downloading COLECO covers",
        ["Downloading_VECTREX_covers"] = "Downloading VECTREX covers",
        ["Downloading_FBA2012_covers"] = "Downloading FBA2012 covers",
        ["Downloading_MAME_2003_covers"] = "Downloading MAME 2003 covers",
        ["Downloading_NG_covers"] = "Downloading NG covers",
        ["Downloading_SCUMMVM_covers"] = "Downloading SCUMMVM covers",
        ["Downloading_PICO8_covers"] = "Downloading PICO-8 covers",

        ["Downloading_backgrounds"] = "Downloading backgrounds",
        ["Downloading_all_backgrounds"] = "Downloading all backgrounds",
        ["Downloading_PS_Vita_backgrounds"] = "Downloading PS Vita backgrounds",
        ["Downloading_PSP_backgrounds"] = "Downloading PSP backgrounds",
        ["Downloading_PS1_backgrounds"] = "Downloading PS1 backgrounds",
        ["Downloading_N64_backgrounds"] = "Downloading N64 backgrounds",
        ["Downloading_SNES_backgrounds"] = "Downloading SNES backgrounds",
        ["Downloading_NES_backgrounds"] = "Downloading NES backgrounds",
        ["Downloading_GBA_backgrounds"] = "Downloading GBA backgrounds",
        ["Downloading_GBC_backgrounds"] = "Downloading GBC backgrounds",
        ["Downloading_GB_backgrounds"] = "Downloading GB backgrounds",
        ["Downloading_DC_backgrounds"] = "Downloading DC backgrounds",
        ["Downloading_MD_backgrounds"] = "Downloading MD backgrounds",
        ["Downloading_SMS_backgrounds"] = "Downloading SMS backgrounds",
        ["Downloading_GG_backgrounds"] = "Downloading GG backgrounds",
        ["Downloading_MAME_2000_backgrounds"] = "Downloading MAME 2000 backgrounds",
        ["Downloading_AMIGA_backgrounds"] = "Downloading AMIGA backgrounds",
        ["Downloading_TG_16_backgrounds"] = "Downloading TG-16 backgrounds",
        ["Downloading_TG_CD_backgrounds"] = "Downloading TG-CD backgrounds",
        ["Downloading_PCE_backgrounds"] = "Downloading PCE backgrounds",
        ["Downloading_PCE_CD_backgrounds"] = "Downloading PCE-CD backgrounds",
        ["Downloading_NG_PC_backgrounds"] = "Downloading NG-PC backgrounds",
        ["Downloading_SCD_backgrounds"] = "Downloading SCD backgrounds",
        ["Downloading_32X_backgrounds"] = "Downloading 32X backgrounds",
        ["Downloading_C64_backgrounds"] = "Downloading C64 backgrounds",
        ["Downloading_WSWANCOL_backgrounds"] = "Downloading WSWANCOL backgrounds",
        ["Downloading_WSWAN_backgrounds"] = "Downloading WSWAN backgrounds",
        ["Downloading_MSX2_backgrounds"] = "Downloading MSX2 backgrounds",
        ["Downloading_MSX_backgrounds"] = "Downloading MSX backgrounds",
        ["Downloading_ZXS_backgrounds"] = "Downloading ZXS backgrounds",
        ["Downloading_A7800_backgrounds"] = "Downloading A7800 backgrounds",
        ["Downloading_A5200_backgrounds"] = "Downloading A5200 backgrounds",
        ["Downloading_A600_backgrounds"] = "Downloading A600 backgrounds",
        ["Downloading_LYNX_backgrounds"] = "Downloading LYNX backgrounds",
        ["Downloading_COLECO_backgrounds"] = "Downloading COLECO backgrounds",
        ["Downloading_VECTREX_backgrounds"] = "Downloading VECTREX backgrounds",
        ["Downloading_FBA2012_backgrounds"] = "Downloading FBA2012 backgrounds",
        ["Downloading_MAME_2003_backgrounds"] = "Downloading MAME 2003 backgrounds",
        ["Downloading_NG_backgrounds"] = "Downloading NG backgrounds",
        ["Downloading_SCUMMVM_backgrounds"] = "Downloading SCUMMVM backgrounds",
        ["Downloading_PICO8_backgrounds"] = "Downloading PICO-8 backgrounds",

        -- Info Screen
        ["App_ID_colon"] = "App ID: ",
        ["Size_colon"] = "Size: ",
        ["Version_colon"] = "Version: ",
        ["Download_Cover"] = "Download Cover",
        ["Download_Background"] = "Download Background",
        ["Override_Category_colon"] = "Override Category: ",
        ["Press_X_to_apply_Category"] = "Press X to apply Category",
        ["Press_O_to_apply_Category"] = "Press O to apply Category",
        ["Default"] = "Default",
        ["Favorite"] = "Favorite",
        ["Rename"] = "Rename",
        ["PS_Vita_Game"] = "PS Vita Game",
        ["Homebrew"] = "Homebrew",
        ["PSP_Game"] = "PSP Game",
        ["PS1_Game"] = "PlayStation Game",
        ["N64_Game"] = "Nintendo 64 Game",
        ["SNES_Game"] = "Super Nintendo Game",
        ["NES_Game"] = "Nintendo Entertainment System Game",
        ["GBA_Game"] = "Game Boy Advance Game",
        ["GBC_Game"] = "Game Boy Color Game",
        ["GB_Game"] = "Game Boy Game",
        ["DC_Game"] = "Sega Dreamcast Game",
        ["MD_Game"] = "Sega Mega Drive Game",
        ["SMS_Game"] = "Sega Master System Game",
        ["GG_Game"] = "Sega Game Gear Game",
        ["MAME_2000_Game"] = "MAME 2000 Game",
        ["Amiga_Game"] = "Amiga Game",
        ["TurboGrafx_16_Game"] = "TurboGrafx-16 Game",
        ["TurboGrafx_CD_Game"] = "TurboGrafx-CD Game",
        ["PC_Engine_Game"] = "PC Engine Game",
        ["PC_Engine_CD_Game"] = "PC Engine CD Game",
        ["Neo_Geo_Pocket_Color_Game"] = "Neo Geo Pocket Color Game",
        ["Playstation_Mobile_Game"] = "Playstation Mobile Game",
        ["SCD_Game"] = "Sega CD Game",
        ["S32X_Game"] = "Sega 32X Game",
        ["C64_Game"] = "Commodore 64 Game",
        ["WSWANCOL_Game"] = "WonderSwan Color Game",
        ["WSWAN_Game"] = "WonderSwan Game",
        ["MSX2_Game"] = "MSX2 Game",
        ["MSX_Game"] = "MSX Game",
        ["ZXS_Game"] = "ZX Spectrum Game",
        ["A7800_Game"] = "Atari 7800 Game",
        ["A5200_Game"] = "Atari 5200 Game",
        ["A600_Game"] = "Atari 600 Game",
        ["LYNX_Game"] = "Atari Lynx Game",
        ["COLECO_Game"] = "ColecoVision Game",
        ["VECTREX_Game"] = "Vectrex Game",
        ["FBA2012_Game"] = "FBA 2012 Game",
        ["MAME2003_Game"] = "MAME 2003 Plus Game",
        ["Neo_Geo_Game"] = "Neo Geo Game",
        ["ScummVM_Game"] = "ScummVM Game",
        ["PICO8_Game"] = "PICO-8 Game",

        -- Missing launcher message
        ["Please_install_RetroFlow_Adrenaline_Launcher"] = "Please install RetroFlow Adrenaline Launcher.",
        ["The_VPK_is_saved_here"] = "The VPK is saved here",

        -- Search
        ["Search"] = "Search",
        ["Search_Results"] = "Search Results",
        ["Search_No_Results"] = "Press select to search again",

        -- Settings Menu
        ["Categories"] = "Categories",
        ["Sounds"] = "Sounds",
        ["Artwork"] = "Artwork",
        ["Scan_Settings"] = "Scan Settings",
        ["Adrenaline_roms"] = "Adrenaline games: ",
        ["All_Category"] = "All Category: ",
        ["Back_Chevron"] = "<  Back",
        ["Theme"] = "Theme",
        ["Game_backgounds_colon"] = "Game Backgrounds: ",

        -- Game directories
        ["Home"] = "Home",
        ["Directory_not_found"] = "Directory not found",
        ["Edit_game_directories"] = "Edit game directories...",
        ["Game_directories"] = "Game directories",
        ["Use_this_directory"] = "Use this directory",
        ["Rescan"] = "Rescan",
        ["Back"] = "Back",

        -- Scan progress
        ["Scanning_titles"] = "Scanning titles...",
        ["Scanning_games_ellipsis"] = "Scanning games...",
        ["Scan_complete"] = "Scan complete",
        ["Reloading_ellipsis"] = "Reloading...",

        -- Guides
        ["Help_and_Guides"] = "Help",

        ["guide_1_heading"] = "Adding games",
        ["guide_1_content"] = "Game directories: \nPlace your games in 'ux0:/data/RetroFlow/ROMS/', or to use your own file directories, go to 'Scan Settings' then 'Edit game directories'. \n\nOnce you have added your games, select 'Rescan' to add them to RetroFlow. \n\nFilenames: \nIt's important that your games are named using the 'no-intro' file naming convention, e.g. 'Sonic (USA)', otherwise images won't be downloaded.",

        ["guide_2_heading"] = "Adrenaline games not loading?",
        ["guide_2_content"] = "If Adrenaline games aren't loading and you have installed the RetroFlow Adrenaline Launcher, please install AdrBubbleBooterInstaller: https://vitadb.rinnegatamante.it/#/info/307. \n\nOr try installing Adrenaline Bubble Manager: https://github.com/ONElua/AdrenalineBubbleManager/releases/",

        ["guide_3_heading"] = "Custom game covers & backgrounds",
        ["guide_3_content"] = "Covers: \nCustom covers can be saved in the game folders here: 'ux0:/data/RetroFlow/COVERS/'. \n\nBackgounds: \nCustom game backgrounds can be saved in the game folders here: 'ux0:/data/RetroFlow/BACKGROUNDS/'. \n\nFilenames:\nThe filename must match the App ID or the App Name Images must be in .png format.",

        ["guide_4_heading"] = "Custom wallpaper & music",
        ["guide_4_content"] = "Wallpaper: \nYou can add as many wallpapers as you like by saving them here: 'ux0:/data/RetroFlow/WALLPAPER/'. \nImages must be in .jpg or .png format and the size should be 960px x 544px. \n\nMusic: \nSongs can be added to 'ux0:/data/RetroFlow/MUSIC/'. \nMusic must be in .ogg format.",

        ["guide_5_heading"] = "Control shortcuts",
        ["guide_5_content"] = "DPad Up: Skip to favourites category \n\nDPad Down + Square: Go back one category \n\nDPad Down + L/R triggers: Skip games alphabetically",

        ["guide_6_heading"] = "About",
        ["guide_6_content"] = "RetroFlow by jimbob4000 is a modified version of the HexFlow app. \n\nThe originalHexFlow app is by VitaHex. Support VitaHex's projects on patreon.com/vitahex \n\nMore information:\nFor more information and full credits, please visit: https://github.com/jimbob4000/RetroFlow-Launcher",

        -- Other Settings
        ["Other_Settings"] = "Other Settings",
        ["Swap_X_and_O_buttons_colon"] = "Swap X and O buttons: ",
        ["Adrenaline_PS_button_colon"] = "Adrenaline PS button:",
        ["Menu"] = "Menu",
        ["LiveArea"] = "LiveArea",
        ["Standard"] = "Standard",
        ["Show_missing_covers_colon"] = "Show missing covers:",

        -- Game options
        ["Options"] = "Options",
        ["Adrenaline_options"] = "Adrenaline options",
        ["Driver_colon"] = "Driver: ",
        ["Execute_colon"] = "Execute: ",
        ["Save"] = "Save",
        ["Add_to_favorites"] = "Add to favorites",
        ["Remove_from_favorites"] = "Remove from favorites",
        ["Show_hidden_games_colon"] = "Show hidden games:",
        ["Hide_game"] = "Hide game",
        ["Unhide_game"] = "Unhide game",
        ["Remove_from_recently_played"] = "Remove from recently played",
        ["Retroarch_options"] = "RetroArch options",
        ["Core_colon"] = "Core:",

        -- Collections
        ["Collections"] = "Collections",
        ["Collections_colon"] = "Collections:",
        ["Add_to_collection"] = "Add to collection",
        ["New_collection"] = "New collection",
        ["New_collection_name"] = "New collection name",
        ["Create"] = "Create",
        ["Remove_from_collection"] = "Remove from collection",
        ["No_collections"] = "No collections",
        ["Delete"] = "Delete",
        ["Edit_collections"] = "Edit collections",
        ["Show_collections_colon"] = "Show collections:",
    }
}

---
--- @function Get Default Language ID
--- @description Retrieve the Default Language ID
--- @return number Default Language ID
---
function RetroText_Const.getDefaultLanguageId()
    return TEXT_CONSTANTS.LANGUAGE_IDS.DEFAULT
end

---
--- @function Get Default Font
--- @description Retrieve the Default Font Name
--- @return string Default Font Name
---
function RetroText_Const.getDefaultFont()
    return TEXT_CONSTANTS.FONTS.DEFAULT
end

---
--- @function Get Default Language Lines
--- @description Retrieve the Default Localization lines
--- @return any Default Localization for every localized string
---
function RetroText_Const.getDefaultLangLines()
    return TEXT_CONSTANTS.LANG_DEFAULT
end

---
--- @function Get Language Filename From Id
--- @description Retrieve the language Filename for a language ID
--- @param _languageId number Language ID of the language for which we want the Language Filename
--- @return string Language Filename for the inputted ID 
---
function RetroText_Const.getLangFileFromId(_languageId)
    local langFile = TEXT_CONSTANTS.LANG_FILE.DEFAULT
    
    if     _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.ENGLISH_UK     then langFile = TEXT_CONSTANTS.LANG_FILE.ENGLISH_UK    
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.ENGLISH_US     then langFile = TEXT_CONSTANTS.LANG_FILE.ENGLISH_US    
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.GERMAN         then langFile = TEXT_CONSTANTS.LANG_FILE.GERMAN        
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.FRENCH         then langFile = TEXT_CONSTANTS.LANG_FILE.FRENCH        
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.ITALIAN        then langFile = TEXT_CONSTANTS.LANG_FILE.ITALIAN       
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.SPANISH        then langFile = TEXT_CONSTANTS.LANG_FILE.SPANISH       
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.SPANISH_LATIN  then langFile = TEXT_CONSTANTS.LANG_FILE.SPANISH_LATIN 
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.PORTUGUESE     then langFile = TEXT_CONSTANTS.LANG_FILE.PORTUGUESE    
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.SWEDISH        then langFile = TEXT_CONSTANTS.LANG_FILE.SWEDISH       
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.RUSSIAN        then langFile = TEXT_CONSTANTS.LANG_FILE.RUSSIAN       
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.JAPANESE       then langFile = TEXT_CONSTANTS.LANG_FILE.JAPANESE      
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.CHINESE_TRADI  then langFile = TEXT_CONSTANTS.LANG_FILE.CHINESE_TRADI 
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.POLSKI         then langFile = TEXT_CONSTANTS.LANG_FILE.POLSKI        
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.DUTCH          then langFile = TEXT_CONSTANTS.LANG_FILE.DUTCH         
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.DANISH         then langFile = TEXT_CONSTANTS.LANG_FILE.DANISH        
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.NORWEGIAN      then langFile = TEXT_CONSTANTS.LANG_FILE.NORWEGIAN     
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.FINNISH        then langFile = TEXT_CONSTANTS.LANG_FILE.FINNISH       
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.TURKISH        then langFile = TEXT_CONSTANTS.LANG_FILE.TURKISH       
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.KOREAN         then langFile = TEXT_CONSTANTS.LANG_FILE.KOREAN        
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.CHINESE        then langFile = TEXT_CONSTANTS.LANG_FILE.CHINESE       
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.JAPANESE_RYU   then langFile = TEXT_CONSTANTS.LANG_FILE.JAPANESE_RYU  
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.HUNGARIAN      then langFile = TEXT_CONSTANTS.LANG_FILE.HUNGARIAN     
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.PORTUGUESE_BRA then langFile = TEXT_CONSTANTS.LANG_FILE.PORTUGUESE_BRA
    else                                                                  langFile = TEXT_CONSTANTS.LANG_FILE.ENGLISH_UK
    end
    
    return langFile
end

---
--- @function Get Font for Language Id
--- @description Retrieve the Font name for a language ID
--- @param _languageId number Language ID of the language for which we want the Font name
--- @return string Font name for the language ID
---
function RetroText_Const.getFontForLangId(_languageId)
    local font = TEXT_CONSTANTS.FONTS.DEFAULT 
    
    if     _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.KOREAN        then font = TEXT_CONSTANTS.FONTS.KOREAN
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.CHINESE       then font = TEXT_CONSTANTS.FONTS.CHINESE
    elseif _languageId == TEXT_CONSTANTS.LANGUAGE_IDS.CHINESE_TRADI then font = TEXT_CONSTANTS.FONTS.CHINESE_TRADI
    end
    
    return font
end

---
--- @function Get Language from Vita
--- @description Retrieve Retro Language ID from the Vita system's language
--- @return number Retro Language ID
---
function RetroText_Const.getLanguageFromVita()
    local vitaLanguage = System.getLanguage()
    local chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.DEFAULT

    if     vitaLanguage == 0  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.JAPANESE
    elseif vitaLanguage == 1  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.ENGLISH_US
    elseif vitaLanguage == 2  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.FRENCH
    elseif vitaLanguage == 3  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.SPANISH
    elseif vitaLanguage == 4  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.GERMAN
    elseif vitaLanguage == 5  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.ITALIAN
    elseif vitaLanguage == 6  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.DUTCH
    elseif vitaLanguage == 7  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.PORTUGUESE
    elseif vitaLanguage == 8  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.RUSSIAN
    elseif vitaLanguage == 9  then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.KOREAN
    elseif vitaLanguage == 10 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.CHINESE_TRADI
    elseif vitaLanguage == 11 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.CHINESE
    elseif vitaLanguage == 12 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.FINNISH
    elseif vitaLanguage == 13 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.SWEDISH
    elseif vitaLanguage == 14 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.DANISH
    elseif vitaLanguage == 15 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.ENGLISH_UK
    elseif vitaLanguage == 16 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.NORWEGIAN
    elseif vitaLanguage == 17 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.POLSKI
    elseif vitaLanguage == 18 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.PORTUGUESE_BRA
    elseif vitaLanguage == 19 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.TURKISH
    elseif vitaLanguage == 20 then chosenLanguage = TEXT_CONSTANTS.LANGUAGE_IDS.SPANISH_LATIN
    end

    return chosenLanguage
end

return RetroText_Const
