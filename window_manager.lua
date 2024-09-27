local windowManager = {}

function windowManager.maximizeWindow()
    local win = hs.window.focusedWindow()
    if not win then return end
    local screen = win:screen()
    local max = screen:frame()
    win:setFrame({
        x = max.x + 10,
        y = max.y + 10,
        w = max.w - 20,
        h = max.h - 20
    })
end

return windowManager