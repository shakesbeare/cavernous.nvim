--- From tokyonight --  Author: Folke -- Thanks Folke!
local function hexToRgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

local function blend(foreground, background, alpha)
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local bg = hexToRgb(background)
	local fg = hexToRgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

local function darken(hex, amount, bg)
	return blend(hex, bg or "#000000", amount)
end

local lush = require('lush')
local hsl = lush.hsl
local p = require('cavernous.palette')


-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {

    Cursor                                          { bg = p.white, fg = p.black }, -- Character under the cursor
    CurSearch                                       { bg = p.yellow, fg = p.black }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    lCursor                                         { bg = p.white, fg = p.black }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM                                        { bg = p.white, fg = p.black }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn                                    { bg = p.gray3 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine                                      { bg = p.gray3 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory                                       { fg = p.blue.darken(-20) }, -- Directory names (and other special names in listings)
    DiffAdd                                         { bg = p.strong_green.darken(80), fg = p.strong_green }, -- Diff mode: Added line |diff.txt|
    DiffChange                                      { bg = p.yellow.darken(80), fg = p.yellow }, -- Diff mode: Changed line |diff.txt|
    DiffDelete                                      { bg = p.red.darken(80), fg = p.red }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText                                     { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer                                  { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor                                      { bg = p.white, fg = p.black }, -- Cursor in a focused terminal
    TermCursorNC                                    { bg = p.white, fg = p.black }, -- Cursor in an unfocused terminal
    ErrorMsg                                        { fg = p.red }, -- Error messages on the command line
    VertSplit                                       { fg = p.gray5 }, -- Column separating vertically split windows
    Folded                                          { bg = p.gray5, fg = p.black}, -- Line used for closed folds
    -- FoldColumn                                   { }, -- 'foldcolumn'
    -- SignColumn                                   { }, -- Column where |signs| are displayed
    IncSearch                                       { bg = p.yellow, fg = p.black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute                                      { bg = p.yellow, fg = p.black }, -- |:substitute| replacement text highlighting
    -- LineNr                                       { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove                                  { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow                                  { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    -- CursorLineNr                                 { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold                               { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign                               { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    -- MatchParen                                   { }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg                                      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea                                      { }, -- Area for messages and cmdline
    -- MsgSeparator                                 { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg                                      { }, -- |more-prompt|
    -- NonText                                      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal                                          { bg = "None", fg = p.light_blue }, -- Normal text
    -- FloatTitle                                   { }, -- Title of floating windows.
    -- NormalNC                                     { }, -- normal text in non-current windows
    -- Pmenu                                        { }, -- Popup menu: Normal item.
    PmenuSel                                     { fg = p.black, bg = p.yellow }, -- Popup menu: Selected item.
    -- PmenuKind                                    { }, -- Popup menu: Normal item "kind"
    -- PmenuKindSel                                 { }, -- Popup menu: Selected item "kind"
    -- PmenuExtra                                   { }, -- Popup menu: Normal item "extra text"
    -- PmenuExtraSel                                { }, -- Popup menu: Selected item "extra text"
    -- PmenuSbar                                    { }, -- Popup menu: Scrollbar.
    -- PmenuThumb                                   { }, -- Popup menu: Thumb of the scrollbar.
    -- Question                                     { }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine                                 { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    -- Search                                       { }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey                                   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad                                     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap                                     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal                                   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare                                    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine                                   { bg = "None" }, -- Status line of current window
    StatusLineNC                                 { bg = p.gray1 }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine                                      { }, -- Tab pages line, not active tab page label
    -- TabLineFill                                  { }, -- Tab pages line, where there are no labels
    -- TabLineSel                                   { }, -- Tab pages line, active tab page label
    -- Title                                        { }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual                                          { bg = p.gray2 }, -- Visual mode selection
    -- VisualNOS                                    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg                                   { }, -- Warning messages
    -- Whitespace                                   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- Winseparator                                 { }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu                                     { }, -- Current match in 'wildmenu' completion
    -- WinBar                                       { }, -- Window bar of current window
    -- WinBarNC                                     { }, -- Window bar of not-current windows
    Comment                                         { fg = p.gray5 }, -- Any comment
    Constant                                        { fg = p.lightest_blue }, -- (*) Any constant
    String                                          { fg = p.green }, --   A string constant: "this is a string"
    Character                                       { fg = p.green }, --   A character constant: 'c', '\n'
    Number                                          { fg = p.lightest_blue}, --   A number constant: 2          34, 0xff
    Boolean                                         { fg = p.blue }, --   A boolean constant: TRUE, false
    Float                                           { fg = p.lightest_blue }, --   A floating point constant: 2.3e10
    Identifier                                      { fg = p.light_blue }, -- (*) Any variable name
    Function                                        { fg = p.yellow }, --   Function name (also: methods for classes)
    -- Statement                                    { }, -- (*) Any statement
    Conditional                                     { fg = p.purple }, --   if, then, else, endif, switch, etc.
    Repeat                                          { fg = p.purple }, --   for, do, while, etc.
    Label                                           { fg = p.purple }, --   case, default, etc.
    Operator                                        { fg = p.lightest_blue }, --   "sizeof", "+", "*", etc.
    Keyword                                         { fg = p.purple }, --   any other keyword
    Exception                                       { fg = p.red }, --   try, catch, throw
    -- PreProc                                      { }, -- (*) Generic Preprocessor
    -- Include                                      { }, --   Preprocessor #include
    Define                                          { fg = p.orange }, --   Preprocessor #define
    Macro                                           { fg = p.orange }, --   Same as Define
    -- PreCondit                                    { }, --   Preprocessor #if, #else, #endif, etc.
    Type                                            { fg = p.blue }, -- (*) int, long, char, etc.
    -- StorageClass                                 { }, --   static, register, volatile, etc.
    -- Structure                                    { }, --   struct, union, enum, etc.
    -- Typedef                                      { }, --   A typedef
    Special                                         { fg = p.blue, bold = true }, -- (*) Any special symbol
    -- SpecialChar                                  { }, --   Special character in a constant
    -- Tag                                          { }, --   You can use CTRL-] on this
    Delimiter                                       { fg = p.white }, --   Character that needs attention
    -- SpecialComment                               { }, --   Special things inside a comment (e.g. '\n')
    -- Debug                                        { }, --   Debugging statements
    -- Underlined                                   { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore                                       { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error                                        { }, -- Any erroneous construct
    Todo                                            { fg = p.strong_green, bg = p.strong_green.darken(85), bold = true, }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    -- LspReferenceText                             { } , -- Used for highlighting "text" references
    -- LspReferenceRead                             { } , -- Used for highlighting "read" references
    -- LspReferenceWrite                            { } , -- Used for highlighting "write" references
    -- LspCodeLens                                  { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator                         { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter                  { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
    DiagnosticError                                 { fg = p.red, bg = p.red.darken(90) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn                                  { fg = p.yellow, bg = p.yellow.darken(90) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo                                  { fg = p.light_blue, bg = p.light_blue.darken(90) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint                                  { fg = p.purple, bg = p.purple.darken(90) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk                                    { fg = p.yellow, bg = "None" } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError                   { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn                    { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo                    { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint                    { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticVirtualTextOk                      { } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError                        { DiagnosticError, undercurl = true } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn                         { DiagnosticWarn, undercurl = true } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo                         { DiagnosticInfo, undercurl = true } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint                         { DiagnosticHint, undercurl = true } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk                           { DiagnosticOk, undercurl = true } , -- Used to underline "Ok" diagnostics.
    -- DiagnosticFloatingError                      { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn                       { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo                       { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint                       { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingOk                         { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    -- DiagnosticSignError                          { } , -- Used for "Error" signs in sign column.
    -- DiagnosticSignWarn                           { } , -- Used for "Warn" signs in sign column.
    -- DiagnosticSignInfo                           { } , -- Used for "Info" signs in sign column.
    -- DiagnosticSignHint                           { } , -- Used for "Hint" signs in sign column.
    -- DiagnosticSignOk                             { } , -- Used for "Ok" signs in sign column.
    -- sym"@text.literal"                           { }, -- Comment
    -- sym"@text.reference"                         { }, -- Identifier
    -- sym"@text.title"                             { }, -- Title
    -- sym"@text.uri"                               { }, -- Underlined
    -- sym"@text.underline"                         { }, -- Underlined
    sym"@text.todo"                                 { link = "Todo" }, -- Todo
    -- sym"@comment"                                { }, -- Comment
    -- sym"@punctuation"                            { }, -- Delimiter
    -- sym"@constant"                               { }, -- Constant
    -- sym"@constant.builtin"                       { }, -- Special
    sym"@constant.macro"                            { fg = p.orange }, -- Define
    -- sym"@define"                                 { }, -- Define
    -- sym"@macro"                                  { }, -- Macro
    -- sym"@string"                                 { }, -- String
    -- sym"@string.escape"                          { }, -- SpecialChar
    -- sym"@string.special"                         { }, -- SpecialChar
    -- sym"@character"                              { }, -- Character
    -- sym"@character.special"                      { }, -- SpecialChar
    -- sym"@number"                                 { }, -- Number
    -- sym"@boolean"                                { }, -- Boolean
    -- sym"@float"                                  { }, -- Float
    -- sym"@function"                               { }, -- Function
    -- sym"@function.builtin"                       { }, -- Special
    -- sym"@function.macro"                         { }, -- Macro
    -- sym"@parameter"                              { }, -- Identifier
    -- sym"@method"                                 { }, -- Function
    -- sym"@field"                                  { }, -- Identifier
    -- sym"@property"                               { }, -- Identifier
    -- sym"@constructor"                            { }, -- Special
    -- sym"@conditional"                            { }, -- Conditional
    -- sym"@repeat"                                 { }, -- Repeat
    -- sym"@label"                                  { }, -- Label
    -- sym"@operator"                               { }, -- Operator
    -- sym"@keyword"                                { }, -- Keyword
    -- sym"@exception"                              { }, -- Exception
    sym"@variable"                                  { link = p.Identifier }, -- Identifier
    -- sym"@type"                                   { }, -- Type
    -- sym"@type.definition"                        { }, -- Typedef
    -- sym"@storageclass"                           { }, -- StorageClass
    -- sym"@structure"                              { }, -- Structure
    sym"@namespace"                                 { fg = p.orange }, -- Identifier
    sym"@module"                                    { fg = p.orange },
    -- sym"@include"                                { }, -- Include
    -- sym"@preproc"                                { }, -- PreProc
    -- sym"@debug"                                  { }, -- Debug
    -- sym"@tag"                                    { }, -- Tag
    sym"@lsp.typemod.comment.documentation.rust"    { fg = p.orange.darken(15) },
    sym"@comment.documentation.rust"                { fg = p.orange.darken(15) },
    sym"@function.macro.rust"                       { fg = p.orange },
    sym"@lsp.type.decorator.rust"                   { fg = p.orange },
    sym"@lsp.typemod.decorator.attribute.rust"      { fg = p.orange },
    sym"@lsp.typemod.decorator.defaultLibrary.rust" { fg = p.orange },
    sym"@lsp.typemod.decorator.library.rust"        { fg = p.orange },
    sym"@variable.builtin.rust"                     { fg = p.red, bold = true },
    sym"@type.builtin.rust"                         { link = "Type" },
    sym"@lsp.type.selfKeyword.rust"                 { fg = p.red, bold = true },
    sym"@lsp.typemod.selfKeyword.declaration.rust"  { fg = p.red, bold = true },
    sym"@lsp.typemod.selfKeyword.reference.rust"    { fg = p.red, bold = true },
    sym"@lsp.typemod.variable.mutable.rust"         { underline = true },
    sym"@lsp.typemod.selfKeyword.mutable.rust"      { underline = true },

}

end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
