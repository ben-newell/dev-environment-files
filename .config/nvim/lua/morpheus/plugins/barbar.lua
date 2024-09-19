-- Plugin setup using Lazy.nvim
return {
  require("lazy").setup({
    {
      "romgrk/barbar.nvim",
      dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
      },
      init = function()
        vim.g.barbar_auto_setup = false
      end,
      opts = {
        -- Configuration options for Barbar.nvim
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
      },
      version = "^1.0.0", -- optional: only update when a new 1.x version is released
      config = function()
        -- Define key mappings after plugin setup
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Key mappings for Barbar.nvim
        map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
        map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
        map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
        map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
        map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
        map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
        map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
        map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
        map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
        map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
        map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
        map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
        map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
        map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
        map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
        map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
        map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
        map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
        map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
        map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
        map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
        map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
      end,
    },
  }),
}
