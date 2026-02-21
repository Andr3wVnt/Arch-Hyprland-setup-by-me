-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Define a group to prevent duplicating the autocmds if you reload config
local template_group = vim.api.nvim_create_augroup("AutoTemplates", { clear = true })

-- Python: Add Shebang
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.py",
  group = template_group,
  callback = function()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
      "#!/usr/bin/env python3",
      "",
    })
    -- Move cursor to line 2
    vim.api.nvim_win_set_cursor(0, { 2, 0 })
  end,
})

-- Bash: Add Shebang
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.sh",
  group = template_group,
  callback = function()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
      "#!/usr/bin/env bash",
      "",
    })
    -- Move cursor to line 2
    vim.api.nvim_win_set_cursor(0, { 2, 0 })
  end,
})

-- C: Standard Boilerplate
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.c",
  group = template_group,
  callback = function()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
      "#include <stdio.h>",
      "#include <stdlib.h>",
      "",
      "int main() {",
      "    return 0;",
      "}",
    })
    -- Move cursor inside main (Line 5, indent 4)
    vim.api.nvim_win_set_cursor(0, { 5, 4 })
  end,
})

-- C++: Standard Boilerplate
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = { "*.cpp", "*.cc" },
  group = template_group,
  callback = function()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {
      "#include <iostream>",
      "",
      "int main() {",
      "    return 0;",
      "}",
    })
    -- Move cursor inside main (Line 4, indent 4)
    vim.api.nvim_win_set_cursor(0, { 4, 4 })
  end,
})
