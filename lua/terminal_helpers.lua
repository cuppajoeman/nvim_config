-- Function to open Ranger in a new terminal window
function OpenRangerTerminal()
  -- Open a new terminal window and run ranger
  vim.cmd 'term ranger'

  -- Get the buffer number of the newly created terminal
  local buf = vim.api.nvim_get_current_buf()

  -- Set the buffer name to "ranger" and filetype to "ranger"
  vim.api.nvim_buf_set_option(buf, 'buftype', 'terminal')
  vim.api.nvim_buf_set_option(buf, 'filetype', 'ranger')
end

-- Map <leader>ran to open ranger in a terminal
vim.api.nvim_set_keymap('n', '<leader>ran', ':lua OpenRangerTerminal()<CR>', { noremap = true, silent = true })

-- Command to open a named terminal
vim.api.nvim_create_user_command('NamedTerminal', function(opts)
  vim.cmd('terminal bash #' .. opts.args)
end, { nargs = 1 })

-- Map <leader>nt to the NamedTerminal command
vim.api.nvim_set_keymap('n', '<leader>nt', ':NamedTerminal ', { noremap = true, silent = false })
