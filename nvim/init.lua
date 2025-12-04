-- Simple Neovim Configuration

-- General settings
vim.opt.number = true              -- Show line numbers
vim.opt.mouse = 'a'                -- Enable mouse support
vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard

-- Indentation  
vim.opt.tabstop = 4                -- Number of spaces for tab
vim.opt.shiftwidth = 4             -- Number of spaces for indentation
vim.opt.expandtab = true           -- Use spaces instead of tabs

-- Font settings (for GUI applications like Neovide)
vim.opt.guifont = "FiraCode Nerd Font:h14"  -- Primary font: FiraCode
-- Alternative: "JetBrainsMono Nerd Font:h14"