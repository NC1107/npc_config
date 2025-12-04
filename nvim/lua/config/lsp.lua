-- LSP configuration for C++

local M = {}

function M.setup()
  -- LSP diagnostics configuration
  vim.diagnostic.config({
    virtual_text = true,           -- Show diagnostics inline to the right
    signs = false,                 -- Disable the E's in the sign column
    underline = true,              -- Underline problematic code
    update_in_insert = true,       -- Show diagnostics in insert mode
    severity_sort = true,          -- Sort by severity
  })

  -- Built-in LSP setup for C++
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "objc", "objcpp" },
    callback = function()
      vim.lsp.start({
        name = "clangd",
        cmd = { "clangd" },
        root_dir = vim.fs.dirname(vim.fs.find({".git", "compile_commands.json"}, { upward = true })[1]),
      })
    end,
  })

  -- LSP key mappings
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
      local opts = { buffer = event.buf }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end,
  })
end

return M