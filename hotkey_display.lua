local hotkeyDisplay = {}
local debounceTimer = nil
local canvas = require("ui/canvas")

function hotkeyDisplay.showAllHotkeys(ctrlCmdShortcuts)
    if debounceTimer then
        debounceTimer:stop()
    end

    debounceTimer = hs.timer.doAfter(0.5, function()
        local hotkeys = {
            {modifiers = "alt", key = "-", description = "Volume Down"},
            {modifiers = "alt", key = "=", description = "Volume Up"},
            {modifiers = "ctrl + alt", key = "C", description = "Choose Audio Output Device"},
            {modifiers = "ctrl + alt", key = "P", description = "Toggle Play/Pause"},
            {modifiers = "ctrl + alt", key = "H", description = "Show All Hotkeys"}
        }

        for _, shortcut in ipairs(ctrlCmdShortcuts) do
            table.insert(hotkeys, {
                modifiers = "alt",
                key = shortcut[1],
                description = "> " .. shortcut[2]
            })
        end

        local hotkeyList = "Hotkey List:\n\n"
        for _, hotkey in ipairs(hotkeys) do
            hotkeyList = hotkeyList .. string.format("%-20s : %s\n", hotkey.modifiers .. " + " .. hotkey.key, hotkey.description)
        end

        local uiCanvas = canvas.createCanvas(hotkeyList)
        uiCanvas:show()
        hs.timer.doAfter(5, function() uiCanvas:delete() end)  -- Show the canvas for 5 seconds
    end)
end

return hotkeyDisplay