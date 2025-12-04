-- GitHub Copilot configuration

local M = {}

function M.setup()
  -- Copilot Chat setup
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_no_tab_map = true
  
  -- Key mappings for Copilot
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

  -- Setup Copilot Chat with error handling
  local ok, chat = pcall(require, 'CopilotChat')
  if ok then
    chat.setup({
      window = {
        layout = 'vertical',
        width = 0.4,
        height = 0.8,
        border = 'rounded',
        title = 'Copilot Chat',
      },
      show_help = false,
      show_folds = true,
      highlight_selection = true,
      context = nil,
      history_path = vim.fn.stdpath('data') .. '/copilotchat_history',
      callback = nil,
      mappings = {
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert = '<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>'
        },
        reset = {
          normal = '<C-r>',
          insert = '<C-r>'
        },
      },
    })
  end
end

return M