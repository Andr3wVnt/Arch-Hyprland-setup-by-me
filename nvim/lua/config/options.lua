-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.number = true -- Show absolute line numbers
opt.relativenumber = false -- Disable relative line numbers
-- Set tabs to 4 spaces
vim.opt.tabstop = 4       -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4    -- Size of an indent
vim.opt.expandtab = true  -- Use spaces instead of tabs (recommended)
vim.opt.softtabstop = 4   -- Number of spaces to insert when hitting <Tab>
