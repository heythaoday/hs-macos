local volumeControl = {}

local function showVolumePopover(volume)
    hs.notify.new({
        title = "Volume Control",
        informativeText = "Volume: " .. math.floor(volume) .. "%",
        autoWithdraw = true,
        withdrawAfter = 3
    }):send()
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