-- GitHub Copilot configuration

local M = {}

function M.setup()
  -- Copilot Chat setup
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_no_tab_map = true
  


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
      context = nil, -- Let user control context manually for better clarity
      auto_follow_cursor = false,
      auto_insert_mode = false,
      clear_chat_on_new_prompt = false,
      history_path = vim.fn.stdpath('data') .. '/copilotchat_history',
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