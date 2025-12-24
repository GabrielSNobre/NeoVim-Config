return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = {
        preset = 'default',
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then return cmp.accept()
            else return cmp.select_and_accept() end
          end,
          'select_prev', 'fallback' },
          ['<S-Tab>'] = { 'select_next', 'fallback' },
          ['<CR>'] = { 'select_and_accept', 'fallback' }
        },
        completion = {
          list = {
            selection = {
              preselect = true,
            }
          }
        },
        fuzzy = {implementation = "lua"},
      }
    },
  {
    'neovim/nvim-lspconfig',
    opts ={},
    config = function ()
      local lspconfig = vim.lsp.config
      local blink = require("blink.cmp")
      local capabilities = blink.get_lsp_capabilities()

      lspconfig('lua_ls',{
        capabilities = capabilities,
        settings = {
        Lua = {
          diagnostics = {
                globals = {'vim'},
            }
          }
        }
      })
      lspconfig('html',{
          capabilities = capabilities,
      })
      lspconfig('ts_ls',{
        capabilities = capabilities,
      })
      lspconfig('clangd',{
        capabilities = capabilities,
      })
    vim.lsp.enable("lua_ls")
    end
  },
 }
