dofile("./build_palette.lua")

local lushwright = require("shipwright.transform.lush")
local cavernous = dofile("./src/cavernous/cavernous.lua") -- nixos messes with paths :(
run(cavernous,
    lushwright.to_lua,
    { patchwrite, "colors/cavernous.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" })
