local lush = require('lush')
local p = require('src.cavernous.palette')

function test() 
    function inner() 
        print "hello world"
    end
end


-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {

    Cursor                                          { bg = p.white, fg = p.white.readable() }, -- Character under the cursor
    lCursor                                         { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM                                        { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
    TermCursor                                      { Cursor }, -- Cursor in a focused terminal.
    TermCursorNC                                    { Cursor }, -- Unfocused terminals do not have a cursor
    CurSearch                                       { bg = p.yellow, fg = p.jet_black }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    CursorColumn                                    { bg = p.gray2 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    ColorColumn                                     { bg = p.gray1, fg="None" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine                                      { bg = p.gray2 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory                                       { fg = p.bright_blue.lighten(20) }, -- Directory names (and other special names in listings)
    DiffAdd                                         { bg = p.bright_green.darken(80), fg = p.bright_green }, -- Diff mode: Added line |diff.txt|
    DiffChange                                      { bg = p.yellow.darken(80), fg = p.yellow }, -- Diff mode: Changed line |diff.txt|
    DiffDelete                                      { bg = p.red.darken(80), fg = p.red }, -- Diff mode: Deleted line |diff.txt|
    -- DiffText                                     { }, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer                                  { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    TermCursor                                      { bg = p.white, fg = p.jet_black }, -- Cursor in a focused terminal
    TermCursorNC                                    { bg = p.white, fg = p.jet_black }, -- Cursor in an unfocused terminal
    ErrorMsg                                        { fg = p.red }, -- Error messages on the command line
    WinSeparator                                    { fg = p.white }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    VertSplit                                       { WinSeparator }, -- Column separating vertically split windows
    Folded                                          { bg = p.gray5, fg = p.jet_black}, -- Line used for closed folds
    -- FoldColumn                                   { }, -- 'foldcolumn'
    -- SignColumn                                   { }, -- Column where |signs| are displayed
    IncSearch                                       { bg = p.yellow, fg = p.jet_black }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute                                      { bg = p.yellow, fg = p.jet_black }, -- |:substitute| replacement text highlighting
    Tabline                                         { },
    TablineFill                                     { },
    TablineSel                                      {},
    TablineActive                                   { fg = p.yellow, bold = true},
    TablineInactive                                 { bg="None" },
    TablineEnd                                      { bg="None" },
    NonText                                         { fg = p.gray2 },
    LineNr                                          { fg = p.gray2 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    IblScope                                        { fg = p.gray5, bold=false }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove                                  { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow                                  { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr                                    { fg = p.gray4 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold                               { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign                               { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen                                      { bg = p.gray4 }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg                                      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea                                      { }, -- Area for messages and cmdline
    -- MsgSeparator                                 { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    -- MoreMsg                                      { }, -- |more-prompt|
    -- NonText                                      { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal                                          { bg = "None", fg = p.blue }, -- Normal text
    NormalFloat                                     { Normal },
    -- FloatTitle                                   { }, -- Title of floating windows.
    -- NormalNC                                     { }, -- normal text in non-current windows
    -- Pmenu                                        { }, -- Popup menu: Normal item.
    PmenuSel                                        { fg = p.jet_black, bg = p.yellow }, -- Popup menu: Selected item.
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
    Visual                                          { bg = p.gray3 }, -- Visual mode selection
    -- VisualNOS                                    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    -- WarningMsg                                   { }, -- Warning messages
    -- Whitespace                                   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    -- WildMenu                                     { }, -- Current match in 'wildmenu' completion
    -- WinBar                                       { }, -- Window bar of current window
    -- WinBarNC                                     { }, -- Window bar of not-current windows
    Comment                                         { fg = p.gray5 }, -- Any comment
    Constant                                        { fg = p.faded_blue }, -- (*) Any constant
    String                                          { fg = p.green }, --   A string constant: "this is a string"
    Character                                       { fg = p.green }, --   A character constant: 'c', '\n'
    Number                                          { fg = p.faded_blue}, --   A number constant: 2          34, 0xff
    Boolean                                         { fg = p.bright_blue }, --   A boolean constant: TRUE, false
    Float                                           { fg = p.faded_blue }, --   A floating point constant: 2.3e10
    Identifier                                      { fg = p.blue }, -- (*) Any variable name
    Function                                        { fg = p.yellow }, --   Function name (also: methods for classes)
    -- Statement                                    { }, -- (*) Any statement
    Conditional                                     { fg = p.magenta }, --   if, then, else, endif, switch, etc.
    Repeat                                          { fg = p.magenta }, --   for, do, while, etc.
    Label                                           { fg = p.magenta }, --   case, default, etc.
    Operator                                        { fg = p.faded_blue }, --   "sizeof", "+", "*", etc.
    Keyword                                         { fg = p.magenta }, --   any other keyword
    Exception                                       { fg = p.red }, --   try, catch, throw
    -- PreProc                                      { }, -- (*) Generic Preprocessor
    -- Include                                      { }, --   Preprocessor #include
    Define                                          { fg = p.orange }, --   Preprocessor #define
    Macro                                           { fg = p.orange }, --   Same as Define
    -- PreCondit                                    { }, --   Preprocessor #if, #else, #endif, etc.
    Type                                            { fg = p.bright_blue }, -- (*) int, long, char, etc.
    -- StorageClass                                 { }, --   static, register, volatile, etc.
    -- Structure                                    { }, --   struct, union, enum, etc.
    -- Typedef                                      { }, --   A typedef
    Special                                         { fg = p.bright_blue, bold = true }, -- (*) Any special symbol
    -- SpecialChar                                  { }, --   Special character in a constant
    -- Tag                                          { }, --   You can use CTRL-] on this
    Delimiter                                       { fg = p.white }, --   Character that needs attention
    -- SpecialComment                               { }, --   Special things inside a comment (e.g. '\n')
    -- Debug                                        { }, --   Debugging statements
    -- Underlined                                   { gui = "underline" }, -- Text that stands out, HTML links
    -- Ignore                                       { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    -- Error                                        { }, -- Any erroneous construct
    Todo                                            { fg = p.bright_green, bg = p.bright_green.darken(80), bold = true, }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    DiagnosticError                                 { fg = p.red, bg = p.red.darken(90) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn                                  { fg = p.yellow, bg = p.yellow.darken(90) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo                                  { fg = p.blue, bg = p.blue.darken(90) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint                                  { fg = p.magenta, bg = p.magenta.darken(90) } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk                                    { fg = p.yellow, bg = "None" } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticUnderlineError                        { DiagnosticError, undercurl = true } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn                         { DiagnosticWarn, undercurl = true } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo                         { DiagnosticInfo, undercurl = true } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint                         { DiagnosticHint, undercurl = true } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk                           { DiagnosticOk, undercurl = true } , -- Used to underline "Ok" diagnostics.
    DiagnosticUnnecessary                           { DiagnosticUnderlineHint },
    manSectionHeading                               { fg=p.white, bg=p.white.darken(90) },
    manOptionDesc                                   { fg=p.green },
    TreesitterContext                               { bg="None" },
    TreesitterContextLineNumber                     { LineNr, fg=p.gray2 },
    TreesitterContextBottom                         { bg="None" },
    TreesitterContextBottomLineNumber               { fg=p.gray3, bg="None" },
    TreesitterContextSeparator                      { fg=p.gray3 },
    sym"@text.todo"                                 { Todo },
    sym"@constant.macro"                            { fg = p.orange }, -- Define
    sym"@variable"                                  { Identifier }, -- Identifier
    sym"@namespace"                                 { fg = p.orange }, -- Identifier
    sym"@module"                                    { fg = p.orange },
    sym"@lsp.typemod.comment.documentation.rust"    { fg = p.orange.darken(15) },
    sym"@comment.documentation.rust"                { fg = p.orange.darken(15) },
    sym"@function.macro.rust"                       { fg = p.orange },
    sym"@lsp.type.decorator.rust"                   { fg = p.orange },
    sym"@lsp.typemod.decorator.attribute.rust"      { fg = p.orange },
    sym"@lsp.typemod.decorator.defaultLibrary.rust" { fg = p.orange },
    sym"@lsp.typemod.decorator.library.rust"        { fg = p.orange },
    sym"@variable.builtin.rust"                     { fg = p.red, bold = true },
    sym"@type.builtin.rust"                         { Type },
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
