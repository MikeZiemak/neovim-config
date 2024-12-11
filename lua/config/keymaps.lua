-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Split window
keymap.set("n", "ws", ":vsplit<Return>", opts)

-- this will prevent the lines deleted with 'd' key from being copied to clipboard
keymap.set("n", "d", '"_d', opts)
keymap.set("v", "d", '"_d', opts)
