--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Copyright © Karl Saunders (Mobius1) 2021
-- ! Edit it if you want, but don't re-release this without my permission, and never claim it to be yours !

-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
-- to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
-- and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
    
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
----------------------------------------------------------------------------------------------------------------------------------------------------------------

function Send(message, timeout, position, progress, theme)

    if message == nil then
        return PrintError("^1BULLETIN ERROR: ^7Notification message is nil")
    end

    if type(message) == "number" then
        message = tostring(message)
    end

    if not tonumber(timeout) then
        timeout = Config.Timeout
    end
    
    if position == nil then
        position = Config.Position
    end
    
    if progress == nil then
        progress = false
    end  

    AddNotification({
        type        = "standard",
        message     = message,
        timeout     = timeout,
        position    = position,
        progress    = progress,
        theme       = theme,
    })
end

function SendAdvanced(message, title, subject, icon, timeout, position, progress)

    if message == nil then
        return PrintError("^1BULLETIN ERROR: ^7Notification message is nil")
    end

    if type(message) == "number" then
        message = tostring(message)
    end

    if title == nil then
        return PrintError("^1BULLETIN ERROR: ^7Notification title is nil")
    end
    
    if subject == nil then
        return PrintError("^1BULLETIN ERROR: ^7Notification subject is nil")
    end    

    if not tonumber(timeout) then
        timeout = Config.Timeout
    end
    
    if position == nil then
        position = Config.Position
    end
    
    if progress == nil then
        progress = false
    end  

    AddNotification({
        type        = "advanced",
        message     = message,
        title       = title,
        subject     = subject,
        icon        = Config.Pictures[icon],
        timeout     = timeout,
        position    = position,
        progress    = progress
    })
end

function AddNotification(data)
    data.config = Config
    SendNUIMessage(data)
end

function PrintError(message)
    local s = string.rep("=", string.len(message))
    print(s)
    print(message)
    print(s)  
end

RegisterNetEvent("bulletin:send")
AddEventHandler("bulletin:send", Send)

RegisterNetEvent("bulletin:sendAdvanced")
AddEventHandler("bulletin:sendAdvanced", SendAdvanced)