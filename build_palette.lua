local COLUMN_WIDTH = 15
local palette = dofile("./src/cavernous/palette.lua") -- nixos messes with paths :(
local super_sort = require("palette_super_sort").super_sort

function string.starts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

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

local function retrieve_data(palette)
    local out = {}

    for k, v in pairs(palette) do
        local item = {
            color_name = k,
            hex = v.hex,
            hsl = {
                h = v.h,
                s = v.s,
                l = v.l,
            },
            rgb = {
                r = v.rgb.r,
                g = v.rgb.g,
                b = v.rgb.b,
            }
        }
        table.insert(out, item)
    end
    return out
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

local palette_data = super_sort(retrieve_data(palette))

-- put the data in y'all
for i, v in ipairs(palette_data) do
    -- color name
    local name_padding_required = COLUMN_WIDTH - v.color_name:len()
    local name_padding = string.rep(" ", name_padding_required)
    output = output .. v.color_name .. name_padding

    -- hex value
    local hex = v.hex
    local hex_padding_required = COLUMN_WIDTH - hex:len()
    local hex_padding = string.rep(" ", hex_padding_required)
    output = output .. hex .. hex_padding

    -- hsl value
    local hsl = format_triplet(v.hsl.h, v.hsl.s, v.hsl.l)
    local hsl_padding_required = COLUMN_WIDTH - hsl:len()
    local hsl_padding = string.rep(" ", hsl_padding_required)
    output = output .. hsl .. hsl_padding

    -- rgb value
    local rgb = format_triplet(v.rgb.r, v.rgb.g, v.rgb.b)
    output = output .. rgb

    output = output .. "\n"
end

local palette_file = vim.fn.expand("~") ..
    "/.dotfiles/nvim_config/lua/plugins/cavernous.nvim/PALETTE"

local file = assert(io.open(palette_file, "w"))
file:write(output)
file:close()
