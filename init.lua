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
hs.hotkey.bind({"alt"}, "-", volumeControl.volumeDown)
hs.hotkey.bind({"alt"}, "=", volumeControl.volumeUp)

-- Bind audio device chooser
hs.hotkey.bind({"ctrl", "shift"}, "C", audioDeviceManager.chooseAudioOutputDevice)

-- Bind media control
hs.hotkey.bind({"ctrl", "shift"}, "P", youtubeControl.togglePlayPause)

-- Bind hotkey display
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "H", function()
    hotkeyDisplay.showAllHotkeys(ctrlCmdShortcuts)
end)