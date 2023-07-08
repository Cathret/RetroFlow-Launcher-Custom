---
--- @module RetroDebug
--- @description Module containing stuff to be able to debug RetroFlow
---
--- @field infoPopup function Public Static. Use Vita's system to display an Info Popup, that won't stop the execution of the app
--- @field debugPopup function Public Static. Use Vita's system to display an Debug Popup, that will stop the execution of the app while shown
--- @field warningPopup function Public Static. Use Vita's system to display an Warning Popup, that will stop the execution of the app while shown. If clicking on "No", will exit the app
--- @field errorPopup function Public Static. Use Vita's system to display an Warning Popup, that will stop the execution of the app while shown. After clicking on ok, will exit the app
---
--- @field _showPopup function Private Static. Use Vita's system to display an Popup
---
local RetroDebug = {}

--- ButtonsMode available
-- BUTTON_OK
-- BUTTON_CANCEL
-- BUTTON_OK_CANCEL
-- BUTTON_YES_NO
---

--- DialogState available
-- RUNNING
-- FINISHED
-- CANCELED
---

local SEVERITY =
{
    INFO    = 0,
    DEBUG   = 1,
    WARNING = 2,
    ERROR   = 3
}

local MS_TO_WAIT = 1000 -- 1s

---
--- @function Info Popup
--- @description Display an Info popup that won't stop the execution
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.infoPopup(_text)
    RetroDebug._showPopup(_text, false, BUTTON_OK, SEVERITY.INFO)
end

---
--- @function Debug Popup
--- @description Display an Debug popup that will stop the execution of the app while shown
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.debugPopup(_text)
    RetroDebug._showPopup(_text, false, BUTTON_OK, SEVERITY.DEBUG)
end

---
--- @function Warning Popup
--- @description Display an Warning popup that will stop the execution of the app while shown. If "no" is clicked, will exit the app
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.warningPopup(_text)
    RetroDebug._showPopup(_text .. "\nContinue?", false, BUTTON_YES_NO, SEVERITY.WARNING)
end

---
--- @function Warning Popup
--- @description Display an Warning popup that will stop the execution of the app while shown. After being closed, will exit the app
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.errorPopup(_text)
    RetroDebug._showPopup(_text, false, BUTTON_OK, SEVERITY.ERROR)
end

---
--- @function Show Popup
--- @description Display an popup that can stop the execution of the app while shown and exit the app if necessary
--- 
--- @param _text string Text to be displayed on the popup
--- @param _hasProgressBar boolean Should a ProgressBar be shown?
--- @param _btnMode any What buttons should be shown
--- @param _severity number Severity of the popup (impacting if should stop the app or exit it) 
---
function RetroDebug._showPopup(_text, _hasProgressBar, _btnMode, _severity)
    System.setMessage(_text, _hasProgressBar, _btnMode)

    if _severity == SEVERITY.INFO then
        return -- If only INFO, we don't stop the execution
    end
    
    local lastMessageState = System.getMessageState()
    while lastMessageState == RUNNING do
        System.wait(MS_TO_WAIT) -- Update only every Xms to avoid overprocessing
        lastMessageState = System.getMessageState()
    end

    -- We will exit the App if Popup is an Error or a Canceled Warning
    local shouldExitApp = false
    if _severity == SEVERITY.DEBUG then
        -- We don't need to do anything, just continue the app
    elseif _severity == SEVERITY.WARNING then
        if lastMessageState == FINISHED then
            -- We don't need to do anything, just continue the app
        else -- if lastMessageState == CANCELED then
            shouldExitApp = true
        end
    elseif _severity == SEVERITY.ERROR then
        shouldExitApp = true
    end

    if shouldExitApp then
        System.exit()
    end
end

return RetroDebug