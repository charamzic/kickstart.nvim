local function set_java_indent(buf)
  vim.bo[buf].expandtab = true
  vim.bo[buf].tabstop = 4
  vim.bo[buf].shiftwidth = 4
  vim.bo[buf].softtabstop = 4
end

-- Apply immediately when opening a Java file
set_java_indent(0)

-- Also reapply when LSP attaches (prevents overrides)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    if vim.bo[args.buf].filetype == 'java' then
      set_java_indent(args.buf)
    end
  end,
})
