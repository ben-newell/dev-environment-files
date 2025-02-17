return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    vim.g.conform_enabled = true
    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
      notify_on_error = false,
      notify_no_formatters = false,
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
    end, { desc = "Format file or range (in visual mode)" })

    vim.keymap.set("n", "<leader>to", function()
      vim.g.conform_enabled = not vim.g.conform_enabled
      print("conform " .. (vim.g.conform_enabled and "enabled" or "disabled"))
    end, { desc = "Toggle conform autoformat" })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        if vim.g.conform_enabled then
          conform.format({ bufnr = args.buf, lsp_fallback = true, async = false, timeout_ms = 1000 })
        end
      end,
    })
  end,
}
