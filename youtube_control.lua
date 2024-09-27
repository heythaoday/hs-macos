local youtubeControl = {}

function youtubeControl.togglePlayPause()
    local script = [[
        tell application "Safari"
            do JavaScript "
                var video = document.querySelector('video');
                var title = document.title;
                if (video) {
                    if (video.paused) {
                        video.play();
                    } else {
                        video.pause();
                    }
                }
                title;
            " in front document
        end tell
    ]]

    local ok, result = hs.osascript.applescript(script)
    if ok then
        hs.alert.show("Toggled Play: " .. result)
    else
        hs.alert.show("Error toggling play/pause")
    end
end

return youtubeControl