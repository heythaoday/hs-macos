local hotkeyDisplay = {}

function hotkeyDisplay.showAllHotkeys(ctrlCmdShortcuts)
    local hotkeys = {
        {modifiers = "alt", key = "-", description = "Volume Down"},
        {modifiers = "alt", key = "=", description = "Volume Up"},
        {modifiers = "ctrl + shift", key = "C", description = "Choose Audio Output Device"},
        {modifiers = "ctrl + shift", key = "P", description = "Toggle Play/Pause"},
        {modifiers = "cmd + ctrl + shift", key = "H", description = "Show All Hotkeys"}
    }

    for _, shortcut in ipairs(ctrlCmdShortcuts) do
        table.insert(hotkeys, {
            modifiers = "alt",
            key = shortcut[1],
            description = "Launch or Focus " .. shortcut[2]
        })
    end

    local hotkeyList = ""
    for _, hotkey in ipairs(hotkeys) do
        hotkeyList = hotkeyList .. hotkey.modifiers .. " + " .. hotkey.key .. " : " .. hotkey.description .. "\n"
    end

    hs.alert.show(hotkeyList, 5)  -- Show the hotkeys for 5 seconds
end

return hotkeyDisplay