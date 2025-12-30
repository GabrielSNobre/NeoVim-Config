-- In your Lazy plugin configuration file (e.g., ~/.config/nvim/lua/plugins/treesitter.lua)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
      require("nvim-treesitter").setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "javascript",
          "typescript",
          "html",
          "css",
          "python",
          "bash",
          "json",
          "yaml",
          "markdown",
          "markdown_inline"
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        -- List of parsers to ignore installing
        ignore_install = {},

        highlight = {
          enable = true,
          -- disable = { "markdown" }, -- disable highlighting for specific languages
          additional_vim_regex_highlighting = false,
        },

        -- Enable incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>v", -- set to `false` to disable one of the mappings
            node_incremental = "<leader>v",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },

        -- Enable indentation
        indent = {
          enable = true,
        },

        -- Enable autotag plugin (optional, requires nvim-ts-autotag plugin)
        autotag = {
          enable = false, -- set to true if you have nvim-ts-autotag installed
        },
      })
    end,
  },
}
