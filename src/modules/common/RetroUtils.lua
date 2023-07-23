---
--- @module RetroUtils
--- @description Module containing useful stuff for the whole application 
---
--- @field customToString function Public Static. Convert to string any already string-able variable but also tables
---
local RetroUtils = {}

---
--- @function Custom To String
--- @description Convert to string any already string-able variable but also tables
---
--- @param _var any Variable to be string-yfied
--- @return string String visualisation of the input parameter
---
function RetroUtils.customToString(_var)
    if type(_var) == 'table' then
        local s = '{\n'
        for k,v in pairs(_var) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            s = s .. '['..k..'] = ' .. RetroUtils.customToString(v) .. ',\n'
        end
        return s .. '} '
    else
        return tostring(_var)
    end
end

return RetroUtils