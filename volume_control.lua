local volumeControl = {}
local alertStyle = require("ui/alert_style")

local function showVolumePopover(volume)
    hs.alert.show("Volume: " .. math.floor(volume) .. "%", alertStyle)
end

function volumeControl.volumeDown()
    local device = hs.audiodevice.defaultOutputDevice()
    local currentVolume = device:volume()
    local newVolume = math.max(0, currentVolume - 5)
    device:setVolume(newVolume)
    showVolumePopover(newVolume)
end

function volumeControl.volumeUp()
    local device = hs.audiodevice.defaultOutputDevice()
    local currentVolume = device:volume()
    local newVolume = math.min(100, currentVolume + 5)
    device:setVolume(newVolume)
    showVolumePopover(newVolume)
end

return volumeControl