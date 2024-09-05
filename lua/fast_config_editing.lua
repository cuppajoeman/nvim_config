-- Write to file quickly
vim.api.nvim_set_keymap('n', '<leader>w', ':w!<CR>', { noremap = true, silent = true })
-- Edit Neovim configuration file
vim.api.nvim_set_keymap('n', '<leader>ve', ':e $MYVIMRC<CR>', { noremap = true, silent = true })
-- Source (reload) Neovim configuration file
vim.api.nvim_set_keymap('n', '<leader>vs', ':source $MYVIMRC<CR>', { noremap = true, silent = true })
