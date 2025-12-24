-- Instalação com lazy.nvim
return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    -- Configurações básicas
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    -- Atualização em tempo real
    update_debounce = 100,
    -- Destaque da linha atual no blame
    current_line_blame = true,
    -- Habilita a coluna de sinais
    signcolumn = true,
  },
  config = function(_, opts)
    require('gitsigns').setup(opts)
  end,
}
