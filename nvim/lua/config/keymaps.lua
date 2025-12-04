-- Key mappings configuration

local M = {}

function M.setup()
  -- Set leader key
  vim.g.mapleader = " "

  -- Familiar undo/redo mappings
  vim.keymap.set('n', '<C-z>', 'u', { desc = 'Undo' })
  vim.keymap.set('i', '<C-z>', '<C-o>u', { desc = 'Undo in insert mode' })
  vim.keymap.set('n', '<C-y>', '<C-r>', { desc = 'Redo' })
  vim.keymap.set('i', '<C-y>', '<C-o><C-r>', { desc = 'Redo in insert mode' })

  -- Visual selection with Shift + arrows (works in insert and normal mode)
  vim.keymap.set('i', '<S-Left>', '<Esc>v<Left>', { desc = 'Select left' })
  vim.keymap.set('i', '<S-Right>', '<Esc>v<Right>', { desc = 'Select right' })
  vim.keymap.set('i', '<S-Up>', '<Esc>v<Up>', { desc = 'Select up' })
  vim.keymap.set('i', '<S-Down>', '<Esc>v<Down>', { desc = 'Select down' })
  
  -- Extend selection in visual mode
  vim.keymap.set('v', '<S-Left>', '<Left>', { desc = 'Extend selection left' })
  vim.keymap.set('v', '<S-Right>', '<Right>', { desc = 'Extend selection right' })
  vim.keymap.set('v', '<S-Up>', '<Up>', { desc = 'Extend selection up' })
  vim.keymap.set('v', '<S-Down>', '<Down>', { desc = 'Extend selection down' })

  -- Word selection with Shift + Ctrl + arrows
  vim.keymap.set('i', '<S-C-Left>', '<Esc>vb', { desc = 'Select word left' })
  vim.keymap.set('i', '<S-C-Right>', '<Esc>ve', { desc = 'Select word right' })
  vim.keymap.set('v', '<S-C-Left>', 'b', { desc = 'Extend selection word left' })
  vim.keymap.set('v', '<S-C-Right>', 'e', { desc = 'Extend selection word right' })

  -- Copy, cut, paste operations
  vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy selection' })
  vim.keymap.set('i', '<C-c>', '<C-o>"+yy', { desc = 'Copy line' })
  vim.keymap.set('n', '<C-c>', '"+yy', { desc = 'Copy line' })
  
  vim.keymap.set('v', '<C-x>', '"+x', { desc = 'Cut selection' })
  vim.keymap.set('i', '<C-x>', '<C-o>"+dd', { desc = 'Cut line' })
  vim.keymap.set('n', '<C-x>', '"+dd', { desc = 'Cut line' })
  
  vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = 'Paste' })
  vim.keymap.set('n', '<C-v>', '"+p', { desc = 'Paste' })
  vim.keymap.set('v', '<C-v>', '"+p', { desc = 'Paste over selection' })

  -- Select all
  vim.keymap.set('i', '<C-a>', '<Esc>ggVG', { desc = 'Select all' })
  vim.keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select all' })

  -- Mac Cmd key equivalents (same as Ctrl)
  -- Copy operations
  vim.keymap.set('v', '<D-c>', '"+y', { desc = 'Copy selection (Cmd)' })
  vim.keymap.set('i', '<D-c>', '<C-o>"+yy', { desc = 'Copy line (Cmd)' })
  vim.keymap.set('n', '<D-c>', '"+yy', { desc = 'Copy line (Cmd)' })
  
  -- Cut operations
  vim.keymap.set('v', '<D-x>', '"+x', { desc = 'Cut selection (Cmd)' })
  vim.keymap.set('i', '<D-x>', '<C-o>"+dd', { desc = 'Cut line (Cmd)' })
  vim.keymap.set('n', '<D-x>', '"+dd', { desc = 'Cut line (Cmd)' })
  
  -- Paste operations
  vim.keymap.set('i', '<D-v>', '<C-r>+', { desc = 'Paste (Cmd)' })
  vim.keymap.set('n', '<D-v>', '"+p', { desc = 'Paste (Cmd)' })
  vim.keymap.set('v', '<D-v>', '"+p', { desc = 'Paste over selection (Cmd)' })

  -- Select all
  vim.keymap.set('i', '<D-a>', '<Esc>ggVG', { desc = 'Select all (Cmd)' })
  vim.keymap.set('n', '<D-a>', 'ggVG', { desc = 'Select all (Cmd)' })

  -- Undo/Redo
  vim.keymap.set('n', '<D-z>', 'u', { desc = 'Undo (Cmd)' })
  vim.keymap.set('i', '<D-z>', '<C-o>u', { desc = 'Undo in insert mode (Cmd)' })
  vim.keymap.set('n', '<D-y>', '<C-r>', { desc = 'Redo (Cmd)' })
  vim.keymap.set('i', '<D-y>', '<C-o><C-r>', { desc = 'Redo in insert mode (Cmd)' })

  -- Ensure Escape key works properly
  vim.keymap.set('i', '<Esc>', '<Esc>', { desc = 'Exit insert mode' })

  -- Copilot keybinds
  vim.keymap.set('i', '<C-j>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
    desc = 'Accept Copilot suggestion'
  })
  
  vim.keymap.set('i', '<C-h>', '<Plug>(copilot-dismiss)', { desc = 'Dismiss Copilot' })
  vim.keymap.set('i', '<C-]>', '<Plug>(copilot-next)', { desc = 'Next Copilot suggestion' })
  vim.keymap.set('i', '<C-[>', '<Plug>(copilot-previous)', { desc = 'Previous Copilot suggestion' })

  -- Copilot Chat commands
  vim.keymap.set('n', '<leader>cc', ':CopilotChatToggle<CR>', { desc = 'Toggle Copilot Chat' })
  vim.keymap.set('v', '<leader>cc', ':CopilotChatVisual<CR>', { desc = 'Copilot Chat with selection' })
  vim.keymap.set('n', '<leader>ce', ':CopilotChatExplain<CR>', { desc = 'Explain code' })
  vim.keymap.set('n', '<leader>ct', ':CopilotChatTests<CR>', { desc = 'Generate tests' })
  vim.keymap.set('n', '<leader>cf', ':CopilotChatFix<CR>', { desc = 'Fix code' })
  vim.keymap.set('n', '<leader>co', ':CopilotChatOptimize<CR>', { desc = 'Optimize code' })
  vim.keymap.set('n', '<leader>cd', ':CopilotChatDocs<CR>', { desc = 'Generate docs' })
  
  -- Context shortcuts
  vim.keymap.set('n', '<leader>cb', ':CopilotChatBuffer<CR>', { desc = 'Chat with current buffer' })
  vim.keymap.set('n', '<leader>cw', ':CopilotChat @workspace<CR>', { desc = 'Chat with workspace context' })
  vim.keymap.set('n', '<leader>cx', ':CopilotChat @buffers<CR>', { desc = 'Chat with all buffers' })

  -- Git keybindings are now in config/git.lua
  
end

return M