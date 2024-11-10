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

function windowManager.resizeToFullHD()
    local win = hs.window.focusedWindow()
    if not win then return end
    local screen = win:screen()
    local max = screen:frame()
    
    -- Calculate center position
    local x = max.x + (max.w - 1920) / 2
    local y = max.y + (max.h - 1080) / 2
    
    win:setFrame({
        x = x,
        y = y,
        w = 1920,
        h = 1080
    })
end

function windowManager.resizeToFullHD34()
    local win = hs.window.focusedWindow()
    if not win then return end
    local screen = win:screen()
    local max = screen:frame()
    
    local height = 1080
    local width = 1920 * 3 / 4
    
    -- Calculate center position
    local x = max.x + (max.w - width) / 2
    local y = max.y + (max.h - height) / 2
    
    win:setFrame({
        x = x,
        y = y,
        w = width,
        h = height
    })
end

return windowManager