local o = vim.opt
o.showmatch = true -- Show matching braces
--[[ o.colorcolumn = true -- Vertical ruler ]]

o.list = true -- Show invisible characters, e.g. tabs or eol:s
--[[ o.listchars=tab:»·,trail:·    -- according to this definition ]]
o.foldenable    = true -- Enable folding
o.fdls          = 10 -- Start with all folds folded
o.foldnestmax   = 3 -- More than three folds should not be necessary

--[[ o.noerrorbells  = true -- No warning sounds ofc ]]
o.nu            = rnu -- Normal numbering at start
-- o.undofile        -- Default location is XDG_DATA_HOME/nvim/undo
o.termguicolors = true -- Enable 24-bit RGB color in terminal
--[[ o.signcolumn    = auto -- Always show the sign column ]]
o.updatetime    = 50 -- To make vim snappier (?)
o.autoread      = true -- Read automatically from outside changes
--[[ o.enc           = utf - 8 -- vim display encoding ]]
--[[ o.fenc          = utf - 8 -- output encoding ]]
--[[ o.mouse         = nvi -- enable mouse support in n-v-i modes ]]

o.linebreak     = true -- if wrap is on, the line is only visually wrapped
--[[ o.nowrap        = true -- default behaviour, no wrap ]]
--[[ o.showbreak=↪     -- insert this character at linebreaks ]]
--[[ o.noshowmode  = true -- Do not display -- MODE -- on command line. ]]
-- This is already in statusbar -> redundant info
--[[ o.noruler     = true -- Do not display cursor pos. and etc. Same reason as above ]]

o.splitright  = true -- right is the default direction for vspl
o.splitbelow  = true -- below is the default direction for spl

-- Tabs
o.tabstop     = 4 -- how many columns of whitespace is a \t char worth?
o.softtabstop = 4 -- how many columns of whitespace is a tab keypress or a backspace keypress worth?
o.shiftwidth  = 4 -- how many columns of whitespace a “level of indentation” is worth?
o.expandtab   = true -- tab keypresses will be expanded into spaces
o.autoindent  = true
o.smartindent = true

o.scrolloff   = 4 -- The cursor must be at least 4 lines from up/low bound

o.backspace   = indent, eol, start -- <BS> works on newlines as well
--[[ o.clipboard+=unnamedplus      -- Always use system clipboard, can cause slow startup ]]
--[[ o.path+=**    -- Extend `find` path recursively down the directory tree ]]
--[[ o.nohlsearch  = true -- Start without search highlighting ]]
--[[ o.incsearch   = true -- Search while writing ]]
--[[ o.ignorecase  = true -- In combination with... ]]
--[[ o.smartcase   = true -- Smart case-insensitive search ]]

--[[ o.completeopt = menuone, noinsert, noselect ]]
o.pumheight   = 10

-- ==============================================================================
