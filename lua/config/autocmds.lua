-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- local function write_if_writable()
--   if vim.bo.modifiable and not vim.bo.readonly and vim.bo.buftype == "" then
--     vim.cmd.wa()
--   end
-- end
--
-- vim.api.nvim_create_autocmd("FocusLost", { callback = write_if_writable })
-- vim.api.nvim_create_autocmd("BufLeave", { callback = write_if_writable })

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  group = vim.api.nvim_create_augroup("AutosaveOnLeave", { clear = true }),
  callback = function()
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) == 1 then
      pcall(vim.cmd, "silent! update")
    end
  end,
})
