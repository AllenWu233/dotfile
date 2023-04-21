require("impatient")

require("user.options")
require("user.keymaps")

require("user.ui")
require("user.core")
require("user.lsp")
require("user.optional")
require("user.lang")

require("user.plugins")
require("user.whichkey")

require('leap').add_default_mappings()
require('leap').opts.highlight_unlabeled_phase_one_targets = true
vim.keymap.set({ 'x', 'o', 'n' }, 'r', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'x', 'o', 'n' }, 'R', '<Plug>(leap-backward-to)')

require("symbols-outline").setup()
