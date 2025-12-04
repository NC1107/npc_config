-- Terminal configuration

local M = {}

function M.setup()
  -- Terminal open/toggle functionality
  vim.keymap.set('n', '<leader>t', function()
    vim.cmd('botright split | resize 15 | terminal')
    vim.cmd('startinsert')
  end, { desc = 'Open terminal' })

  vim.keymap.set('n', '<C-`>', function()
    -- Toggle terminal
    for _, win in pairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.api.nvim_buf_get_option(buf, 'buftype') == 'terminal' then
        vim.api.nvim_win_close(win, false)
        return
      end
    end
    vim.cmd('botright split | resize 15 | terminal')
    vim.cmd('startinsert')
  end, { desc = 'Toggle terminal' })

  -- Terminal styling
  vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
      vim.cmd('highlight TerminalNormal guibg=#1e1e2e')
      vim.cmd('setlocal winhighlight=Normal:TerminalNormal')
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
    end,
  })

  -- Terminal mode mappings
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
  vim.keymap.set('t', '<C-q>', '<C-\\><C-n>:q<CR>', { desc = 'Close terminal' })
end

return M