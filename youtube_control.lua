local youtubeControl = {}

function youtubeControl.togglePlayPause()
    local script = [[
        tell application "Safari"
            set youtubeTab to missing value
            repeat with t in tabs of windows
                if (URL of t contains "youtube.com" or URL of t contains "music.youtube.com") then
                    set youtubeTab to t
                    exit repeat
                end if
            end repeat
            if youtubeTab is not missing value then
                set current tab of front window to youtubeTab
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
                " in youtubeTab
            end if
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