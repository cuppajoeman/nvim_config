vim.api.nvim_create_user_command('InsertDefinition', function()
  local template = {
    '<div class="definition" id="{ID}">',
    '  <div class="title">{TITLE}</div>',
    '  <div class="content">',
    '    {CONTENT}',
    '  </div>',
    '</div>',
  }
  -- Insert each line separately
  vim.api.nvim_put(template, 'l', true, true)
end, {})
