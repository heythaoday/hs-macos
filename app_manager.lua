local appManager = {}

function appManager.open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

function appManager.launchOrFocusOrRotate(app)
    local focusedWindow = hs.window.focusedWindow()
    local focusedWindowApp = focusedWindow:application()
    local focusedWindowAppName = focusedWindowApp:name()
    local focusedWindowPath = focusedWindowApp:path()
    local appNameOnDisk = string.gsub(focusedWindowPath, "/Applications/", "")
    appNameOnDisk = string.gsub(appNameOnDisk, ".app", "")
    appNameOnDisk = string.gsub(appNameOnDisk, "/System/Library/CoreServices/", "")
    if focusedWindow and appNameOnDisk == app then
        local appWindows = hs.application.get(focusedWindowAppName):allWindows()
        if #appWindows > 0 then
            if app == "Finder" then
                appWindows[#appWindows - 1]:focus()
            else
                appWindows[#appWindows]:focus()
            end
        else
            hs.application.launchOrFocus(app)
        end
    else
        hs.application.launchOrFocus(app)
    end
end

return appManager