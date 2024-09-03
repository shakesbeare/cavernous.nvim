local lushwright = require("shipwright.transform.lush")
local colorscheme = dofile("./lua/cavernous/cavernous.lua") -- nixos messes with paths :(
run(colorscheme,
  lushwright.to_lua,
  {patchwrite, "colors/cavernous.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE"})
