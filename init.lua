local appManager = require("app_manager")
local volumeControl = require("volume_control")
local audioDeviceManager = require("audio_device_manager")
local youtubeControl = require("youtube_control")
local hotkeyDisplay = require("hotkey_display")

-- Bind application shortcuts
local ctrlCmdShortcuts = {
    {"1", "Google Chrome"},
    {"2", "Visual Studio Code"},
    {"3", "Iterm"},
    {"Q", "Safari"},
    {"W", "Things3"},
    {"E", "Fork"}
}

for i, shortcut in ipairs(ctrlCmdShortcuts) do
    hs.hotkey.bind({"alt"}, shortcut[1], function()
        appManager.launchOrFocusOrRotate(shortcut[2])
    end)
end

-- Bind volume controls
hs.hotkey.bind({"ctrl", "alt"}, "-", volumeControl.volumeDown)
hs.hotkey.bind({"ctrl", "alt"}, "=", volumeControl.volumeUp)

-- Bind audio device chooser
hs.hotkey.bind({"ctrl", "alt"}, "C", audioDeviceManager.chooseAudioOutputDevice)

-- Bind media control
hs.hotkey.bind({"ctrl", "alt"}, "P", youtubeControl.togglePlayPause)

-- Bind hotkey display
hs.hotkey.bind({"ctrl", "alt"}, "H", function()
    hotkeyDisplay.showAllHotkeys(ctrlCmdShortcuts)
end)