return{
    {
        'nvim-mini/mini.pairs',
        version = '*',
        opts = {
            config = function()
                require('mini.pairs').setup()
            end
        }
    },
    {
        'nvim-mini/mini.pick',
        version = '*',
        config = function()
            require('mini.pick').setup()
        end
    },
    {
        'nvim-mini/mini.statusline',
        version = '*',
        opts = {
            config = function()
                require('mini.statusline').setup()
            end
        }
    },
}
