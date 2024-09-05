-- Create an augroup named 'RestoreCursor', which is used to group autocmds.
-- 'clear = true' ensures that any existing autocmds in this group are cleared.
vim.api.nvim_create_augroup('RestoreCursor', { clear = true })

-- Define an autocmd for the 'BufReadPost' event, which triggers after a buffer is read.
vim.api.nvim_create_autocmd('BufReadPost', {
  group = 'RestoreCursor', -- Associate this autocmd with the 'RestoreCursor' group.
  callback = function()
    -- Get the line number where the cursor was when the file was last closed.
    local line = vim.fn.line '\'"'

    -- Check if the line is valid (between 1 and the last line of the file),
    -- the filetype is not 'commit', and the filetype is not 'xxd' or 'gitrebase'.
    if line >= 1 and line <= vim.fn.line '$' and vim.bo.filetype ~= 'commit' and vim.fn.index({ 'xxd', 'gitrebase' }, vim.bo.filetype) == -1 then
      -- If all conditions are met, move the cursor to the last known position
      -- (marked by `"`).
      vim.cmd 'normal! g`"'
    end
  end,
})
