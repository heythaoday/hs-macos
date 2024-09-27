local canvas = {}

-- Function to create and return a canvas
function canvas.createCanvas(list)
    local screenFrame = hs.screen.mainScreen():frame()
    local canvas = hs.canvas.new{
        x = screenFrame.x + screenFrame.w * 0.1,
        y = screenFrame.y + screenFrame.h * 0.1,
        w = screenFrame.w * 0.8,
        h = screenFrame.h * 0.8
    }

    canvas:appendElements({
        -- Blurred background
        type = "rectangle",
        action = "fill",
        fillColor = {alpha = 0.75, hex = "#000000"},
        frame = {x = "0%", y = "0%", w = "100%", h = "100%"},
        withShadow = true,
        shadow = {
            blurRadius = 20,
            offset = {h = 0, w = 0},
            color = {alpha = 0.5, hex = "#000000"}
        }
    }, {
        -- Text element
        type = "text",
        text = list,
        textFont = "IBM Plex Mono",  -- Set your custom font here
        textSize = 18,
        textColor = {hex = "#FFFFFF"},
        textAlignment = "left",
        frame = {x = "5%", y = "5%", w = "90%", h = "90%"}
    })

    return canvas
end

return canvas