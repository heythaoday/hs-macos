local audioDeviceManager = {}
local alertStyle = require("ui/alert_style")

function audioDeviceManager.chooseAudioOutputDevice()
    local devices = hs.audiodevice.allOutputDevices()
    local choices = {}

    for i, device in ipairs(devices) do
        table.insert(choices, {
            ["text"] = device:name(),
            ["subText"] = device:transportType(),
            ["uid"] = device:uid()
        })
    end

    local chooser = hs.chooser.new(function(choice)
        if not choice then return end
        local selectedDevice = hs.audiodevice.findOutputByUID(choice["uid"])
        if selectedDevice then
            selectedDevice:setDefaultOutputDevice()
            hs.alert.show("Switched to: " .. selectedDevice:name(), alertStyle)
        end
    end)

    chooser:choices(choices)
    chooser:show()
end

return audioDeviceManager