---
--- @description Default values of Directory names for each console. To be concatenated to path
--- @return any Map<String, String> Key=Console | Value=FolderName
---

local CONSOLE_KEYS = require("modules/common/const/RetroConst_ConsoleKeys")

-- Default system name folders
local ConsoleFolderNames =
{
    [CONSOLE_KEYS.Atari2600]                   = "Atari - 2600",
    [CONSOLE_KEYS.Atari5200]                   = "Atari - 5200",
    [CONSOLE_KEYS.Atari7800]                   = "Atari - 7800",
    [CONSOLE_KEYS.AtariLynx]                   = "Atari - Lynx",
    [CONSOLE_KEYS.WonderSwan]                  = "Bandai - WonderSwan",
    [CONSOLE_KEYS.WonderSwanColor]             = "Bandai - WonderSwan Color",
    [CONSOLE_KEYS.ColecoVision]                = "Coleco - ColecoVision",
    [CONSOLE_KEYS.Commodore64]                 = "Commodore - 64",
    [CONSOLE_KEYS.Amiga]                       = "Commodore - Amiga",
    [CONSOLE_KEYS.FBA2012]                     = "FBA 2012",
    [CONSOLE_KEYS.Vectrex]                     = "GCE - Vectrex",
    [CONSOLE_KEYS.MAME2000]                    = "MAME 2000",
    [CONSOLE_KEYS.MAME2003Plus]                = "MAME 2003 Plus",
    [CONSOLE_KEYS.MSX]                         = "Microsoft - MSX",
    [CONSOLE_KEYS.MSX2]                        = "Microsoft - MSX2",
    [CONSOLE_KEYS.PCEngine]                    = "NEC - PC Engine",
    [CONSOLE_KEYS.PCEngineCD]                  = "NEC - PC Engine CD",
    [CONSOLE_KEYS.TurboGrafx16]                = "NEC - TurboGrafx 16",
    [CONSOLE_KEYS.TurboGrafxCD]                = "NEC - TurboGrafx CD",
    [CONSOLE_KEYS.GameBoy]                     = "Nintendo - Game Boy",
    [CONSOLE_KEYS.GameBoyAdvance]              = "Nintendo - Game Boy Advance",
    [CONSOLE_KEYS.GameBoyColor]                = "Nintendo - Game Boy Color",
    [CONSOLE_KEYS.Nintendo64]                  = "Nintendo - Nintendo 64",
    [CONSOLE_KEYS.NintendoEntertainmentSystem] = "Nintendo - Nintendo Entertainment System",
    [CONSOLE_KEYS.SuperNintendo]               = "Nintendo - Super Nintendo Entertainment System",
    [CONSOLE_KEYS.Sega32X]                     = "Sega - 32X",
    [CONSOLE_KEYS.SegaDreamcast]               = "Sega - Dreamcast",
    [CONSOLE_KEYS.SegaGameGear]                = "Sega - Game Gear",
    [CONSOLE_KEYS.SegaMasterSystem]            = "Sega - Master System - Mark III",
    [CONSOLE_KEYS.SegaMegaDrive]               = "Sega - Mega Drive - Genesis",
    [CONSOLE_KEYS.SegaCD]                      = "Sega - Mega-CD - Sega CD",
    [CONSOLE_KEYS.ZXSpectrum]                  = "Sinclair - ZX Spectrum",
    [CONSOLE_KEYS.NeoGeo]                      = "SNK - Neo Geo - FBA 2012",
    [CONSOLE_KEYS.NeoGeoPocketColor]           = "SNK - Neo Geo Pocket Color",
    [CONSOLE_KEYS.PlayStation]                 = "Sony - PlayStation - RetroArch",
    [CONSOLE_KEYS.ScummVM]                     = "ScummVM",
    [CONSOLE_KEYS.Pico8]                       = "Lexaloffle Games - Pico-8",
}

return ConsoleFolderNames