--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  local background = hsl(0, 0, 10)
  local text = hsl(50, 5, 50)
  local text_muted = hsl(0, 0, 30)
  local text_emphasis = hsl(0, 0, 75)

  local red = hsl(0, 70, 70)
  local orange = hsl(30, 60, 55)
  local yellow = hsl(40, 60, 55)
  local green = hsl(127, 20, 60)
  local blue = hsl(220, 50, 70)
  local violet = hsl(260, 35, 70)

  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn    { }, -- Columns set with 'colorcolumn'
    Conceal        { fg=text }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor         { }, -- Character under the cursor
    -- CurSearch      { }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
    -- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
    -- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine     { bg=background.lighten(5) }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory      { fg=blue }, -- Directory names (and other special names in listings)
    DiffAdd        { fg=green }, -- Diff mode: Added line |diff.txt|
    DiffChange     { fg=orange }, -- Diff mode: Changed line |diff.txt|
    DiffDelete     { fg=red }, -- Diff mode: Deleted line |diff.txt|
    DiffText       { fg=orange, gui='underline' }, -- Diff mode: Changed text within a changed line |diff.txt|
    diffAdded      { DiffAdd },
    diffRemoved    { DiffDelete },
    -- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor     { }, -- Cursor in a focused terminal
    -- TermCursorNC   { }, -- Cursor in an unfocused terminal
    ErrorMsg       { fg=hsl(0, 0, 0), bg=red.darken(10) }, -- Error messages on the command line
    VertSplit      { fg=text_muted }, -- Column separating vertically split windows
    Folded         { fg=text }, -- Line used for closed
    FoldColumn     { }, -- 'foldcolumn'
    SignColumn     { }, -- Column where |signs| are displayed
    -- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute     { }, -- |:substitute| replacement text highlighting
    LineNr         { fg=text_muted }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    -- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
    -- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr   { fg=orange, CursorLine }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    -- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
    -- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
    MatchParen     { fg=hsl(0, 0, 0), bg=background.lighten(40), gui='bold' }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg        { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea        { }, -- Area for messages and cmdline
    -- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg        { fg=green }, -- |more-prompt|
    NonText        { fg=text_muted }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal         { fg=text_emphasis, bg=background }, -- Normal text
    NormalFloat    { fg=text_emphasis, bg=background.lighten(5) }, -- Normal text in floating windows.
    FloatBorder    { fg=text_muted }, -- Border of floating windows.
    -- FloatTitle     { }, -- Title of floating windows.
    -- NormalNC       { }, -- normal text in non-current windows
    Pmenu          { }, -- Popup menu: Normal item.
    PmenuSel       { fg=text_muted.darken(50), bg=background.lighten(40) }, -- Popup menu: Selected item.
    PmenuKind      { Pmenu }, -- Popup menu: Normal item "kind"
    PmenuKindSel   { PmenuSel }, -- Popup menu: Selected item "kind"
    PmenuExtra     { Pmenu }, -- Popup menu: Normal item "extra text"
    PmenuExtraSel  { PmenuSel }, -- Popup menu: Selected item "extra text"
    PmenuSbar      { }, -- Popup menu: Scrollbar.
    PmenuThumb     { bg=green }, -- Popup menu: Thumb of the scrollbar.
    Question       { fg=green }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine   { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search         { fg=hsl(0, 0, 0), bg=yellow }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    SpecialKey     { fg=text_muted }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad       { fg=red, gui='underline' }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap       { fg=violet, gui='underline' }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal     { fg=orange, gui='underline' }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare      { fg=yellow, gui='underline' }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine     { bg=background.darken(20) }, -- Status line of current window
    StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine        { }, -- Tab pages line, not active tab page label
    TabLineFill    { }, -- Tab pages line, where there are no labels
    TabLineSel     { fg=green, bg=background.lighten(10) }, -- Tab pages line, active tab page label
    Title          { fg=violet }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual         { bg=background.lighten(20) }, -- Visual mode selection
    -- VisualNOS      { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg     { fg=red }, -- Warning messages
    -- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator   { VertSplit }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    WildMenu       { Search }, -- Current match in 'wildmenu' completion
    -- WinBar         { }, -- Window bar of current window
    -- WinBarNC       { }, -- Window bar of not-current windows

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg=text }, -- Any comment

    Constant       { fg=yellow }, -- (*) Any constant
    String         { fg=green.lighten(10).saturate(-40) }, --   A string constant: "this is a string"
    Character      { String }, --   A character constant: 'c', '\n'
    Number         { fg=violet }, --   A number constant: 234, 0xff
    Boolean        { fg=violet }, --   A boolean constant: TRUE, false
    -- Float          { }, --   A floating point constant: 2.3e10

    Identifier     { fg=text_emphasis }, -- (*) Any variable name
    Function       { fg=green }, --   Function name (also: methods for classes)

    Statement      { fg=violet }, -- (*) Any statement
    -- Conditional    { }, --   if, then, else, endif, switch, etc.
    Repeat         { fg=blue }, --   for, do, while, etc.
    -- Label          { }, --   case, default, etc.
    Operator       { fg=red }, --   "sizeof", "+", "*", etc.
    -- Keyword        { }, --   any other keyword
    -- Exception      { }, --   try, catch, throw

    PreProc        { fg=orange }, -- (*) Generic Preprocessor
    -- Include        { }, --   Preprocessor #include
    -- Define         { }, --   Preprocessor #define
    -- Macro          { }, --   Same as Define
    -- PreCondit      { }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg=green.rotate(65).lighten(10) }, -- (*) int, long, char, etc.
    -- StorageClass   { }, --   static, register, volatile, etc.
    -- Structure      { }, --   struct, union, enum, etc.
    -- Typedef        { }, --   A typedef

    Special        { fg=violet }, -- (*) Any special symbol
    -- SpecialChar    { }, --   Special character in a constant
    -- Tag            { }, --   You can use CTRL-] on this
    Delimiter      { }, --   Character that needs attention
    -- SpecialComment { }, --   Special things inside a comment (e.g. '\n')
    -- Debug          { }, --   Debugging statements

    -- Underlined     { }, -- Text that stands out, HTML links
    -- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { fg=red, }, -- Any erroneous construct
    Todo           { fg=violet }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    DiagnosticError               { fg=red } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticWarn                { fg=orange } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticInfo                { fg=blue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticHint                { fg=text_emphasis } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticOk                  { fg=green } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    DiagnosticVirtualTextError    { DiagnosticError } , -- Used for "Error" diagnostic virtual text.
    DiagnosticVirtualTextWarn     { DiagnosticWarn } , -- Used for "Warn" diagnostic virtual text.
    DiagnosticVirtualTextInfo     { DiagnosticInfo } , -- Used for "Info" diagnostic virtual text.
    DiagnosticVirtualTextHint     { DiagnosticHint } , -- Used for "Hint" diagnostic virtual text.
    DiagnosticVirtualTextOk       { DiagnosticOk   } , -- Used for "Ok" diagnostic virtual text.
    DiagnosticUnderlineError      { sp=DiagnosticError.fg, gui='undercurl' } , -- Used to underline "Error" diagnostics.
    DiagnosticUnderlineWarn       { sp=DiagnosticWarn.fg, gui='undercurl' } , -- Used to underline "Warn" diagnostics.
    DiagnosticUnderlineInfo       { sp=DiagnosticInfo.fg, gui='underline' } , -- Used to underline "Info" diagnostics.
    DiagnosticUnderlineHint       { sp=DiagnosticHint.fg, gui='underline' } , -- Used to underline "Hint" diagnostics.
    DiagnosticUnderlineOk         { sp=DiagnosticOk.fg, gui='underline' } , -- Used to underline "Ok" diagnostics.
    DiagnosticFloatingError       { DiagnosticError } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    DiagnosticFloatingWarn        { DiagnosticWarn } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    DiagnosticFloatingInfo        { DiagnosticInfo } , -- Used to color "Info" diagnostic messages in diagnostics float.
    DiagnosticFloatingHint        { DiagnosticHint } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticFloatingOk          { DiagnosticOk } , -- Used to color "Ok" diagnostic messages in diagnostics float.
    DiagnosticSignError           { DiagnosticError } , -- Used for "Error" signs in sign column.
    DiagnosticSignWarn            { DiagnosticWarn } , -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo            { DiagnosticInfo } , -- Used for "Info" signs in sign column.
    DiagnosticSignHint            { DiagnosticHint } , -- Used for "Hint" signs in sign column.
    DiagnosticSignOk              { DiagnosticOk } , -- Used for "Ok" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    -- sym"@text.todo"         { }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@punctuation.bracket" { },
    sym"@punctuation.special"  { fg=blue },
    sym"@punctuation.delimiter"{ fg=red.lighten(30) },
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    sym"@include"              { PreProc },
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    sym"@function"             { Type }, -- Function
    sym"@function.builtin"     { fg=orange, gui='italic' }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    sym"@parameter"            { Identifier }, -- Identifier
    sym"@method"               { Function }, -- Function
    sym"@nospell"              { Todo }, -- Todo
    sym"@field"                { Identifier }, -- Identifier
    sym"@property"             { Identifier }, -- Identifier
    sym"@property.scss"        { fg=blue }, -- Identifier
    sym"@constructor"          { fg=orange }, -- Special
    sym"@conditional"          { fg=blue }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    sym"@operator"             { fg=red.lighten(30) }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    sym"@keyword.gitcommit"    { fg=orange }, -- Keyword
    sym"@keyword.scss"         { fg=green }, -- Keyword
    sym"@keyword.operator"     { fg=blue }, -- Keyword
    sym"@keyword.coroutine"    { fg=red },
    sym"@keyword.return"       { fg=red },
    sym"@exception"            { fg=red }, -- Exception
    sym"@variable"             { Identifier }, -- Identifier
    sym"@variable.builtin"     { fg=yellow, gui='italic' }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { fg=violet }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    sym"@tag"                  { fg=yellow }, -- Tag
    sym"@tag.delimiter"        { fg=blue },
    sym"@tag.attribute"        { fg=violet },


    -- Fugitive
    fugitiveHeader             { fg=orange },
    fugitiveStagedHeading      { Type },
    fugitiveStagedModifier     { Type },
    fugitiveUnstagedHeading    { fg=red },
    fugitiveUnstagedModifier   { fg=red },

    -- NerdTree
    NERDTreeOpenable        { fg=green },
    NERDTreeClosable        { fg=orange },

    -- CoC.nvim
    CocSearch               { fg=green },

    -- NVIM-Dap
    DapUIFloatBorder        { FloatBorder },
    DapUIWatchesEmpty       { fg=text_emphasis },
    DapUIWatchesError       { fg=red },
    DapUIWatchesValue       { fg=green },
    DapUISource             { fg=violet },
    DapUIType               { fg=violet },
    DapUIBreakpointsCurrentLine { fg=green },
    DapUILineNumber         { fg=blue },
    DapUIDecoration         { fg=blue },
    DapUIStoppedThread      { fg=green },
    DapUIThread             { fg=text_emphasis },
    DapUIScope              { fg=orange },
    DapUIBreakpointsPath    { fg=orange },
    DapUIStepOver           { fg=blue },
    DapUIStepInto           { fg=blue },
    DapUIStepBack           { fg=blue },
    DapUIStepOut            { fg=blue },
    DapUIStop               { fg=red },
    DapUIPlayPause          { fg=green },
    DapUIRestart            { fg=green },
    DapUIUnavailable        {},
    DapUIWinSelect          { fg=blue },
    DapUIEndofBuffer        {},
    DapUINormalNC           {},
    DapUIPlayPauseNC        { fg=green },
    DapUIRestartNC          { fg=green },
    DapUIStopNC             { fg=red },
    DapUIUnavailableNC      {},
    DapUIStepOverNC         {},
    DapUIStepIntoNC         {},
    DapUIStepBackNC         {},
    DapUIStepOutNC          {},
    DapUIModifiedValue      { fg=yellow },

    -- Neotest
    NeotestAdapterName      { fg=red },
    NeotestDir              { fg=blue },
    NeotestFile             { fg=orange },
    NeotestTest             { fg=violet },
    NeotestRunning          { fg=yellow, gui='bold' },
    NeotestPassed           { fg=green, gui='bold' },
}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
