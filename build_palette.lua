local COLUMN_WIDTH = 15
local palette = dofile("./src/cavernous/palette.lua") -- nixos messes with paths :(

local function format_number(number)
    local max_length = 3
    local number = tostring(number)
    for i = 1, (max_length - number:len()) do
        number = "0" .. number
    end
    return number
end

local function format_triplet(a, b, c)
    return format_number(a) .. "," .. format_number(b) .. "," .. format_number(c)
end

local output = ""

local headers = {
    "COLOR", "HEX", "HSL", "RGB"
}

-- add headers
for i, v in ipairs(headers) do
    local padding_required = COLUMN_WIDTH - v:len()
    local padding = string.rep(" ", padding_required)
    output = output .. v .. padding
end

-- prepare for data
output = output .. "\n"

-- put the data in y'all
for k, v in pairs(palette) do
    -- color name
    local name_padding_required = COLUMN_WIDTH - k:len()
    local name_padding = string.rep(" ", name_padding_required)
    output = output .. k .. name_padding

    -- hex value
    local hex = v.hex
    local hex_padding_required = COLUMN_WIDTH - hex:len()
    local hex_padding = string.rep(" ", hex_padding_required)
    output = output .. hex .. hex_padding

    -- hsl value
    local hsl = format_triplet(v.h, v.s, v.l)
    local hsl_padding_required = COLUMN_WIDTH - hsl:len()
    local hsl_padding = string.rep(" ", hsl_padding_required)
    output = output .. hsl .. hsl_padding

    -- rgb value
    local rgb = v.rgb
    local rgb = format_triplet(rgb.r, rgb.g, rgb.b)
    output = output .. rgb

    output = output .. "\n"
end

local palette_file = vim.fn.expand("~") ..
    "/.dotfiles/nvim_config/lua/plugins/cavernous.nvim/PALETTE"

local file = assert(io.open(palette_file, "w"))
file:write(output)
file:close()
