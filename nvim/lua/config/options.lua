-- General Neovim options and settings

local M = {}

function M.setup()
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

  -- C++ specific settings
  vim.api.nvim_create_autocmd("FileType", {
    pattern = {"cpp", "c", "h", "hpp"},
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.expandtab = true
    end,
  })
end

return M