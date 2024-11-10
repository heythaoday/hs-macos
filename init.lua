local appManager = require("app_manager")
local volumeControl = require("volume_control")
local audioDeviceManager = require("audio_device_manager")
local youtubeControl = require("youtube_control")
local hotkeyDisplay = require("hotkey_display")
local windowManager = require("window_manager")
local alertStyle = require("ui/alert_style")

-- Bind hotkey display
hs.hotkey.bind({"ctrl", "alt", "shift"}, "H", function()
    hotkeyDisplay.showAllHotkeys(ctrlCmdShortcuts)
end)
-- Bind reload Hammerspoon config
hs.hotkey.bind({"ctrl", "alt"}, "R", function()
    hs.alert.show("Hammerspoon config reloaded", alertStyle)
    hs.reload()
end)

-- Bind volume controls
hs.hotkey.bind({"alt"}, "-", volumeControl.volumeDown)
hs.hotkey.bind({"alt"}, "=", volumeControl.volumeUp)

-- Bind audio device chooser
hs.hotkey.bind({"ctrl", "alt"}, "C", audioDeviceManager.chooseAudioOutputDevice)

-- Bind media control
hs.hotkey.bind({"ctrl", "alt"}, "P", youtubeControl.togglePlayPause)
hs.hotkey.bind({"ctrl", "alt"}, "N", youtubeControl.nextVideo)  

-- Bind application shortcuts
local ctrlCmdShortcuts = {
    {"1", "Google Chrome"},
    {"2", "WebStorm"},
    {"3", "Visual Studio Code"},
    {"4", "Iterm"},
    {"Q", "Safari"},
    {"W", "Insomnia"},
    {"E", "Obsidian"}
}

for i, shortcut in ipairs(ctrlCmdShortcuts) do
    hs.hotkey.bind({"alt"}, shortcut[1], function()
        appManager.launchOrFocusOrRotate(shortcut[2])
    end)
end

-- Bind window management hotkeys
hs.hotkey.bind({"ctrl", "alt"}, "M", windowManager.maximizeWindow)
hs.hotkey.bind({"ctrl", "alt"}, "F", windowManager.resizeToFullHD34)
-- hs.hotkey.bind({"ctrl", "alt"}, "Left", windowManager.leftHalf)
-- hs.hotkey.bind({"ctrl", "alt"}, "Right", windowManager.rightHalf)
-- hs.hotkey.bind({"ctrl", "alt"}, "Up", windowManager.topHalf)
-- hs.hotkey.bind({"ctrl", "alt"}, "Down", windowManager.bottomHalf)