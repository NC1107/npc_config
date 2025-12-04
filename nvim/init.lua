-- Clean Neovim Configuration
-- Modular setup with organized Lua modules

-- Load configuration modules
require('config.options').setup()
require('config.keymaps').setup()
require('config.theme').setup()
require('config.terminal').setup()
require('config.lsp').setup()
require('config.copilot').setup()
require('config.git').setup()
