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
  vim.cmd('terminal bash \\#' .. opts.args)
end, { nargs = 1 })

-- Map <leader>nt to the NamedTerminal command
vim.api.nvim_set_keymap('n', '<leader>nt', ':NamedTerminal ', { noremap = true, silent = false })

-- Function to open a terminal in the directory of the active file
function OpenTerminalInFileDirectory()
  -- Get the full path of the current file
  local file_path = vim.fn.expand '%:p'

  -- Determine the directory of the current file
  local file_dir = vim.fn.fnamemodify(file_path, ':h')

  -- If there is no file (e.g., an unsaved buffer), fall back to the current working directory
  if file_dir == '' then
    file_dir = vim.fn.getcwd()
  end

  -- Save the current directory to restore it later
  local original_dir = vim.fn.getcwd()

  -- Change to the file's directory
  vim.cmd('cd ' .. vim.fn.fnameescape(file_dir))

  -- Open the terminal in a vertical split
  vim.cmd 'vsplit | term'

  -- Restore the original directory
  vim.cmd('cd ' .. vim.fn.fnameescape(original_dir))

  -- Set the terminal buffer to non-listed
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_set_option(buf, 'buflisted', false)
end

-- Map <leader>ft to open a terminal in the active file's directory
vim.api.nvim_set_keymap('n', '<leader>ft', ':lua OpenTerminalInFileDirectory()<CR>', { noremap = true, silent = true })
