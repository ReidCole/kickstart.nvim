-- Organize typescript imports
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end
vim.keymap.set('n', '<leader>ji', function()
  organize_imports()
end, { desc = 'organize imports' })

-- Keep screen centered when navigating
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Format current buffer
vim.keymap.set('n', '<leader>jfm', '<cmd>Format<cr><cmd>FormatWriteLock<cr>')

-- Open file explorer
vim.keymap.set('n', '<leader>je', '<cmd>Ex<cr>', { desc = 'Open netrw file explorer' })

-- Quit and write to all buffers
vim.keymap.set('n', '<leader>jq', '<cmd>wqall<cr>', { desc = 'Write and quit all buffers' })

-- Grep search (+ command line args if you surround search with "")
vim.keymap.set('n', '<leader>sg', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>')

-- Harpoon
-- TODO: consider using absolute mappings instead of relative mappings
-- (e.g. go to file 3, instead of, go to next file until you land on the right one)
vim.keymap.set('n', '<leader>jra', ':lua require("harpoon.mark").add_file()<cr>',
  { desc = 'add to harpoon' })
vim.keymap.set('n', '<leader>jru', ':lua require("harpoon.ui").toggle_quick_menu()<cr>',
  { desc = 'harpoon ui' })
vim.keymap.set('n', '<C-l>', '<cmd>lua require("harpoon.ui").nav_next()<cr>',
  { desc = 'harpoon next' })
vim.keymap.set('n', '<C-h>', '<cmd>lua require("harpoon.ui").nav_prev()<cr>',
  { desc = 'harpoon previous' })

-- Paste over selection without replacing current paste register thingy
vim.keymap.set('v', '<leader>p', '"_dP')

-- Navigating snippet jump points
local luasnip = require 'luasnip'
vim.keymap.set('i', '<C-l>', function() luasnip.jump(1) end)
vim.keymap.set('i', '<C-h>', function() luasnip.jump(-1) end)

-- Quickly change indentation
vim.keymap.set('n', '<leader>jf4', ':set tabstop=4<cr>:set shiftwidth=4<cr>')
vim.keymap.set('n', '<leader>jf2', ':set tabstop=2<cr>:set shiftwidth=2<cr>')

-- Undotree
vim.keymap.set('n', '<leader>ut', '<cmd>UndotreeToggle<cr>')

-- Move selection up and down
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")

-- Search and replace the word your cursor is on
vim.keymap.set('n', '<leader>rs', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'search and replace current word in entire buffer' })

-- Telescope resume
vim.keymap.set('n', '<leader>jp', '<cmd>Telescope resume<cr>')
