local hotkeyDisplay = {}

function hotkeyDisplay.showAllHotkeys(ctrlCmdShortcuts)
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

    hs.alert.show(hotkeyList, 5)  -- Show the hotkeys for 5 seconds
end

return hotkeyDisplay