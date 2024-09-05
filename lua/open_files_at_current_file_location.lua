-- Open files relative to the directory the current file lives in
vim.api.nvim_set_keymap('n', '<leader>ce', ':e ' .. vim.fn.expand '%:p:h' .. '/<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ct', ':tabe ' .. vim.fn.expand '%:p:h' .. '/<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cs', ':split ' .. vim.fn.expand '%:p:h' .. '/<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cv', ':vsplit ' .. vim.fn.expand '%:p:h' .. '/<CR>', { noremap = true, silent = true })
