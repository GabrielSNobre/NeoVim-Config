return  {
    {
        "guillermodotn/nvim-earthsong",
        lazy = false,          -- Carrega imediatamente
        priority = 1000,       -- Alta prioridade para evitar "flash" de cores
        config = function()
            require("earthsong").setup({
                -- Define a variante "mute" (cores opacas)
                variant = "mute",
                -- Ativa o fundo transparente
                styles = {
                    transparency = true,
                    italic = true,   -- Mantém itálicos (ajuste conforme preferência)
                    bold = true,
                },
                -- Outras opções padrão (pode personalizar)
                dim_inactive_windows = false,
                extend_background_behind_borders = true,
            })
            -- Aplica o esquema de cores
            vim.cmd("colorscheme earthsong-mute")
        end,

    },{
        "xiyaowong/transparent.nvim",
    opts = {
        config = function ()
            require("transparent").setup({
                groups = {
                    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                    'EndOfBuffer',
                },
            })
        end
    }
    }
}


