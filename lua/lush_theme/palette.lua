local hsl = require('lush').hsl

local colors = {
    black             = hsl(0, 0, 0),
    gray1             = hsl(0, 0, 15),
    gray2             = hsl(0, 0, 30),
    gray3             = hsl(0, 0, 45),
    gray4             = hsl(0, 0, 60),
    gray5             = hsl(0, 0, 75),
    white             = hsl(0, 0, 90),
    red               = hsl(0, 100, 75),
    orange            = hsl(30, 100, 75),
    yellow            = hsl(65, 75, 75),
    green             = hsl(120, 100, 75),
    light_blue        = hsl(200, 100, 85),
    blue              = hsl(208, 100, 75),
    purple            = hsl(280, 100, 75),
    slate             = hsl(249, 15, 28),
    lightest_blue     = hsl(200, 65, 80),
    strong_green      = hsl(100, 85, 50),
}

return colors
