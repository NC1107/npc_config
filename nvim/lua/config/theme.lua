-- Theme and colorscheme configuration

local M = {}

function M.setup()
  -- Enable true color support
  vim.opt.termguicolors = true

  -- Simple Dracula-inspired colors
  local function setup_dracula_colors()
    vim.cmd([[
      highlight Normal guifg=#f8f8f2 guibg=#282a36
      highlight Comment guifg=#6272a4
      highlight String guifg=#f1fa8c
      highlight Number guifg=#bd93f9
      highlight Keyword guifg=#ff79c6
      highlight Function guifg=#8be9fd
      highlight Type guifg=#ffb86c
      highlight LineNr guifg=#44475a
      highlight CursorLineNr guifg=#f8f8f2
      highlight Visual guibg=#44475a
      highlight Search guibg=#ff79c6 guifg=#282a36
    ]])
  end

  -- Apply Dracula theme on startup
  setup_dracula_colors()

  -- Theme switching commands
  vim.keymap.set('n', '<leader>td', ':colorscheme default<CR>', { desc = 'Default theme' })
  vim.keymap.set('n', '<leader>tr', function() setup_dracula_colors() end, { desc = 'Dracula theme' })
end

return M