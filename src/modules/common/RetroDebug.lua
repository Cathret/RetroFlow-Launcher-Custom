---
--- @module RetroDebug
--- @description Module containing stuff to be able to debug RetroFlow. Can't be called before App is started.
---
--- @field infoPopup function Public Static. Use Vita's system to display an Info Popup, that won't stop the execution of the app
--- @field debugPopup function Public Static. Use Vita's system to display an Debug Popup, that will stop the execution of the app while shown
--- @field warningPopup function Public Static. Use Vita's system to display an Warning Popup, that will stop the execution of the app while shown. If clicking on "No", will exit the app
--- @field errorPopup function Public Static. Use Vita's system to display an Warning Popup, that will stop the execution of the app while shown. After clicking on ok, will exit the app
---
--- @field _generatePopup function Private Static. Generate a popup and handle breaking if needed
--- @field _showPopup function Private Static. Use Vita's system to display an Popup
---
local RetroDebug = {}

--- ButtonMode available
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

--- Task fields
-- Text
-- HasProgressBar
-- ButtonMode
-- Severity
-- OnClosed
---

local SEVERITY =
{
    INFO    = 0,
    DEBUG   = 1,
    WARNING = 2,
    ERROR   = 3
}

---
--- @function Info Popup
--- @description Display an Info popup that won't stop the execution
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.infoPopup(_text)
    RetroDebug._generatePopup(_text, false, BUTTON_OK, SEVERITY.INFO)
end

---
--- @function Debug Popup
--- @description Display an Debug popup that will stop the execution of the app while shown
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.debugPopup(_text)
    RetroDebug._generatePopup(_text, false, BUTTON_OK, SEVERITY.DEBUG)
end

---
--- @function Warning Popup
--- @description Display an Warning popup that will stop the execution of the app while shown. If "no" is clicked, will exit the app
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.warningPopup(_text)
    RetroDebug._generatePopup(_text .. "\nContinue?", false, BUTTON_YES_NO, SEVERITY.WARNING)
end

---
--- @function Warning Popup
--- @description Display an Warning popup that will stop the execution of the app while shown. After being closed, will exit the app
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.errorPopup(_text)
    RetroDebug._generatePopup(_text, false, BUTTON_OK, SEVERITY.ERROR)
end

---
--- @function Generate Popup
--- @description Generate a popup task that will be able to stop the execution of the app while shown and exit the app if necessary. Will queue multiple popups.
--- 
--- @param _text string Text to be displayed on the popup
--- @param _hasProgressBar boolean Should a ProgressBar be shown?
--- @param _btnMode any What buttons should be shown
--- @param _severity number Severity of the popup (impacting if should stop the app or exit it)
---
function RetroDebug._generatePopup(_text, _hasProgressBar, _btnMode, _severity)
    local onClosedFunc = function(_closeState) end

    -- Set OnClosed behaviour
    if _severity == SEVERITY.DEBUG then
        -- We don't need to do anything, just continue the app
    elseif _severity == SEVERITY.WARNING then
        onClosedFunc = function(_closeState)
            if _closeState == FINISHED then
                -- We don't need to do anything, just continue the app
            else -- if _closeState == CANCELED then
                System.exit()
            end
        end
    elseif _severity == SEVERITY.ERROR then
        onClosedFunc = function(_closeState)
            System.exit()
        end
    end
    
    RetroDebug._showPopup(_text, _hasProgressBar, _btnMode)

    local messageState = System.getMessageState()
    while messageState == RUNNING do
        Graphics.initBlend()
        Graphics.termBlend()
        Screen.waitVblankStart()
        Screen.flip()
        
        messageState = System.getMessageState()
    end

    onClosedFunc(messageState)
end

---
--- @function Show Popup
--- @description Display an popup that can stop the execution of the app while shown and exit the app if necessary. If a popup is already up, popup is dropped
--- 
--- @param _text string Text to be displayed on the popup
--- @param _hasProgressBar boolean Should a ProgressBar be shown?
--- @param _btnMode any What buttons should be shown
---
function RetroDebug._showPopup(_text, _hasProgressBar, _btnMode)
    System.setMessage(_text, _hasProgressBar, _btnMode)
end

return RetroDebug
