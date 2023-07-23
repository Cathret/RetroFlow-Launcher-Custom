---
--- @module RetroDebug
--- @description Module containing stuff to be able to debug RetroFlow. Can't be called before App is started.
---
--- @field infoPopup function Public Static. Use Vita's system to display an Info Popup, that won't stop the execution of the app
--- @field debugPopup function Public Static. Use Vita's system to display a Debug Popup, that will stop the execution of the app while shown
--- @field warningPopup function Public Static. Use Vita's system to display a Warning Popup, that will stop the execution of the app while shown. If clicking on "No", will exit the app
--- @field errorPopup function Public Static. Use Vita's system to display an Error Popup, that will stop the execution of the app while shown. After clicking on ok, will exit the app
--- @field assertWithMessage function Public Static. Verifies that a condition returns true. If not, will display an Error popup and will then exit the app
--- @field expectEqual function Public Static. Expect the two parameters to be equal, else will assert using assertWithMessage with some info
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

local MAX_CHARACTERS_IN_POPUP = 300

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
--- @description Display a Debug popup that will stop the execution of the app while shown
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.debugPopup(_text)
    RetroDebug._generatePopup(_text, false, BUTTON_OK, SEVERITY.DEBUG)
end

---
--- @function Warning Popup
--- @description Display a Warning popup that will stop the execution of the app while shown. If "no" is clicked, will exit the app
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.warningPopup(_text)
    RetroDebug._generatePopup(_text .. "\nContinue?", false, BUTTON_YES_NO, SEVERITY.WARNING)
end

---
--- @function Error Popup
--- @description Display an Error popup that will stop the execution of the app while shown. After being closed, will exit the app
--- 
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.errorPopup(_text)
    RetroDebug._generatePopup(_text, false, BUTTON_OK, SEVERITY.ERROR)
end

---
--- @function Assert With Message
--- @description Verifies that a condition returns true. If not, will display an Error popup that will stop the execution of the app while shown. After being closed, will exit the app
--- 
--- @param _condition boolean Condition to be true. Else will lift an Error
--- @param _text string Text to be displayed on the popup
---
function RetroDebug.assertWithMessage(_condition, _text)
    if _condition == false then
        RetroDebug.errorPopup("ASSERT: " .. _text)
    end
end

---
--- @function Expect Equal
--- @description Expect the two parameters to be equal, else will assert using assertWithMessage with some info
--- 
--- @param _left any First value to be equal to second value
--- @param _right any Second value to be equal to first value
--- @param _title string Is Optional. Text to prefix the popup content
---
function RetroDebug.expectEqual(_left, _right, --[[opt]]_title)
    _title = _title or nil
    
    local valueIfNil = "~NIL~"
    local text = "Expected Equal [" .. (_left or valueIfNil) .. "] and [" .. (_right or valueIfNil) .. "]"
    if _title ~= nil then
        text = _title .. "\n" .. text
    end
    
    RetroDebug.assertWithMessage(_left == _right, text)
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
    
    -- Quite annoying check since having too many characters in Vita's popup will make them not display
    local textSize = string.len(_text)
    for i = 1, textSize, MAX_CHARACTERS_IN_POPUP do
        local isLastRun = i == textSize
        local shrinkedText = string.sub(_text, i, i + MAX_CHARACTERS_IN_POPUP) -- Get maximum characters to display in a single popup
        local btnMode = isLastRun and _btnMode or BUTTON_YES_NO -- If we are not on the last popup, use Yes/No choice to continue displaying missing popups (since Ok/Cancel doens't return Cancel)
        
        RetroDebug._showPopup(shrinkedText, _hasProgressBar, btnMode)
    
        local messageState = System.getMessageState()
        while messageState == RUNNING do
            Graphics.initBlend()
            Graphics.termBlend()
            Screen.waitVblankStart()
            Screen.flip()
            
            messageState = System.getMessageState()
        end

        -- If we chose "No" in popup, do not display future ones
        if isLastRun == false and messageState == CANCELED then
            break
        end
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
