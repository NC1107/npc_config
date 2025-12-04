-- Git integration configuration

local M = {}

function M.setup()
  -- Enable built-in git integration
  vim.opt.signcolumn = "yes"  -- Always show sign column for git signs
  
  -- Configure git signs (built-in since Neovim 0.10+)
  if vim.fn.has('nvim-0.10') == 1 then
    -- Use built-in git signs
    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
      pattern = "*",
      callback = function()
        -- Check if we're in a git repository
        local git_dir = vim.fn.system("git rev-parse --git-dir 2>/dev/null"):gsub("\n", "")
        if vim.v.shell_error == 0 then
          vim.opt_local.signcolumn = "yes"
          -- Enable diff highlighting
          vim.cmd("highlight DiffAdd guibg=#2d4a2b guifg=NONE")
          vim.cmd("highlight DiffChange guibg=#2d3a4a guifg=NONE") 
          vim.cmd("highlight DiffDelete guibg=#4a2d2d guifg=NONE")
        end
      end,
    })
  end
  
  -- Git keybindings
  vim.keymap.set('n', '<leader>gs', ':!git status<CR>', { desc = 'Git status' })
  vim.keymap.set('n', '<leader>ga', ':!git add %<CR>', { desc = 'Git add current file' })
  vim.keymap.set('n', '<leader>gA', ':!git add .<CR>', { desc = 'Git add all' })
  vim.keymap.set('n', '<leader>gc', ':!git commit -m "', { desc = 'Git commit' })
  vim.keymap.set('n', '<leader>gp', ':!git push<CR>', { desc = 'Git push' })
  vim.keymap.set('n', '<leader>gl', ':!git log --oneline -10<CR>', { desc = 'Git log' })
  vim.keymap.set('n', '<leader>gd', ':!git diff %<CR>', { desc = 'Git diff current file' })
  vim.keymap.set('n', '<leader>gD', ':!git diff<CR>', { desc = 'Git diff all' })
  vim.keymap.set('n', '<leader>gb', ':!git branch<CR>', { desc = 'Git branches' })
  
  -- Git blame for current line
  vim.keymap.set('n', '<leader>gB', function()
    local line = vim.fn.line('.')
    local file = vim.fn.expand('%')
    vim.cmd('!git blame -L' .. line .. ',' .. line .. ' ' .. file)
  end, { desc = 'Git blame current line' })
  
  -- Show git changes in split
  vim.keymap.set('n', '<leader>gv', function()
    vim.cmd('vsplit')
    vim.cmd('terminal git diff --color=always')
    vim.cmd('startinsert')
  end, { desc = 'Git diff in split' })
  
end

return M