-- configure clang-format
local function format_on_save()
  local formatdiff = 1
  if vim.fn.has 'python' == 1 then
    vim.cmd ' execute "!python ~/projects/llvm-project/clang/tools/clang-format/clang-format.py"'
  elseif vim.fn.has 'python3' == 1 then
    vim.cmd ' execute "!python3 ~/projects/llvm-project/clang/tools/clang-format/clang-format.py"'
  end
end

-- Automatically format on save for certain file types
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.h', '*.cc', '*.cpp' },
  callback = format_on_save,
})
