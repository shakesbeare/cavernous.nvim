dofile("./build_palette.lua")

local lushwright = require("shipwright.transform.lush")
local cavernous = dofile("./src/cavernous/cavernous.lua") -- nixos messes with paths :(
run(cavernous,
    lushwright.to_lua,
    { patchwrite, "colors/cavernous.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" })

-- run(cavernous,
--     lushwright.extract_term_colors,
--     term_colors_to_alacritty_map,
--     contrib.alacritty,
--     { overwrite, "external/alaccritty.yml" })
