" File:       monokai.vim
" Maintainer: Crusoe Xia (crusoexia)
" URL:        https://github.com/crusoexia/vim-monokai
" License:    MIT
"
" The colour palette is from http://www.colourlovers.com/
" The original code is from https://github.com/w0ng/vim-hybrid

" Initialisation
" --------------

if !has("gui_running") && &t_Co < 256
  finish
endif

if ! exists("g:monokai_gui_italic")
    let g:monokai_gui_italic = 1
endif

if ! exists("g:monokai_term_italic")
    let g:monokai_term_italic = 0
endif

let g:monokai_termcolors = 256 " does not support 16 color term right now.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "monokai"

function! s:h(group, style)
  let s:ctermformat = "NONE"
  let s:guiformat = "NONE"
  if has_key(a:style, "format")
    let s:ctermformat = a:style.format
    let s:guiformat = a:style.format
  endif
  if g:monokai_term_italic == 0
    let s:ctermformat = substitute(s:ctermformat, ",italic", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic,", "", "")
    let s:ctermformat = substitute(s:ctermformat, "italic", "", "")
  endif
  if g:monokai_gui_italic == 0
    let s:guiformat = substitute(s:guiformat, ",italic", "", "")
    let s:guiformat = substitute(s:guiformat, "italic,", "", "")
    let s:guiformat = substitute(s:guiformat, "italic", "", "")
  endif
  if g:monokai_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")      ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")      ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")      ? a:style.sp.gui   : "NONE")
    \ "gui="     (!empty(s:guiformat) ? s:guiformat   : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (!empty(s:ctermformat) ? s:ctermformat   : "NONE")
endfunction

" Palettes
" --------


let s:white       = { "gui": "#BABAB1", "cterm": "145" }
let s:black       = { "gui": "#2C3037", "cterm": "23" }
let s:lightblack  = { "gui": "#2D2E27", "cterm": "235" }
let s:lightblack2 = { "gui": "#383a3e", "cterm": "236" }
let s:darkblack   = { "gui": "#26292F", "cterm": "16" }
let s:darkerblack = { "gui": "#1E2024", "cterm": "16" }
let s:grey        = { "gui": "#4B5261", "cterm": "59" }
let s:lightgrey   = { "gui": "#9CA3B2", "cterm": "145" }
let s:darkgrey    = { "gui": "#64645e", "cterm": "239" }
let s:warmgrey    = { "gui": "#676E7B", "cterm": "60" }

let s:pink        = { "gui": "#E06C75", "cterm": "168" }
let s:green       = { "gui": "#98C379", "cterm": "114" }
let s:aqua        = { "gui": "#56b6c2", "cterm": "73" }
let s:yellow      = { "gui": "#E5C07B", "cterm": "180" }
let s:orange      = { "gui": "#D19A66", "cterm": "173" }
let s:purple      = { "gui": "#C678DD", "cterm": "176" }
let s:red         = { "gui": "#BE5046", "cterm": "131" }
let s:darkred     = { "gui": "#5f0000", "cterm": "52" }

let s:addfg       = { "gui": "#d7ffaf", "cterm": "193" }
let s:addbg       = { "gui": "#5f875f", "cterm": "65" }
let s:delbg       = { "gui": "#f75f5f", "cterm": "167" }
let s:changefg    = { "gui": "#d7d7ff", "cterm": "189" }
let s:changebg    = { "gui": "#5f5f87", "cterm": "60" }

" Highlighting 
" ------------

" editor
call s:h("Normal",        { "fg": s:white,      "bg": s:black })
call s:h("ColorColumn",   {                     "bg": s:darkblack})
call s:h("Cursor",        { "fg": s:black,      "bg": s:white })
call s:h("CursorColumn",  {                     "bg": s:lightblack2 })
call s:h("CursorLine",    {                     "bg": s:lightblack2})
call s:h("NonText",       { "fg": s:grey })
call s:h("StatusLine",    { "fg": s:lightgrey,   "bg": s:darkerblack})
call s:h("StatusLineNC",  { "fg": s:lightgrey,   "bg": s:darkblack})
call s:h("TabLine",       { "fg": s:white,      "bg": s:darkblack,    "format": "reverse" })
call s:h("Visual",        {                     "bg": s:grey})
call s:h("Search",        { "fg": s:black,      "bg": s:yellow })
call s:h("MatchParen",    { "fg": s:white,                           "format": "underline,bold" })
call s:h("Question",      { "fg": s:yellow })
call s:h("ModeMsg",       { "fg": s:yellow })
call s:h("MoreMsg",       { "fg": s:yellow })
call s:h("ErrorMsg",      { "fg": s:black,      "bg": s:red,          "format": "standout" })
call s:h("WarningMsg",    { "fg": s:red })
call s:h("VertSplit",     { "fg": s:darkerblack,   "bg": s:black})
call s:h("LineNr",        { "fg": s:grey,       "bg": s:black})
call s:h("CursorLineNr",  { "fg": s:orange,     "bg": s:lightblack })
call s:h("SignColumn",    {                     "bg": s:lightblack })

" misc
call s:h("SpecialKey",    { "fg": s:pink })
call s:h("Title",         { "fg": s:yellow })
call s:h("Directory",     { "fg": s:aqua })

" diff
call s:h("DiffAdd",       { "fg": s:addfg,      "bg": s:addbg })
call s:h("DiffDelete",    { "fg": s:black,      "bg": s:delbg })
call s:h("DiffChange",    { "fg": s:changefg,   "bg": s:changebg })
call s:h("DiffText",      { "fg": s:black,      "bg": s:aqua })

" fold
call s:h("Folded",        { "fg": s:warmgrey,   "bg": s:darkblack })
call s:h("FoldColumn",    {                     "bg": s:darkblack })
"        Incsearch"

" popup menu
call s:h("Pmenu",         { "fg": s:white, "bg": s:darkblack})
call s:h("PmenuSel",      { "fg": s:white, "bg": s:black,        "format": "bold" })
call s:h("PmenuThumb",    { "fg": s:lightblack, "bg": s:grey })
"        PmenuSbar"

" Generic Syntax Highlighting
" ---------------------------

call s:h("Constant",      { "fg": s:purple })
call s:h("Number",        { "fg": s:purple })
call s:h("Float",         { "fg": s:purple })
call s:h("Boolean",       { "fg": s:purple })
call s:h("Character",     { "fg": s:yellow })
call s:h("String",        { "fg": s:yellow })

call s:h("Type",          { "fg": s:aqua })
call s:h("Structure",     { "fg": s:aqua })
call s:h("StorageClass",  { "fg": s:aqua })
call s:h("Typedef",       { "fg": s:aqua })
    
call s:h("Identifier",    { "fg": s:green })
call s:h("Function",      { "fg": s:green })
                         
call s:h("Statement",     { "fg": s:pink })
call s:h("Operator",      { "fg": s:pink })
call s:h("Label",         { "fg": s:pink })
call s:h("Keyword",       { "fg": s:aqua })
"        Conditional"
"        Repeat"
"        Exception"

call s:h("PreProc",       { "fg": s:green })
call s:h("Include",       { "fg": s:pink })
call s:h("Define",        { "fg": s:pink })
call s:h("Macro",         { "fg": s:green })
call s:h("PreCondit",     { "fg": s:green })
                           
call s:h("Special",       { "fg": s:purple })
call s:h("SpecialChar",   { "fg": s:pink })
call s:h("Delimiter",     { "fg": s:pink })
call s:h("SpecialComment",{ "fg": s:aqua })
call s:h("Tag",           { "fg": s:pink })
"        Debug"

call s:h("Todo",          { "fg": s:orange,   "format": "bold,italic" })
call s:h("Comment",       { "fg": s:warmgrey, "format": "italic" })
                         
call s:h("Underlined",    { "fg": s:green })
call s:h("Ignore",        {})
call s:h("Error",         { "fg": s:red, "bg": s:darkred })

"Neovim Terminal Colors
"------------
if has('nvim')
	let g:terminal_color_0  = s:black.gui
	let g:terminal_color_1  = s:red.gui
	let g:terminal_color_2  = s:green.gui
	let g:terminal_color_3  = s:yellow.gui
	let g:terminal_color_4  = s:aqua.gui
	let g:terminal_color_5  = s:purple.gui
	let g:terminal_color_6  = s:aqua.gui
	let g:terminal_color_7  = s:white.gui
	let g:terminal_color_8  = s:black.gui
	let g:terminal_color_9  = s:red.gui
	let g:terminal_color_10  = s:green.gui
	let g:terminal_color_11  = s:yellow.gui
	let g:terminal_color_12  = s:aqua.gui
	let g:terminal_color_13  = s:purple.gui
	let g:terminal_color_14  = s:aqua.gui
	let g:terminal_color_15  = s:white.gui
endif


" NerdTree
" --------

call s:h("NERDTreeOpenable",        { "fg": s:yellow })
call s:h("NERDTreeClosable",        { "fg": s:yellow })
call s:h("NERDTreeHelp",            { "fg": s:yellow })
call s:h("NERDTreeBookmarksHeader", { "fg": s:pink })
call s:h("NERDTreeBookmarksLeader", { "fg": s:black })
call s:h("NERDTreeBookmarkName",    { "fg": s:yellow })
call s:h("NERDTreeCWD",             { "fg": s:pink })
call s:h("NERDTreeUp",              { "fg": s:white })
call s:h("NERDTreeDirSlash",        { "fg": s:white})
call s:h("NERDTreeDir",             { "fg": s:white})

" Syntastic
" ---------

hi! link SyntasticErrorSign Error
call s:h("SyntasticWarningSign",    { "fg": s:lightblack, "bg": s:orange })

" Language highlight
" ------------------

" Java properties
call s:h("jpropertiesIdentifier",   { "fg": s:pink })

" Vim command
call s:h("vimCommand",              { "fg": s:pink })

" Javascript
call s:h("jsFuncName",          { "fg": s:green })
call s:h("jsThis",              { "fg": s:pink })
call s:h("jsFunctionKey",       { "fg": s:green })
call s:h("jsPrototype",         { "fg": s:aqua })
call s:h("jsExceptions",        { "fg": s:aqua })
call s:h("jsFutureKeys",        { "fg": s:aqua })
call s:h("jsBuiltins",          { "fg": s:aqua })
call s:h("jsArgsObj",           { "fg": s:aqua })
call s:h("jsStatic",            { "fg": s:aqua })
call s:h("jsSuper",             { "fg": s:aqua })
call s:h("jsFuncArgRest",       { "fg": s:purple, "format": "italic" })                                 
call s:h("jsFuncArgs",          { "fg": s:orange, "format": "italic" })
call s:h("jsStorageClass",      { "fg": s:aqua })
call s:h("jsDocTags",           { "fg": s:aqua,   "format": "italic" })

" Typescript
call s:h("typescriptArrowFuncArg",        { "fg": s:orange, "format": "italic" })
call s:h("typescriptFuncType",            { "fg": s:orange, "format": "italic" })
call s:h("typescriptCall",                { "fg": s:orange, "format": "italic" })
call s:h("typescriptVariable",            { "fg": s:aqua })
call s:h("typescriptModule",              { "fg": s:aqua })
call s:h("typescriptPredefinedType",      { "fg": s:aqua })
call s:h("typescriptFuncTypeArrow",       { "fg": s:aqua })
call s:h("typescriptImport",              { "fg": s:pink })
call s:h("typescriptExport",              { "fg": s:pink })
call s:h("typescriptCastKeyword",         { "fg": s:pink })
call s:h("typescriptOperator",            { "fg": s:pink })
call s:h("typescriptEndColons",           { "fg": s:white })
call s:h("typescriptObjectLabel",         { "fg": s:green })
call s:h("typescriptAmbientDeclaration",  { "fg": s:pink })
                                 
" Html
call s:h("htmlTag",             { "fg": s:white })
call s:h("htmlEndTag",          { "fg": s:white })
call s:h("htmlTagName",         { "fg": s:pink })
call s:h("htmlArg",             { "fg": s:green })
call s:h("htmlSpecialChar",     { "fg": s:purple })

" Xml
call s:h("xmlTag",              { "fg": s:pink })
call s:h("xmlEndTag",           { "fg": s:pink })
call s:h("xmlTagName",          { "fg": s:orange })
call s:h("xmlAttrib",           { "fg": s:green })

" CSS
call s:h("cssProp",             { "fg": s:yellow })
call s:h("cssUIAttr",           { "fg": s:yellow })
call s:h("cssFunctionName",     { "fg": s:aqua })
call s:h("cssColor",            { "fg": s:purple })
call s:h("cssPseudoClassId",    { "fg": s:purple })
call s:h("cssClassName",        { "fg": s:green })
call s:h("cssValueLength",      { "fg": s:purple })
call s:h("cssCommonAttr",       { "fg": s:pink })
call s:h("cssBraces" ,          { "fg": s:white })
call s:h("cssClassNameDot",     { "fg": s:pink })
call s:h("cssURL",              { "fg": s:orange, "format": "underline,italic" })

" LESS
call s:h("lessVariable",        { "fg": s:green })

" ruby
call s:h("rubyInterpolationDelimiter",  {})
call s:h("rubyInstanceVariable",        {})
call s:h("rubyGlobalVariable",          {})
call s:h("rubyClassVariable",           {})
call s:h("rubyPseudoVariable",          {})
call s:h("rubyFunction",                { "fg": s:green })
call s:h("rubyStringDelimiter",         { "fg": s:yellow })
call s:h("rubyRegexp",                  { "fg": s:yellow })
call s:h("rubyRegexpDelimiter",         { "fg": s:yellow })
call s:h("rubySymbol",                  { "fg": s:purple })
call s:h("rubyEscape",                  { "fg": s:purple })
call s:h("rubyInclude",                 { "fg": s:pink })
call s:h("rubyOperator",                { "fg": s:pink })
call s:h("rubyControl",                 { "fg": s:pink })
call s:h("rubyClass",                   { "fg": s:pink })
call s:h("rubyDefine",                  { "fg": s:pink })
call s:h("rubyException",               { "fg": s:pink })
call s:h("rubyRailsARAssociationMethod",{ "fg": s:orange })
call s:h("rubyRailsARMethod",           { "fg": s:orange })
call s:h("rubyRailsRenderMethod",       { "fg": s:orange })
call s:h("rubyRailsMethod",             { "fg": s:orange })
call s:h("rubyConstant",                { "fg": s:aqua })
call s:h("rubyBlockArgument",           { "fg": s:orange })
call s:h("rubyBlockParameter",          { "fg": s:orange })

" eruby
call s:h("erubyDelimiter",              {})
call s:h("erubyRailsMethod",            { "fg": s:aqua })

" c
call s:h("cLabel",                      { "fg": s:pink })
call s:h("cStructure",                  { "fg": s:aqua})
call s:h("cStorageClass",               { "fg": s:pink})
call s:h("cInclude",                    { "fg": s:pink})
call s:h("cDefine",                     { "fg": s:pink})
