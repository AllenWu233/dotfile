
-- ################################################################### ufo setting 
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldnestmax ="1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = false
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.statuscolumn = '%=%l%s%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : "  " }%*'


-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
    })
end
--[[]]
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end


require('ufo').setup(
  { fold_virt_text_handler = handler,

 open_fold_hl_timeout = 150,
    close_fold_kinds = {'imports', 'comment'},
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-u>',
            scrollD = '<C-d>'
        }
    },
  }
  
)
-- ########################################################################################
require('hlslens').setup()

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)


require('numb').setup()
--[[ require('neoscroll').setup() ]]

require('specs').setup{ 
    show_jumps  = true,
    min_jump = 30,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 10, -- time increments used for fade/resize effects 
        blend = 30, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 30,
        winhl = "PMenu",
        fader = require('specs').pulse_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}

vim.api.nvim_set_keymap('n', 'n', 'n:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'N:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', '<C-f>:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-b>', '<C-b>:lua require("specs").show_specs()<CR>', { noremap = true, silent = true })
--
--#region

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline(),
    wilder.search_pipeline()
  ),
})

wilder.set_option('renderer', wilder.wildmenu_renderer({
  highlighter = wilder.basic_highlighter(),
}))

-- ######################################################################### wilder setting
--[[ local wilder = require('wilder') ]]
--[[ wilder.setup({modes = {':', '/', '?'}}) ]]
--[[]]
--[[ local highlighters = { ]]
--[[   wilder.pcre2_highlighter(), ]]
--[[   wilder.basic_highlighter(), ]]
--[[ } ]]
--[[ wilder.set_option('renderer', wilder.renderer_mux({ ]]
--[[   [':'] = wilder.popupmenu_renderer({ ]]
--[[     highlighter = highlighters, ]]
--[[   }), ]]
--[[   ['/'] = wilder.wildmenu_renderer({ ]]
--[[     highlighter = highlighters, ]]
--[[   }), ]]
--[[ })) ]]
--[[]]
--[[ wilder.set_option('renderer', wilder.popupmenu_renderer({ ]]
--[[   pumblend = 5, ]]
--[[ })) ]]
--[[]]
--[[ wilder.set_option('renderer', wilder.popupmenu_renderer( ]]
--[[   wilder.popupmenu_border_theme({ ]]
--[[     highlights = { ]]
--[[       border = 'Normal', -- highlight to use for the border ]]
--[[     }, ]]
--[[     -- 'single', 'double', 'rounded' or 'solid' ]]
--[[     -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details ]]
--[[     border = 'rounded', ]]
--[[   }) ]]
--[[ )) ]]
--[[]]
--[[ wilder.set_option('renderer', wilder.popupmenu_renderer({ ]]
--[[   highlighter = wilder.basic_highlighter(), ]]
--[[   left = {' ', wilder.popupmenu_devicons()}, ]]
--[[   right = {' ', wilder.popupmenu_scrollbar()}, ]]
--[[ })) ]]
--[[ wilder.set_option('pipeline', { ]]
--[[   wilder.branch( ]]
--[[     wilder.cmdline_pipeline({ ]]
--[[       fuzzy = 1, ]]
--[[       set_pcre2_pattern = 1, ]]
--[[     }), ]]
--[[     wilder.python_search_pipeline({ ]]
--[[       pattern = 'fuzzy', ]]
--[[     }) ]]
--[[   ), ]]
--[[ }) ]]
--###################################################################################
